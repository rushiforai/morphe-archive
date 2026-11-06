/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireParameterIntact
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "Sharper images"
internal const val SHARPER_IMAGES_HOOK =
    "$EXTENSION_PACKAGE/ui/SharperImages;->pick(Ljava/util/List;Ljava/lang/Object;I)Ljava/lang/Object;"
internal const val HUSH_PHOTO_SIZE = "$EXTENSION_PACKAGE/ui/HushPhotoSize;"
internal const val PHOTO_SIZE = "Lcom/tumblr/imageinfo/PhotoSize;"
internal const val PHOTO_INFO = "Lcom/tumblr/imageinfo/PhotoInfo;"
private const val LIST = "Ljava/util/List;"

/** The getters [HUSH_PHOTO_SIZE] declares, which Tumblr's image size already answers by name. */
private val SIZE_GETTERS = mapOf("getUrl" to "Ljava/lang/String;", "getWidth" to "I", "getHeight" to "I")

/** A return of the size chooser, the register it returns, and where the hook goes. */
internal data class SizeReturn(val at: Int, val pick: Int)

internal class SharperImagesPlan(val chooser: MutableMethod, val returns: List<SizeReturn>, val sizes: Int, val width: Int)

/**
 * Tumblr picks which copy of an image to load (`r5f.f` in 47.0.0.108) from the sizes the post
 * lists, for a width it caps at 640 before asking, then shrinks again on a slow connection. Each
 * return of that chooser goes through the extension with the full list and the width asked for,
 * and the extension can answer a larger listed copy. Tumblr's image size answers the extension's
 * [HUSH_PHOTO_SIZE] with its own public getters, so the size class only gains an interface.
 */
@Suppress("unused")
val sharperImagesPatch = bytecodePatch(
    name = PATCH,
    description = "Loads images in posts at a higher resolution when Tumblr has a larger copy, up to twice the width" +
        " Tumblr shows them at, even on a slow connection. GIFs go up too, but never past the pixel count of a" +
        " 1280 by 960 one. Uses more" +
        " data. Starts off." +
        " Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("sharperImages")
        requireStatusMethod("imageSizes")
        val plan = resolveSharperImages()
        // Last return first, so the earlier indices stay where the plan found them.
        plan.returns.sortedByDescending { it.at }.forEach { site ->
            plan.chooser.addInstructions(site.at, """
                invoke-static { v${plan.sizes}, v${site.pick}, v${plan.width} }, $SHARPER_IMAGES_HOOK
                move-result-object v${site.pick}
                check-cast v${site.pick}, $PHOTO_SIZE
            """)
        }
        mutableClassDefBy(PHOTO_SIZE).interfaces.add(HUSH_PHOTO_SIZE)
        enableCapability("imageSizes")
        enableStatus("sharperImages")
    }
}

private fun Method.choosesSize(): Boolean {
    val types = parameterTypes.map(CharSequence::toString)
    return isStatic() && returnType == PHOTO_SIZE && types.size == 5 && types[1] == "I" && types[2] == "I" &&
        types[3] == PHOTO_INFO && types[4] == "Z"
}

/** Every target, register and the size class are checked before anything changes. */
internal fun BytecodePatchContext.resolveSharperImages(): SharperImagesPlan {
    requireExtensionHook(PATCH, SHARPER_IMAGES_HOOK)
    val contract = classDefByOrNull(HUSH_PHOTO_SIZE)
    requireShape(PATCH, contract != null && AccessFlags.INTERFACE.isSet(contract.accessFlags) &&
        contract.methods.count() == SIZE_GETTERS.size && contract.methods.all { method ->
            SIZE_GETTERS[method.name]?.let { method.hasShape(emptyList(), it) } == true &&
                AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.ABSTRACT.isSet(method.accessFlags)
        }, "the extension's image size bridge is missing or changed")
    val size = classDefByOrNull(PHOTO_SIZE)
    requireShape(PATCH, size != null && !AccessFlags.INTERFACE.isSet(size.accessFlags), "Tumblr's image size class is missing")
    requireShape(PATCH, HUSH_PHOTO_SIZE !in size!!.interfaces, "Tumblr's image size is already bridged")
    SIZE_GETTERS.forEach { (name, result) ->
        requireShape(PATCH, size.methods.any {
            it.name == name && it.hasShape(emptyList(), result) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }, "Tumblr's image size no longer has a public $name()")
    }

    val choosers = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(choosers) { it.choosesSize() }
    }
    val chooser = choosers.only(PATCH, "the image size chooser")
    val steps = chooser.instructionList()
    val listed = steps.getOrNull(0)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }?.methodRef()
    val stored = steps.getOrNull(1)
    requireShape(
        PATCH,
        listed != null && listed.definingClass == PHOTO_INFO && listed.hasShape(emptyList(), LIST) &&
            stored?.opcode == Opcode.MOVE_RESULT_OBJECT,
        "the image size chooser doesn't start by reading the image's sizes",
    )
    val sizes = (stored as OneRegisterInstruction).registerA
    requireShape(
        PATCH,
        steps.indices.none { it != 1 && writesRegister(steps[it], sizes) },
        "the image size chooser reuses the register holding the sizes",
    )
    val returns = steps.indices.filter { steps[it].opcode == Opcode.RETURN_OBJECT }.map {
        SizeReturn(it, (steps[it] as OneRegisterInstruction).registerA)
    }
    requireShape(PATCH, returns.isNotEmpty(), "the image size chooser never returns a size")
    val width = chooser.parameterRegisterNumber(1)
    chooser.requireParameterIntact(PATCH, 1, returns.map { it.at })
    requireShape(
        PATCH,
        sizes < 16 && width < 16 && returns.all { it.pick < 16 && it.pick != sizes && it.pick != width },
        "the image size chooser keeps the sizes, the width or its pick out of the hook's reach",
    )

    val mutableChooser = mutableOf(chooser)
    returns.forEach { mutableChooser.requireFallthrough(it.at) }
    return SharperImagesPlan(mutableChooser, returns, sizes, width)
}

/** Refuses when a jump lands on a return: the label stays on Tumblr's instruction, so the jump would skip the hook. */
private fun MutableMethod.requireFallthrough(index: Int) {
    requireShape(
        PATCH,
        (implementation!!.instructions[index] as BuilderInstruction).location.labels.isEmpty(),
        "Tumblr's code jumps straight to a return of the image size chooser",
    )
}
