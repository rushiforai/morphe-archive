package app.template.patches.shared

import app.morphe.patcher.patch.Patch
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Enforces the user-facing description contract: one short sentence plus a build line derived
 * from the same exact compatibility list the patch declares.
 */
internal fun assertPatchDescriptionContract(patch: Patch<*>) {
    val description = patch.description
    requireNotNull(description) { "${patch.name}: missing description" }
    // Two accepted forms: version-grouped ("2.0.24 (5002395, 5002527)") or, when that exceeds the
    // build-line budget, the exact code-only list ("5001712, 5001812, ..."). Both feed the same
    // code-set equality check below.
    val buildLine = Regex("""\bBuilds?: ((?:(?:\S+\s+)?(?:\d+\.\d+\.\d+(?:/\d+| \([^)]*\))(?:, )?)+)|(?:\d{4,}(?:, \d{4,})*))\.(?: |$)""")
        .find(description)
    requireNotNull(buildLine) { "${patch.name}: missing Builds line in: $description" }
    val expected = patch.compatibility.orEmpty()
        .flatMap { compatibility -> compatibility.targets }
        .flatMap { target -> target.versionCodes.orEmpty().values }
        .toSet()
    val actual = Regex("""\b\d{4,}\b""").findAll(buildLine.groupValues[1])
        .map { it.value.toInt() }
        .toSet()
    assertEquals(expected, actual, "${patch.name}: Builds line drifted from compatibleWith")
    val sentence = description.substringBefore(buildLine.value).trim()
    assertTrue(sentence.length <= 150, "${patch.name}: description sentence is ${sentence.length} chars")
    assertTrue(buildLine.value.length <= 100, "${patch.name}: build line is ${buildLine.value.length} chars")
}
