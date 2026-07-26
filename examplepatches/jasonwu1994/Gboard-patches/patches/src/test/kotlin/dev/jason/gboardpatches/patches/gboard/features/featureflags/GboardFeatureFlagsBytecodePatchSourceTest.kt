package dev.jason.gboardpatches.patches.gboard.features.featureflags

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardFeatureFlagsBytecodePatchSourceTest {
    @Test
    fun `shared flag override runs only at object return sites`() {
        val source = readPatchSource()
        val utilitySource = readUtilitySource()

        assertTrue(source.contains("mutableMethod.applyFeatureFlagValueOverride()"))
        assertTrue(source.contains("internal fun MutableMethod.applyFeatureFlagValueOverride()"))
        assertTrue(source.contains("injectFeatureFlagReturnOverrides("))
        assertTrue(source.contains("delegateTemplate = FEATURE_FLAG_VALUE_DELEGATE_TEMPLATE"))
        assertFalse(source.contains("::buildFeatureFlagValueDelegate"))
        assertTrue(utilitySource.contains("returnInstructionIndices()"))
        assertTrue(utilitySource.contains("RETURN_OBJECT"))
        assertTrue(utilitySource.contains("check(returnIndices.isNotEmpty())"))
        assertTrue(utilitySource.contains("resultRegister.toString()"))
        assertFalse(utilitySource.contains("enum class FeatureFlagOverrideShape"))
        assertTrue(utilitySource.contains("FEATURE_FLAG_OVERRIDE_SHAPE_SHARED"))
        assertTrue(utilitySource.contains("FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS"))
        assertFalse(source.contains("addInstructions(0, FEATURE_FLAG_OVERRIDE_DELEGATE)"))
        assertFalse(source.contains("shouldForceFlagTrue"))
        assertFalse(source.contains("return-object"))
    }

    @Test
    fun `shared flag override uses the dynamic result register after preserving receiver`() {
        val source = readPatchSource()
        val utilitySource = readUtilitySource()

        assertTrue(utilitySource.contains("OneRegisterInstruction"))
        assertTrue(
            utilitySource.contains("ensureFeatureFlagReceiverPreserved(insertIfMissing ="),
        )
        assertTrue(utilitySource.contains("delegateTemplate.replace(RESULT_REGISTER_TOKEN"))
        assertTrue(
            utilitySource.contains("RETURN_OBJECT at \$returnIndex does not expose registerA"),
        )
        assertTrue(
            source.contains(
                "applyOverriddenFlagValue(Ljava/lang/String;Ljava/lang/Object;)" +
                    "Ljava/lang/Object;",
            ),
        )
        assertTrue(source.contains("move-result-object v\$RESULT_REGISTER_TOKEN"))
        assertFalse(source.contains("flag_factory"))
        assertFalse(source.contains("Lmky;"))
        assertFalse(source.contains("17.0.10"))
    }

    private fun readPatchSource(): String = String(
        Files.readAllBytes(
            Path.of(
                "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                    "featureflags/GboardFeatureFlagsBytecodePatch.kt",
            ),
        ),
        StandardCharsets.UTF_8,
    )

    private fun readUtilitySource(): String = String(
        Files.readAllBytes(
            Path.of(
                "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                    "featureflags/GboardFeatureFlagOverrideUtils.kt",
            ),
        ),
        StandardCharsets.UTF_8,
    )
}
