package app.template.patches.mailcom.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.returnEarly

internal const val STRING = "Ljava/lang/String;"

/**
 * The no-arg toString() of a Kotlin data class, found by the stable start of its output
 * ("ClassName(firstField="). The remote-config models are matched this way rather than by
 * class name.
 */
internal fun toStringFingerprint(prefix: String) = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = listOf(),
    filters = listOf(string(prefix, StringComparisonType.STARTS_WITH)),
)

/**
 * Makes each named concrete no-arg boolean getter of this class answer false. Fails loudly,
 * listing the getters it did find, when a name is missing or matches more than once.
 */
internal fun MutableClass.forceGettersFalse(patch: String, names: List<String>) {
    val found = methods.filter { method ->
        method.name in names && method.returnType == "Z" &&
            method.parameterTypes.isEmpty() && method.implementation != null
    }
    val counts = found.groupingBy { it.name }.eachCount()
    val missing = names.filter { counts[it] != 1 }
    if (missing.isNotEmpty()) {
        throw PatchException(
            "$patch: $type needs exactly one concrete ()Z getter for each of $missing; " +
                "found ${found.map { it.name }}",
        )
    }
    found.forEach { it.returnEarly(false) }
}
