package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.ungoogled.patches.maps.ui.activityContextHookPatch
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

/** org.ungoogled.ui.SpeedAlerts, the extension half. */
private const val SPEED_ALERTS = "Lorg/ungoogled/ui/SpeedAlerts;"

/**
 * The navigation speedometer's speed setter: metres a second in, times 3.6 for km/h or 2.2369363
 * for mph, stored as the whole number the speedometer shows. Those two factors appear together
 * nowhere else.
 */
private object SpeedometerSpeedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(literal(3.6f), literal(2.2369363f)),
)

@Suppress("unused")
val speedingChimePatch = bytecodePatch(
    name = "Speeding chime",
    description = "Plays a chime when your speed passes the speed limit during navigation, as Waze does. " +
        "Maps itself only turns its speedometer red. When it chimes is chosen in Waze & external data source, a row on the " +
        "account sheet.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(sharedExtensionPatch, activityContextHookPatch, wazeFeaturesRowPatch)

    execute {
        fun Instruction.ref() = (this as? ReferenceInstruction)?.reference

        val setSpeed = SpeedometerSpeedFingerprint.method
        val code = setSpeed.implementation!!.instructions.toList()
        // The speedometer: what the method's holder is cast to before its fields are read.
        val speedometer = code.firstNotNullOfOrNull { insn ->
            (insn.ref() as? TypeReference)?.type?.takeIf { insn.opcode == Opcode.CHECK_CAST }
        } ?: throw PatchException("the speed setter casts to no speedometer")
        // Its units: read and compared with one enum constant -- the one that picks the 3.6 factor, km/h.
        val units = code.firstNotNullOfOrNull { insn ->
            (insn.ref() as? FieldReference)?.takeIf { insn.opcode == Opcode.IGET_OBJECT && it.definingClass == speedometer }
        } ?: throw PatchException("$speedometer's units field not found")
        val kmh = code.firstNotNullOfOrNull { insn ->
            (insn.ref() as? FieldReference)?.takeIf { insn.opcode == Opcode.SGET_OBJECT && it.type == units.type }
        } ?: throw PatchException("the km/h constant of ${units.type} not found")
        // The speed: the int field the converted value is stored in.
        val speedStore = code.indexOfLast { insn ->
            insn.opcode == Opcode.IPUT && (insn.ref() as FieldReference).let { it.definingClass == speedometer && it.type == "I" }
        }
        if (speedStore < 0) throw PatchException("$speedometer's speed field not found")
        val speedField = code[speedStore].ref() as FieldReference
        val holder = (code[speedStore] as TwoRegisterInstruction).registerB
        val conversion=code.withIndex().filter{it.value.opcode==Opcode.FLOAT_TO_INT}.singleOrNull()
            ?:throw PatchException("the speed setter's integer conversion is not unique")
        val displayed=(conversion.value as TwoRegisterInstruction).registerA

        // The speed limit setter, beside it: (limit, units), storing the limit in another int field.
        val setLimit = mutableClassDefBy(setSpeed.definingClass).methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("I", units.type)
        } ?: throw PatchException("the speed limit setter not found")
        val limitCode = setLimit.implementation!!.instructions.toList()
        val limitStore = limitCode.indexOfFirst { insn ->
            insn.opcode == Opcode.IPUT && (insn.ref() as FieldReference).let {
                it.definingClass == speedometer && it.type == "I" && it.name != speedField.name
            }
        }
        if (limitStore < 0) throw PatchException("$speedometer's speed limit field not found")
        val limitField = limitCode[limitStore].ref() as FieldReference
        val limitHolder = (limitCode[limitStore] as TwoRegisterInstruction).registerB

        // Chime only after the displayed value changes. Native-data freshness is
        // observed separately at entry: steady speed/limit calls skip these IPUTs.
        setSpeed.addInstruction(speedStore + 1, "invoke-static { v$holder }, $SPEED_ALERTS->onSpeedometer(Ljava/lang/Object;)V")
        setSpeed.addInstructions(conversion.index+1,"""
            invoke-static { v$holder, v$displayed }, $SPEED_ALERTS->displayedSpeed(Ljava/lang/Object;I)I
            move-result v$displayed
        """)
        setLimit.addInstruction(limitStore + 1, "invoke-static { v$limitHolder }, $SPEED_ALERTS->onSpeedometer(Ljava/lang/Object;)V")
        setSpeed.addInstruction(0, "invoke-static/range { p0 .. p1 }, $SPEED_ALERTS->onNativeSpeedInput(Ljava/lang/Object;F)V")
        setLimit.addInstructions(0,"""
            invoke-static/range { p0 .. p2 }, $SPEED_ALERTS->onNativeLimitInput(Ljava/lang/Object;ILjava/lang/Object;)V
            invoke-static/range { p0 .. p2 }, $SPEED_ALERTS->displayedLimit(Ljava/lang/Object;ILjava/lang/Object;)I
            move-result p1
        """)
        val wrapperField = code.firstNotNullOfOrNull { insn ->
            (insn.ref() as? FieldReference)?.takeIf {
                insn.opcode == Opcode.IGET_OBJECT && it.definingClass == setSpeed.definingClass
            }
        } ?: throw PatchException("speed setter wrapper field not found")
        val mph = limitCode.mapNotNull { insn ->
            (insn.ref() as? FieldReference)?.takeIf {
                insn.opcode == Opcode.SGET_OBJECT && it.type == units.type && it.name != kmh.name
            }
        }.distinctBy { it.name }.singleOrNull()
            ?: throw PatchException("the limit setter's accepted mph units constant is not unique")

        // The extension's readers of that speedometer.
        val extension = mutableClassDefBy(SPEED_ALERTS)
        fun replace(name: String, returnType: String, smali: String, parameters: List<String> = listOf("Ljava/lang/Object;")) {
            extension.methods.remove(extension.methods.single { it.name == name })
            extension.methods.add(
                ImmutableMethod(
                    SPEED_ALERTS, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
                    AccessFlags.STATIC.value, null, null, MutableMethodImplementation(parameters.size + 1),
                ).toMutable().apply { addInstructions(0, smali) },
            )
        }
        // The supported APK's own attach listener clears ahvy.e on detach.
        // Repaint only live native widgets; do not keep retired car/phone models active.
        // The attach listener's class is renamed between builds; identify it by the
        // callback field it holds instead of pinning the obfuscated name.
        val preferencesField = mutableClassDefBy(speedometer).fields.singleOrNull { f ->
            f.name == "c" && classDefByOrNull(f.type)?.fields?.any {
                it.name == "e" && it.type == "Ljava/lang/Object;"
            } == true
        } ?: throw PatchException("the speed widget's native attachment binding changed")
        val attachedField = mutableClassDefBy(preferencesField.type).fields.singleOrNull {
            it.name == "e" && it.type == "Ljava/lang/Object;"
        } ?: throw PatchException("the speed widget's native attachment callback changed")
        replace("nativeWidgetAttached","Z","""
            check-cast p0, ${setSpeed.definingClass}
            iget-object v0, p0, $wrapperField
            check-cast v0, $speedometer
            iget-object v0, v0, $preferencesField
            iget-object v0, v0, $attachedField
            if-eqz v0, :detached
            const/4 v0, 0x1
            return v0
            :detached
            const/4 v0, 0x0
            return v0
        """)
        replace("writeNativeSpeed","V","""
            check-cast p0, ${setSpeed.definingClass}
            invoke-virtual/range { p0 .. p1 }, ${setSpeed.definingClass}->${setSpeed.name}(F)V
            return-void
        """,listOf("Ljava/lang/Object;","F"))
        replace("writeNativeLimit","V","""
            check-cast p0, ${setLimit.definingClass}
            check-cast p2, ${units.type}
            invoke-virtual/range { p0 .. p2 }, ${setLimit.definingClass}->${setLimit.name}(I${units.type})V
            return-void
        """,listOf("Ljava/lang/Object;","I","Ljava/lang/Object;"))
        replace(
            "nativeUnits", "I",
            """
                sget-object v0, ${kmh.definingClass}->${kmh.name}:${kmh.type}
                if-eq p1, v0, :kmh
                sget-object v0, ${mph.definingClass}->${mph.name}:${mph.type}
                if-eq p1, v0, :mph
                check-cast p0, ${setSpeed.definingClass}
                iget-object v0, p0, $wrapperField
                check-cast v0, $speedometer
                iget-object v0, v0, $speedometer->${units.name}:${units.type}
                sget-object p0, ${kmh.definingClass}->${kmh.name}:${kmh.type}
                if-eq v0, p0, :kmh
                :mph
                const/4 v0, 0x0
                return v0
                :kmh
                const/4 v0, 0x1
                return v0
            """,
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
        )
        replace(
            "speed", "I",
            """
                check-cast p0, $speedometer
                iget v0, p0, $speedometer->${speedField.name}:I
                return v0
            """,
        )
        replace(
            "limit", "I",
            """
                check-cast p0, $speedometer
                iget v0, p0, $speedometer->${limitField.name}:I
                return v0
            """,
        )
        replace(
            "kmh", "Z",
            """
                check-cast p0, $speedometer
                iget-object v0, p0, $speedometer->${units.name}:${units.type}
                sget-object p0, ${kmh.definingClass}->${kmh.name}:${kmh.type}
                if-ne v0, p0, :not_kmh
                const/4 v0, 0x1
                return v0
                :not_kmh
                const/4 v0, 0x0
                return v0
            """,
        )

        markPatched("speedingChimePatched")
    }
}
