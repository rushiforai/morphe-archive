package app.template.patches.smartlauncher.misc.promotions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTLAUNCHER
import app.template.patches.smartlauncher.misc.signature.spoofSignaturePatch
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val STRING = "Ljava/lang/String;"

// Remote-config property -> its type. The paywall and "leaving premium" properties are not here.
internal val PROMOTION_PROPERTIES = mapOf(
    "isRatingActivityEnabled" to "Z",
    "isScheduledPromoEnabled" to "Z",
    "isSeasonalPromoEnabled" to "Z",
    "showSurveyTip" to "Z",
    "enableProBanner" to "Z",
    // The reader skips parsing when the schedule is empty (it clears its list first).
    "periodicPromoSchedule" to STRING,
)

private val LABEL = Regex(""", (\w+)=(null)?""")
private val PREFIX = Regex("""\((\w+)=""")

/**
 * Names the data class's properties from its toString (prefix, then ", name=" labels; hard-coded
 * "name=null" entries are not fields) and pairs them with the constructor parameters in order.
 * Returns property name -> (p-register, type). Checks the counts and the types line up.
 */
internal fun configParameterRegisters(toString: Method, constructor: Method): Map<String, Pair<Int, String>> {
    val instructions = toString.implementation!!.instructions.toList()
    val names = mutableListOf<String>()
    instructions.forEach { instruction ->
        val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ?: return@forEach
        if (names.isEmpty()) {
            PREFIX.find(text)?.let { names += it.groupValues[1] }
        } else {
            LABEL.findAll(text).filter { it.groupValues[2].isEmpty() }.forEach { names += it.groupValues[1] }
        }
    }
    val fieldTypes = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .filter { it.definingClass == toString.definingClass }
        .distinctBy { it.name }.map { it.type }
    val parameters = constructor.parameterTypes.map(CharSequence::toString)
    if (names.size != fieldTypes.size || fieldTypes != parameters) {
        throw PatchException(
            "Hide promotions: toString names (${names.size}) do not line up with the constructor " +
                "(${parameters.size} parameters, ${fieldTypes.size} fields)"
        )
    }

    var register = 1 // p0 is this
    return names.indices.associate { index ->
        val type = parameters[index]
        names[index] to (register to type).also { register += if (type == "J" || type == "D") 2 else 1 }
    }
}

/**
 * The config object carries the promotion switches from the default and the fetched config
 * alike, built by its single constructor. At the start of that constructor the rating prompt,
 * scheduled and seasonal promos, survey tip and Pro banner parameters are overwritten with
 * false, and the periodic promo schedule with an empty string.
 */
@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Hides promo banners, rating and survey prompts.",
) {
    compatibleWith(COMPATIBILITY_SMARTLAUNCHER)

    // The app exits at start when its signature is not the original one.
    dependsOn(spoofSignaturePatch)

    execute {
        val toString = ConfigToStringFingerprint.method
        val config = ConfigToStringFingerprint.classDef
        val constructor = config.methods.singleOrNull { it.name == "<init>" && it.implementation != null }
            ?: throw PatchException("Hide promotions: ${config.type} must have exactly one constructor")

        val registers = configParameterRegisters(toString, constructor)
        val code = PROMOTION_PROPERTIES.map { (name, expectedType) ->
            val (register, type) = registers[name]
                ?: throw PatchException("Hide promotions: property $name missing from ${config.type}")
            if (type != expectedType) throw PatchException("Hide promotions: $name is $type, expected $expectedType")
            // const/16 and const-string take an 8-bit register, so a high p-register is safe.
            if (type == STRING) "const-string p$register, \"\"" else "const/16 p$register, 0x0"
        }

        constructor.addInstructionsChecked(0, code.joinToString("\n"))
    }
}
