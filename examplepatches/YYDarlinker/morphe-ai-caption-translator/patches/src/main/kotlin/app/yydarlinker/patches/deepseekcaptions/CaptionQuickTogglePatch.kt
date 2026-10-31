package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val FLYOUT_UTILS = "Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;"
private const val FLYOUT_FILTER = "Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuComponentsFilter;"
private const val SHORTS_STATE = "Lapp/morphe/extension/youtube/shared/ShortsPlayerState;"
private const val MORPHE_UTILS = "Lapp/morphe/extension/shared/Utils;"
private const val QUICK_TOGGLE = "${EXTENSION}CaptionQuickToggle;"

private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val LINEAR_LAYOUT = "Landroid/widget/LinearLayout;"

/** The name of the public bridge that is added to Morphe's `FlyoutUtils` for its non-public row inflater. */
private const val ADD_BUTTON_BRIDGE = "addonCaptionButton"

/** The only static method of [owner] with this signature; [returns] is not checked when it is null. */
private fun <M : Method> Iterable<M>.staticMethod(owner: String, name: String, returns: String?, vararg parameters: String): M =
    singleOrNull {
        it.name == name && it.isStatic() && (returns == null || it.returnType == returns) &&
            it.parameterNames() == parameters.toList()
    } ?: throw PatchException("AI captions: $owner->$name is unavailable; the flyout of Morphe changed")

/**
 * The quick toggle row of the player's flyout menu. It reuses the official menu of Morphe: the extension adds its row
 * with Morphe's own inflater, at the position where the official rows end, and never looks for windows or replaces
 * gestures.
 *
 * Every structure is resolved before the first change, because the patching must not fail after the app was
 * modified; the returned function applies the changes.
 */
internal fun BytecodePatchContext.prepareCaptionQuickToggle(): () -> Unit {
    val utils = mutableClassDefBy(FLYOUT_UTILS)
    val filter = mutableClassDefBy(FLYOUT_FILTER)
    val runtime = mutableClassDefBy(QUICK_TOGGLE)

    val addButton = utils.methods.staticMethod(FLYOUT_UTILS, "addFlyoutButton", "I", OBJECT, DRAWABLE, STRING, CLICK_LISTENER, "I")
    val menuInfo = utils.methods.staticMethod(FLYOUT_UTILS, "getFlyoutMenuInfo", null, OBJECT, "I")
    val containerClass = classDefBy(menuInfo.returnType)
    if (containerClass.methods.none {
            it.name == "menuContainer" && it.parameterTypes.isEmpty() && it.returnType == LINEAR_LAYOUT &&
                AccessFlags.PUBLIC.isSet(it.accessFlags)
        }
    ) {
        throw PatchException("AI captions: the flyout menu info has no typed menu container")
    }
    filter.methods.staticMethod(FLYOUT_FILTER, "getTopFlyoutMenuVisible", "Z")
    classDefBy(SHORTS_STATE).methods.staticMethod(SHORTS_STATE, "isOpen", "Z")
    // Follow a Kotlin @JvmStatic delegate when present; 2.0 uses a Java static implementation.
    // Resolve the actual setter from the public API instead of assuming its source language.
    val publicSetter = mutableClassDefBy(SHORTS_STATE).methods
        .staticMethod(SHORTS_STATE, "setOpen", "V", "Z")
    val delegates = publicSetter.code().mapNotNull { it.call() }.filter {
        it.name == "setOpen" && it.returnType == "V" && it.parameterNames() == listOf("Z")
    }
    val shortsSetter = if (delegates.isEmpty()) publicSetter else {
        val delegate = delegates.unique("official Shorts setter delegate")
        mutableClassDefBy(delegate.definingClass).methods.filter {
            it.id() == delegate.id() && !it.isStatic()
        }.unique("official Shorts state implementation")
    }
    if (shortsSetter.implementation == null) throw PatchException("AI captions: Shorts setter has no implementation")
    val shortsReturns = shortsSetter.code().indices.filter { shortsSetter.code()[it].opcode == Opcode.RETURN_VOID }
    if (shortsReturns.isEmpty()) throw PatchException("AI captions: Shorts lifecycle has no return")
    utils.methods.staticMethod(FLYOUT_UTILS, "dismissFlyout", "V")
    if (utils.methods.any { it.name == ADD_BUTTON_BRIDGE }) throw PatchException("AI captions: flyout bridge already exists")

    // The component filter reports every menu path with its buffer; the extension needs both to know which menu is
    // open. The path parameter is the one before the byte array.
    val detector = filter.methods.filter { it.name == "isFiltered" }.unique("menu component filter")
    val parameters = detector.parameterNames()
    val pathType = parameters.getOrNull(parameters.indexOf("[B") - 1)
    val expected = listOf(
        "Lapp/morphe/extension/shared/patches/components/ContextInterface;", STRING, STRING, pathType, "[B",
        "Lapp/morphe/extension/shared/patches/components/BufferAsciiStrings;",
        "Lapp/morphe/extension/shared/patches/components/StringFilterGroup;",
        "Lapp/morphe/extension/shared/patches/components/Filter\$FilterContentType;", "I",
    )
    if (detector.returnType != "Z" || detector.isStatic() || detector.implementation == null ||
        pathType !in listOf(STRING, "Ljava/lang/CharSequence;") || parameters != expected
    ) {
        throw PatchException("AI captions: unsupported menu filter signature: ${detector.name}$parameters")
    }
    // The parameters before the path are references, so the path is in p4 and the byte array in p5.
    val pathRegister = 4

    val menuBody = findMenuBody(utils)
    val code = menuBody.code()
    val dividerCall = code.indices.filter { index ->
        code[index].call()?.let { call ->
            call.definingClass == utils.type && (
                call.name == "addDivider" && call.returnType == "I" && call.parameterNames() == listOf(OBJECT, "I") ||
                call.name == "addFlyoutMenuItem" && call.returnType == "I" && call.parameterNames() == listOf(
                    OBJECT, DRAWABLE, STRING, CLICK_LISTENER, "I", "Z", utils.type.removeSuffix(";") + "\$FlyoutButtonResource;"
                )
            )
        } == true
    }.unique("shared divider call")
    val guard = (dividerCall - 1 downTo 0).firstOrNull { code[it].opcode == Opcode.IF_LEZ }
        ?: throw PatchException("AI captions: shared divider guard unavailable")
    val indexRegister = (code[guard] as OneRegisterInstruction).registerA
    // The panel is the first argument of the divider call, not necessarily p0: since 1.48 the
    // official VideoDelay row uses p0's register as a Boolean scratch before this point.
    val dividerRegisters = when (val call = code[dividerCall]) {
        is FiveRegisterInstruction -> listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
        is RegisterRangeInstruction -> (call.startRegister until call.startRegister + call.registerCount).toList()
        else -> throw PatchException("AI captions: divider registers unavailable")
    }
    var panelRegister = dividerRegisters.first()
    // A range invoke can copy the panel into its argument window only inside the guarded
    // divider block. Trace those object moves back to the value that is live at the hook.
    for (index in dividerCall - 1 downTo guard + 1) {
        val instruction = code[index]
        if (instruction.opcode.setsRegister() && (instruction as OneRegisterInstruction).registerA == panelRegister) {
            if (instruction.opcode !in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) {
                throw PatchException("AI captions: divider panel is not available before its guard")
            }
            panelRegister = (instruction as TwoRegisterInstruction).registerB
        }
    }
    val dividerIndex = if (code[dividerCall].call()!!.name == "addDivider") 1 else 4
    if (dividerRegisters.getOrNull(dividerIndex) != indexRegister) {
        throw PatchException("AI captions: divider guard does not use the insertion index")
    }
    val afterDivider = (code[guard] as? BuilderOffsetInstruction)?.target?.location?.instruction
        ?: throw PatchException("AI captions: divider guard target unavailable")

    return {
        shortsReturns.reversed().forEach { index ->
            shortsSetter.replaceInstruction(index, "invoke-static {}, $QUICK_TOGGLE->onShortsStateChanged()V")
            shortsSetter.addInstructions(index + 1, "return-void")
        }
        // The extension calls Morphe's checked inflater through a public bridge in its own class.
        val bridge = ImmutableMethod(
            utils.type, ADD_BUTTON_BRIDGE, addButton.parameters, addButton.returnType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(6),
        ).toMutable()
        bridge.addInstructions(0, "invoke-static/range {p0 .. p4}, ${addButton.id()}\nmove-result v0\nreturn v0")
        utils.methods.add(bridge)

        runtime.bindStub("addNativeRow", 1, "invoke-static/range {p0 .. p4}, ${bridge.id()}\nmove-result v0\nreturn v0")
        runtime.bindStub("topMenu", 1, "invoke-static {}, $FLYOUT_FILTER->getTopFlyoutMenuVisible()Z\nmove-result v0\nreturn v0")
        runtime.bindStub("shortsOpen", 1, "invoke-static {}, $SHORTS_STATE->isOpen()Z\nmove-result v0\nreturn v0")
        runtime.bindStub("dismissNative", 0, "invoke-static {}, $FLYOUT_UTILS->dismissFlyout()V\nreturn-void")
        // Each path returns its own type: ART does not narrow a null branch, and merging the menu info with the
        // layout at one return would make the whole class fail verification.
        runtime.bindStub(
            "nativeContainer",
            1,
            """
                const/4 v0, 0x0
                invoke-static {p0, v0}, ${menuInfo.id()}
                move-result-object v0
                if-nez v0, :container
                const/4 v0, 0x0
                return-object v0
                :container
                invoke-virtual {v0}, ${containerClass.type}->menuContainer()$LINEAR_LAYOUT
                move-result-object v0
                return-object v0
            """,
        )
        // The menu info type is private in Morphe's class; the extension reads its container.
        menuInfo.accessFlags = (menuInfo.accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value

        // Insert at the shared group's boundary, before its conditional divider and signal reset. The index is the
        // official inflater's next insertion position (the dialog and the popup differ). The labeled instruction is
        // replaced so that zero or hidden official buttons reach the hook too.
        menuBody.replaceInstruction(guard, "invoke-static {v$panelRegister, v$indexRegister}, $QUICK_TOGGLE->onMenu(${OBJECT}I)I")
        menuBody.addInstructionsWithLabels(
            guard + 1,
            "move-result v$indexRegister\nif-lez v$indexRegister, :after_divider",
            ExternalLabel("after_divider", afterDivider),
        )
        detector.addInstructions(
            0,
            "invoke-static/range {p$pathRegister .. p${pathRegister + 1}}, $QUICK_TOGGLE->observeMenuPath($pathType[B)V",
        )
    }
}

/**
 * The method that adds the official rows of the menu and, once, the divider after them. Older bundles of Morphe
 * defer that to a captured `Runnable`; its call is followed to the typed static body instead of guessing a
 * generated lambda name.
 */
private fun BytecodePatchContext.findMenuBody(utils: MutableClass): MutableMethod {
    // The menu clears its visibility signal after adding all rows and the shared divider.
    // This lifecycle boundary survives changes to the divider's inflater implementation.
    fun resets(method: Method) = method.code().count {
        it.call()?.let { call ->
            call.definingClass == FLYOUT_FILTER && call.name == "resetTopFlyoutMenuVisible" &&
                call.returnType == "V" && call.parameterTypes.isEmpty()
        } == true
    }

    val entry = utils.methods.staticMethod(FLYOUT_UTILS, "addFlyoutElements", null, OBJECT)
    if (resets(entry) == 1) return entry
    if (resets(entry) != 0) throw PatchException("AI captions: unexpected menu visibility reset count")

    val outer = entry.code()
    outer.filter {
        it.call()?.let { call ->
            call.definingClass == MORPHE_UTILS && call.name == "runOnMainThreadDelayed" &&
                call.parameterNames() == listOf(RUNNABLE, "J")
        } == true
    }.unique("deferred menu dispatch")

    val bodies = outer.filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }.distinct()
        .map { classDefBy(it) }.filter { RUNNABLE in it.interfaces }
        .flatMap { runnable ->
            outer.filter {
                it.call()?.let { call ->
                    call.definingClass == runnable.type && call.name == "<init>" && call.parameterNames() == listOf(OBJECT)
                } == true
            }.unique("captured menu constructor")
            runnable.methods.filter { it.name == "run" && it.returnType == "V" && it.parameterTypes.isEmpty() }
                .flatMap { it.code() }.mapNotNull { it.call() }
                .filter { it.definingClass == utils.type && it.returnType == "V" && it.parameterNames() == listOf(OBJECT) }
                .mapNotNull { reference -> utils.methods.singleOrNull { it.id() == reference.id() && it.isStatic() } }
        }.distinct().filter { resets(it) == 1 }
    return bodies.unique("reachable deferred divider body")
}
