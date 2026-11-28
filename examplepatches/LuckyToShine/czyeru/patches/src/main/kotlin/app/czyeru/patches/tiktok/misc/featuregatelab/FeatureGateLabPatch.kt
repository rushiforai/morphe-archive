/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.czyeru.patches.tiktok.misc.featuregatelab

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.absettings.APP_AB_INT_KEY_REGISTER
import app.czyeru.patches.tiktok.misc.absettings.APP_AB_INT_METHOD
import app.czyeru.patches.tiktok.misc.absettings.APP_AB_INT_PARAMETERS
import app.czyeru.patches.tiktok.misc.absettings.APP_AB_RAW
import app.czyeru.patches.tiktok.misc.absettings.MethodShape
import app.czyeru.patches.tiktok.misc.absettings.appAbClass
import app.czyeru.patches.tiktok.misc.absettings.appAbTypedClasses
import app.czyeru.patches.tiktok.misc.absettings.methodsOfShape
import app.czyeru.patches.tiktok.misc.absettings.shape
import app.czyeru.patches.tiktok.misc.settings.settingsPatch
import app.czyeru.patches.tiktok.shared.callThroughLocals
import app.czyeru.patches.tiktok.shared.objectIn
import app.czyeru.patches.tiktok.shared.valueIn
import app.czyeru.patches.tiktok.shared.wideIn
import app.czyeru.util.addInstructionsAtControlFlowLabel
import app.czyeru.util.cloneMutableAndPreserveParameters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val ABMOCK_SETTINGS_MANAGER_DESCRIPTOR = "Lcom/bytedance/ies/abmock/SettingsManager;"
private const val LIVE_SETTINGS_DESCRIPTOR = "Lcom/bytedance/android/live_settings/SettingsManager;"
private const val ACTIVITY_CENTER_DESCRIPTOR = "Lcom/ss/android/ugc/tiktok/pns/activitycenter/EnterActivityCenterAction;"
private const val VE_CONFIG_DESCRIPTOR = "Lcom/ss/android/vesdk/VEConfigCenter;"
private const val PLAYER_SETTING_SERVICE_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/video/simplayer/PlayerSettingServiceImpl;"
/** Stands in for the app AB class, which is renamed on every build and resolved by shape. */
private const val APP_AB_DESCRIPTOR = "<app-ab>"
private const val RUNTIME_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/featuregatelab/FeatureGateLabRuntime;"

private data class TypedBoundary(
    val targetDescriptor: String,
    val methodName: String,
    val returnType: String,
    val parameters: List<String>,
    val keyParameter: String,
    val returnOpcode: Opcode,
    val runtimeMethod: String,
    val runtimeDescriptor: String,
    val wide: Boolean = false,
    val isStatic: Boolean = false,
    val nameIsStable: Boolean = false,
)

private val boundaries = listOf(
    TypedBoundary(APP_AB_DESCRIPTOR, "LIZ", "Z", listOf("I", "Ljava/lang/String;", "Z", "Z"), "p2", Opcode.RETURN, "overrideBoolean", "(Ljava/lang/String;Z)Z"),
    TypedBoundary(APP_AB_DESCRIPTOR, "LIZJ", "D", listOf("D", "I", "Ljava/lang/String;", "Z"), "p4", Opcode.RETURN_WIDE, "overrideDouble", "(Ljava/lang/String;D)D", true),
    TypedBoundary(APP_AB_DESCRIPTOR, "LIZLLL", "F", listOf("I", "Ljava/lang/String;", "Z", "F"), "p2", Opcode.RETURN, "overrideFloat", "(Ljava/lang/String;F)F"),
    TypedBoundary(APP_AB_DESCRIPTOR, APP_AB_INT_METHOD, "I", APP_AB_INT_PARAMETERS, APP_AB_INT_KEY_REGISTER, Opcode.RETURN, "overrideInt", "(Ljava/lang/String;I)I"),
    TypedBoundary(APP_AB_DESCRIPTOR, "LJII", "J", listOf("I", "J", "Ljava/lang/String;", "Z"), "p4", Opcode.RETURN_WIDE, "overrideLong", "(Ljava/lang/String;J)J", true),
    TypedBoundary(APP_AB_DESCRIPTOR, "LJIIIIZZ", "Ljava/lang/String;", listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Z"), "p2", Opcode.RETURN_OBJECT, "overrideString", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"),
    TypedBoundary(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR, "LIZ", "Z", listOf("Ljava/lang/String;", "Z"), "p0", Opcode.RETURN, "overrideBoolean", "(Ljava/lang/String;Z)Z", isStatic = true),
    TypedBoundary(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR, "LIZIZ", "D", listOf("Ljava/lang/String;", "D"), "p0", Opcode.RETURN_WIDE, "overrideDouble", "(Ljava/lang/String;D)D", true, isStatic = true),
    TypedBoundary(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR, "LIZJ", "F", listOf("Ljava/lang/String;", "F"), "p0", Opcode.RETURN, "overrideFloat", "(Ljava/lang/String;F)F", isStatic = true),
    TypedBoundary(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR, "LJ", "I", listOf("Ljava/lang/String;", "I"), "p0", Opcode.RETURN, "overrideInt", "(Ljava/lang/String;I)I", isStatic = true),
    TypedBoundary(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR, "LJFF", "J", listOf("Ljava/lang/String;", "J"), "p0", Opcode.RETURN_WIDE, "overrideLong", "(Ljava/lang/String;J)J", true, isStatic = true),
    TypedBoundary(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR, "LJI", "Ljava/lang/String;", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "p0", Opcode.RETURN_OBJECT, "overrideString", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", isStatic = true),
    TypedBoundary(LIVE_SETTINGS_DESCRIPTOR, "getBooleanValue", "Z", listOf("Ljava/lang/String;", "Z"), "p1", Opcode.RETURN, "overrideLiveBoolean", "(Ljava/lang/String;Z)Z", nameIsStable = true),
    TypedBoundary(LIVE_SETTINGS_DESCRIPTOR, "getDoubleValue", "D", listOf("Ljava/lang/String;", "D"), "p1", Opcode.RETURN_WIDE, "overrideLiveDouble", "(Ljava/lang/String;D)D", true, nameIsStable = true),
    TypedBoundary(LIVE_SETTINGS_DESCRIPTOR, "getFloatValue", "F", listOf("Ljava/lang/String;", "F"), "p1", Opcode.RETURN, "overrideLiveFloat", "(Ljava/lang/String;F)F", nameIsStable = true),
    TypedBoundary(LIVE_SETTINGS_DESCRIPTOR, "getIntValue", "I", listOf("Ljava/lang/String;", "I"), "p1", Opcode.RETURN, "overrideLiveInt", "(Ljava/lang/String;I)I", nameIsStable = true),
    TypedBoundary(LIVE_SETTINGS_DESCRIPTOR, "getLongValue", "J", listOf("Ljava/lang/String;", "J"), "p1", Opcode.RETURN_WIDE, "overrideLiveLong", "(Ljava/lang/String;J)J", true, nameIsStable = true),
    TypedBoundary(LIVE_SETTINGS_DESCRIPTOR, "getStringValue", "Ljava/lang/String;", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "p1", Opcode.RETURN_OBJECT, "overrideLiveString", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", nameIsStable = true),
    TypedBoundary(VE_CONFIG_DESCRIPTOR, "getValue", "Ljava/lang/Boolean;", listOf("Ljava/lang/String;", "Z"), "p1", Opcode.RETURN_OBJECT, "overrideVeBoolean", "(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;", nameIsStable = true),
    TypedBoundary(VE_CONFIG_DESCRIPTOR, "getValue", "F", listOf("Ljava/lang/String;", "F"), "p1", Opcode.RETURN, "overrideVeFloat", "(Ljava/lang/String;F)F", nameIsStable = true),
    TypedBoundary(VE_CONFIG_DESCRIPTOR, "getValue", "I", listOf("Ljava/lang/String;", "I"), "p1", Opcode.RETURN, "overrideVeInt", "(Ljava/lang/String;I)I", nameIsStable = true),
    TypedBoundary(VE_CONFIG_DESCRIPTOR, "getValue", "J", listOf("Ljava/lang/String;", "J"), "p1", Opcode.RETURN_WIDE, "overrideVeLong", "(Ljava/lang/String;J)J", true, nameIsStable = true),
    TypedBoundary(VE_CONFIG_DESCRIPTOR, "getValue", "Ljava/lang/String;", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "p1", Opcode.RETURN_OBJECT, "overrideVeString", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", nameIsStable = true),
)

@Suppress("unused")
val featureGateLabPatch = bytecodePatch(
    name = "Feature Gate Lab",
    description = "Adds a menu for viewing and overriding supported TikTok feature flags and configuration values.",
    default = true,
) {
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        boundaries.flatMap { boundary ->
            if (boundary.targetDescriptor == APP_AB_DESCRIPTOR) appAbTypedClasses().map { boundary to it }
            else listOf(boundary to mutableClassDefBy(boundary.targetDescriptor))
        }.forEach { (boundary, target) ->
            val shape = MethodShape(boundary.returnType, boundary.parameters, boundary.isStatic)
            val ofShape = target.methods.filter { it.shape() == shape }
            val candidates =
                if (boundary.nameIsStable) ofShape.filter { it.name == boundary.methodName }
                else ofShape
            val method = when (candidates.size) {
                1 -> candidates.single()
                0 -> throw PatchException(
                    "Feature Gate Lab boundary not found: ${target.type} has no " +
                        (if (boundary.nameIsStable) "${boundary.methodName} of " else "") +
                        "${boundary.returnType}${boundary.parameters}.",
                )
                else -> candidates.singleOrNull { it.name == boundary.methodName }
                    ?: throw PatchException(
                        "Feature Gate Lab boundary is ambiguous: ${target.type} has ${candidates.size} of " +
                            "${boundary.returnType}${boundary.parameters} and none is called ${boundary.methodName}.",
                    )
            }
            method.patchBoundary(boundary)
        }

        appAbClass().methodsOfShape(APP_AB_RAW, "Feature Gate Lab raw App AB boundary")
            .forEach { it.patchRawAbBoundary() }

        val settingsManager = mutableClassDefBy(ABMOCK_SETTINGS_MANAGER_DESCRIPTOR)
        val objectGetterWithoutDefault = settingsManager.methods.filter {
            it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/Class;") &&
                AccessFlags.STATIC.isSet(it.accessFlags)
        }.let { matches ->
            matches.singleOrNull() ?: matches.singleOrNull { it.name == "LJII" }
        } ?: throw PatchException("Feature Gate Lab SettingsManager object boundary without default not found")
        objectGetterWithoutDefault
            .cloneMutableAndPreserveParameters()
            .patchSettingsManagerObjectBoundary(
            hasDefault = false,
            isStatic = true,
        )

        val objectGetterWithDefault = settingsManager.methods.filter {
            it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes == listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/Class;",
                    "Ljava/lang/Object;",
                ) &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }.let { matches ->
            matches.singleOrNull() ?: matches.singleOrNull { it.name == "LJIIIIZZ" }
        } ?: throw PatchException("Feature Gate Lab SettingsManager object boundary with default not found")
        objectGetterWithDefault.patchSettingsManagerObjectBoundary(
            hasDefault = true,
            isStatic = false,
        )

        val liveSettingsManager = mutableClassDefBy(LIVE_SETTINGS_DESCRIPTOR)
        val liveObjectGetterWithDefault = liveSettingsManager.methods.singleOrNull {
            it.name == "getValueSafely" &&
                it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/Object;")
        } ?: throw PatchException("Feature Gate Lab Live object boundary with default not found")
        liveObjectGetterWithDefault.patchLiveSettingsObjectBoundary(hasClassKey = false)

        val liveObjectGetterByClass = liveSettingsManager.methods.singleOrNull {
            it.name == "getValueSafely" &&
                it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes == listOf("Ljava/lang/Class;")
        } ?: throw PatchException("Feature Gate Lab Live object boundary by class not found")
        liveObjectGetterByClass.patchLiveSettingsObjectBoundary(hasClassKey = true)

        val liveStringArrayGetter = liveSettingsManager.methods.singleOrNull {
            it.name == "getStringArrayValue" &&
                it.returnType == "[Ljava/lang/String;" &&
                it.parameterTypes == listOf("Ljava/lang/String;", "[Ljava/lang/String;")
        } ?: throw PatchException("Feature Gate Lab Live string-array boundary not found")
        liveStringArrayGetter.patchLiveSettingsObjectBoundary(hasClassKey = false)

        val playerSettings = mutableClassDefBy(PLAYER_SETTING_SERVICE_DESCRIPTOR)
        val playerGetter = playerSettings.methods.singleOrNull {
            it.name == "get" &&
                it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes == listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/reflect/Type;",
                    "Ljava/lang/Object;",
                    "Z",
                    "Z",
                )
        } ?: throw PatchException("Feature Gate Lab PlayerSettingService boundary not found")
        playerGetter.patchPlayerSettingBoundary()

        val activityCenter = mutableClassDefBy(ACTIVITY_CENTER_DESCRIPTOR)
        val getSchema = activityCenter.methods.singleOrNull {
            it.name == "getSchema" &&
                it.returnType == "Ljava/lang/String;" &&
                it.parameterTypes == listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Landroid/net/Uri;",
                )
        } ?: throw PatchException("Feature Gate Lab Activity Center schema boundary not found")
        getSchema.patchActivityCenterSchema()

        val runtime = mutableClassDefBy(RUNTIME_DESCRIPTOR)
        val installed = runtime.methods.singleOrNull {
            it.name == "isInstalled" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Feature Gate Lab runtime marker not found")
        installed.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

private fun MutableMethod.patchLiveSettingsObjectBoundary(hasClassKey: Boolean) {
    val implementation = implementation
        ?: throw PatchException("Feature Gate Lab Live object boundary has no implementation")
    implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) ->
            index to ((instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Feature Gate Lab Live object return without result register"))
        }
        .asReversed()
        .forEach { (index, register) ->
            val returnCast = if (returnType == "Ljava/lang/Object;") {
                ""
            } else {
                "\ncheck-cast v$register, $returnType"
            }
            val call = if (hasClassKey) {
                callThroughLocals(
                    "Feature Gate Lab",
                    "invoke-static",
                    "$RUNTIME_DESCRIPTOR->observeLiveSettingsClassObject(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;",
                    objectIn("p1"),
                    objectIn("v$register"),
                )
            } else {
                callThroughLocals(
                    "Feature Gate Lab",
                    "invoke-static",
                    "$RUNTIME_DESCRIPTOR->observeLiveSettingsObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                    objectIn("p1"),
                    objectIn("p2"),
                    objectIn("v$register"),
                )
            }
            addInstructionsAtControlFlowLabel(index, "$call\nmove-result-object v$register$returnCast")
        }
}

private fun MutableMethod.patchSettingsManagerObjectBoundary(
    hasDefault: Boolean,
    isStatic: Boolean,
) {
    val implementation = implementation
        ?: throw PatchException("Feature Gate Lab SettingsManager object boundary has no implementation")
    implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) ->
            index to ((instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Feature Gate Lab SettingsManager object return without result register"))
        }
        .asReversed()
        .forEach { (index, register) ->
            val call = if (hasDefault) {
                callThroughLocals(
                    "Feature Gate Lab",
                    "invoke-static",
                    "$RUNTIME_DESCRIPTOR->observeSettingsObject(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                    objectIn("p1"),
                    objectIn("p2"),
                    objectIn("p3"),
                    objectIn("v$register"),
                )
            } else if (isStatic) {
                callThroughLocals(
                    "Feature Gate Lab",
                    "invoke-static",
                    "$RUNTIME_DESCRIPTOR->observeSettingsObjectWithoutDefault(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;",
                    objectIn("p0"),
                    objectIn("p1"),
                    objectIn("v$register"),
                )
            } else {
                callThroughLocals(
                    "Feature Gate Lab",
                    "invoke-static",
                    "$RUNTIME_DESCRIPTOR->observeSettingsObjectWithoutDefault(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;",
                    objectIn("p1"),
                    objectIn("p2"),
                    objectIn("v$register"),
                )
            }
            addInstructionsAtControlFlowLabel(index, "$call\nmove-result-object v$register")
        }
}

private fun MutableMethod.patchPlayerSettingBoundary() {
    val implementation = implementation
        ?: throw PatchException("Feature Gate Lab PlayerSettingService boundary has no implementation")
    implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) ->
            index to ((instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Feature Gate Lab PlayerSettingService return without result register"))
        }
        .asReversed()
        .forEach { (index, register) ->
            val call = callThroughLocals(
                "Feature Gate Lab",
                "invoke-static",
                "$RUNTIME_DESCRIPTOR->overridePlayerValue(Ljava/lang/String;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;",
                objectIn("p1"),
                objectIn("p2"),
                objectIn("v$register"),
            )
            addInstructionsAtControlFlowLabel(index, "$call\nmove-result-object v$register")
        }
}

private fun MutableMethod.patchRawAbBoundary() {
    val implementation = implementation
        ?: throw PatchException("Feature Gate Lab raw App AB boundary has no implementation")
    implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) ->
            index to ((instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Feature Gate Lab raw App AB return without result register"))
        }
        .asReversed()
        .forEach { (index, register) ->
            val call = callThroughLocals(
                "Feature Gate Lab",
                "invoke-static",
                "$RUNTIME_DESCRIPTOR->overrideRawAbValue(Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;",
                objectIn("p1"),
                objectIn("v$register"),
                valueIn("p2"),
            )
            addInstructionsAtControlFlowLabel(index, "$call\nmove-result-object v$register")
        }
}

private fun MutableMethod.patchActivityCenterSchema() {
    val implementation = implementation
        ?: throw PatchException("Feature Gate Lab Activity Center boundary has no implementation")
    implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) ->
            index to ((instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Feature Gate Lab Activity Center return without result register"))
        }
        .asReversed()
        .forEach { (index, register) ->
            addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static/range {v$register .. v$register}, $RUNTIME_DESCRIPTOR->transformActivityCenterSchema(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """,
            )
        }
}

private fun MutableMethod.patchBoundary(boundary: TypedBoundary) {
    val implementation = implementation ?: throw PatchException("Feature Gate Lab boundary has no implementation: $this")
    implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == boundary.returnOpcode }
        .map { (index, instruction) ->
            index to ((instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Feature Gate Lab return without result register: $this"))
        }
        .asReversed()
        .forEach { (index, register) ->
            val result = when {
                boundary.wide -> wideIn("v$register")
                boundary.returnOpcode == Opcode.RETURN_OBJECT -> objectIn("v$register")
                else -> valueIn("v$register")
            }
            val call = callThroughLocals(
                "Feature Gate Lab",
                "invoke-static",
                "$RUNTIME_DESCRIPTOR->${boundary.runtimeMethod}${boundary.runtimeDescriptor}",
                objectIn(boundary.keyParameter),
                result,
            )
            val moveResult = when (boundary.returnOpcode) {
                Opcode.RETURN_WIDE -> "move-result-wide v$register"
                Opcode.RETURN_OBJECT -> "move-result-object v$register"
                else -> "move-result v$register"
            }
            addInstructionsAtControlFlowLabel(index, "$call\n$moveResult")
        }
}
