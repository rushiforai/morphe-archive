// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.edbfi.extension.syncforreddit.authorcolors.bindings.AuthorColors
import app.reseam.patch.PatchRuntime
import app.reseam.patch.Type
import app.reseam.patch.XmlDocument
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.dex.invokeRegisters
import app.reseam.patch.dex.literal
import app.reseam.patch.dex.methodRef
import app.reseam.patch.dex.opcode
import app.reseam.patch.dex.regA
import app.reseam.patch.dex.regB
import app.reseam.patch.dex.returnType
import app.reseam.patch.field
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.methods
import app.reseam.patch.points
import app.reseam.patch.types.Instruction

private const val CONTEXT = "android.content.Context"
private const val FRAGMENT = "androidx.fragment.app.Fragment"
private const val FRAGMENT_ACTIVITY = "androidx.fragment.app.FragmentActivity"
private const val BOTTOM_SHEET = "com.google.android.material.bottomsheet.BottomSheetDialogFragment"
private const val SELECTION_SHEET = "com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.material_dialogs.base.AbstractSelectionDialogBottomSheet"
// The extension subclasses this row through its compile-only stub.
private const val SELECTION_ROW = "$SELECTION_SHEET\$h"
private const val LOCAL_COLORS = "edbfi_local_author_colors"
private const val MAP = "java.util.Map"

internal fun PatchRuntime.resolveAuthorColorEdits(): () -> Unit {
    val paintManager = klass("Sync local paint store") { sourceFile("UserPaintManager.java") }
    val manager = methods("Get the current local paint manager") {
        inClass(paintManager)
        flags(AccessFlags.PUBLIC or AccessFlags.STATIC)
        params()
        returns(paintManager.descriptor)
    }.single()
    val allColors = methods("Read the active profile's local paints") {
        inClass(paintManager)
        flags(AccessFlags.PUBLIC)
        params()
        returns(MAP)
        opcodeSequence(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT)
    }.single()
    val persistPaints = methods("Persist device-local paint entries") {
        inClass(paintManager)
        flags(AccessFlags.PRIVATE or AccessFlags.STATIC)
        strings("user_paint_ultra", "###USER_PAINT_ULTRA###")
        params(Type.String, MAP)
        returns(Type.Void)
    }.single()
    val savePaint = methods("Save one paint locally with no profile lookup") {
        inClass(paintManager)
        flags(AccessFlags.PUBLIC)
        strings("Adding paint from notification: ")
        params(Type.String, Type.String, Type.String)
        returns(Type.Void)
        calls(persistPaints)
        calls { owner("android.graphics.Color"); name("parseColor") }
    }.single()
    val removePaint = methods("Remove one paint locally") {
        inClass(paintManager)
        flags(AccessFlags.PUBLIC)
        strings("Removing paint from notification: ")
        params(Type.String, Type.String)
        returns(Type.Void)
        calls(persistPaints)
    }.single()
    val paintChange = methods("Notify Sync of a local paint change") {
        inClass(paintManager)
        strings("Notifying change...", "Username was current")
        params(Type.String)
        returns(Type.Void)
        calledBy(persistPaints)
    }.single()
    val account = klass("Sync account singleton") {
        sourceFile("AccountSingleton.java")
        hasInstanceField(Type.String)
        strings("Logged out")
    }
    val activeAccount = paintChange.points("Get the active account singleton") {
        invokeStatic { owner(account.descriptor); params(); returns(account.descriptor) }
    }.single().callee()
    val profileName = paintChange.points("Get the current profile name for local paint writes") {
        invokeVirtual { owner(account.descriptor); params(); returns(Type.String) }
        argument(0) { resultOf(account.descriptor) }
    }.single().callee()

    val commentSheet = klass("Comment options sheet") {
        sourceFile("CommentMoreDialogBottomSheet.java")
        strings("Tag user", "Paint user")
    }
    val buildOptions = methods("Build comment options including the native tag row") {
        inClass(commentSheet)
        strings("Tag user", "Remove tag", "Paint user")
        params()
        returns(Type.Void)
    }.single()
    val addOption = buildOptions.points("Add the native tag option") {
        string("Tag user")
        then {
            invokeDirect { owner(SELECTION_ROW); name("<init>"); params(Type.Int, Type.String); returns(Type.Void) }
        }
        then { invokeVirtual { owner(SELECTION_SHEET); params(SELECTION_ROW); returns(SELECTION_ROW) } }
    }.single().callee()
    val action = methods("Dispatch comment options") {
        inClass(commentSheet)
        params(SELECTION_ROW)
        returns(Type.Void)
    }.single()
    val tags = klass("Sync user tag manager") { sourceFile("NewUserTagManager.java") }
    val tagAction = action.points("Get the activity and author of the native tag action") {
        invokeVirtual { owner(FRAGMENT); params(); returns(FRAGMENT_ACTIVITY) }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then { opcode(Opcode.IGET_OBJECT) }
        then { invokeVirtual { params(); returns(Type.String) } }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then { invokeStatic { owner(tags.descriptor); params(CONTEXT, Type.String); returns(Type.Void) } }
    }.single()
    val readAuthor = tagAction.previous { invokeVirtual { params(); returns(Type.String) } }.callee()
    val commentField = tagAction.previous { opcode(Opcode.IGET_OBJECT) }.field()
    val activity = tagAction.previous { invokeVirtual { owner(FRAGMENT); params(); returns(FRAGMENT_ACTIVITY) } }.callee()
    val dismiss = action.points("Dismiss comment options after selecting an action") {
        invokeVirtual { owner(BOTTOM_SHEET); params(); returns(Type.Void) }
    }.single().callee()
    val icon = checkNotNull(resources.id("drawable", "format_paint")) { "Missing comment paint icon" }

    val builderType = spannableTextBuilder.descriptor
    val formatter = methods("Format the author and metadata in a comment header") {
        strings("\u200e", "Sync dev", "[score hidden]")
        params(builderType, "android.widget.TextView", commentField.type, commentField.type, Type.Boolean)
        returns(Type.Void)
        calls(readAuthor)
    }.single()

    val roundedSpan = klass("Sync rounded comment author span") { sourceFile("MonetRoundedCornerSpan.java") }
    val paintConstructor = roundedSpan.method("<init>") { params(Type.Int); returns(Type.Void) }
    val authorEnd = formatter.points("Resolve the comment author append range") {
        string("\u200e")
        then {
            invokeVirtual { owner(builderType); params("java.lang.CharSequence"); returns(Type.Void) }
            argument(1) { string("\u200e") }
        }
        then { invokeVirtual { owner(builderType); params(); returns(Type.Int) } }
        then { opcode(Opcode.MOVE_RESULT) }
        then { calls(readAuthor) }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then { invokeVirtual { owner(builderType); params("java.lang.CharSequence"); returns(Type.Void) } }
        then { invokeVirtual { owner(builderType); params(); returns(Type.Int) } }
        then { opcode(Opcode.MOVE_RESULT) }
    }.single()
    val nativePaint = formatter.points("Apply native saved paint to the comment author") {
        calls(paintConstructor)
        then { invokeVirtual { owner(builderType); params("java.lang.Object", Type.Int, Type.Int, Type.Int); returns(Type.Void) } }
    }.single()
    val setSpan = nativePaint.callee()
    val join = nativePaint
        .captureArgumentAs("builder", 0)
        .captureArgumentAs("start", 2)
        .captureArgumentAs("end", 3)
        .captureArgumentAs("flags", 4)
        .next {
            opcode(Opcode.MOVE)
            then { opcode(Opcode.GOTO) }
            then { opcode(Opcode.MOVE) }
        }.captureAs("hasPaint", Type.Boolean)
        .next { calls(readAuthor) }
        .captureArgumentAs("comment", 0)

    val end = authorEnd.index
    val span = nativePaint.index
    val insns = formatter.method.instructions
    val firstParam = formatter.method.registersSize - formatter.method.insSize
    val append = insns[end - 7].methodRef
    val length = insns[end - 6].methodRef
    val spanRegisters = insns[span].invokeRegisters.orEmpty()
    val nativeNew = nativePaint.previous { newInstance(roundedSpan.descriptor) }.index
    val guard = insns.getOrNull(nativeNew - 1) as? Instruction.Branch
    val jump = insns.getOrNull(span + 2) as? Instruction.Branch0
    val yes = insns.getOrNull(span + 1)
    val no = insns.getOrNull(span + 3)
    check(
        // Verify that the measured range surrounds the actual append of the comment author's name.
        spanRegisters.size == 5 && insns[end - 2].methodRef == append && insns[end - 1].methodRef == length &&
            insns[end - 7].invokeRegisters?.firstOrNull() == spanRegisters[0] &&
            insns[end - 2].invokeRegisters == listOf(spanRegisters[0], insns[end - 3].regA) &&
            insns[end - 6].invokeRegisters == listOf(firstParam) &&
            insns[end - 1].invokeRegisters == listOf(firstParam) &&
            insns[end - 4].invokeRegisters == listOf(firstParam + 3) &&
            nativePaint.writer(2).index == end - 5 && nativePaint.writer(3).index == end &&
            // The two paths join with a flag indicating whether the native colored pill was added.
            guard?.opcode == Opcode.IF_EQZ && insns[nativeNew - 2].opcode == Opcode.MOVE_RESULT &&
            insns[nativeNew - 2].regA == guard.regA &&
            insns[nativeNew - 3].methodRef?.definingClass == paintManager.descriptor &&
            insns[nativeNew - 3].methodRef?.returnType == Type.Boolean &&
            yes?.opcode == Opcode.MOVE && no?.opcode == Opcode.MOVE && yes.regA == no.regA &&
            jump?.opcode == Opcode.GOTO && jump.field0.offset == 2 &&
            // From if-eqz through allocation, the native color lookup, constructor, span call,
            // flag write and goto. DEX branch offsets are in 16-bit code units.
            span - nativeNew == 10 && guard.field0.offset == 28 &&
            join.index == span + 4 && insns[join.index].invokeRegisters == listOf(firstParam + 3) &&
            nativePaint.writer(4).instruction.literal == 33L,
    ) { "Sync comment author append range or native paint branch drifted in ${formatter.method.descriptor}" }

    val preferenceLookup = ultraSettings.points("Find the Ultra tag preference") {
        string("ultra_tag")
        then { invokeVirtual { params("java.lang.CharSequence"); returns(PREFERENCE) } }
    }.single().callee()
    val preference = klass(PREFERENCE)
    // These members are obfuscated and referenced by the compile-only stubs.
    listOf(
        preference.method("A0") { params(CLICK_LISTENER); returns(Type.Void) },
        preference.method("k") { params(); returns(CONTEXT) },
        klass(CLICK_LISTENER).method("a") { params(PREFERENCE); returns(Type.Boolean) },
        klass(SELECTION_ROW).method("<init>") { params(Type.Int, Type.String); returns(Type.Void) },
    ).forEach { it.method }
    listOf(manager, allColors, savePaint, removePaint, activeAccount, profileName, addOption, readAuthor, activity,
        dismiss, preferenceLookup, paintConstructor, setSpan).forEach { it.method }

    return {
        AuthorColors.storedColors.implement { returnValue(call(manager).call(allColors)) }
        AuthorColors.currentProfile.implement { returnValue(call(activeAccount).call(profileName)) }
        AuthorColors.writeColor.implement {
            val store = call(manager)
            whenNull(param(2)) {
                store.call(removePaint, param(0), param(1))
            }.otherwise {
                store.call(savePaint, param(0), param(1), param(2))
            }
            returnVoid()
        }
        buildOptions.after {
            val user = thisObject.field(commentField).call(readAuthor)
            val row = AuthorColors.createAction(user, int(icon.toInt()))
            whenNotNull(row) { thisObject.call(addOption, row) }
        }
        action.before {
            whenTrue(AuthorColors.editAction(thisObject.call(activity), param(0))) {
                thisObject.call(dismiss)
                returnVoid()
            }
        }
        join.before {
            val hasPaint = capture("hasPaint")
            whenFalse(hasPaint) {
                val color = AuthorColors.savedColor(capture("comment").call(readAuthor))
                whenNotNull(color) {
                    val rgb = color.callVirtual("java.lang.Integer", "intValue", "()I")
                    val pill = newInstance(roundedSpan.descriptor, "(I)V", rgb)
                    capture("builder").call(setSpan, pill, capture("start"), capture("end"), capture("flags"))
                    hasPaint.assign(bool(true))
                }
            }
        }
        ultraSettings.after {
            AuthorColors.registerManager(thisObject.call(preferenceLookup, string(LOCAL_COLORS)))
        }
    }
}

internal fun XmlDocument.resolveAuthorColorSettingsEdit(): () -> Unit {
    check(root.tag == "PreferenceScreen" && findByAttribute(KEY, LOCAL_COLORS).isEmpty()) {
        "Unexpected local author color preference in $ULTRA_XML"
    }
    val subscriberSection = requirePreference(ULTRA_XML, SUBSCRIBER_SECTION, "PreferenceCategory")
    check(subscriberSection.parent?.tag == "PreferenceScreen") { "Expected an Ultra settings category in $ULTRA_XML" }

    return {
        val manager = createElement(SYNC_PREFERENCE)
        manager[KEY] = LOCAL_COLORS
        manager["android:title"] = "Local author colors"
        manager["android:summary"] = "Edit colors saved for comment authors on this device"
        manager["android:icon"] = "@drawable/format_paint"
        manager["android:persistent"] = "false"
        root.insertBefore(manager, subscriberSection)
    }
}
