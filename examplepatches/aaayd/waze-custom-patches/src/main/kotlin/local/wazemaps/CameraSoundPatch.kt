package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CAMERA_EXTENSION = "Llocal/wazemaps/alerts/CameraSound;"

@Suppress("unused")
val cameraSoundPatch = bytecodePatch(
    name = "Speed camera sound below speed limit",
    description = "Enable Waze's speed camera sound below the speed limit. Reapplies after configuration updates. Camera alerts and audible sound must remain enabled in Waze.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(refreshWazeSkins)
    extendWith("extensions/camera-sound.dex")
    execute {
        val getter = configGetter(listOf("CONFIG_VALUE_ALERTS_PLAY_SPEED_CAMERA_SOUND_BELOW_SPEED_LIMIT"), "Ljava/lang/Boolean;", "Z")
        bindExtension(CAMERA_EXTENSION, context = false, rows = false, config = getter)
        val manager = mutableClassDefBy("Lcom/waze/ConfigManager;")
        for ((name, parameters, result) in listOf(
            Triple("getConfigValueBoolNTV", listOf("I"), "Z"),
            Triple("setConfigValueBoolNTV", listOf("I", "Z"), "V")
        )) if (manager.methods.count { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result } != 1)
            throw PatchException("Native camera sound config API missing: $name")
        val sync = configSynced()
        val native = mutableClassDefBy("Lcom/waze/NativeManager;")
        val start = native.methods.singleOrNull { it.name == "onlineInit" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            ?: throw PatchException("Waze native startup missing")
        val instructions = start.implementation?.instructions?.toList() ?: throw PatchException("Waze startup has no bytecode")
        val ready = instructions.mapIndexedNotNull { index, instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            index.takeIf { instruction.opcode == Opcode.SPUT_BOOLEAN && field?.definingClass == "Lcom/waze/NativeManager;" && field.name == "sAppStarted" }
        }.singleOrNull() ?: throw PatchException("Native-ready startup flag missing")
        fun nativeCall(name: String) = instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/waze/NativeManager;" && ref.name == name
        }
        if (nativeCall("AppInitNTV") !in 0 until ready || nativeCall("AppStartNTV") <= ready)
            throw PatchException("Unexpected Waze native startup order")
        val syncReturns = sync.implementation?.instructions?.mapIndexedNotNull { i, instruction ->
            i.takeIf { instruction.opcode == Opcode.RETURN_VOID }
        }.orEmpty()
        if (syncReturns.isEmpty()) throw PatchException("Config refresh exit missing")
        getter.addInstructions(0, """
            invoke-static/range {p0 .. p0}, $CAMERA_EXTENSION->override(Ljava/lang/Object;)Ljava/lang/Boolean;
            move-result-object v0
            if-eqz v0, :original_config
            return-object v0
            :original_config
            nop
        """)
        start.addInstructions(ready + 1, "invoke-static {}, $CAMERA_EXTENSION->applySaved()V")
        syncReturns.reversed().forEach { sync.addInstructions(it, "invoke-static {}, $CAMERA_EXTENSION->scheduleApply()V") }
    }
}
