package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val FEATURE = "truecaller.swap_call_buttons"

// The extension helper that answers the swapped copy of a notification layout while the feature is
// on, and the stock layout otherwise (extensions/truecaller).
private const val SWAP_LAYOUTS = "Lapp/template/extension/truecaller/SwapCallButtons;"

// Suffix of the swapped layout copies; SwapCallButtons.SUFFIX in the extension must match.
internal const val SWAPPED_LAYOUT_SUFFIX = "_heval_swapped"

// Truecaller's own incoming call notification layouts. Two hold the buttons: the collapsed row
// (icon buttons, also part of the Android 12 expanded layout) and the older expanded layout (text
// buttons), each with the decline button right before the answer button in one LinearLayout. The
// rest only include them: the Android 12 expanded layout includes the collapsed row, and the six
// layouts the notification class inflates (dark / default theme of the collapsed, expanded and
// Android 12 expanded layout) include one of those three.
private const val NOTIFICATION_BIG_LAYOUT = "notification_call_incoming_big"
internal val NOTIFICATION_BUTTON_LAYOUTS = listOf("notification_call_incoming", NOTIFICATION_BIG_LAYOUT)
private const val NOTIFICATION_ROW_LAYOUT = "notification_call_incoming_big_new"
internal val NOTIFICATION_INFLATED_LAYOUTS = listOf(
    "notification_call_incoming_dark", "notification_call_incoming_default",
    "notification_call_incoming_big_dark", "notification_call_incoming_big_default",
    "notification_call_incoming_big_dark_new", "notification_call_incoming_big_default_new",
)

/** The single element of [path] whose android:id is [id], failing loudly when it is missing or duplicated. */
private fun org.w3c.dom.Document.viewById(path: String, id: String): Element {
    val all = getElementsByTagName("*")
    val matches = (0 until all.length)
        .mapNotNull { all.item(it) as? Element }
        .filter { it.getAttribute("android:id").substringAfter('/') == id }
    return matches.singleOrNull()
        ?: throw PatchException("$path: expected one view \"$id\", found ${matches.size}")
}

private fun Element.previousElement(): Element? {
    var node: Node? = previousSibling
    while (node != null && node !is Element) node = node.previousSibling
    return node as? Element
}

private fun layoutPath(name: String) = "res/layout/$name.xml"

// Adds a swapped copy of each notification layout, named <stock name>_heval_swapped, and leaves the
// stock layouts untouched, so the notification is stock while the feature is off. In the copies of
// the two button layouts the answer button moves in front of the decline button. Each keeps its id
// (the PendingIntents are bound by id), text, icon and colour; the margins stay with the slot, so the
// spacing between them is unchanged; the big copy's button row is made shorter so it fits the
// Android 12+ height cap. The copies of the other layouts include the swapped copies instead of the
// stock ones. The patcher gives the new files resource ids when it encodes the resources, so the
// bytecode part finds them by name at runtime.
private val swapCallNotificationButtonsResourcePatch = resourcePatch(
    description = "Adds swapped copies of Truecaller's own incoming call notification layouts.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        val copied = NOTIFICATION_BUTTON_LAYOUTS + NOTIFICATION_ROW_LAYOUT + NOTIFICATION_INFLATED_LAYOUTS
        decode(*copied.map(::layoutPath).toTypedArray())
        for (name in copied) {
            val source = get(layoutPath(name))
            if (!source.isFile) throw PatchException("${layoutPath(name)} not found")
            // A new file: no decode on request (copy = false).
            val copy = get(layoutPath(name + SWAPPED_LAYOUT_SUFFIX), false)
            if (copy.exists()) throw PatchException("${layoutPath(name + SWAPPED_LAYOUT_SUFFIX)} already exists")
            source.copyTo(copy)
        }

        for (name in NOTIFICATION_BUTTON_LAYOUTS) {
            val path = layoutPath(name + SWAPPED_LAYOUT_SUFFIX)
            document(path).use { doc ->
                val decline = doc.viewById(path, "button_decline")
                val answer = doc.viewById(path, "button_answer")
                if (answer.previousElement() !== decline) {
                    throw PatchException("$path: the decline button is not right before the answer button")
                }
                val margins = { view: Element ->
                    (0 until view.attributes.length).map { view.attributes.item(it) }
                        .filter { it.nodeName.startsWith("android:layout_margin") }
                        .associate { it.nodeName to it.nodeValue }
                }
                val declineMargins = margins(decline)
                val answerMargins = margins(answer)
                declineMargins.keys.forEach(decline::removeAttribute)
                answerMargins.keys.forEach(answer::removeAttribute)
                answerMargins.forEach(decline::setAttribute)
                declineMargins.forEach(answer::setAttribute)
                decline.parentNode.insertBefore(answer, decline)

                // The text buttons of the big layout were made for Android 11 and older, where
                // the call style notification is not used. Android 12+ decorates a custom view and
                // caps its height (heads-up: 136dp with 20dp above and below the content, so 96dp
                // of content). The big layout needs about 95dp at the default font size (two text
                // lines, 16dp gap, 44dp buttons), so the bottom of the buttons and their rounded
                // corners were cut off (issue #116). In the copy the gap above the buttons is 8dp,
                // the buttons are 40dp and the row gets 8dp below it, about 91dp: a cap eats the
                // empty space first. The collapsed layout's 44dp icon buttons fit its 48dp.
                if (name == NOTIFICATION_BIG_LAYOUT) {
                    val row = answer.parentNode as? Element
                    if (row?.tagName != "LinearLayout" || row.getAttribute("android:orientation") != "horizontal") {
                        throw PatchException("$path: the buttons are not in a horizontal LinearLayout")
                    }
                    row.setAttribute("android:layout_marginTop", "8.0dp")
                    row.setAttribute("android:layout_marginBottom", "8.0dp")
                    var child = row.firstChild
                    while (child != null) {
                        if (child is Element) {
                            if (!child.hasAttribute("android:layout_height")) {
                                throw PatchException("$path: ${child.getAttribute("android:id")} has no layout_height")
                            }
                            child.setAttribute("android:layout_height", "40.0dp")
                        }
                        child = child.nextSibling
                    }
                }
            }
        }

        // Each including layout includes exactly one of the button or row layouts.
        val included = (NOTIFICATION_BUTTON_LAYOUTS + NOTIFICATION_ROW_LAYOUT).associateBy { "@layout/$it" }
        for (name in listOf(NOTIFICATION_ROW_LAYOUT) + NOTIFICATION_INFLATED_LAYOUTS) {
            val path = layoutPath(name + SWAPPED_LAYOUT_SUFFIX)
            document(path).use { doc ->
                val includes = doc.getElementsByTagName("include").let { list -> (0 until list.length).map { list.item(it) as Element } }
                    .filter { it.getAttribute("layout") in included }
                val include = includes.singleOrNull()
                    ?: throw PatchException("$path: expected one include of ${included.keys}, found ${includes.size}")
                include.setAttribute("layout", "@layout/" + included.getValue(include.getAttribute("layout")) + SWAPPED_LAYOUT_SUFFIX)
            }
        }
    }
}

// A Heval Controls feature: the offsets, the call style check and the notification layouts take
// their patched path only while it is on. Each is read when an incoming call is shown, so no
// restart is needed.
@Suppress("unused")
val swapCallButtonsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Swap call answer and decline buttons",
        description = "Puts the answer button on the left and the decline button on the right for incoming calls.",
        category = TruecallerControlsCategory.CALL_SCREEN,
    ),
    default = false,
    dependencies = setOf(swapCallNotificationButtonsResourcePatch),
) {
    classDefBy(SWAP_LAYOUTS)

    // 1. The full screen incoming call UI. Each swipe button's modifier gets offset(x, y) right
    // before its test tag is loaded: the decline button -width / 3.5, the answer button
    // +width / 3.5. Negating x on both moves each to the other side. Offsets follow the layout
    // direction, so right-to-left layouts are mirrored the same way. The offset call is found by
    // shape: a static (Float, Float, Int, Modifier)Modifier call, Modifier being this
    // composable's first parameter type. x goes through a new (F)F helper that negates it while
    // the feature is on and passes it through while it is off.
    val method = IncomingCallButtonsFingerprint.method
    val modifier = method.parameterTypes.firstOrNull()?.toString()
        ?: throw PatchException("The incoming call buttons composable has no parameters")
    val offsetParameters = listOf("F", "F", "I", modifier)
    val negate = mutableClassDefBy(method.definingClass).addHevalValueHelper(FEATURE, "morpheSwapCallButtonOffset", "F") {
        """
            neg-float p0, p0
            return p0
        """
    }

    // Highest index first, so the earlier index stays valid after the insert.
    for (tag in listOf("answerCallButton", "rejectCallButton")) {
        val instructions = method.instructions.toList()
        val tagIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == tag
        }
        val offsetIndex = (tagIndex - 1 downTo 0).firstOrNull { index ->
            val instruction = instructions[index]
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_STATIC && call?.returnType == modifier &&
                call.parameterTypes.map(CharSequence::toString) == offsetParameters
        } ?: throw PatchException("No offset modifier before the \"$tag\" swipe button")
        // offset's first argument is x.
        val x = method.getInstruction<FiveRegisterInstruction>(offsetIndex).registerC
        method.requireNoBranchTargetAt(offsetIndex, "Swap call answer and decline buttons")
        method.filterThroughHevalHelper(offsetIndex, x, negate)
    }

    // 2. The incoming call notification. The system call style notification (Android 12+,
    // when the featureCallStyleNotifications experiment is on) always shows decline first, so
    // while the feature is on the builder's call style check answers false (through a new (Z)Z
    // helper): Truecaller's own layout is used, with the swapped layouts of step 3. Only the
    // incoming call notification changes; the ongoing call notification keeps its style.
    val ownLayout = IncomingCallNotificationFingerprint.let { fingerprint ->
        val notification = fingerprint.method
        val check = fingerprint.instructionMatches.last().index
        val instructions = notification.instructions.toList()
        val moveResult = instructions.getOrNull(check + 1)
        if (moveResult?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("The incoming call notification's call style check result is not kept")
        }
        val result = (moveResult as OneRegisterInstruction).registerA

        // The first branch on the result picks the layout; the result must not change before it.
        val branch = (check + 2 until instructions.size).firstOrNull { index ->
            val instruction = instructions[index]
            if (instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA.let {
                    it == result || (instruction.opcode.setsWideRegister() && it == result - 1)
                }
            ) {
                throw PatchException("The call style check result is overwritten at $index before it is used")
            }
            (instruction.opcode == Opcode.IF_EQZ || instruction.opcode == Opcode.IF_NEZ) &&
                (instruction as OneRegisterInstruction).registerA == result
        } ?: throw PatchException("The call style check result is never branched on")
        val ownLayoutPath = if (instructions[branch].opcode == Opcode.IF_EQZ) {
            (instructions[branch] as BuilderOffsetInstruction).target.location.index
        } else {
            branch + 1
        }
        // The false path must build the notification class that inflates RemoteViews.
        val ownLayout = (ownLayoutPath until instructions.size).firstOrNull { instructions[it].opcode == Opcode.NEW_INSTANCE }
            ?.let { ((instructions[it] as ReferenceInstruction).reference as TypeReference).type }
            ?: throw PatchException("The call style check's false path builds no notification")

        notification.requireNoBranchTargetAt(check + 2, "Swap call answer and decline buttons")
        val forceFalse = mutableClassDefBy(notification.definingClass).addHevalValueHelper(FEATURE, "morpheSwapCallButtonsCallStyle", "Z") { v ->
            """
                const/4 $v, 0x0
                return $v
            """
        }
        notification.filterThroughHevalHelper(check + 2, result, forceFalse)
        ownLayout
    }

    // 3. The own layout notification class builds its RemoteViews(packageName, layout) in its
    // constructor from the six inflated layouts. Each layout id goes through
    // SwapCallButtons.layout(I)I right before the RemoteViews constructor, which answers the
    // swapped copy while the feature is on and the stock id while it is off.
    val expected = NOTIFICATION_INFLATED_LAYOUTS.associateBy { resourceId(ResourceType.LAYOUT, it).toInt() }
    val swapLayout = ImmutableMethodReference(SWAP_LAYOUTS, "layout", listOf("I"), "I")
    val redirected = mutableSetOf<String>()
    for (constructor in mutableClassDefBy(ownLayout).methods.filter { it.name == "<init>" && it.implementation != null }) {
        val instructions = constructor.instructions.toList()
        val inflations = instructions.indices.filter { index ->
            val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_DIRECT && call?.definingClass == "Landroid/widget/RemoteViews;" &&
                call.name == "<init>" && call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I")
        }
        // From the last inflation backwards, so the earlier indices stay valid.
        for (index in inflations.reversed()) {
            val layoutRegister = (instructions[index] as FiveRegisterInstruction).registerE
            val load = instructions.getOrNull(index - 1)
            val layout = (load as? NarrowLiteralInstruction)?.narrowLiteral
            if (load?.opcode != Opcode.CONST || (load as OneRegisterInstruction).registerA != layoutRegister || layout !in expected) {
                throw PatchException("$ownLayout inflates RemoteViews at $index from ${load?.opcode} $layout, not one of the incoming call layouts")
            }
            constructor.requireNoBranchTargetAt(index, "Swap call answer and decline buttons")
            constructor.filterThroughHevalHelper(index, layoutRegister, swapLayout)
            redirected += expected.getValue(layout!!)
        }
    }
    if (redirected != NOTIFICATION_INFLATED_LAYOUTS.toSet()) {
        throw PatchException("$ownLayout inflates ${redirected.sorted()}, expected ${NOTIFICATION_INFLATED_LAYOUTS.sorted()}")
    }
}
