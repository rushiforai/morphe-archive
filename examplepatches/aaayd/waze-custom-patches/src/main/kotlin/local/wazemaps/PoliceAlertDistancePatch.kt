package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Adapted from dowjames/morphe-patches, commit ea93ea28fc2e329e0bdcaa72aba888998f92ca10.
// GPL-3.0. Attribution and the upstream notice are in THIRD_PARTY_NOTICES.md.
private const val ALERT_EXTENSION = "Llocal/wazemaps/alerts/AlertDistance;"

@Suppress("unused")
val policeAlertDistancePatch = bytecodePatch(
    name = "Android Auto police alert distance",
    description = "Add a saved 50 to 10000 metre police/enforcement heads-up distance in Map display. Defaults to 1200 metres. Applies and verifies Waze's three native distance settings, with an original-distance restore option.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(refreshWazeSkins)
    extendWith("extensions/alert-distance.dex")
    execute {
        val getter = configGetter(listOf("CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE", "CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_NORMAL", "CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_FREEWAY"), "Ljava/lang/Long;", "J")
        bindExtension(ALERT_EXTENSION, context = true, rows = true, config = getter)
        val manager = mutableClassDefBy("Lcom/waze/ConfigManager;")
        for ((name, parameters, result) in listOf(
            Triple("getConfigValueLongNTV", listOf("I"), "J"),
            Triple("setConfigValueLongNTV", listOf("I", "J"), "V")
        )) if (manager.methods.count { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result } != 1)
            throw PatchException("Native distance config API missing: $name")
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
        val render = settingsRenderer()
        val exits = render.implementation!!.instructions.mapIndexedNotNull { i, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) i to (instruction as OneRegisterInstruction).registerA else null
        }
        if (exits.isEmpty()) throw PatchException("Unexpected settings renderer")
        getter.addInstructions(0, """
            invoke-static/range {p0 .. p0}, $ALERT_EXTENSION->override(Ljava/lang/Object;)Ljava/lang/Long;
            move-result-object v0
            if-eqz v0, :original_config
            return-object v0
            :original_config
            nop
        """)
        start.addInstructions(ready + 1, "invoke-static {}, $ALERT_EXTENSION->applySaved()V")
        syncReturns.reversed().forEach { sync.addInstructions(it, "invoke-static {}, $ALERT_EXTENSION->scheduleApply()V") }
        exits.reversed().forEach { (index, register) ->
            render.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $ALERT_EXTENSION->decorate(Landroid/view/View;)Landroid/view/View;
                move-result-object v$register
            """)
        }
    }
}
