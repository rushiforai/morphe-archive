package semicoloncolonel.mobilestream.patches.truthsocial.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

// Truth Social 1.28.3. The app's JSON models are Kotlin classes whose
// constructor parameters carry their JSON names. overrideJsonValues sets
// chosen parameters at the start of a model's constructor, so the app sees
// the new value wherever it reads the model. Each parameter is found by its
// JSON name, so the order of the parameters does not matter.
//
// The server sends a list of features for the account (/api/v1/features),
// such as "predictions", "gems_enabled", and "watch_tab". The app hides each
// feature that is off. turnOffTruthFeatures sets chosen features to off.
internal object FeaturesConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/truthsocial/core/data/models/Features;",
    name = "<init>",
    custom = { method, _ -> method.parameterTypes.lastOrNull()?.toString() == "Ljava/util/Map;" },
)

// The model constructor with the most parameters: Kotlin's primary one.
// The synthetic defaults constructor and copy() both call it.
internal fun BytecodePatchContext.modelConstructor(type: String): MutableMethod =
    mutableClassDefBy(type).methods
        .filter { it.name == "<init>" && it.parameters.any { p -> p.annotations.isNotEmpty() } }
        .maxByOrNull { it.parameterTypes.size }
        ?: throw PatchException("No JSON constructor in $type")

internal fun MutableMethod.overrideJsonValues(values: Map<String, Any>) {
    val jsonNames = parameters.map { parameter ->
        parameter.annotations.firstNotNullOfOrNull { annotation ->
            (annotation.elements.firstOrNull { it.name == "name" }?.value as? StringEncodedValue)?.value
        }
    }
    // p0 is the object; long and double parameters take two registers.
    val registers = mutableListOf<Int>()
    var next = 1
    parameterTypes.forEach { type ->
        registers += next
        next += if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }
    val code = values.entries.joinToString("\n") { (name, value) ->
        val index = jsonNames.indexOf(name)
        if (index < 0) throw PatchException("JSON value \"$name\" not found in $definingClass")
        val register = "p${registers[index]}"
        when (val type = parameterTypes[index].toString()) {
            "Z" -> "const/16 $register, ${if (value == true) "0x1" else "0x0"}"
            "I" -> "const $register, ${value as Int}"
            "Ljava/lang/Boolean;" ->
                "sget-object $register, Ljava/lang/Boolean;->${if (value == true) "TRUE" else "FALSE"}:Ljava/lang/Boolean;"
            else -> throw PatchException("JSON value \"$name\" has unsupported type $type")
        }
    }
    addInstructions(0, code)
}

internal fun BytecodePatchContext.turnOffTruthFeatures(vararg names: String) =
    FeaturesConstructorFingerprint.method.overrideJsonValues(names.associateWith { false })
