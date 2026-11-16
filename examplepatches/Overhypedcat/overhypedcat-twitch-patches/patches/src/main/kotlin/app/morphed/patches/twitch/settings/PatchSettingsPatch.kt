package app.morphed.patches.twitch.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SCREENS_CLASS = "Lapp/morphed/extension/twitch/ui/Screens;"
private const val ROWS_CLASS = "Lapp/morphed/extension/twitch/settings/PatchSettingsRows;"
private const val IMPORT_ACTIVITY = "app.morphed.extension.twitch.settings.VpnImportActivity"
private const val OPTIONS_ROW_CLASS = "Lapp/morphed/extension/twitch/settings/PlayerOptionsRow;"

/** Finds the resource IDs of the older Options sheet's own texts, by name, to find its code by. */
private val optionsSheetLabelsPatch = resourcePatch {
    execute {
        document("res/values/public.xml").use { values ->
            val items = values.getElementsByTagName("public")
            for (i in 0 until items.length) {
                val attributes = items.item(i).attributes
                if (attributes.getNamedItem("type")?.nodeValue != "string") continue
                val id = attributes.getNamedItem("id")?.nodeValue ?: continue
                when (attributes.getNamedItem("name")?.nodeValue) {
                    "audio_only_label" -> OptionsSheetLabels.audioOnly = java.lang.Long.decode(id).toInt()
                    "viewing_options_label" -> OptionsSheetLabels.viewingOptions = java.lang.Long.decode(id).toInt()
                }
            }
        }
        check(OptionsSheetLabels.audioOnly != 0 && OptionsSheetLabels.viewingOptions != 0) {
            "The player Options sheet's texts (audio_only_label, viewing_options_label) aren't in the app's resources"
        }
    }
}

/** Declares the activity that picks a VPN server's config file. */
private val vpnImportActivityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0)
                ?: error("The manifest has no application")
            val existing = manifest.getElementsByTagName("activity")
            for (i in 0 until existing.length) {
                if (existing.item(i).attributes.getNamedItem("android:name")?.nodeValue == IMPORT_ACTIVITY) return@use
            }
            val activity = manifest.createElement("activity")
            activity.setAttribute("android:name", IMPORT_ACTIVITY)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:excludeFromRecents", "true")
            activity.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            application.appendChild(activity)
        }
    }
}

@Suppress("unused")
val patchSettingsPatch = bytecodePatch(
    name = "Patch settings",
    description = "Adds a Patch settings group to the app's Settings (VPN servers for the quality unlock, and " +
        "Debug mode: a live log window and a log file in Downloads), and the patches' switches to the video " +
        "player's Options.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(vpnImportActivityPatch)
    extendWith("extensions/twitch.mpe")

    execute {
        // Follow the app's screens from the start: dialogs, the log window, the player's Options sheet.
        ApplicationOnCreateFingerprint.method.apply {
            val thisRegister = implementation!!.registerCount - 1
            addInstruction(0, "invoke-static/range { v$thisRegister .. v$thisRegister }, " +
                "$SCREENS_CLASS->install(Landroid/app/Application;)V")
        }

        // The Patch settings group: two rows built with the app's own row composable, after the account group's
        // divider, closed with a divider of its own.
        SettingsAccountGroupFingerprint.method.apply {
            val calls = settingsRowCalls(this)
            val lastCall = getInstruction<RegisterRangeInstruction>(calls.last())
            val row = lastCall.getReference<MethodReference>()!!
            val clickType = row.parameterTypes[2].toString()
            val first = lastCall.startRegister
            val composer = first + 5
            check(lastCall.registerCount == 8) { "Unexpected settings row call in $definingClass->$name" }
            // The non-range calls below name these registers directly: they must fit in 4 bits.
            check(first + 5 <= 15) { "Settings rows use registers above v15 in $definingClass->$name; the patch needs an update" }

            val instructions = implementation!!.instructions.toList()
            val dividerIndex = (calls.last() + 1 until instructions.size).firstOrNull { index ->
                val instruction = instructions[index]
                val reference = instruction.getReference<MethodReference>() ?: return@firstOrNull false
                instruction.opcode == Opcode.INVOKE_STATIC && instruction is FiveRegisterInstruction &&
                    instruction.registerCount == 2 && instruction.registerC == composer &&
                    reference.returnType == "V" && reference.parameterTypes.size == 2 &&
                    reference.parameterTypes[1].toString() == "I"
            } ?: error("No divider after the settings rows in $definingClass->$name")
            val divider = getInstruction(dividerIndex).getReference<MethodReference>()!!
            checkRegistersFree(this, dividerIndex, (first..first + 7).filter { it != composer }.toSet(), "the settings group")
            checkNoJumpTo(this, dividerIndex + 1, "the settings group")

            // The rows' icons: the lock (Security & Privacy) for VPN servers, the sliders (Content Preferences)
            // for Debug mode; each row's icon is the literal loaded into its fourth argument before the call.
            val icons = calls.map { callIndex ->
                val iconRegister = getInstruction<RegisterRangeInstruction>(callIndex).startRegister + 3
                (callIndex - 1 downTo maxOf(0, callIndex - 12)).firstNotNullOfOrNull { index ->
                    val instruction = instructions[index]
                    if (instruction is OneRegisterInstruction && instruction is NarrowLiteralInstruction &&
                        instruction.registerA == iconRegister && instruction.narrowLiteral != 0
                    ) instruction.narrowLiteral else null
                } ?: error("No icon found for settings row ${calls.indexOf(callIndex) + 1} in $definingClass->$name")
            }
            val vpnIcon = icons[5]
            val debugIcon = icons[3]

            fun rowSmali(id: Int, icon: Int) = """
                const/16 v${first + 3}, $id
                invoke-static { v${first + 3} }, $ROWS_CLASS->click(I)Ljava/lang/Object;
                move-result-object v${first + 2}
                check-cast v${first + 2}, $clickType
                invoke-static { v${first + 3} }, $ROWS_CLASS->title(I)Ljava/lang/String;
                move-result-object v$first
                invoke-static { v${first + 3} }, $ROWS_CLASS->description(I)Ljava/lang/String;
                move-result-object v${first + 1}
                const v${first + 3}, $icon
                const/16 v${first + 4}, 0x0
                const/16 v${first + 6}, 0x0
                const/16 v${first + 7}, 0x10
                invoke-static/range { v$first .. v${first + 7} }, $row
            """

            addInstructions(
                dividerIndex + 1,
                rowSmali(0, vpnIcon) + rowSmali(1, debugIcon) + """
                    const/16 v$first, 0x0
                    invoke-static { v$composer, v$first }, $divider
                """
            )

            // The row handler becomes the app's click type, so the row composable takes it. That type must be a
            // Function0 (invoke() returning an Object), which the handler implements.
            val clickClass = classDefByOrNull(clickType) ?: error("Click type $clickType not found")
            val abstractMethods = clickClass.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) }
            check(AccessFlags.INTERFACE.isSet(clickClass.accessFlags) && abstractMethods.size == 1 &&
                abstractMethods[0].name == "invoke" && abstractMethods[0].parameterTypes.isEmpty() &&
                abstractMethods[0].returnType == "Ljava/lang/Object;") {
                "The settings row's click type $clickType isn't a Function0; the patch needs an update"
            }
            mutableClassDefBy(ROWS_CLASS).interfaces.add(clickType)
        }
    }
}

@Suppress("unused")
val playerOptionsRowPatch = bytecodePatch(
    name = "Patch switches in the vertical view",
    description = "Adds a Patches row to the video player's Options in the vertical view, which opens the " +
        "patches' switches (the vertical view's Options can't hold them itself).",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(patchSettingsPatch, optionsSheetLabelsPatch)

    execute {
        // The player's older Options sheet (the vertical view opens it) is Jetpack Compose: it can't take switches
        // whose state it doesn't hold. A "Patches" row, built with its own row composable after its last viewing
        // option, opens the switches as a sheet of their own.
        ViewingOptionsGroupFingerprint.method.apply {
            val lastIndex = optionsRowCalls(this).last()
            val lastCall = getInstruction<RegisterRangeInstruction>(lastIndex)
            val row = lastCall.getReference<MethodReference>()!!
            val clickType = row.parameterTypes[4].toString()
            val first = lastCall.startRegister
            val composer = first + 7
            check(lastCall.registerCount == 10) { "Unexpected Options row call in $definingClass->$name" }
            // Right after the call, the composer is moved back out of the call's registers: the row goes there.
            val restore = getInstruction(lastIndex + 1)
            check(restore is TwoRegisterInstruction && restore.registerB == composer &&
                restore.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) {
                "The Options rows don't keep their composer as expected in $definingClass->$name; the patch needs an update"
            }
            val composerAfter = restore.registerA
            // (move-result-object, check-cast and const/16 take registers up to v255)
            check(first + 9 <= 255) { "The Options rows use registers above v255 in $definingClass->$name; the patch needs an update" }
            checkRegistersFree(this, lastIndex + 1,
                (first..first + 9).filter { it != composer && it != composerAfter }.toSet(), "the Patches row")
            checkNoJumpTo(this, lastIndex + 2, "the Patches row")
            addInstructions(
                lastIndex + 2,
                """
                    invoke-static {}, $OPTIONS_ROW_CLASS->click()Ljava/lang/Object;
                    move-result-object v${first + 4}
                    check-cast v${first + 4}, $clickType
                    invoke-static {}, $OPTIONS_ROW_CLASS->title()Ljava/lang/String;
                    move-result-object v$first
                    const/16 v${first + 1}, 0x0
                    const/16 v${first + 2}, 0x0
                    const/16 v${first + 3}, 0x0
                    const/16 v${first + 5}, 0x0
                    const/16 v${first + 6}, 0x0
                    const/16 v${first + 8}, 0x0
                    const/16 v${first + 9}, 0x6e
                    invoke-static/range { v$first .. v${first + 9} }, $row
                    move-object/from16 v$composerAfter, v$composer
                """
            )
            val clickClass = classDefByOrNull(clickType) ?: error("Click type $clickType not found")
            val abstractMethods = clickClass.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) }
            check(AccessFlags.INTERFACE.isSet(clickClass.accessFlags) && abstractMethods.size == 1 &&
                abstractMethods[0].name == "invoke" && abstractMethods[0].parameterTypes.isEmpty() &&
                abstractMethods[0].returnType == "Ljava/lang/Object;") {
                "The Options row's click type $clickType isn't a Function0; the patch needs an update"
            }
            mutableClassDefBy(OPTIONS_ROW_CLASS).interfaces.add(clickType)
        }
    }
}
