/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil

/**
 * Facebook's Reels and Watch ad pool, which it calls VideoHomeSponsoredPool (582 `LX/6Gg;`). The
 * client-side story loader that fills the Reels tab asks it for an ad whenever a slot comes up,
 * through the pool base class every story pool shares. The pool marks the ad it hands out as used
 * and logs the ad position before the loader puts it in a page, so the page filters only see an ad
 * the pool has already given away.
 *
 * Each of its two vends logs this literal when it has no ad to give, and no other class holds it.
 */
internal const val POOL_NO_AD = "-WVCDF-NO-AD"

private const val HOLD_POOL_AD = "$EXTENSION_PACKAGE/ads/ReelsAdFilter;->holdPoolAd()Z"

/**
 * Facebook's other reel ad pool, FbShortsSponsoredPool (584 `LX/5RW;`, 585 `LX/05Yg;` on arm64 and
 * `LX/05Ym;` on armeabi-v7a, which overrides the second vend itself and gets a base-calling
 * override for the first). The Reels row in the News
 * feed builds one as its sponsored pool (FbShortsIFUSponsoredPool) next to its organic pool, so an
 * ad tile in that row comes from it and never asks the Reels tab's pool (#216). Its constructor
 * logs this literal, and no other class holds it.
 */
internal const val FB_SHORTS_POOL = "FBShortsSponsoredPool."

internal const val HOLD_ROW_AD = "$EXTENSION_PACKAGE/ads/ReelsAdFilter;->holdRowAd()Z"

/** A vend: an instance method with a body that hands back an object and logs [POOL_NO_AD]. */
internal fun isPoolVend(method: Method): Boolean {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || !method.returnType.startsWith("L")) return false
    val instructions = method.implementation?.instructions ?: return false
    return instructions.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == POOL_NO_AD }
}

/** The pool's vends, from the one class holding [POOL_NO_AD]. */
internal fun BytecodePatchContext.reelsAdPoolVends(): List<MutableMethod> {
    val pools = classDefByStrings(POOL_NO_AD, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val pool = pools.singleOrNull()
        ?: throw PatchException("$SPONSORED_REELS_PATCH: expected one Reels ad pool loading \"$POOL_NO_AD\", found ${pools.size}")
    val vends = pool.methods.filter(::isPoolVend)
    if (vends.isEmpty()) {
        throw PatchException("$SPONSORED_REELS_PATCH: ${pool.type} loads \"$POOL_NO_AD\" but has no instance method handing back an object")
    }
    val mutable = mutableClassDefBy(pool.type)
    return vends.map { vend -> mutable.findMutableMethodOf(vend) }
}

/**
 * The FbShorts pool's vends, one per vend of the Reels pool ([reelVends]). Both pools extend one pool
 * base, and the story loader (CSRStoryPoolContainerImpl) asks a pool through one of the two base
 * methods the Reels pool's vends override, picked by the container's validate flag. The FbShorts pool
 * overrides only one of them (584: the plain pick, not the one that validates), so a base method it
 * leaves alone gets an override here that calls the base, and every route into the pool has a vend
 * to hold.
 */
internal fun BytecodePatchContext.fbShortsAdPoolVends(reelVends: List<Method>): List<MutableMethod> {
    val pools = classDefByStrings(FB_SHORTS_POOL, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val pool = pools.singleOrNull()
        ?: throw PatchException("$SPONSORED_REELS_PATCH: expected one FbShorts ad pool loading \"$FB_SHORTS_POOL\", found ${pools.size}")
    val reelPool = reelVends.map { it.definingClass }.distinct().singleOrNull()
        ?: throw PatchException("$SPONSORED_REELS_PATCH: the Reels ad pool's vends sit on more than one class")
    val base = classDefBy(reelPool).superclass
    if (base == null || pool.superclass != base) {
        throw PatchException("$SPONSORED_REELS_PATCH: ${pool.type} extends ${pool.superclass}, not the Reels ad pool's base $base")
    }
    val mutable = mutableClassDefBy(pool.type)
    return reelVends.map { vend ->
        mutable.methods.firstOrNull { MethodUtil.methodSignaturesMatch(it, vend) }
            ?: callingBase(mutable, base, vend)
    }
}

/** Adds to [pool] an override of [vend]'s base method [base] that only calls the base and hands back its answer. */
private fun callingBase(pool: MutableClass, base: String, vend: Method): MutableMethod {
    if (!vend.returnType.startsWith("L")) {
        throw PatchException("$SPONSORED_REELS_PATCH: the vend $vend hands back no object")
    }
    val parameterTypes = vend.parameterTypes.map { it.toString() }
    // this, then each parameter, a wide one taking two registers, and one local for the answer.
    val parameterRegisters = 1 + parameterTypes.size + parameterTypes.count { it == "J" || it == "D" }
    val call = "$base->${vend.name}(${parameterTypes.joinToString("")})${vend.returnType}"
    return ImmutableMethod(
        pool.type,
        vend.name,
        parameterTypes.map { ImmutableMethodParameter(it, null, null) },
        vend.returnType,
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(parameterRegisters + 1),
    ).toMutable().apply {
        addInstructions(
            0,
            """
                invoke-super/range { p0 .. p${parameterRegisters - 1} }, $call
                move-result-object v0
                return-object v0
            """,
        )
        pool.methods.add(this)
    }
}

/**
 * First thing in a vend: ask the extension ([hook], the Reels pool's by default), and answer null
 * when it holds the ad back. Null is what the vend itself answers when no slot is free, before it
 * touches the pool, so the loader goes on with the next organic reel and the ad stays in the pool
 * unused.
 */
internal fun MutableMethod.holdPoolAdFirst(hook: String = HOLD_POOL_AD) {
    requireLocals(SPONSORED_REELS_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $hook
            move-result v0
            if-eqz v0, :facebook
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
