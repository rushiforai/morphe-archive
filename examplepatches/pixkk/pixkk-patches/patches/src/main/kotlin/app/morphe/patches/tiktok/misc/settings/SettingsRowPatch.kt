package app.morphe.patches.tiktok.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.findFreeRegister
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.numberOfParameterRegisters
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method as SmaliMethod
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val WHAT = "pixkk settings row"
private const val SCREEN = "Lapp/pixkk/extension/core/SettingsScreen;"
private const val WHATS_NEW_VM =
    "Lcom/ss/android/ugc/aweme/setting/ui/rvmpcompose/group/support/cells/WhatsNewCellVM;"
private const val SUPPORT_GROUP_VM =
    "Lcom/ss/android/ugc/aweme/setting/ui/rvmpcompose/group/support/SupportGroupVM;"

/** The What's New row's state: its constructor writes the row's title as a plain string. */
internal object WhatsNewStateFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    strings = listOf("What's New"),
)

/** What a tap on the What's New row does, from both of the places that call it. */
internal object WhatsNewClickFingerprint : Fingerprint(
    definingClass = WHATS_NEW_VM,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, _ -> method.name != "<init>" },
)

/** The support group builds its rows; What's New is added only behind two checks. */
internal object SupportGroupRowsFingerprint : Fingerprint(
    definingClass = SUPPORT_GROUP_VM,
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.getReference<FieldReference>()?.name == "WHATS_NEW"
        } == true
    },
)

private const val PAGE = "Lapp/pixkk/extension/core/SettingsPage;"

/** The activity the settings page is shown in; TikTok's ad personalisation screen, also lent to Hushfeed. */
internal object PageActivityOnCreateFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/AdPersonalizationActivity;") && method.name == "onCreate"
    },
)

internal object PageActivityOnBackPressedFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/AdPersonalizationActivity;") &&
            method.name == "onBackPressed" &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "V"
    },
)

private const val AD_WEB_MORE_ACTION_SERVICE =
    "Lcom/ss/android/ugc/aweme/commercialize/hybrid/impl/web/AdWebMoreActionService;"
private const val SPARK_CONTEXT = "Lcom/bytedance/hybrid/spark/SparkContext;"
private const val TUX_ICON_VIEW = "Lcom/bytedance/tux/icon/TuxIconView;"
private const val AD_BROWSER_SETTINGS_KEY = "ad_browser_settings"
private const val VECTOR_RESOURCE_TO_STRING = "VectorResource(resId="

/**
 * The type of TikTok's `VectorResource(resId: Int)` data class, found by the string its generated
 * toString() appends. Exactly one class carries it, and it needs the one-int constructor.
 */
private fun BytecodePatchContext.vectorResourceClass(): String {
    val carrier = classDefByStrings(VECTOR_RESOURCE_TO_STRING).singleOrNull()
        ?: throw PatchException("$WHAT: expected one class carrying \"$VECTOR_RESOURCE_TO_STRING\"")
    if (carrier.methods.none { it.name == "<init>" && it.parameterTypes.toList() == listOf("I") }) {
        throw PatchException("$WHAT: ${carrier.type} has no <init>(I)V to build the icon with")
    }
    return carrier.type
}

/**
 * TikTok's own settings gear: the icon id the Ad Browser settings action hands the icon view it is
 * drawn in. Read from that bytecode, so no build's resource ids are assumed.
 */
private fun settingsGearResourceId(iconRenderer: SmaliMethod, keyCarriers: Iterable<ClassDef>): Int {
    val iconMethod = iconRenderer.implementation?.instructions?.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_INTERFACE) return@mapNotNull null
        (instruction as? ReferenceInstruction)?.reference.let { it as? MethodReference }
            ?.takeIf { it.parameterTypes.isEmpty() && it.returnType == "I" }
    }?.toList().orEmpty().singleOrNull()
        ?: throw PatchException("$WHAT: the Ad Browser action's icon call is gone")

    val ids = keyCarriers.filter { classDef ->
        iconMethod.definingClass in classDef.interfaces && classDef.methods.any { method ->
            val body = method.implementation?.instructions?.toList() ?: return@any false
            method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
                body.size == 2 && body[0].opcode == Opcode.CONST_STRING &&
                body[0].getReference<StringReference>()?.string == AD_BROWSER_SETTINGS_KEY
        }
    }.mapNotNull { classDef ->
        val method = classDef.methods.singleOrNull {
            it.name == iconMethod.name && it.parameterTypes == iconMethod.parameterTypes &&
                it.returnType == iconMethod.returnType
        } ?: return@mapNotNull null
        method.implementation?.instructions?.toList().orEmpty().zipWithNext().mapNotNull { (value, exit) ->
            if (exit.opcode != Opcode.RETURN) return@mapNotNull null
            if ((value as? OneRegisterInstruction)?.registerA != (exit as? OneRegisterInstruction)?.registerA) {
                return@mapNotNull null
            }
            (value as? NarrowLiteralInstruction)?.narrowLiteral
        }.toSet()
    }
    val id = ids.reduceOrNull(Set<Int>::intersect)?.singleOrNull()
        ?: throw PatchException("$WHAT: the Ad Browser action does not name one settings icon")
    if (id ushr 24 != 0x7f) throw PatchException("$WHAT: the settings icon is not an app resource")
    return id
}

internal fun BytecodePatchContext.settingsGearResourceId(): Int {
    val renderer = mutableClassDefBy(AD_WEB_MORE_ACTION_SERVICE).methods.singleOrNull { method ->
        method.returnType == "V" &&
            method.parameterTypes == listOf(SPARK_CONTEXT, "Landroid/content/Context;", TUX_ICON_VIEW)
    } ?: throw PatchException("$WHAT: the Ad Browser icon renderer was not found once")
    return settingsGearResourceId(renderer, classDefByStrings(AD_BROWSER_SETTINGS_KEY))
}

@Suppress("unused")
val settingsRowPatch = bytecodePatch(
    name = WHAT,
    description = "Turns the What's New row in Settings and privacy into the Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // The row is only built behind a test-build flag and a feature switch; show it always.
        SupportGroupRowsFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val whatsNew = instructions.indices.filter {
                instructions[it].getReference<FieldReference>()?.name == "WHATS_NEW"
            }
            if (whatsNew.size < 2) throw PatchException("$WHAT: the What's New checks are gone")

            // The switch: `move-result` then `if-eqz` right before the row is added.
            val switchResult = whatsNew[1] - 2
            if (instructions[switchResult].opcode != Opcode.MOVE_RESULT) {
                throw PatchException("$WHAT: the What's New switch has changed")
            }
            // The flag: the last boolean read of the group's own field before the first mention.
            val flagRead = (whatsNew[0] - 1 downTo 0).firstOrNull {
                instructions[it].opcode == Opcode.IGET_BOOLEAN &&
                    instructions[it].getReference<FieldReference>()?.definingClass == SUPPORT_GROUP_VM
            } ?: throw PatchException("$WHAT: the What's New flag is gone")

            // The later one first, so the earlier index stays where it is.
            val switchRegister = (instructions[switchResult] as OneRegisterInstruction).registerA
            addInstruction(switchResult + 1, "const/4 v$switchRegister, 0x1")
            val flagRegister = (instructions[flagRead] as OneRegisterInstruction).registerA
            addInstruction(flagRead + 1, "const/4 v$flagRegister, 0x1")
        }

        val vectorResource = vectorResourceClass()
        val gear = settingsGearResourceId()
        WhatsNewStateFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                it.getReference<StringReference>()?.string == "What's New"
            }
            val register = (getInstruction(index) as OneRegisterInstruction).registerA
            replaceInstruction(index, "const-string v$register, \"Pixkk Patches\"")

            // The constructor loads one icon from a static and uses it for both icon fields.
            val iconLoad = indexOfFirstInstruction {
                opcode == Opcode.SGET_OBJECT && getReference<FieldReference>()?.type == vectorResource
            }
            if (iconLoad < 0) throw PatchException("$WHAT: the What's New row's icon load is gone")
            val iconRegister = (getInstruction(iconLoad) as OneRegisterInstruction).registerA
            val temp = findFreeRegister(iconLoad + 1, iconRegister)
            addInstructions(
                iconLoad + 1,
                """
                    new-instance v$iconRegister, $vectorResource
                    const v$temp, $gear
                    invoke-direct {v$iconRegister, v$temp}, $vectorResource-><init>(I)V
                """,
            )
        }

        PageActivityOnCreateFingerprint.method.apply {
            val invokeSuperIndex = indexOfFirstInstructionOrThrow(Opcode.INVOKE_SUPER)
            val invokeSuper = getInstruction(invokeSuperIndex) as? Instruction35c
                ?: throw PatchException("$WHAT: the settings activity's onCreate has an unsupported invoke-super")
            val locals = implementation!!.registerCount - numberOfParameterRegisters
            if (locals < 1) throw PatchException("$WHAT: the settings activity's onCreate has no free register")
            val scratch = locals - 1
            val next = invokeSuperIndex + 1
            addInstructionsWithLabels(
                next,
                """
                    invoke-static { v${invokeSuper.registerC} }, $PAGE->initialize(Landroid/app/Activity;)Z
                    move-result v$scratch
                    if-eqz v$scratch, :not_pixkk
                    return-void
                """,
                ExternalLabel("not_pixkk", getInstruction(next)),
            )
        }

        PageActivityOnBackPressedFingerprint.method.apply {
            if (implementation!!.registerCount - numberOfParameterRegisters < 1) {
                throw PatchException("$WHAT: the settings activity's onBackPressed has no free register")
            }
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $PAGE->handleBackPressed(Landroid/app/Activity;)Z
                    move-result v0
                    if-eqz v0, :not_pixkk
                    return-void
                """,
                ExternalLabel("not_pixkk", getInstruction(0)),
            )
        }

        WhatsNewClickFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $SCREEN->show(Landroid/content/Context;)V
                return-void
            """,
        )
    }
}
