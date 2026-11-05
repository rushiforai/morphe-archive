import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "net.dinglisch.android.taskerm"
private const val LICENSE_STATUS = "Lcom/joaomgcd/taskerm/licensing/LicenseStatus;"
private const val CONTEXT = "Landroid/content/Context;"

private fun Method.strings(): List<String> = instructions().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}

private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

private fun Method.hasFlags(vararg flags: AccessFlags): Boolean =
    accessFlags == flags.fold(0) { acc, flag -> acc or flag.value }

class TaskerSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Full Version forces Licensed and GmsCore support moves only sign-in to MicroG RE`() {
        val root = repoRoot()
        val apk = File(root, "apks/tasker/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.7.8",
            patchNames = setOf("Enable Full Version", "GmsCore support"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. Response mapper: found by its constructor's status labels, like the patch.
        val statusClass = classes.firstOrNull { cls ->
            cls.methods.any {
                it.name == "<init>" && it.params() == listOf("I") &&
                    it.strings().containsAll(listOf("Licensed", "Retrying", "Unlicensed"))
            }
        } ?: error("LicenseStatus response mapper not found in emitted dexes")
        val statusGetters = statusClass.methods.filter {
            it.returnType == LICENSE_STATUS && it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertTrue(statusGetters.isNotEmpty(), "${statusClass.type} has no LicenseStatus getter")
        statusGetters.forEach {
            assertReturnsLicensedEnum(it, label = "${statusClass.type}.${it.name}()")
        }

        // 2. Licence manager: found by the "Checking cached only" log line.
        var licenseManager: ClassDef? = null
        val cached = classes.firstNotNullOfOrNull { cls ->
            cls.methods.firstOrNull {
                it.returnType == "Z" && it.params() == listOf(CONTEXT, "J") &&
                    it.strings().any { s -> s.startsWith("Checking cached only") }
            }?.also { licenseManager = cls }
        } ?: error("cached licence check not found in emitted dexes")
        val manager = licenseManager!!
        assertForcedBoolean(cached, expected = true, label = "${manager.type}.${cached.name}(Context, long)")

        val fresh = manager.methods.single {
            it.hasFlags(AccessFlags.PUBLIC, AccessFlags.FINAL) &&
                it.returnType == "Z" && it.params() == listOf(CONTEXT)
        }
        assertForcedBoolean(fresh, expected = true, label = "${manager.type}.${fresh.name}(Context)")

        // 3. Static facade: the public static (Context)Z that calls the (Context) overload.
        val facade = classes.asSequence().flatMap { it.methods.asSequence() }.single { method ->
            method.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL) &&
                method.returnType == "Z" && method.params() == listOf(CONTEXT) &&
                method.instructions().any {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == manager.type && ref.name == fresh.name &&
                        ref.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
                }
        }
        assertForcedBoolean(facade, expected = true, label = "${facade.definingClass}.${facade.name}(Context)")

        // 4. Startup check result helper: reads LicenseStatus.Retry and Licensed. The boolean and
        // Context follow the result holder in either order (6.7.8 swapped them).
        val result = manager.methods.single { method ->
            method.hasFlags(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL) &&
                method.returnType == "Z" && method.params().size == 3 &&
                method.params().drop(1).toSet() == setOf("Z", CONTEXT) &&
                method.instructions().any {
                    val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                    ref?.definingClass == LICENSE_STATUS && ref.name == "Retry"
                }
        }
        assertForcedBoolean(result, expected = true, label = "${manager.type}.${result.name}(status, boolean, Context)")

        assertLoginOnlyGmsCore(classes)
    }

    // "GmsCore support" (login-only): the sign-in and token clients bind to MicroG RE, everything
    // else keeps Google Play services.
    private fun assertLoginOnlyGmsCore(classes: List<ClassDef>) {
        val byType = classes.associateBy { it.type }
        fun ClassDef.strings() = methods.flatMap { it.strings() }

        // The MicroG RE check runs first in the launch activity's onCreate.
        val onCreate = (byType["Lnet/dinglisch/android/taskerm/Tasker;"] ?: error("Tasker activity not found"))
            .method("onCreate", listOf("Landroid/os/Bundle;"))
        val first = (onCreate.instructions().firstOrNull() as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            first?.definingClass == GMS_EXTENSION && first.name == "checkGmsCore",
            "Tasker.onCreate does not start with checkGmsCore; got $first",
        )

        // BaseGmsClient, found like the patch: its connect step holds the dynamic-lookup error and
        // builds the binding from (package getter, action getter, dynamic-lookup getter).
        val connect = classes.asSequence().flatMap { it.methods.asSequence() }.single { m ->
            m.strings().any { it.contains(DYNAMIC_LOOKUP_ERROR) }
        }
        val base = byType.getValue(connect.definingClass)
        val insns = connect.instructions()
        fun callsBefore(index: Int) = insns.subList(0, index)
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .filter { it.definingClass == base.type && it.parameterTypes.isEmpty() }
            .takeLast(3)
        val bindings = insns.indices.filter { i ->
            val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "<init>" && ref.parameterTypes.map(CharSequence::toString) == listOf(STRING, STRING, "Z", "I", "Z") &&
                callsBefore(i).map { it.returnType } == listOf(STRING, STRING, "Z")
        }
        assertTrue(bindings.size == 1, "expected one BaseGmsClient binding (package, action, dynamic lookup), found ${bindings.size}")
        val (packageGetter, actionGetter, dynamicGetter) = callsBefore(bindings.single()).map { it.name }

        // The shared getter still answers Google Play services.
        assertTrue(
            base.method(packageGetter, emptyList()).strings() == listOf(GMS),
            "${base.type}.$packageGetter() no longer returns $GMS",
        )

        // Clients by their (possibly rewritten) start-service action.
        fun isClient(cls: ClassDef): Boolean {
            var type: String? = cls.superclass
            while (type != null) {
                if (type == base.type) return true
                type = byType[type]?.superclass
            }
            return false
        }
        val clients = classes.filter(::isClient).mapNotNull { cls ->
            val action = cls.methods.firstOrNull { it.name == actionGetter && it.parameterTypes.isEmpty() }
                ?.strings()?.singleOrNull() ?: return@mapNotNull null
            action to cls
        }.groupBy({ it.first }, { it.second })

        for (action in ROUTED_ACTIONS) {
            val routed = clients["app.revanced.android.gms.${action.removePrefix("com.google.android.gms.")}"]
            assertTrue(!routed.isNullOrEmpty(), "no client binds to MicroG RE's $action")
            routed!!.forEach { cls ->
                val pkg = cls.method(packageGetter, emptyList()).instructions()
                assertTrue(
                    pkg.getOrNull(0)?.let { (it as? ReferenceInstruction)?.reference as? StringReference }?.string == MICROG &&
                        pkg.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
                    "${cls.type}.$packageGetter() does not return $MICROG",
                )
                assertForcedBoolean(cls.method(dynamicGetter, emptyList()), expected = false, label = "${cls.type}.$dynamicGetter() (dynamic lookup)")
            }
            assertTrue(action !in clients, "a client still binds to Google Play services' $action")
        }
        for (action in KEPT_ACTIONS) {
            val kept = clients[action]
            assertTrue(!kept.isNullOrEmpty(), "client for $action not found (or its action was rewritten)")
            kept!!.forEach { cls ->
                assertTrue(
                    cls.methods.none { it.name == packageGetter && it.parameterTypes.isEmpty() },
                    "${cls.type} ($action) overrides the package getter",
                )
            }
        }

        // GoogleAuthUtil's legacy GetToken path: MicroG RE's package and account type.
        val getToken = classes.single { "com.google.android.gms.auth.GetToken" in it.strings() }.strings()
        assertTrue(MICROG in getToken && "app.revanced" in getToken, "GetToken holder does not point at MicroG RE")
        assertTrue(GMS !in getToken && "com.google" !in getToken, "GetToken holder still names Google Play services")

        // The sign-in intent and SignInHubActivity agree on MicroG RE's GOOGLE_SIGN_IN action.
        val signInHub = byType.getValue("Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;").strings()
        assertTrue(
            "app.revanced.android.gms.auth.GOOGLE_SIGN_IN" in signInHub && MICROG in signInHub && GMS !in signInHub,
            "SignInHubActivity does not start MicroG RE's sign-in",
        )
        val leftovers = classes.filter { "com.google.android.gms.auth.GOOGLE_SIGN_IN" in it.strings() }.map { it.type }
        assertTrue(leftovers.isEmpty(), "GOOGLE_SIGN_IN not rewritten in $leftovers")
        val account = byType.getValue("Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;").strings()
        assertTrue("app.revanced" in account && "com.google" !in account, "GoogleSignInAccount keeps the com.google account type")

        // Outside the scope: availability, location, Dynamite, FCM and the manifest keep Google.
        val availability = classes.asSequence().flatMap { it.methods.asSequence() }.single { m ->
            m.returnType == "I" && m.strings().any { it.contains(GOOGLE_SIGNATURE_INVALID) }
        }
        assertTrue(availability.instructions().size > 2 && GMS in availability.strings(),
            "isGooglePlayServicesAvailable was changed")
        val dynamite = byType.getValue("Lcom/google/android/gms/dynamite/DynamiteModule;").strings()
        assertTrue(GMS in dynamite && "com.google.android.gms.chimera" in dynamite && MICROG !in dynamite,
            "DynamiteModule was rewritten")
        val fcm = classes.filter { "com.google.iid.TOKEN_REQUEST" in it.strings() }
        assertTrue(fcm.isNotEmpty() && fcm.all { GMS in it.strings() }, "FCM registration was rewritten")
        val all = classes.flatMap { it.strings() }
        assertTrue(all.none { it.startsWith("app.revanced.android.c2dm") || it.startsWith("app.revanced.android.location") },
            "push or location strings point at MicroG RE")

        val manifestFile = workDir.walkTopDown()
            .firstOrNull { it.name == "AndroidManifest.xml" && it.readText().contains("SPOOFED_PACKAGE_NAME") }
            ?: error("no decoded AndroidManifest.xml with the MicroG meta-data under $workDir")
        val manifestText = manifestFile.readText()
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val metaData = manifest.children("meta-data").associate { it.getAttribute("android:name") to it.getAttribute("android:value") }
        for ((name, value) in mapOf(
            "app.revanced.android.gms.SPOOFED_PACKAGE_NAME" to PKG,
            "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" to SIGNATURE_SHA1,
            "app.revanced.MICROG_PACKAGE_NAME" to MICROG,
        )) {
            assertTrue(metaData[name] == value, "meta-data $name is ${metaData[name]}, expected $value")
        }
        val queried = manifest.children("queries").flatMap { it.children("package") }.map { it.getAttribute("android:name") }
        assertTrue(MICROG in queried, "<queries> is missing $MICROG")
        assertTrue(manifest.getAttribute("package") == PKG, "package name changed")
        assertTrue(
            "com.google.android.c2dm.permission.RECEIVE" in manifestText && "app.revanced.android.c2dm" !in manifestText,
            "c2dm manifest entries were renamed",
        )
    }
}

private const val STRING = "Ljava/lang/String;"
private const val GMS = "com.google.android.gms"
private const val MICROG = "app.revanced.android.gms"
private const val SIGNATURE_SHA1 = "feadd18b23781cfd4eac71118c76fb35c1ab39c7"
private const val GMS_EXTENSION = "Lapp/template/extension/gmscore/GmsCoreSupport;"
private const val DYNAMIC_LOOKUP_ERROR = "the minimum apk version of this BaseGmsClient is too low to support dynamic lookup"
private const val GOOGLE_SIGNATURE_INVALID = " requires Google Play services, but their signature is invalid."

private val ROUTED_ACTIONS = listOf(
    "com.google.android.gms.auth.account.authapi.START",
    "com.google.android.gms.auth.service.START",
    "com.google.android.gms.auth.api.signin.service.START",
    "com.google.android.gms.signin.service.START",
)

private val KEPT_ACTIONS = listOf(
    "com.google.android.location.internal.GoogleLocationManagerService.START",
    "com.google.android.gms.home.service.START",
    "com.google.android.gms.common.telemetry.service.START",
    "com.google.android.gms.auth.api.credentials.service.START",
)
