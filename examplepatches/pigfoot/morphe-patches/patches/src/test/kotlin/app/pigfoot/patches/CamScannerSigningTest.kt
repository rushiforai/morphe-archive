package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import org.junit.Assert.*
import org.junit.Test

class CamScannerSigningTest {
    @Test fun transformationIsMinimalNonMutatingAndRejectsRepeatedOrTamperedInput() {
        val input = byteArrayOf(9, 2, 3, 4, 5, 8)
        val spec = SigningEdit(sha256(input), 2, byteArrayOf(3, 4), byteArrayOf(0, 0))
        val result = editSigning(input, spec)
        assertArrayEquals(byteArrayOf(9, 2, 0, 0, 5, 8), result)
        assertArrayEquals(byteArrayOf(9, 2, 3, 4, 5, 8), input)
        assertThrows(IllegalArgumentException::class.java) { editSigning(result, spec) }
        assertThrows(IllegalArgumentException::class.java) { editSigning(input.copyOf().also { it[0] = 0 }, spec) }
        for (bad in listOf(spec.copy(offset = -1), spec.copy(offset = 99),
            spec.copy(before = byteArrayOf()), spec.copy(after = byteArrayOf(0)),
            spec.copy(before = byteArrayOf(0, 0)))) {
            assertThrows(IllegalArgumentException::class.java) { editSigning(input, bad) }
        }
    }

    @Test fun onlyTwoQualifiedNativeSigningGatesAreSelectable() {
        assertEquals(setOf("lib/arm64-v8a/libnative-encrypt.so", "lib/armeabi/libnative-encrypt.so"), signingEdits.keys)
        assertEquals(4, signingEdits.getValue("lib/arm64-v8a/libnative-encrypt.so").after.size)
        assertEquals(2, signingEdits.getValue("lib/armeabi/libnative-encrypt.so").after.size)
        assertFalse(signingEdits.containsKey("lib/x86/libnative-encrypt.so"))
    }

    @Test fun signingDoesNotEnableLegacyRouteSubstitutionOrOfflineMode() {
        assertTrue(camscannerSigningPatch.default)
        assertTrue(camscannerSigningPatch.dependencies.contains(camscannerSideloadStartupPatch))
        assertTrue(camscannerSigningPatch.dependencies.contains(camscannerPolicyExtensionPatch))
        assertFalse(camscannerSigningPatch.dependencies.contains(camscannerOfflinePatch))
    }

    @Test fun supportedReSignedInstallsRequireSigningWithoutQualifyingRootMount() {
        for (installer in listOf(InstallerType.STANDARD, InstallerType.SHIZUKU)) {
            assertEquals(PatchAvailability.REQUIRED,
                camscannerSigningPatch.availability!!.resolve(installer, ApkArchitecture.ARM64_V8A))
        }
        assertEquals(PatchAvailability.UNAVAILABLE,
            camscannerSigningPatch.availability!!.resolve(InstallerType.MOUNT, ApkArchitecture.ARM64_V8A))
        assertTrue(camscannerOfflinePatch.dependencies.contains(camscannerSigningPatch))
    }
}
