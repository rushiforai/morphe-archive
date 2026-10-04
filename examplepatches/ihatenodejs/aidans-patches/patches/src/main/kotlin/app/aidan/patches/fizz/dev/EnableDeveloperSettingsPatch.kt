package app.aidan.patches.fizz.dev

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val MAIN_ACTIVITY = "Lcom/fizzsocial/fizz/MainActivity;"
private const val HOME_TOP_BAR_CLASS = "Lsd/w;"
private const val ALIGNMENT_CLASS = "La3/b;"
private const val DEVELOPER_MENU_BRIDGE = "Lapp/aidan/extension/fizz/DeveloperMenuBridge;"
private const val SETTINGS_ICON_CLASS = "Lne/t;"
private const val MOBILE_STUDIO_DRAWER_GATE = "Lce/w1;"
private const val SPOOF_USER_CLASS = "Lcom/fizzsocial/fizz/data/local/x6;"

@Suppress("unused")
val enableDeveloperSettingsPatch = bytecodePatch(
    name = "Enable Developer Settings",
    description = "Adds an in-app developer mod menu accessible via a top-bar header button, with controls for Mobile Studio.",
    default = false
) {
    compatibleWith(COMPATIBILITY_FIZZ)
    extendWith("extensions/extension.mpe")

    val enableMobileStudio = booleanOption(
        key = "mobileStudio",
        default = true,
        title = "Mobile Studio",
        description = "Includes Mobile Studio trigger in the developer settings menu and permanently unlocks Mobile Studio access."
    )
    execute {
        patchMainActivityLifecycle(
            mobileStudio = enableMobileStudio.value ?: true
        )

        patchHomeTopBarComposable()

        if (enableMobileStudio.value ?: true) {
            unlockMobileStudioDrawerGate()
        }
    }
}

/**
 * Injects DeveloperMenuBridge.init(this, mobileStudio)
 * immediately after super.onCreate in MainActivity.onCreate.
 */
private fun BytecodePatchContext.patchMainActivityLifecycle(
    mobileStudio: Boolean
) {
    val activityClass = mutableClassDefByOrNull(MAIN_ACTIVITY)
        ?: throw PatchException("MainActivity class $MAIN_ACTIVITY not found")

    val onCreateMethod = activityClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method onCreate(Bundle) not found in $MAIN_ACTIVITY")

    val instructions = onCreateMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $MAIN_ACTIVITY.onCreate")

    val superOnCreateIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_SUPER
    }
    val targetIndex = if (superOnCreateIndex >= 0) superOnCreateIndex + 1 else 0

    val studioHex = if (mobileStudio) "0x1" else "0x0"

    onCreateMethod.addInstructions(
        targetIndex,
        """
        const/4 v0, $studioHex
        invoke-static {p0, v0}, $DEVELOPER_MENU_BRIDGE->init(Landroid/app/Activity;Z)V
        """.trimIndent()
    )
}

/**
 * Injects Developer Settings icon button into sd.w.a (Home TopBar) immediately to
 * the left of the notification bell.
 */
private fun BytecodePatchContext.patchHomeTopBarComposable() {
    val topBarClass = mutableClassDefByOrNull(HOME_TOP_BAR_CLASS)
        ?: throw PatchException("HomeTopBar class $HOME_TOP_BAR_CLASS not found")

    val topBarMethod = topBarClass.methods.firstOrNull {
        it.name == "a" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method a(...) not found in $HOME_TOP_BAR_CLASS")

    val impl = topBarMethod.implementation
        ?: throw PatchException("Missing instructions in $HOME_TOP_BAR_CLASS.a")
    val instructions = impl.instructions

    // Find "feed-activity-button" tag on the notification bell
    val activityButtonIndex = instructions.indexOfFirst { instruction ->
        if (instruction is ReferenceInstruction) {
            val ref = instruction.reference
            if (ref is StringReference) {
                ref.string == "feed-activity-button"
            } else false
        } else false
    }

    if (activityButtonIndex < 0) {
        throw PatchException("Could not locate 'feed-activity-button' anchor in $HOME_TOP_BAR_CLASS.a")
    }

    // Locate the sget-object v3, La3/b;->f:La3/i (Alignment.CenterEnd) immediately preceding the notification button
    val centerEndAnchor = instructions.subList(0, activityButtonIndex).indexOfLast { instruction ->
        if (instruction.opcode == Opcode.SGET_OBJECT && instruction is ReferenceInstruction) {
            val ref = instruction.reference
            if (ref is FieldReference) {
                ref.definingClass == ALIGNMENT_CLASS && ref.name == "f"
            } else false
        } else false
    }

    if (centerEndAnchor < 0) {
        throw PatchException("Could not locate Alignment.CenterEnd anchor before notification button in $HOME_TOP_BAR_CLASS.a")
    }

    // Identify incoming branch (goto from single-feed title) that targets centerEndAnchor
    val branchIndex = (0 until centerEndAnchor).firstOrNull { i ->
        val insn = instructions[i]
        insn is BuilderOffsetInstruction && insn.target.location.index == centerEndAnchor
    } ?: -1

    // Inject Developer Settings button layout & composable invocation
    topBarMethod.addInstructions(
        centerEndAnchor,
        """
        # --- Begin Injected Developer Settings Button ---
        # 1. Align modifier to CenterEnd
        sget-object v3, $ALIGNMENT_CLASS->f:La3/i;
        invoke-virtual {v2, v9, v3}, Landroidx/compose/foundation/layout/b;->a(La3/s;La3/d;)La3/s;
        move-result-object v10

        # 2. Right margin 56.dp (8.dp bell margin + 44.dp bell size + 4.dp gap)
        const/4 v14, 0x0
        const/16 v15, 0xb
        const/4 v11, 0x0
        const/4 v12, 0x0
        const/high16 v13, 0x42600000
        invoke-static/range {v10 .. v15}, Landroidx/compose/foundation/layout/a;->r(La3/s;FFFFI)La3/s;
        move-result-object v3

        # 3. Touch target size 44.dp x 44.dp
        const/high16 v4, 0x42300000
        invoke-static {v3, v4}, Landroidx/compose/foundation/layout/d;->o(La3/s;F)La3/s;
        move-result-object v14

        # 4. Clickable handler via DeveloperMenuBridge.getClickListener()
        const/16 v17, 0x0
        const/16 v19, 0x7
        const/4 v15, 0x0
        const/16 v16, 0x0
        invoke-static {}, $DEVELOPER_MENU_BRIDGE->getClickListener()Ljava/lang/Object;
        move-result-object v18
        check-cast v18, Lwl/a;
        invoke-static/range {v14 .. v19}, Landroidx/compose/foundation/a;->e(La3/s;ZLjava/lang/String;Lg4/g;Lwl/a;I)La3/s;
        move-result-object v3

        # 5. Semantics / testTag: feed-developer-button
        const-string v4, "feed-developer-button"
        invoke-static {v3, v4}, Landroidx/compose/ui/platform/a;->a(La3/s;Ljava/lang/String;)La3/s;
        move-result-object v10

        # 6. Inner padding 10.dp (centers 24.dp icon inside 44.dp touch target)
        const/4 v15, 0x0
        const/high16 v11, 0x41200000
        move v12, v11
        move v13, v11
        move v14, v11
        invoke-static/range {v10 .. v15}, Landroidx/compose/foundation/layout/a;->r(La3/s;FFFFI)La3/s;
        move-result-object v12

        # 7. Render Icon (Outlined.Settings gear vector, dynamic color scheme tint)
        move-object/from16 v10, v38
        iget-wide v13, v10, Lwe/c;->z:J
        sget-object v10, $SETTINGS_ICON_CLASS->a:Ln3/e;
        const/16 v16, 0x0
        const/16 v17, 0x0
        const-string v11, "Developer Settings"
        move-object v15, v7
        invoke-static/range {v10 .. v17}, Lk2/t0;->b(Ln3/e;Ljava/lang/String;La3/s;JLo2/p;II)V
        # --- End Injected Developer Settings Button ---
        """.trimIndent()
    )

    // Retarget incoming branch from single-feed title to jump to the developer button instead of skipping it
    if (branchIndex >= 0) {
        val newTargetLabel = impl.newLabelForIndex(centerEndAnchor)
        val branchInsn = impl.instructions[branchIndex] as BuilderOffsetInstruction
        val retargeted = when (branchInsn) {
            is BuilderInstruction10t -> BuilderInstruction10t(branchInsn.opcode, newTargetLabel)
            is BuilderInstruction20t -> BuilderInstruction20t(branchInsn.opcode, newTargetLabel)
            is BuilderInstruction30t -> BuilderInstruction30t(branchInsn.opcode, newTargetLabel)
            else -> throw PatchException("Unsupported branch opcode: ${branchInsn.opcode}")
        }
        impl.replaceInstruction(branchIndex, retargeted)
    }
}

/**
 * Permanently unlocks the Mobile Studio drawer gate in ce.w1.invokeSuspend by forcing
 * case 1 (the superadmin check) to return Boolean.TRUE.
 */
private fun BytecodePatchContext.unlockMobileStudioDrawerGate() {
    val gateClass = mutableClassDefByOrNull(MOBILE_STUDIO_DRAWER_GATE)
        ?: throw PatchException("MobileStudioDrawerGate class $MOBILE_STUDIO_DRAWER_GATE not found")

    val invokeSuspendMethod = gateClass.methods.firstOrNull {
        it.name == "invokeSuspend" && it.returnType == "Ljava/lang/Object;" && it.implementation != null
    } ?: throw PatchException("Method invokeSuspend not found in $MOBILE_STUDIO_DRAWER_GATE")

    val instructions = invokeSuspendMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $MOBILE_STUDIO_DRAWER_GATE.invokeSuspend")

    // Case 1 is the only case referencing x6 (SpoofUser)
    val x6Index = instructions.indexOfFirst { instruction ->
        if (instruction is ReferenceInstruction) {
            val ref = instruction.reference
            if (ref is TypeReference) {
                ref.type == SPOOF_USER_CLASS
            } else false
        } else false
    }

    if (x6Index < 0) {
        throw PatchException("Could not locate case 1 anchor ($SPOOF_USER_CLASS) in $MOBILE_STUDIO_DRAWER_GATE.invokeSuspend")
    }

    // Immediately return Boolean.TRUE in case 1
    invokeSuspendMethod.addInstructions(
        x6Index + 1,
        """
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        return-object v0
        """.trimIndent()
    )
}
