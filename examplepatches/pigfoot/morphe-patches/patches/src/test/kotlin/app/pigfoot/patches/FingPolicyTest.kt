package app.pigfoot.patches

import app.pigfoot.patches.fing.*
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.SupportedAbi
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.debug.ImmutableLineNumber
import com.android.tools.smali.dexlib2.immutable.instruction.*
import org.junit.Assert.*
import org.junit.Test
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory

class FingPolicyTest {
    @Test fun exactTargetAndIndependentSelectionDoNotChangeExistingApps() {
        val patches = listOf(fingLocalPremiumPatch, fingTelemetryPatch)
        assertEquals(setOf("Fing local premium features", "Fing reduce telemetry"), patches.map { it.name }.toSet())
        for (patch in patches) {
            assertTrue(patch.default)
            assertTrue(patch.dependencies.contains(fingInputPatch))
            assertFalse(patch.dependencies.contains(patches.single { it != patch }))
            val pkg = patch.compatibility!!.single()
            assertEquals(FING_PACKAGE, pkg.packageName)
            assertEquals(ApkFileType.APKM, pkg.apkFileType)
            val target = pkg.targets.single()
            assertEquals(FING_VERSION, target.version)
            assertEquals(28, target.minSdk)
            assertFalse(target.isExperimental)
            assertEquals(mapOf(SupportedAbi.ARM64_V8A to FING_CODE, SupportedAbi.ARMEABI_V7A to FING_CODE
                ), target.versionCodes)
        }
        assertNull(fingInputPatch.name)
    }

    @Test fun versionBuildAndDonorPolicyBoundariesStayNarrow() {
        requireFingVersion("12.13.5", "121305003")
        for ((name, code) in listOf("12.13.5" to "121305004", "12.13.4" to "121304001", "12.12.0" to "121200001"))
            assertThrows(IllegalArgumentException::class.java) { requireFingVersion(name, code) }
        assertEquals(9, fingClassPins.size)
        assertTrue(fingClassPins.values.all { it.matches(Regex("[a-f0-9]{64}")) })
        assertEquals(setOf("Lak/a;", "Lqm/o;"), fingPremiumPolicy.map { it.owner }.toSet())
        assertEquals(5, fingTelemetryPolicy.size)
        assertFalse(fingClassPins.keys.any { it == "Lzc/e;" || it == "Lcom/PinkiePie;" })
    }

    private fun original(policy: FingMethodPolicy, owner: String = policy.owner, withBody: Boolean = true): ImmutableMethod {
        val params = if (policy.descriptor.startsWith("(I)"))
            listOf(ImmutableMethodParameter("I", emptySet(), "capability")) else emptyList()
        return ImmutableMethod(owner, policy.name, params, policy.descriptor.substringAfter(")"), 1,
            setOf(ImmutableAnnotation(1, "Ltest/Kept;", emptyList())), emptySet(),
            if (!withBody) null else ImmutableMethodImplementation(3, listOf(
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN, 0),
                ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0), ImmutableInstruction11x(Opcode.THROW, 0)
            ), listOf(ImmutableTryBlock(0, 1, listOf(ImmutableExceptionHandler("Ljava/lang/Throwable;", 2)))),
                listOf(ImmutableLineNumber(0, 123))))
    }

    @Test fun replacementsPreserveMethodMetadataAndDiscardOldBranchesHandlersAndDebug() {
        val policy = fingPremiumPolicy.first()
        val before = original(policy)
        val after = fingMethodReplacement(before, policy)
        assertEquals(before.definingClass, after.definingClass)
        assertEquals(before.name, after.name)
        assertEquals(before.parameters, after.parameters)
        assertEquals(before.accessFlags, after.accessFlags)
        assertEquals(before.annotations, after.annotations)
        assertEquals(before.hiddenApiRestrictions, after.hiddenApiRestrictions)
        val impl = after.implementation!!
        assertEquals(3, impl.registerCount)
        assertTrue(impl.tryBlocks.isEmpty())
        assertFalse(impl.debugItems.iterator().hasNext())
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), impl.instructions.map { it.opcode })
        assertEquals(1, (impl.instructions.first() as ImmutableInstruction11n).narrowLiteral)
        assertEquals(0, (impl.instructions.last() as ImmutableInstruction11x).registerA)
        assertThrows(IllegalArgumentException::class.java) { fingMethodReplacement(original(policy, "Lother;"), policy) }
        assertThrows(IllegalArgumentException::class.java) { fingMethodReplacement(original(policy, withBody = false), policy) }
    }

    @Test fun premiumUsesWholeFeatureEntryAndVerifiedTierInsteadOfCollectionPredicate() {
        assertEquals(setOf("Lak/a;->h(I)Z", "Lak/a;->d()Lik/o;", "Lqm/o;->e()Z"),
            fingPremiumPolicy.map { it.owner + "->" + it.name + it.descriptor }.toSet())
        assertFalse(fingPremiumPolicy.any { it.name == "test" || it.owner.contains("ServiceActivity") })
        val policy = fingPremiumPolicy.single { it.enumOwner != null }
        val result = fingMethodReplacement(original(policy), policy)
        val code = result.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT), code.map { it.opcode })
        val ref = (code.first() as ImmutableInstruction21c).reference.toString()
        assertEquals("Lik/o;->c:Lik/o;", ref)
        assertTrue(result.implementation!!.tryBlocks.isEmpty())
        assertThrows(IllegalArgumentException::class.java) {
            fingMethodReplacement(original(policy), policy.copy(enumOwner = "Lwrong;"))
        }
        assertThrows(IllegalArgumentException::class.java) {
            fingMethodReplacement(original(policy), policy.copy(enumField = null))
        }
    }

    @Test fun privacyFalseAndVoidBodiesHaveNoNewNetworkOrHelperCalls() {
        val falsePolicy = fingTelemetryPolicy.single { it.owner == "Lap/l;" }
        val result = fingMethodReplacement(original(falsePolicy), falsePolicy)
        assertEquals(0, (result.implementation!!.instructions.first() as ImmutableInstruction11n).narrowLiteral)
        val voidPolicy = fingTelemetryPolicy.single { it.value == null }
        val method = ImmutableMethod(voidPolicy.owner, voidPolicy.name,
            listOf(ImmutableMethodParameter("Z", emptySet(), null)), "V", 1, emptySet(), emptySet(),
            ImmutableMethodImplementation(3, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()))
        val impl = fingMethodReplacement(method, voidPolicy).implementation!!
        assertEquals(listOf(Opcode.RETURN_VOID), impl.instructions.map { it.opcode })
    }

    private fun document(xml: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))

    @Test fun manifestPolicyKeepsNetworkPushBillingMapsAndSdkWhileRemovingOnlyAllowlistedEntries() {
        val doc = document("""<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.overlook.android.fing">
            <uses-sdk android:minSdkVersion="32"/><uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
            <application android:label="Fing"><service android:name="com.overlook.android.fing.ui.notifications.FirebaseNotificationService"/>
            <service android:name="com.google.android.gms.measurement.AppMeasurementService"/>
            <activity android:name="com.android.billingclient.api.ProxyBillingActivity"/>
            <meta-data android:name="com.google.android.geo.API_KEY" android:value="original-map-key"/>
            <meta-data android:name="firebase_analytics_collection_enabled" android:resource="@bool/old"/>
            </application></manifest>""")
        applyFingManifestPolicy(doc)
        applyFingManifestPolicy(doc)
        val names = doc.getElementsByTagName("*").let { ns -> (0 until ns.length).map {
            (ns.item(it) as org.w3c.dom.Element).getAttribute("android:name") } }
        assertTrue(names.containsAll(listOf("android.permission.INTERNET", "android.permission.ACCESS_FINE_LOCATION",
            "com.overlook.android.fing.ui.notifications.FirebaseNotificationService", "com.android.billingclient.api.ProxyBillingActivity")))
        assertFalse(names.contains("com.google.android.gms.permission.AD_ID"))
        assertFalse(names.contains("com.google.android.gms.measurement.AppMeasurementService"))
        assertEquals("32", (doc.getElementsByTagName("uses-sdk").item(0) as org.w3c.dom.Element).getAttribute("android:minSdkVersion"))
        val meta = doc.getElementsByTagName("meta-data").let { ns -> (0 until ns.length).map { ns.item(it) as org.w3c.dom.Element } }
        assertEquals("original-map-key", meta.single { it.getAttribute("android:name") == "com.google.android.geo.API_KEY" }.getAttribute("android:value"))
        for ((key, value) in fingTelemetryMetadata) {
            val node = meta.single { it.getAttribute("android:name") == key }
            assertEquals(value, node.getAttribute("android:value"))
            assertFalse(node.hasAttribute("android:resource"))
        }
        assertFalse(names.contains("firebase_messaging_auto_init_enabled"))
    }

    @Test fun duplicatePrivacyMetadataFailsBeforeAnyManifestWrite() {
        val doc = document("""<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
            <meta-data android:name="firebase_sessions_enabled" android:value="true"/>
            <meta-data android:name="firebase_sessions_enabled" android:value="true"/>
            </application></manifest>""")
        assertThrows(IllegalArgumentException::class.java) { applyFingManifestPolicy(doc) }
        assertEquals(2, doc.getElementsByTagName("meta-data").length)
    }
}
