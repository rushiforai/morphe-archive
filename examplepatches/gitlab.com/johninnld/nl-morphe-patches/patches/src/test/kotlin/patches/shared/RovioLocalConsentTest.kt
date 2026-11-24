package patches.shared

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.*
import org.junit.Test

class RovioLocalConsentTest {
    @Test fun localOptOutDoesNotDownloadAFormAndCompletesAfterRevokingStoredGrants() {
        val dex = rovioLocalConsentDex().use { DexBackedDexFile.fromInputStream(Opcodes.forApi(29), it) }
        val owner = dex.classes.single()
        val methods = owner.methods.associateBy { it.name }
        val run = methods.getValue("run").implementation!!.instructions.toList()
        val calls = run.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() }
        assertTrue(calls.none { it.contains("/ump/") || it.contains("http", ignoreCase = true) })
        assertTrue(calls.indexOfLast { it.contains("->apply()V") } < calls.indexOfLast { it.contains("->onSuccess(I)V") })
        assertEquals(1, calls.count { it.contains("->onSuccess(I)V") })
        assertTrue(calls.any { it.contains("Ljava/lang/String;->replace(CC)") })
        val strings = run.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        for (key in listOf("PurposeConsents", "PurposeLegitimateInterests", "VendorConsents",
            "VendorLegitimateInterests", "SpecialFeaturesOptIns", "PublisherConsent",
            "PublisherLegitimateInterests", "PublisherCustomPurposesConsents",
            "PublisherCustomPurposesLegitimateInterests", "TCString", "AddtlConsent", "UserConsentRecordId")) {
            assertTrue("Missing revocation: $key", "IABTCF_$key" in strings)
        }
        assertFalse("Geographic applicability must not be falsified", "IABTCF_gdprApplies" in strings)
        val dispatch = methods.getValue("complete").implementation!!.instructions
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() }
        assertTrue(dispatch.any { it.contains("Globals;->runOnUiThread(Ljava/lang/Runnable;)V") })
    }
}
