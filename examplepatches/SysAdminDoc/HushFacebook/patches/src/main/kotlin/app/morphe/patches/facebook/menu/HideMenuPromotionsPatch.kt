/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.media.taptoplay.isEnumNaming
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.Method

internal const val HIDE_SECTION = "$EXTENSION_PACKAGE/menu/MenuSections;->hideSection(Ljava/lang/Object;)Z"
internal const val HIDE_SERVER_SECTION = "$EXTENSION_PACKAGE/menu/MenuSections;->hideServerSection(Ljava/lang/Object;)Z"

/**
 * Both sections of a Menu group ask the extension about the group as soon as they know it, and
 * hand back no children when it says the group goes. See MenuSectionAnchors.kt for how the Menu is
 * built. Every other group, Settings and Help included, builds as Facebook built it.
 */
@Suppress("unused")
val hideMenuPromotionsPatch = bytecodePatch(
    name = "Hide Menu promotions",
    description = "Hides the Upgrades and Also from Meta sections of Facebook's Menu. Each has its own switch. " +
        "Settings, Help and support, your shortcuts and the rest of the Menu stay.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val isGroupEnum = { type: String -> classDefByOrNull(type)?.let { isEnumNaming(it, SECTION_NAMES) } == true }

        val native = single(NATIVE_SECTION_KEY, "native Menu group section", ::isNativeSectionChildren)
        val nativeRead = nativeGroupRead(native, isGroupEnum) ?: throw PatchException(
            "$PATCH: ${native.definingClass}->${native.name} doesn't make one call answering the Menu's group enum " +
                "(${SECTION_NAMES.joinToString()}) and keep its answer",
        )
        val server = single(SERVER_POSITIONS.first(), "server Menu group section", ::isServerSectionChildren)
        val serverRead = serverGroupRead(server, isGroupEnum) ?: throw PatchException(
            "$PATCH: ${server.definingClass}->${server.name} doesn't read one group field of its own class",
        )
        if (serverRead.type != nativeRead.type) {
            throw PatchException(
                "$PATCH: the native section's group is ${nativeRead.type} and the server section's ${serverRead.type}",
            )
        }

        mutableClassDefBy(native.definingClass).findMutableMethodOf(native)
            .buildNothingWhenHidden(nativeRead, children(native), HIDE_SECTION)
        mutableClassDefBy(server.definingClass).findMutableMethodOf(server)
            .buildNothingWhenHidden(serverRead, children(server), HIDE_SERVER_SECTION)
        enableStatus("menuPromotions")
    }
}

/** The one children builder of a class loading [string] that [wanted] takes, outside the extension. */
private fun BytecodePatchContext.single(string: String, what: String, wanted: (Method) -> Boolean): Method {
    val found = classDefByStrings(string, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { classDef -> classDef.methods.filter(wanted) }
    return found.singleOrNull()
        ?: throw PatchException("$PATCH: expected one $what loading \"$string\", found ${found.size}")
}

private fun children(method: Method): ChildrenList = childrenList(method) ?: throw PatchException(
    "$PATCH: ${method.definingClass}->${method.name} doesn't read its children from one list it builds",
)

/**
 * Right after the section puts its group in a register, the group goes to [hook], and a yes hands
 * back a new, empty list of children built the way the section builds its own. A no goes on with
 * the section's own next instruction. The list's field is read through a 4-bit operand, so the
 * one register borrowed is a free local no higher than v15; the group goes through the range form,
 * which names any register.
 */
internal fun MutableMethod.buildNothingWhenHidden(read: GroupRead, list: ChildrenList, hook: String) {
    val index = read.index + 1
    val answer = freeLocalsAt(PATCH, index, 1).single()
    addInstructionsWithLabels(
        index,
        """
            invoke-static/range { v${read.register} .. v${read.register} }, $hook
            move-result v$answer
            if-eqz v$answer, :facebook
            new-instance v$answer, ${list.builder}
            invoke-direct/range { v$answer .. v$answer }, ${list.builder}-><init>()V
            iget-object v$answer, v$answer, ${list.children}
            return-object v$answer
        """.trimIndent(),
        ExternalLabel("facebook", getInstruction(index)),
    )
}
