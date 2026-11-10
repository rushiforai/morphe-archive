package app.bin0culars.patches.reddit.misc.settings

import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.p0Register
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/settings/BinocularsMods;"
private const val SHORTCUT_EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/settings/DrawerModsShortcut;"

private fun fillBridge(name: String, smali: String) {
    Fingerprint(definingClass = SHORTCUT_EXTENSION_CLASS, name = name).method.addInstructions(0, smali)
}

@Suppress("unused")
val binocularsModsSettingsPatch =
    patch(
        description = "Adds the bin0culars mods settings section.",
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)

        extendWith("extensions/extension.mpe")

        execute {
            registeredSettings.clear()

            resourceXml("res/values/strings.xml").use { strings ->
                strings.resource("label_content_policy").text = "bin0culars mods"
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_mods_title")
                    text = "bin0culars mods"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_back")
                    text = "Back"
                }
            }

            StartUrlActivityFingerprint.let {
                val index = it.instructionMatches.last().index
                it.method.apply {
                    val p0Register = p0Register
                    val free = findFreeRegister(index, p0Register + 1, p0Register + 2)
                    addInstructionsWithLabels(
                        index,
                        """
                            invoke-static { p1, p2 }, $EXTENSION_CLASS->openIfOurs(Landroid/app/Activity;Landroid/net/Uri;)Z
                            move-result v$free
                            if-eqz v$free, :ignore
                            return-void
                            :ignore
                            nop
                        """,
                    )
                }
            }

            val presenterConstructorMethod = DrawerPresenterConstructorFingerprint.method
            val presenterClassType = DrawerPresenterConstructorFingerprint.classDef.type
            val rulesTitleMatchIndex = DrawerPresenterConstructorFingerprint.instructionMatches.first().index

            val rulesTitleRegister = presenterConstructorMethod
                .getInstruction<OneRegisterInstruction>(rulesTitleMatchIndex).registerA
            val labelContentPolicyId = resourceId(ResourceType.STRING, "label_content_policy").toInt()
            presenterConstructorMethod.replaceInstruction(
                rulesTitleMatchIndex,
                "const v$rulesTitleRegister, 0x${Integer.toHexString(labelContentPolicyId)}",
            )

            val iconRulesId = resourceId(ResourceType.DRAWABLE, "icon_rules").toInt()
            val iconSettingsId = resourceId(ResourceType.DRAWABLE, "icon_settings").toInt()
            var iconRulesIndex = -1
            var iconRulesRegister = -1
            for (i in rulesTitleMatchIndex - 1 downTo 0) {
                val instruction = presenterConstructorMethod.instructions[i]
                if (instruction is NarrowLiteralInstruction && instruction.narrowLiteral == iconRulesId) {
                    iconRulesIndex = i
                    iconRulesRegister = (instruction as? OneRegisterInstruction)?.registerA
                        ?: throw PatchException("icon_rules instruction is not a OneRegisterInstruction")
                    break
                }
            }
            if (iconRulesIndex == -1) {
                throw PatchException("Could not find const for icon_rules before reddit_rules_title")
            }
            presenterConstructorMethod.replaceInstruction(
                iconRulesIndex,
                "const v$iconRulesRegister, 0x${Integer.toHexString(iconSettingsId)}",
            )

            var foundConstructor = false
            var modsRowField: FieldReference? = null
            for (i in rulesTitleMatchIndex + 1 until presenterConstructorMethod.instructions.size) {
                val instruction = presenterConstructorMethod.instructions[i]
                if (!foundConstructor) {
                    if (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) {
                        val methodRef = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        if (methodRef?.name == "<init>") {
                            foundConstructor = true
                        }
                    }
                } else {
                    if (instruction.opcode == Opcode.IPUT_OBJECT) {
                        val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                        if (fieldRef != null) {
                            modsRowField = fieldRef
                            break
                        }
                    }
                }
            }
            val modsField = modsRowField
                ?: throw PatchException("Could not find mods row field after reddit_rules_title")

            val listBuiltMethod = DrawerListBuiltFingerprint.method
            val buildIndex = DrawerListBuiltFingerprint.instructionMatches.first().index

            val listFieldMatches = mutableListOf<Pair<Int, FieldReference>>()
            for (i in buildIndex + 1 until listBuiltMethod.instructions.size) {
                val instruction = listBuiltMethod.instructions[i]
                if (instruction.opcode == Opcode.IPUT_OBJECT) {
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    if (fieldRef != null && fieldRef.definingClass == presenterClassType && fieldRef.type == "Ljava/util/List;") {
                        listFieldMatches.add(i to fieldRef)
                    }
                }
            }
            val (lastIputIndex, listField) = listFieldMatches.lastOrNull()
                ?: throw PatchException("Could not find list field iput-object in ${listBuiltMethod.name}")

            val p0 = listBuiltMethod.p0Register
            listBuiltMethod.addInstructions(
                lastIputIndex + 1,
                "invoke-static/range { v$p0 .. v$p0 }, $SHORTCUT_EXTENSION_CLASS->onDrawerListBuilt(Ljava/lang/Object;)V",
            )

            fillBridge(
                "modsItem",
                """
                    check-cast p0, $presenterClassType
                    iget-object p0, p0, ${modsField.definingClass}->${modsField.name}:${modsField.type}
                    return-object p0
                """,
            )

            fillBridge(
                "drawerItems",
                """
                    check-cast p0, $presenterClassType
                    iget-object p0, p0, ${listField.definingClass}->${listField.name}:${listField.type}
                    return-object p0
                """,
            )

            fillBridge(
                "setDrawerItems",
                """
                    check-cast p0, $presenterClassType
                    iput-object p1, p0, ${listField.definingClass}->${listField.name}:${listField.type}
                    return-void
                """,
            )
        }

        finalize {
            resourceXml("res/values/strings.xml").use { strings ->
                for (setting in registeredSettings) {
                    strings.root.appendChild("string") {
                        setAttribute("name", "bin0culars_${setting.key}_title")
                        text = setting.title
                    }
                    strings.root.appendChild("string") {
                        setAttribute("name", "bin0culars_${setting.key}_summary")
                        text = setting.summary
                    }
                    for (choice in setting.choices) {
                        strings.root.appendChild("string") {
                            setAttribute("name", "bin0culars_${setting.key}_choice_${choice.value}")
                            text = choice.label
                        }
                    }
                }

                val usedSections = registeredSettings.map { it.section }.distinct()
                for (section in usedSections) {
                    strings.root.appendChild("string") {
                        setAttribute("name", "bin0culars_section_${section.id}")
                        text = section.title
                    }
                }

                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_restart_hint")
                    text = "Restart Reddit to apply your changes."
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_restart")
                    text = "Restart"
                }
            }

            val encoded = registeredSettings.joinToString("\n") { setting ->
                val type = if (setting.choices.isNotEmpty()) "C" else "S"
                val defaultValue = if (type == "S") {
                    if (setting.default) "1" else "0"
                } else {
                    setting.defaultChoice ?: ""
                }
                val choices = setting.choices.joinToString(",") { it.value }
                "${setting.key}|${setting.section.id}|${setting.parentKey ?: ""}|$type|$defaultValue|$choices"
            }

            val escaped = encoded
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")

            Fingerprint(definingClass = EXTENSION_CLASS, name = "registryData").method.addInstructions(
                0,
                """
                    const-string v0, "$escaped"
                    return-object v0
                """,
            )
        }
    }
