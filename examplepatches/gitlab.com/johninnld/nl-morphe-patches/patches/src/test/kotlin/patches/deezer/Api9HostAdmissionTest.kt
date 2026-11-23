package patches.deezer

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Test

class Api9HostAdmissionTest {
    @Test fun compiledCarServiceAdmitsAllHostsWithoutCertificateConfiguration() {
        val extension = api9Extension()
        val dex = DexBackedDexFile.fromInputStream(null, extension.bytes.inputStream())
        val service = dex.classes.single { it.type == "Lnl/johninnl/deezer/auto/DeezerCarAppService;" }
        val validator = service.methods.single { it.name == "createHostValidator" }
        val references = validator.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(references.any { it.contains("HostValidator;->ALLOW_ALL_HOSTS_VALIDATOR:") })
        assertFalse(references.any { it.contains("addAllowedHosts") || it.contains("getIdentifier") })
        assertEquals("Allow any Android Auto host", deezerCustomAndroidAutoHosts.name)
        assertTrue(deezerCustomAndroidAutoHosts in deezerApi9Media.dependencies)
    }
}
