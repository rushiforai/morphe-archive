/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.photo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.patchLog
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Where Facebook's own Save photo asks Meta's CDN for a bigger copy of the photo, on 577, 580 and
 * 581.
 *
 * Its save (`subscribeToEncodedImage`, a name Redex keeps, 581 `LX/8pP;`) takes the photo's
 * imageHigh address and, behind a MobileConfig flag, hands it to the app's image address modifier
 * (581 `LX/3PI;->A00`, an `LX/3ib;`) with resize options (581 `LX/1g7;`: a scale type, a fetch
 * tier, and a width and height from MobileConfig). The live modifier, SmartFetchUriModifier (581
 * `LX/3PE;`), rewrites the address's `ctp`, the size it asks the CDN for, toward the box it's given
 * and never past its `cstp`, the most the CDN serves that image at. On the S22 (581, 2026-10-07)
 * that's how Facebook's save got a NASA photo at 1536x2048 where the model's largest copy was
 * 1080x1440. Where the app runs the no-op modifier instead, the address comes back as it was, and
 * so does Facebook's save.
 *
 * The call is found by its shape: the one interface call in the save taking an address and an
 * options object and answering an address, the modifier read from a static field right before
 * it. The options are built right before that from two static fields and the two sizes: the scale
 * type read where the save falls through when MobileConfig names none of the crops, FIT_CENTER,
 * and the tier. 577 reads the two sizes from MobileConfig through a static helper and 580 and 581
 * through the interface, so they aren't copied: the extension asks for the most the address's
 * `cstp` allows, which is at least what Facebook's save gets.
 */
internal const val SAVE_ENCODED_IMAGE = "subscribeToEncodedImage"

/** The extension's stub the patch fills with the modifier's answer. */
internal const val CDN_RESIZE_STUB = "cdnResized"

/** The helper the patch adds to the save's class, which the stub calls. */
internal const val CDN_RESIZE_HELPER = "hushfacebookCdnResized"

private const val URI = "Landroid/net/Uri;"

/** The modifier's call in Facebook's save, and the options it's handed. */
internal data class CdnResize(
    /** The save's class, which gets the helper. */
    val owner: String,
    /** The static field the modifier is read from. */
    val modifier: FieldReference,
    /** The modifier's (address, options) call answering an address. */
    val resize: MethodReference,
    /** The options' (scale type, tier, int, int) constructor. */
    val options: MethodReference,
    /** The static fields the scale type (FIT_CENTER) and the tier are read from. */
    val scale: FieldReference,
    val tier: FieldReference,
)

/** Facebook's save of a photo it's showing: an instance method by the kept name answering nothing. */
internal fun isSaveEncodedImage(method: Method): Boolean =
    method.name == SAVE_ENCODED_IMAGE && method.returnType == "V" && method.implementation != null &&
        !AccessFlags.STATIC.isSet(method.accessFlags)

/**
 * The modifier's call in [save]. Null unless there's exactly one call of its shape, the modifier
 * comes from the static field read right before it, and the options it's handed are built right
 * before that by one constructor call fed from a `new-instance` and two static field reads.
 */
internal fun cdnResize(save: Method): CdnResize? {
    val code = save.implementation?.instructions?.toList() ?: return null
    val at = code.indices.filter { isResizeCall(code[it]) }.singleOrNull() ?: return null
    val resize = code[at].method()!!
    val call = code[at] as FiveRegisterInstruction
    val modifier = staticRead(code.getOrNull(at - 1), call.registerC, resize.definingClass) ?: return null

    val optionsType = resize.parameterTypes[1].toString()
    val init = code.indices.filter { isOptionsInit(code[it], optionsType) }.singleOrNull() ?: return null
    if (init < 3 || init >= at) return null
    val options = code[init].method()!!
    val made = code[init] as FiveRegisterInstruction
    if (made.registerC != call.registerE) return null
    val created = code[init - 1]
    if (created.opcode != Opcode.NEW_INSTANCE || (created as OneRegisterInstruction).registerA != made.registerC ||
        ((created as ReferenceInstruction).reference as? TypeReference)?.type != optionsType
    ) {
        return null
    }
    val tier = staticRead(code[init - 2], made.registerE, options.parameterTypes[1].toString()) ?: return null
    val scale = staticRead(code[init - 3], made.registerD, options.parameterTypes[0].toString()) ?: return null
    return CdnResize(save.definingClass, modifier, resize, options, scale, tier)
}

/** An interface call of (Uri, object) answering a Uri, on four-bit registers. */
private fun isResizeCall(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_INTERFACE) return false
    val method = instruction.method() ?: return false
    val types = method.parameterTypes.map { it.toString() }
    return method.returnType == URI && types.size == 2 && types[0] == URI && types[1].startsWith("L") &&
        (instruction as FiveRegisterInstruction).registerCount == 3
}

/** [optionsType]'s (object, object, int, int) constructor. */
private fun isOptionsInit(instruction: Instruction, optionsType: String): Boolean {
    if (instruction.opcode != Opcode.INVOKE_DIRECT) return false
    val method = instruction.method() ?: return false
    val types = method.parameterTypes.map { it.toString() }
    return method.definingClass == optionsType && method.name == "<init>" && types.size == 4 &&
        types[0].startsWith("L") && types[1].startsWith("L") && types[2] == "I" && types[3] == "I"
}

/** The static field [instruction] reads into [register], when it's an `sget-object` of [type]. */
private fun staticRead(instruction: Instruction?, register: Int, type: String): FieldReference? {
    if (instruction?.opcode != Opcode.SGET_OBJECT || (instruction as OneRegisterInstruction).registerA != register) return null
    val field = (instruction as ReferenceInstruction).reference as? FieldReference ?: return null
    return field.takeIf { it.type == type }
}

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * Fills the extension's [CDN_RESIZE_STUB] with Facebook's modifier call, through a helper on the
 * save's class that builds the options as the save does, with the extension's width and height.
 * A build where the call isn't found keeps the stub empty, and Save photo saves the largest copy
 * the photo's model holds, as it did before.
 */
internal fun BytecodePatchContext.fillCdnResize() {
    val saves = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
        classDef.methods.filterTo(saves, ::isSaveEncodedImage)
    }
    val found = saves.singleOrNull()?.let(::cdnResize)
    if (found == null) {
        patchLog.warning("$PHOTO_PATCH: Facebook's photo address modifier wasn't found in ${saves.size} saves, so photos save at the largest size their model holds")
        return
    }
    val stub = mutableClassDefBy(PHOTO_SAVE).methods.singleOrNull {
        it.name == CDN_RESIZE_STUB && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == URI &&
            it.parameterTypes.map(CharSequence::toString) == listOf(URI, "I", "I")
    }
    if (stub == null) {
        patchLog.warning("$PHOTO_PATCH: $PHOTO_SAVE has no static Uri $CDN_RESIZE_STUB(Uri, int, int)")
        return
    }
    mutableClassDefBy(found.owner).methods.add(cdnResizeHelper(found))
    // d8 gives the stub no locals of its own, so the answer goes back in p0, used by then.
    stub.addInstructions(
        0,
        """
            invoke-static { p0, p1, p2 }, ${found.owner}->$CDN_RESIZE_HELPER(${URI}II)$URI
            move-result-object p0
            return-object p0
        """,
    )
}

/**
 * The helper: the options built from the save's scale type and tier with the width and height it's
 * handed, and the modifier's answer for the address it's handed. Four locals and three parameters.
 */
internal fun cdnResizeHelper(found: CdnResize) = ImmutableMethod(
    found.owner,
    CDN_RESIZE_HELPER,
    listOf(URI, "I", "I").map { ImmutableMethodParameter(it, null, null) },
    URI,
    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
    null,
    null,
    MutableMethodImplementation(7),
).toMutable().apply {
    addInstructions(
        0,
        """
            sget-object v0, ${found.scale}
            sget-object v1, ${found.tier}
            new-instance v2, ${found.options.definingClass}
            invoke-direct { v2, v0, v1, p1, p2 }, ${found.options}
            sget-object v3, ${found.modifier}
            invoke-interface { v3, p0, v2 }, ${found.resize}
            move-result-object v0
            return-object v0
        """,
    )
}
