package app.saketh.patches.webnovel.comments

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val COMMENT_MENU_LAYOUT = "reply_main_item_click_content_pop_window"
private const val COMMENT_ACTIONS = "Lapp/saketh/extension/comments/CommentActions;"
private const val BOOK_SYNOPSIS = "Lapp/saketh/extension/comments/BookSynopsis;"
private const val NATIVE_HTTP_RESULT = "Lcom/qidian/Int/reader/bridge/plugins/NetworkPlugin\$apiSubscriber\$1;"
private const val FLUTTER_PAGE = "Lcom/qidian/Int/reader/flutter/HwFlutterActivity;"

/** Builds the long-press menu (Delete, Dislike, Report) of chapter and paragraph comments and replies. */
private object CommentMenuFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Landroid/content/Context;", "J", "I", "I", "I", "L"),
    filters = listOf(resourceLiteral(ResourceType.LAYOUT, COMMENT_MENU_LAYOUT)),
)

/** Opens the full author's note in a bottom sheet when the note at the end of a chapter is tapped. */
private object AuthorNoteSheetFingerprint : Fingerprint(
    definingClass = "Lcom/yuewen/webnovel/wengine/view/WCreatorThoughtsView;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = "Landroid/widget/TextView;", name = "setMovementMethod")),
)

@Suppress("unused")
val copyTranslatePatch = patch(
    name = "Copy and translate",
    description = "Adds Copy and Translate to the long-press menu of chapter and paragraph comments " +
        "and their replies, using WebNovel's own machine translation, and hides Dislike. " +
        "The target language is chosen in Patch controls or the translation window. Long-press a " +
        "book's details page to select, copy or translate its synopsis. Book reviews are not covered.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("copy_translate")
        resourceXml("res/layout/$COMMENT_MENU_LAYOUT.xml").use { layout ->
            // The popup caps its width at the screen. With two more actions the row can overflow on
            // narrow screens or long-label languages, so the root becomes a HorizontalScrollView
            // holding the original row, and Translate scrolls into view instead of being clipped.
            val scroller = layout.root
            val rowAttributes = scroller.attributeNames.filterNot { it.startsWith("xmlns") }
            val actions = scroller.children.toList()
            val menu = scroller.insertChild(0, "LinearLayout") {
                rowAttributes.forEach { name -> setAttribute(name, scroller.attribute(name)!!) }
            }
            actions.forEach { menu.appendCopy(it); it.remove() }
            rowAttributes.forEach(scroller::removeAttribute)
            scroller.tag = "HorizontalScrollView"
            scroller.setAttribute("android:layout_width", "wrap_content")
            scroller.setAttribute("android:layout_height", "wrap_content")
            scroller.setAttribute("android:scrollbars", "none")
            listOf(
                Triple("saketh_comment_copy", "s_c_file_copy_line", "copy"),
                Triple("saketh_comment_translate", "s_c_translate", "translate"),
            ).forEach { (id, icon, label) ->
                menu.appendChild("LinearLayout") {
                    setAttribute("android:id", "@+id/$id")
                    setAttribute("android:layout_gravity", "center_vertical")
                    setAttribute("android:orientation", "horizontal")
                    setAttribute("android:layout_width", "wrap_content")
                    setAttribute("android:layout_height", "wrap_content")
                    appendChild("androidx.appcompat.widget.AppCompatImageView") {
                        setAttribute("android:layout_width", "@dimen/dp_20")
                        setAttribute("android:layout_height", "@dimen/dp_20")
                        setAttribute("app:srcCompat", "@drawable/$icon")
                        setAttribute("app:tint", "@color/neutral_content_on_inverse")
                    }
                    appendChild("TextView") {
                        setAttribute("android:textColor", "@color/neutral_content_on_inverse")
                        setAttribute("android:layout_width", "wrap_content")
                        setAttribute("android:layout_height", "wrap_content")
                        setAttribute("android:text", "@string/$label")
                        setAttribute("android:layout_marginStart", "@dimen/dp_6")
                        setAttribute("style", "@style/Button2Text")
                    }
                }
            }
            // Even spacing and full-height touch targets: the stock row mixes margins per item.
            menu.setAttribute("android:paddingHorizontal", "@dimen/dp_8")
            menu.children.forEach { action ->
                action.removeAttribute("android:layout_marginStart")
                action.setAttribute("android:layout_height", "match_parent")
                action.setAttribute("android:gravity", "center_vertical")
                action.setAttribute("android:paddingHorizontal", "@dimen/dp_10")
            }
        }

        // Each caller builds the menu, then shows it under the comment. Showing it through the
        // extension wires the new items to that comment's text.
        val menuBuilder = CommentMenuFingerprint.method
        val menuParameters = menuBuilder.parameterTypes.joinToString("")
        fun MethodReference.isMenuBuilder() = name == menuBuilder.name &&
            definingClass == menuBuilder.definingClass && returnType == menuBuilder.returnType &&
            parameterTypes.joinToString("") == menuParameters
        var callers = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { method ->
                    method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.isMenuBuilder() == true
                    } == true
                }
            ) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val built = instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.isMenuBuilder() == true
                }
                if (built < 0) return@forEach
                val show = (built until instructions.size).first {
                    val call = instructions[it]
                    call.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((call as ReferenceInstruction).reference as MethodReference).name == "showAsDropDown"
                }
                val call = instructions[show] as FiveRegisterInstruction
                method.replaceInstruction(
                    show,
                    "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                        "$COMMENT_ACTIONS->show(Landroid/widget/PopupWindow;Landroid/view/View;)V",
                )
                callers++
            }
        }
        if (callers == 0) throw PatchException("No comment long-press menu callers found")

        // The sheet scrolls its text with a movement method that cannot select; selectable text still scrolls.
        AuthorNoteSheetFingerprint.let {
            val index = it.instructionMatches.first().index
            val note = (it.method.implementation!!.instructions[index] as FiveRegisterInstruction).registerC
            val flag = it.method.findFreeRegister(index + 1, note)
            it.method.addInstructions(
                index + 1,
                """
                    const/4 v$flag, 0x1
                    invoke-virtual { v$note, v$flag }, Landroid/widget/TextView;->setTextIsSelectable(Z)V
                """,
            )
        }

        // Book details are Flutter. Flutter fetches them through the native HTTP bridge, so the
        // extension keeps each synopsis it sees there.
        mutableClassDefBy(NATIVE_HTTP_RESULT).methods.single {
            it.name == "onNext" && it.parameterTypes == listOf("Lorg/json/JSONObject;")
        }.addInstructions(0, "invoke-static { p1 }, $BOOK_SYNOPSIS->seen(Lorg/json/JSONObject;)V")

        // Every Flutter page watches touches for a long press, which opens the open book's synopsis.
        val flutterPage = mutableClassDefBy(FLUTTER_PAGE)
        val touch = listOf("Landroid/view/MotionEvent;")
        check(flutterPage.methods.none { it.name == "dispatchTouchEvent" && it.parameterTypes == touch })
        flutterPage.methods.add(
            MutableMethod(
                ImmutableMethod(
                    flutterPage.type,
                    "dispatchTouchEvent",
                    touch.map { ImmutableMethodParameter(it, emptySet(), null) },
                    "Z",
                    AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    MutableMethodImplementation(3),
                ),
            ).apply {
                addInstructions(
                    0,
                    """
                        invoke-static { p0, p1 }, $BOOK_SYNOPSIS->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)V
                        invoke-super { p0, p1 }, ${flutterPage.superclass}->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
                        move-result v0
                        return v0
                    """,
                )
            },
        )
    }
}
