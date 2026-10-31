package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SETTINGS = "Lapp/local/extension/curve/PatchSettings;"

private object LaunchpadClickFingerprint : Fingerprint(
    definingClass = "Lcom/curve/launchpad/ui/LaunchpadFragment;",
    name = "gridAdapter_delegate\$lambda\$0\$0", isStatic = true,
    returnType = "Lkotlin/Unit;",
    parameters = listOf("Lcom/curve/launchpad/ui/LaunchpadFragment;", "Lcom/curve/launchpad/model/LaunchpadItem;")
)

private val patchesScreenResources = resourcePatch {
    execute {
        val icon = checkNotNull(LaunchpadClickFingerprint::class.java.getResourceAsStream("/curve/patches.png"))
        icon.use { get("assets/morphe_patches.png", false).writeBytes(it.readBytes()) }
        for (name in listOf("morphe_patches", "morphe_launchpad_tile")) {
            val layout = checkNotNull(LaunchpadClickFingerprint::class.java.getResourceAsStream("/curve/$name.xml"))
            layout.use { get("res/layout/$name.xml", false).writeBytes(it.readBytes()) }
        }
        document("AndroidManifest.xml").use { manifest ->
            val applications = manifest.getElementsByTagName("application")
            check(applications.length == 1)
            val activity = manifest.createElement("activity")
            val android = "http://schemas.android.com/apk/res/android"
            activity.setAttributeNS(android, "android:name", "app.local.extension.curve.PatchesActivity")
            activity.setAttributeNS(android, "android:exported", "false")
            activity.setAttributeNS(android, "android:theme", "@style/Curve.AppTheme.NoActionBar")
            activity.setAttributeNS(android, "android:label", "Patches")
            applications.item(0).appendChild(activity)
        }
    }
}

@Suppress("unused")
val patchesMenuPatch = bytecodePatch(
    name = "Patches menu",
    description = "Adds Patches settings for Hide Flex and hiding selected Launchpad tiles.",
    default = false
) {
    dependsOn(hideFlexCardPatch, patchesScreenResources)
    compatibleWith(Compatibility(
        name = "Curve Pay", packageName = "com.imaginecurve.curve.prd",
        apkFileType = ApkFileType.APKM, appIconColor = 0x1C1C1C,
        targets = listOf(AppTarget(version = "5.63.0"))
    ))

    execute {
        val application = Fingerprint(
            definingClass = "Lcom/imaginecurve/curve/application/CurveApplication;",
            name = "onCreate", parameters = emptyList(), returnType = "V", isStatic = false,
            filters = listOf(methodCall(definingClass = "Landroid/app/Application;", name = "onCreate"))
        ).matchSingle()
        application.method.addInstructions(application.instructionMatches.single().index + 1,
            "invoke-static/range {p0 .. p0}, $SETTINGS->initialize(Landroid/content/Context;)V")

        val buttons = Fingerprint(
            definingClass = "Lcom/curve/launchpad/ui/LaunchpadState\$Loaded\$ButtonsState\$Available;",
            name = "getButtons", parameters = emptyList(), returnType = "Ljava/util/List;", isStatic = false
        ).matchSingle().method
        val returns = buttons.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returns.isNotEmpty())
        for ((index, instruction) in returns.reversed()) {
            val register = (instruction as OneRegisterInstruction).registerA
            buttons.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $SETTINGS->addPatchesButton(Ljava/util/List;)Ljava/util/List;
                move-result-object v$register
            """)
        }

        val display = Fingerprint(
            definingClass = "Lcom/curve/launchpad/ui/LaunchpadFragment;", name = "updateUI",
            parameters = listOf("Lcom/curve/launchpad/ui/LaunchpadState\$Loaded;"), returnType = "V",
            filters = listOf(methodCall(
                definingClass = "Lcom/curve/launchpad/ui/LaunchpadState\$Loaded\$ButtonsState\$Available;",
                name = "getButtons", returnType = "Ljava/util/List;"
            ))
        ).matchSingle()
        val method = display.method
        check(method.implementation!!.registerCount == 4)
        val getter = display.instructionMatches.single().index
        val result = method.getInstruction<OneRegisterInstruction>(getter + 1)
        check(result.opcode == Opcode.MOVE_RESULT_OBJECT)
        val submit = method.getInstruction<ReferenceInstruction>(getter + 2)
        val call = submit.reference as MethodReference
        check(call.name == "submitList" && call.parameterTypes == listOf("Ljava/util/List;"))
        check((submit as FiveRegisterInstruction).registerD == result.registerA)
        // The shared getter also resolves deep links; hide only the list submitted to the grid.
        method.addInstructions(getter + 2, """
            invoke-static/range {v${result.registerA} .. v${result.registerA}}, Lapp/local/extension/curve/LaunchpadTiles;->filter(Ljava/util/List;)Ljava/util/List;
            move-result-object v${result.registerA}
        """)

        val click = LaunchpadClickFingerprint.matchSingle().method
        check(click.implementation!!.registerCount == 5)
        click.addInstructions(0, """
            invoke-static {p0, p1}, $SETTINGS->openIfPatches(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original_action
            sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v0
            :original_action
            nop
        """)
    }
}
