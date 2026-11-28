package app.ayufa.patches.simeji.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Makes an instance method return `false` immediately. Register p0
 * always exists in an instance method; overwriting it with a constant
 * and returning it avoids depending on the method's local registers.
 */
internal fun MutableMethod.returnFalseImmediately() {
    addInstructions(
        0,
        """
            const/4 p0, 0x0
            return p0
        """
    )
}

/**
 * Makes a method return immediately without doing any work.
 */
internal fun MutableMethod.returnVoidImmediately() {
    addInstructions(0, "return-void")
}

/**
 * Makes a no-argument static int method return 0 immediately. Such a
 * method has no parameter registers, so the result goes through v0;
 * only use this on methods known to declare local registers.
 */
internal fun MutableMethod.returnZeroImmediately() {
    addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """
    )
}

/**
 * Makes an activity finish itself right after its super.onCreate()
 * call, so the screen never becomes visible. Used for popup and
 * promotion activities that should never appear.
 */
internal fun MutableMethod.finishImmediatelyAfterSuperOnCreate() {
    addInstructions(
        superOnCreateIndex() + 1,
        """
            invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
            return-void
        """
    )
}

internal fun MutableMethod.superOnCreateIndex(): Int {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("onCreate has no implementation: $this")
    val superIndex = methodInstructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == "onCreate"
    }
    if (superIndex < 0) {
        throw PatchException("No super.onCreate() call found in $this")
    }
    return superIndex
}

// region Runtime-settings gates.
//
// The Simeji patches no longer hard-disable their targets: each hook
// first asks the extension's SimejiSettings whether the feature is
// enabled and only then short-circuits the method; otherwise the
// original code runs unchanged. The settings live in a small file
// the extension maintains, so toggles apply at runtime and propagate
// between the app and IME processes.
//
// Every gate stores the helper's boolean result in v0, the first
// local register. All gated methods in Simeji 22.5 declare at least
// one local register (verified per method against the dex), and a
// local register holds no meaningful value at method entry, so
// overwriting it before the original code runs is safe. [label] must
// be unique within the method being patched.

internal const val SIMEJI_SETTINGS_CLASS =
    "Lapp/ayufa/extension/simeji/SimejiSettings;"

internal const val SIMEJI_SETTINGS_ENTRY_CLASS =
    "Lapp/ayufa/extension/simeji/SimejiSettingsEntry;"

internal const val NAV_BAR_COLOR_CLASS =
    "Lapp/ayufa/extension/simeji/NavBarColor;"

internal const val CURSOR_PAD_CLASS =
    "Lapp/ayufa/extension/simeji/CursorPad;"

internal const val CURSOR_PAD_PROVIDER_CLASS =
    "Lapp/ayufa/extension/simeji/CursorPadProvider;"

internal const val CURSOR_PAD_CATALOG_CLASS =
    "Lapp/ayufa/extension/simeji/CursorPadCatalog;"

/** Smali prefix: calls settings helper [helper] and jumps to [label] when disabled. */
private fun settingsGate(helper: String, label: String): String =
    """
        invoke-static {}, $SIMEJI_SETTINGS_CLASS->$helper()Z
        move-result v0
        if-eqz v0, :$label
    """

/** Returns void immediately when the settings helper reports enabled. */
internal fun MutableMethod.returnVoidIfEnabled(helper: String, label: String) {
    addInstructions(
        0,
        settingsGate(helper, label) +
            """
                return-void
                :$label
            """
    )
}

/** Returns false (or 0) immediately when the helper reports enabled. */
internal fun MutableMethod.returnFalseIfEnabled(helper: String, label: String) {
    addInstructions(
        0,
        settingsGate(helper, label) +
            """
                const/4 v0, 0x0
                return v0
                :$label
            """
    )
}

/** Returns true immediately when the helper reports enabled. */
internal fun MutableMethod.returnTrueIfEnabled(helper: String, label: String) {
    addInstructions(
        0,
        settingsGate(helper, label) +
            """
                const/4 v0, 0x1
                return v0
                :$label
            """
    )
}

/** Returns `this` immediately when the helper reports enabled. */
internal fun MutableMethod.returnThisIfEnabled(helper: String, label: String) {
    addInstructions(
        0,
        settingsGate(helper, label) +
            """
                return-object p0
                :$label
            """
    )
}

/**
 * Finishes the activity right after super.onCreate() when the helper
 * reports enabled; the original onCreate continues otherwise.
 */
internal fun MutableMethod.finishIfEnabledAfterSuperOnCreate(
    helper: String,
    label: String
) {
    addInstructions(
        superOnCreateIndex() + 1,
        settingsGate(helper, label) +
            """
                invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
                return-void
                :$label
            """
    )
}

/**
 * Routes the result of `ITheme.getNavigationBarBackColor()` inside
 * this method through the extension's NavBarColor resolver.
 *
 * Finds the method's single call to that getter, and right after its
 * move-result-object inserts a branch-free substitution: run
 * [contextSetup] (which must load a Context — or null — into
 * [tempRegister]), then replace the colour register with
 * `NavBarColor.resolveNavBarColor(colour, context)`. The resolver
 * returns a non-null colour unchanged and a sampled theme colour
 * for a null colour; it returns null only on failure, so the stock
 * null handling that follows runs unchanged in that case.
 *
 * No label is used on purpose: labels in mid-method insertions are
 * resolved against the start of the inserted block by the patcher's
 * smali compiler, which produced wrong branch targets when this
 * hook used an if-nez skip (found by inspecting the patched dex of
 * v1.5.0-dev.1; superseded by the branch-free form).
 *
 * [colorRegister] and [tempRegister] must be registers the method
 * does not read between the getter call and the next stock
 * instruction that overwrites them; this was verified per call site
 * against the Simeji 22.5 dex.
 */
internal fun MutableMethod.substituteNavBarColor(
    colorRegister: String,
    tempRegister: String,
    contextSetup: String
) {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("Method has no implementation: $this")
    val callIndex = methodInstructions.indexOfFirst { instruction ->
        (instruction.opcode == Opcode.INVOKE_INTERFACE ||
            instruction.opcode == Opcode.INVOKE_VIRTUAL) &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == "getNavigationBarBackColor"
    }
    if (callIndex < 0) {
        throw PatchException("No getNavigationBarBackColor call found in $this")
    }
    if (methodInstructions[callIndex + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException(
            "getNavigationBarBackColor is not followed by move-result-object in $this"
        )
    }
    addInstructions(
        callIndex + 2,
        """
            $contextSetup
            invoke-static { $colorRegister, $tempRegister }, $NAV_BAR_COLOR_CLASS->resolveNavBarColor(Ljava/lang/Integer;Landroid/content/Context;)Ljava/lang/Integer;
            move-result-object $colorRegister
        """
    )
}

/**
 * Inserts instructions right before the method's final return-void,
 * so they run on the normal completion path (early returns, which in
 * the target methods only guard against null arguments, are skipped).
 */
internal fun MutableMethod.invokeStaticBeforeFinalReturn(smali: String) {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("Method has no implementation: $this")
    val lastReturn = methodInstructions.indexOfLast { instruction ->
        instruction.opcode == Opcode.RETURN_VOID
    }
    if (lastReturn < 0) {
        throw PatchException("No return-void found in $this")
    }
    addInstructions(lastReturn, smali)
}

/**
 * Inserts a static call right after the super call of the method
 * named [superMethodName] (for example onViewCreated), passing the
 * registers listed in [smali].
 */
internal fun MutableMethod.invokeStaticAfterSuper(
    superMethodName: String,
    smali: String
) {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("Method has no implementation: $this")
    val superIndex = methodInstructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == superMethodName
    }
    if (superIndex < 0) {
        throw PatchException("No super.$superMethodName() call found in $this")
    }
    addInstructions(superIndex + 1, smali)
}

// endregion
