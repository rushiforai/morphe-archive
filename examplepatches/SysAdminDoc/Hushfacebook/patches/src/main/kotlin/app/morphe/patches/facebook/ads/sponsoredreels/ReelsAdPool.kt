/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Facebook's Reels and Watch ad pool, which it calls VideoHomeSponsoredPool (581 `LX/5eK;`, 580
 * `LX/5e6;`, 577 `LX/5bF;`). The client-side story loader that fills the Reels tab asks it for an
 * ad whenever a slot comes up, through the pool base class every story pool shares. The pool marks
 * the ad it hands out as used and logs the ad position before the loader puts it in a page, so the
 * page filters only see an ad the pool has already given away.
 *
 * Each of its two vends logs this literal when it has no ad to give, and no other class holds it.
 */
internal const val POOL_NO_AD = "-WVCDF-NO-AD"

private const val HOLD_POOL_AD = "$EXTENSION_PACKAGE/ads/ReelsAdFilter;->holdPoolAd()Z"

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
 * First thing in a vend: ask the extension, and answer null when it holds the ad back. Null is what
 * the vend itself answers when no slot is free, before it touches the pool, so the loader goes on
 * with the next organic reel and the ad stays in the pool unused.
 */
internal fun MutableMethod.holdPoolAdFirst() {
    requireLocals(SPONSORED_REELS_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HOLD_POOL_AD
            move-result v0
            if-eqz v0, :facebook
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
