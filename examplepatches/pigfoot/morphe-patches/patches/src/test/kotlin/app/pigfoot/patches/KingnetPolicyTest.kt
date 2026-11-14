package app.pigfoot.patches

import app.pigfoot.patches.kingnet.*
import org.junit.Assert.*
import org.junit.Test

class KingnetPolicyTest {
    private fun fixture() = javaClass.getResourceAsStream("/kingnet/policy-fixture.js")!!.use { it.readBytes() }

    @Test fun onlyTheQualifiedPackageVersionAndBuildAreEligible() {
        requireKingnetTarget(KINGNET_PACKAGE, KINGNET_VERSION, KINGNET_CODE)
        for ((pkg, version, code) in listOf(Triple("other", KINGNET_VERSION, KINGNET_CODE),
            Triple(KINGNET_PACKAGE, "4.20.7", KINGNET_CODE), Triple(KINGNET_PACKAGE, KINGNET_VERSION, "420079"),
            Triple(KINGNET_PACKAGE, KINGNET_VERSION, null))) {
            assertThrows(IllegalArgumentException::class.java) { requireKingnetTarget(pkg, version, code) }
        }
    }

    @Test fun assetPinRejectsAnythingButTheOriginalFile() {
        assertThrows(IllegalArgumentException::class.java) { requireKingnetAsset(fixture()) }
        assertThrows(IllegalArgumentException::class.java) { requireKingnetAsset(byteArrayOf()) }
    }

    @Test fun fourExactSitesChangeAndEverythingElseRoundtrips() {
        val original = fixture()
        val result = patchKingnetJavaScript(original).toString(Charsets.UTF_8)
        var inverse = result
        for (edit in kingnetEdits) {
            assertEquals(edit.label, 1, Regex(Regex.escape(edit.after)).findAll(result).count())
            inverse = inverse.replace(edit.after, edit.before)
        }
        assertArrayEquals(original, inverse.toByteArray())
        assertEquals(4, kingnetEdits.size)
    }

    @Test fun adRequestStillResolvesButNeverCommitsAdData() {
        val result = patchKingnetJavaScript(fixture()).toString(Charsets.UTF_8)
        assertFalse(result.contains("1===e.data.Status&&(d.a.commit(\"advertising/setAdStorage\""))
        assertFalse(result.contains("1===e.data.Status&&(v.a.commit(\"advertising/setAdStorage\""))
        assertEquals(2, Regex(Regex.escape("!1&&(")).findAll(result).count())
        assertEquals(2, Regex(Regex.escape(".a.commit(\"advertising/setAdSetting\",e.data.Data.Settings)),t(e)")).findAll(result).count())
    }

    @Test fun marketingServiceAndReminderOnlyLoseTheirActiveCode() {
        val result = patchKingnetJavaScript(fixture()).toString(Charsets.UTF_8)
        assertTrue(result.contains("case 0:return t.abrupt(\"return\",void 0);case 1:return MobileMessaging.init({applicationCode:"))
        assertTrue(result.contains("cancelAll((function(){return;var e=this"))
        // FCM push registration and handling are untouched.
        val original = fixture().toString(Charsets.UTF_8)
        assertEquals(Regex("PushNotification").findAll(original).count(), Regex("PushNotification").findAll(result).count())
    }

    @Test fun missingAmbiguousAndAlreadyModifiedSitesRejectWithoutChangingInput() {
        val original = fixture().toString(Charsets.UTF_8)
        for (edit in kingnetEdits) for (bad in listOf(original.replace(edit.before, "changed"), original + edit.before)) {
            val bytes = bad.toByteArray();val before = bytes.copyOf()
            assertThrows(edit.label, IllegalArgumentException::class.java) { patchKingnetJavaScript(bytes) }
            assertArrayEquals(before, bytes)
        }
        val patched = patchKingnetJavaScript(original.toByteArray())
        assertThrows(IllegalArgumentException::class.java) { patchKingnetJavaScript(patched) }
    }

    @Test fun malformedUtf8IsNotSilentlyReencoded() {
        assertThrows(java.nio.charset.CharacterCodingException::class.java) {
            patchKingnetJavaScript(fixture() + byteArrayOf(0xc3.toByte(), 0x28))
        }
    }
}
