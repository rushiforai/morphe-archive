package app.template.patches.hikingmap.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private object PremiumNotificationFingerprint : Fingerprint(
    definingClass = "Lpl/mapa_turystyczna/app/MapActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(string("show_what_is_new_notification")),
)

private val hidePremiumMenuPatch = resourcePatch {
    execute {
        document("res/menu/navigation.xml").use { document ->
            val items = document.getElementsByTagName("item")
            val matches = (0 until items.length).mapNotNull { items.item(it) as? Element }
                .filter { it.getAttribute("android:id").substringAfter('/') == "action_premium" }
            if (matches.size != 1) throw PatchException("Mapa Turystyczna: Premium menu item not found.")
            // Keep the item available to findItem(), but remove it from the drawer.
            matches.single().setAttribute("android:visible", "false")
        }
    }
}

@Suppress("unused")
val hikingMapHidePremiumPromptsPatch = bytecodePatch(
    name = "Hide Premium prompts",
    description = "Hides Premium offers and the menu entry. Removes the trial notification on launch.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Mapa Turystyczna",
            description = "Hiking routes, trail maps and GPS navigation.",
            packageName = "pl.mapa_turystyczna.app",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0x62A744,
            targets = listOf(AppTarget(version = "1.16.6", versionCode = 153)),
        ),
    )
    // Local Premium suppresses the offline-map and route trial dialogs, as well
    // as offers in the ad banner. The startup notification has a separate gate.
    dependsOn(hikingMapPremiumPatch, hidePremiumMenuPatch)

    execute {
        val method = PremiumNotificationFingerprint.method
        if ((method.implementation?.registerCount ?: 0) < 4) {
            throw PatchException("Mapa Turystyczna: no scratch registers in onCreate.")
        }
        val instructions = method.instructions.toList()
        val keyIndex = instructions.indices.singleOrNull { index ->
            ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
                ?.string == "show_what_is_new_notification"
        } ?: throw PatchException("Mapa Turystyczna: ambiguous trial notification preference.")
        val call = (instructions.getOrNull(keyIndex + 1) as? ReferenceInstruction)
            ?.reference as? MethodReference
        val result = instructions.getOrNull(keyIndex + 2)
        if (call?.definingClass != "Landroid/content/SharedPreferences;" ||
            call.name != "getBoolean" || call.returnType != "Z" ||
            result?.opcode != Opcode.MOVE_RESULT ||
            instructions.getOrNull(keyIndex + 3)?.opcode != Opcode.IF_EQZ
        ) {
            throw PatchException("Mapa Turystyczna: trial notification gate changed.")
        }
        val register = (result as OneRegisterInstruction).registerA
        method.replaceInstruction(keyIndex + 2, "const/16 v$register, 0x0")
        // Only the trial offer uses ID 102. Recording, navigation, downloads and
        // update notifications must remain available. v0/v1 are locals here.
        method.addInstructions(
            0,
            """
                const-string v0, "notification"
                invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Landroid/app/NotificationManager;
                if-eqz v0, :no_trial_notification
                const/16 v1, 0x66
                invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
                :no_trial_notification
                nop
            """,
        )
    }
}
