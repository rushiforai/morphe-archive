package app.hushmessenger.patches.coexist

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class InstallBesideMetaAppsPatchTest {
    private val appCommunication = "com.facebook.permission.prod.FB_APP_COMMUNICATION"
    private val receiverAccess = "com.facebook.receiver.permission.ACCESS"
    private val renamedCommunication = "app.hushfacebook.permission.prod.FB_APP_COMMUNICATION"
    private val renamedReceiver = "app.hushfacebook.receiver.permission.ACCESS"

    @Test
    fun acceptsBothCheckedVersionCodes() {
        validateVersionCode("346013387")
        validateVersionCode("346013440")
    }

    @Test
    fun rejectsAnotherBuildWithTheSameVersionName() {
        val failure = assertFailsWith<PatchException> { validateVersionCode("346013438") }
        assertContains(failure.message.orEmpty(), "version code 346013438 is not supported")
        assertActionable(failure)
    }

    private fun assertActionable(failure: PatchException) {
        assertContains(failure.message.orEmpty(), "Use an unmodified arm64 Messenger 580.0.0.49.91 APK")
        assertContains(failure.message.orEmpty(), "version code 346013387 or 346013440")
    }

    private fun manifest(): Document {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
        val root = document.createElement("manifest")
        document.appendChild(root)
        fun add(tag: String, attribute: String, value: String) {
            root.appendChild(document.createElement(tag).apply {
                setAttribute("android:$attribute", value)
                if (tag == "permission") setAttribute("android:protectionLevel", "signature")
            })
        }
        fun addGuards(permission: String) {
            for ((tag, owners) in expectedGuardOwners.getValue(permission)) {
                for (owner in owners) {
                    root.appendChild(document.createElement(tag).apply {
                        setAttribute("android:name", owner)
                        setAttribute("android:permission", permission)
                    })
                }
            }
        }
        add("permission", "name", appCommunication)
        add("uses-permission", "name", appCommunication)
        addGuards(appCommunication)
        add("permission", "name", receiverAccess)
        add("uses-permission", "name", receiverAccess)
        addGuards(receiverAccess)
        return document
    }

    private fun values(document: Document): List<String> {
        val elements = document.getElementsByTagName("*")
        return (0 until elements.length).flatMap { index ->
            val attributes = elements.item(index).attributes
            (0 until attributes.length).map { attributes.item(it).nodeValue }
        }
    }

    @Test
    fun rejectsWeakenedOrChangedProtectionBeforeRenamingAnySite() {
        for (level in listOf("", "normal", "dangerous", "signature|privileged", "0", "1", "0x12", "malformed")) {
            val document = manifest()
            val declarations = document.getElementsByTagName("permission")
            for (i in 0 until declarations.length) {
                (declarations.item(i) as Element).setAttribute("android:protectionLevel", "signature")
            }
            (declarations.item(1) as Element).setAttribute("android:protectionLevel", level)
            val before = values(document)

            val failure = assertFailsWith<PatchException>("Accepted protection level '$level'") {
                document.renameSharedPermissions()
            }

            assertContains(failure.message.orEmpty(), "protection level")
            assertActionable(failure)
            assertEquals(before, values(document))
        }
    }

    @Test
    fun acceptsEquivalentSignatureEncodingsWithoutChangingTheirFlags() {
        for (level in listOf("signature", "2", "0x2", "0x00000002", "0X00000002")) {
            val document = manifest()
            val declarations = document.getElementsByTagName("permission")
            for (i in 0 until declarations.length) {
                (declarations.item(i) as Element).setAttribute("android:protectionLevel", level)
            }
            document.renameSharedPermissions()
            for (i in 0 until declarations.length) {
                assertEquals(level, (declarations.item(i) as Element).getAttribute("android:protectionLevel"))
            }
        }
    }

    @Test
    fun renamesEveryPermissionSiteInTheSupportedManifest() {
        val document = manifest()

        document.renameSharedPermissions()

        val names = values(document)
        assertEquals(26, names.count { it == renamedCommunication })
        assertEquals(3, names.count { it == renamedReceiver })
        assertEquals(0, names.count { it == appCommunication || it == receiverAccess })
    }

    @Test
    fun rejectsAChangedManifestBeforeRenamingAnySite() {
        val document = manifest()
        (document.getElementsByTagName("activity").item(0) as Element).removeAttribute("android:permission")

        val failure = assertFailsWith<PatchException> { document.renameSharedPermissions() }

        assertContains(failure.message.orEmpty(), "expected 26 manifest uses")
        assertActionable(failure)
        assertEquals(25, values(document).count { it == appCommunication })
        assertEquals(0, values(document).count { it == renamedCommunication })
    }

    @Test
    fun rejectsAReassignedGuardEvenWhenTheTotalIsUnchanged() {
        val document = manifest()
        (document.getElementsByTagName("activity").item(0) as Element).removeAttribute("android:permission")
        document.documentElement.appendChild(document.createElement("meta-data").apply {
            setAttribute("android:value", appCommunication)
        })

        val failure = assertFailsWith<PatchException> { document.renameSharedPermissions() }

        assertContains(failure.message.orEmpty(), "manifest roles")
        assertActionable(failure)
        assertEquals(26, values(document).count { it == appCommunication })
        assertEquals(0, values(document).count { it == renamedCommunication })
    }

    @Test
    fun rejectsAReassignedGuardOnAnotherReceiver() {
        val document = manifest()
        (document.getElementsByTagName("receiver").item(0) as Element).removeAttribute("android:permission")
        document.documentElement.appendChild(document.createElement("receiver").apply {
            setAttribute("android:name", "com.facebook.messaging.UncheckedReceiver")
            setAttribute("android:permission", appCommunication)
        })

        val failure = assertFailsWith<PatchException> { document.renameSharedPermissions() }

        assertContains(failure.message.orEmpty(), "component guards")
        assertActionable(failure)
        assertEquals(26, values(document).count { it == appCommunication })
        assertEquals(0, values(document).count { it == renamedCommunication })
    }

    @Test
    fun rejectsASecondPermissionDeclaration() {
        val document = manifest()
        val duplicate = document.createElement("permission")
        duplicate.setAttribute("android:name", appCommunication)
        document.documentElement.appendChild(duplicate)

        val failure = assertFailsWith<PatchException> { document.renameSharedPermissions() }

        assertContains(failure.message.orEmpty(), "must declare $appCommunication exactly once")
        assertActionable(failure)
        assertEquals(0, values(document).count { it == renamedCommunication })
    }

    @Test
    fun rejectsAnAlreadyRenamedManifestWithRecoveryGuidance() {
        val document = manifest()
        (document.getElementsByTagName("permission").item(0) as Element)
            .setAttribute("android:name", renamedCommunication)

        val failure = assertFailsWith<PatchException> { document.renameSharedPermissions() }

        assertContains(failure.message.orEmpty(), "already in the manifest")
        assertActionable(failure)
        assertEquals(25, values(document).count { it == appCommunication })
    }
}
