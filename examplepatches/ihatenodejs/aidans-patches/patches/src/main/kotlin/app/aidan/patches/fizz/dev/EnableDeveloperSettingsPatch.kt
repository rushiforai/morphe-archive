package app.aidan.patches.fizz.dev

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.aidan.patches.fizz.shared.fizzTargets
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
private const val DEVELOPER_MENU_BRIDGE = "Lapp/aidan/extension/fizz/DeveloperMenuBridge;"

/**
 * Developer-menu targets. The top bar composable, its alignment singleton, the settings icon
 * vector and the Mobile Studio drawer gate are all obfuscated per release, and the top bar button
 * has to be written against the registers that are live at the bell injection point, so the whole
 * button block is version-specific.
 */
private data class DeveloperTargets(
    val homeTopBar: String,
    val alignment: String,
    val mobileStudioGate: String,
    val spoofUser: String,
    val topBarButtonSmali: String,
)

private val DEVELOPER_TARGETS_1_54_0 = DeveloperTargets(
    homeTopBar = "Ltd/v;",
    alignment = "La3/b;",
    mobileStudioGate = "Lde/k1;",
    spoofUser = "Lcom/fizzsocial/fizz/data/local/v6;",
    topBarButtonSmali = """
        # --- Begin Injected Developer Settings Button ---
        # 1. Align modifier to CenterEnd
        sget-object v3, La3/b;->f:La3/i;
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
        check-cast v18, Lyl/a;
        invoke-static/range {v14 .. v19}, Landroidx/compose/foundation/a;->e(La3/s;ZLjava/lang/String;Lg4/g;Lyl/a;I)La3/s;
        move-result-object v3

        # 5. Semantics / testTag: feed-developer-button
        const-string v4, "feed-developer-button"
        invoke-static {v3, v4}, Landroidx/compose/ui/platform/a;->a(La3/s;Ljava/lang/String;)La3/s;
        move-result-object v10

        # 6. Inner padding 10.dp (centers 24.dp icon inside 44.dp touch target)
        const/4 v15, 0x0
        const/high16 v11, 0x41200000
        const/high16 v12, 0x41200000
        const/high16 v13, 0x41200000
        const/high16 v14, 0x41200000
        invoke-static/range {v10 .. v15}, Landroidx/compose/foundation/layout/a;->r(La3/s;FFFFI)La3/s;
        move-result-object v12

        # 7. Render Icon (Outlined.Settings gear vector, dynamic color scheme tint)
        move-object/from16 v10, v38
        iget-wide v13, v10, Lye/c;->z:J
        sget-object v10, Loe/u;->a:Ln3/e;
        const/16 v16, 0x0
        const/16 v17, 0x0
        const-string v11, "Developer Settings"
        move-object/from16 v15, v7
        invoke-static/range {v10 .. v17}, Lk2/t0;->b(Ln3/e;Ljava/lang/String;La3/s;JLo2/p;II)V
        # --- End Injected Developer Settings Button ---
    """.trimIndent(),
)

private val DEVELOPER_TARGETS_1_72_0 = DeveloperTargets(
    homeTopBar = "Lee/n1;",
    alignment = "Ly2/b;",
    mobileStudioGate = "Lde/r2;",
    spoofUser = "Lcom/fizzsocial/fizz/data/local/y7;",
    topBarButtonSmali = """
        # --- Begin Injected Developer Settings Button ---
        # Live at the bell injection point: v2 RowScope, v4 row modifier, v8 composer,
        # v42 MaterialTheme color scheme. v11..v22 are written by the bell block afterwards.
        # 1. Align modifier to CenterEnd
        sget-object v11, Ly2/b;->f:Ly2/i;
        invoke-virtual {v2, v4, v11}, Landroidx/compose/foundation/layout/b;->a(Ly2/q;Ly2/d;)Ly2/q;
        move-result-object v12

        # 2. Right margin 56.dp (8.dp bell margin + 44.dp bell size + 4.dp gap)
        const/4 v13, 0x0
        const/4 v14, 0x0
        const/high16 v15, 0x42600000
        const/16 v16, 0x0
        const/16 v17, 0xb
        invoke-static/range {v12 .. v17}, Landroidx/compose/foundation/layout/a;->r(Ly2/q;FFFFI)Ly2/q;
        move-result-object v12

        # 3. Touch target size 44.dp x 44.dp (TopBar size constant)
        sget v11, Lee/n1;->a:F
        invoke-static {v12, v11}, Landroidx/compose/foundation/layout/d;->p(Ly2/q;F)Ly2/q;
        move-result-object v17

        # 4. Clickable handler via DeveloperMenuBridge.getClickListener()
        const/16 v18, 0x0
        const/16 v19, 0x0
        const/16 v20, 0x0
        const/16 v22, 0x7
        invoke-static {}, $DEVELOPER_MENU_BRIDGE->getClickListener()Ljava/lang/Object;
        move-result-object v21
        check-cast v21, Lhn/a;
        invoke-static/range {v17 .. v22}, Landroidx/compose/foundation/a;->f(Ly2/q;ZLjava/lang/String;Le4/h;Lhn/a;I)Ly2/q;
        move-result-object v17

        # 5. Semantics / testTag: feed-developer-button
        const-string v18, "feed-developer-button"
        invoke-static/range {v17 .. v18}, Landroidx/compose/ui/platform/a;->a(Ly2/q;Ljava/lang/String;)Ly2/q;
        move-result-object v17

        # 6. Inner padding 9.dp on all four sides: the 44.dp touch target minus 2x9.dp leaves a
        # 26.dp box. The bell's vector leaves side margins inside its box, so matching drawn glyph
        # width (~27.dp) rather than box width keeps both top bar icons visually equal.
        # Flag 0x0 = every padding argument is provided (a set bit would force that side to 0.dp).
        const/high16 v18, 0x41100000
        const/high16 v19, 0x41100000
        const/high16 v20, 0x41100000
        const/high16 v21, 0x41100000
        const/16 v22, 0x0
        invoke-static/range {v17 .. v22}, Landroidx/compose/foundation/layout/a;->r(Ly2/q;FFFFI)Ly2/q;
        move-result-object v13

        # 7. Render Icon (Outlined.Settings gear vector, dynamic color scheme tint)
        sget-object v11, Lrf/i0;->a:Ll3/e;
        const-string v12, "Developer Settings"
        move-object/from16 v5, v42
        iget-wide v14, v5, Lcg/d;->y:J
        move-object/from16 v16, v8
        const/16 v17, 0x0
        const/16 v18, 0x0
        invoke-static/range {v11 .. v18}, Li2/w1;->b(Ll3/e;Ljava/lang/String;Ly2/q;JLm2/p;II)V
        # --- End Injected Developer Settings Button ---
    """.trimIndent(),
)

@Suppress("unused")
val enableDeveloperSettingsPatch = bytecodePatch(
    name = "Enable Developer Settings",
    description = "Adds an in-app developer mod menu accessible via a top-bar header button, with controls for Mobile Studio.",
    default = false
) {
    category("Developer")
    compatibleWith(COMPATIBILITY_FIZZ)
    extendWith("extensions/extension.mpe")

    val enableMobileStudio = booleanOption(
        key = "mobileStudio",
        default = true,
        title = "Mobile Studio",
        description = "Includes Mobile Studio trigger in the developer settings menu and permanently unlocks Mobile Studio access."
    )
    execute {
        val targets = fizzTargets("1.54.0" to DEVELOPER_TARGETS_1_54_0, "1.72.0" to DEVELOPER_TARGETS_1_72_0)
        val mobileStudio = enableMobileStudio.value ?: true

        patchMainActivityLifecycle(mobileStudio = mobileStudio)

        patchHomeTopBarComposable(targets)

        if (mobileStudio) {
            unlockMobileStudioDrawerGate(targets)
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
 * Injects the Developer Settings icon button into the Home TopBar immediately to the left of the
 * notification bell, immediately before the bell's CenterEnd alignment.
 */
private fun BytecodePatchContext.patchHomeTopBarComposable(targets: DeveloperTargets) {
    val topBarClass = mutableClassDefByOrNull(targets.homeTopBar)
        ?: throw PatchException("HomeTopBar class ${targets.homeTopBar} not found")

    val topBarMethod = topBarClass.methods.firstOrNull {
        it.name == "a" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method a(...) not found in ${targets.homeTopBar}")

    val impl = topBarMethod.implementation
        ?: throw PatchException("Missing instructions in ${targets.homeTopBar}->a")
    val instructions = impl.instructions

    // Find "feed-activity-button" tag on the notification bell
    val activityButtonIndex = instructions.indexOfFirst { instruction ->
        if (instruction is ReferenceInstruction) {
            val ref = instruction.reference
            if (ref is StringReference) {
                ref.string == "feed-activity-button"
            } else {
                false
            }
        } else {
            false
        }
    }

    if (activityButtonIndex < 0) {
        throw PatchException("Could not locate 'feed-activity-button' anchor in ${targets.homeTopBar}->a")
    }

    // Locate the sget-object of Alignment.CenterEnd immediately preceding the notification button
    val centerEndAnchor = instructions.subList(0, activityButtonIndex).indexOfLast { instruction ->
        if (instruction.opcode == Opcode.SGET_OBJECT && instruction is ReferenceInstruction) {
            val ref = instruction.reference
            if (ref is FieldReference) {
                ref.definingClass == targets.alignment && ref.name == "f"
            } else {
                false
            }
        } else {
            false
        }
    }

    if (centerEndAnchor < 0) {
        throw PatchException(
            "Could not locate Alignment.CenterEnd anchor before notification button in ${targets.homeTopBar}->a"
        )
    }

    // Identify incoming branch (goto from single-feed title) that targets centerEndAnchor
    val branchIndex = (0 until centerEndAnchor).firstOrNull { i ->
        val insn = instructions[i]
        insn is BuilderOffsetInstruction && insn.target.location.index == centerEndAnchor
    } ?: -1

    // Inject Developer Settings button layout & composable invocation. The assembler drops
    // instructions whose operands exceed their format's register width instead of failing, so the
    // injected block is counted and any loss aborts the patch.
    val injectedInstructionCount = targets.topBarButtonSmali
        .lines()
        .count { it.isNotBlank() && !it.trimStart().startsWith("#") }
    val instructionsBefore = impl.instructions.count()
    topBarMethod.addInstructions(centerEndAnchor, targets.topBarButtonSmali)
    val instructionsAfter = impl.instructions.count()
    if (instructionsAfter - instructionsBefore != injectedInstructionCount) {
        throw PatchException(
            "Assembled ${instructionsAfter - instructionsBefore} of $injectedInstructionCount top bar " +
                "button instructions in ${targets.homeTopBar}->a; a register operand likely exceeds its format width"
        )
    }

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
 * Permanently unlocks the Mobile Studio drawer gate by forcing the spoof-user case of
 * invokeSuspend to return Boolean.TRUE.
 */
private fun BytecodePatchContext.unlockMobileStudioDrawerGate(targets: DeveloperTargets) {
    val gateClass = mutableClassDefByOrNull(targets.mobileStudioGate)
        ?: throw PatchException("MobileStudioDrawerGate class ${targets.mobileStudioGate} not found")

    val invokeSuspendMethod = gateClass.methods.firstOrNull {
        it.name == "invokeSuspend" && it.returnType == "Ljava/lang/Object;" && it.implementation != null
    } ?: throw PatchException("Method invokeSuspend not found in ${targets.mobileStudioGate}")

    val instructions = invokeSuspendMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in ${targets.mobileStudioGate}->invokeSuspend")

    // Only case referencing the SpoofUser model
    val spoofUserIndex = instructions.indexOfFirst { instruction ->
        if (instruction is ReferenceInstruction) {
            val ref = instruction.reference
            if (ref is TypeReference) {
                ref.type == targets.spoofUser
            } else {
                false
            }
        } else {
            false
        }
    }

    if (spoofUserIndex < 0) {
        throw PatchException(
            "Could not locate spoof-user anchor (${targets.spoofUser}) in ${targets.mobileStudioGate}->invokeSuspend"
        )
    }

    // Immediately return Boolean.TRUE in that case
    invokeSuspendMethod.addInstructions(
        spoofUserIndex + 1,
        """
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        return-object v0
        """.trimIndent()
    )
}
