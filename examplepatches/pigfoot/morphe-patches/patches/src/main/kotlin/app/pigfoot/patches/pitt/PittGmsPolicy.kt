package app.pigfoot.patches.pitt

import app.pigfoot.patches.shared.firebase.FirebaseCertificateHeaderContract
import app.pigfoot.patches.shared.firebase.restoreFirebaseCertificateHeader
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val PITT_GMS_PACKAGE = "app.revanced.android.gms"
internal const val PITT_STOCK_SHA1 = "78fb4dd6d47fea4a0ae35e97cabfde10b5561cf4"
internal const val PITT_GMS_CLIENT = "Li7/f;"
internal const val PITT_GMS_MODE = "Lh7/a;->a()I"
internal const val PITT_GMS_ACTION = "com.google.android.gms.auth.GOOGLE_SIGN_IN"
internal const val PITT_GMS_SERVICE = "com.google.android.gms.auth.api.signin.service.START"
internal const val PITT_GMS_BASE = "Lcom/google/android/gms/common/internal/c;"

internal const val PITT_FIREBASE_HEADERS = "Lcom/google/android/gms/internal/firebase-auth-api/zzacv;->zza(Ljava/net/URLConnection;)V"
internal const val PITT_FIREBASE_IDENTITY = "Lcom/google/android/gms/internal/firebase-auth-api/zzado;"

// Independently identical on pristine base and untouched merged ARM64 APKS.
internal val pittGmsClassPins = mapOf(
    "Lh7/a;" to "341a85cf48a43177c78e8f1a1d84d3bb79dc7b1ae2c23d97724ea0cb338e97c3",
    "Li7/l;" to "1ccf308e272b5988eb08dc1f3e2c2d5e8ce3d8cbc205ac7e2a935f7273d5e9c1",
    PITT_GMS_CLIENT to "ef7132f9ce011ccf6eb863a74443f526fa68a16c2cd30858ec7bd0e3ffd7dff6",
    "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;" to "76b5300093f4fa5d83785738c4a43c74e858c998bbbce851b6dd8a1c7fdf5ea4",
    PITT_GMS_BASE to "a675b53eb795860190f6f07e37287735b3963fe360fcf8455fa3d7fd00727054",
    PITT_FIREBASE_HEADERS.substringBefore("->") to "72f7376ff426f415efc4996fe14a82a196cda06669564207f22bf1a247f4fec5",
    PITT_FIREBASE_IDENTITY to "10d6a9015342d56fb22102f68f1d711b5897b13c27d14eff6612af27a4f425a5",
    PITT_GOOGLE_CLICK to "e6d0de5b0fe513a1988ecabf6525b16a779eb108f2b494c081f9860cf71da3fc"
)

internal val pittGmsStrings = mapOf(
    "Li7/l;->a(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Landroid/content/Intent;" to
        mapOf(PITT_GMS_ACTION to "$PITT_GMS_PACKAGE.auth.GOOGLE_SIGN_IN"),
    "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;->onCreate(Landroid/os/Bundle;)V" to
        mapOf(PITT_GMS_ACTION to "$PITT_GMS_PACKAGE.auth.GOOGLE_SIGN_IN", "com.google.android.gms" to PITT_GMS_PACKAGE),
    "$PITT_GMS_CLIENT->getStartServiceAction()Ljava/lang/String;" to
        mapOf(PITT_GMS_SERVICE to "$PITT_GMS_PACKAGE.auth.api.signin.service.START")
)

internal val pittGmsOverrideNames = setOf("getStartServicePackage", "requiresGooglePlayServices")

/** Only these three auth methods are eligible; collect all sites before mutation. */
internal fun redirectPittGmsStrings(method: MutableMethod) {
    val replacements = requireNotNull(pittGmsStrings[method.pittId()]) { "Unsupported PiTT GmsCore method" }
    val implementation = requireNotNull(method.implementation)
    val code = implementation.instructions.toList()
    val sites = replacements.map { (from, to) ->
        val found = code.indices.filter { (code[it] as? ReferenceInstruction)?.reference?.toString() == from }
        require(found.size == 1) { "Missing or ambiguous PiTT auth string: $from" }
        val index = found.single()
        require(code[index].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)) { "Invalid PiTT auth string opcode" }
        Triple(index, (code[index] as OneRegisterInstruction).registerA, to)
    }
    for ((index, register, value) in sites) {
        val ref = ImmutableStringReference(value)
        implementation.replaceInstruction(index, if (code[index].opcode == Opcode.CONST_STRING_JUMBO)
            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, ref)
        else BuilderInstruction21c(Opcode.CONST_STRING, register, ref))
    }
}

/** Select the legacy API, not a successful authentication result. Keep original code/handlers. */
internal fun selectPittLegacyGmsMode(method: MutableMethod) {
    require(method.pittId() == PITT_GMS_MODE) { "Unsupported PiTT auth mode method" }
    val implementation = requireNotNull(method.implementation)
    require(implementation.registerCount == 5 && implementation.instructions.first().opcode == Opcode.MONITOR_ENTER) {
        "Unsupported or already modified PiTT auth mode"
    }
    method.addInstructions(0, "const/4 v0, 0x4\nreturn v0")
}

/** Override only the legacy auth client, never the shared GmsClient superclass. */
internal fun pittGmsClientOverrides(): List<ImmutableMethod> = listOf(
    ImmutableMethod(PITT_GMS_CLIENT, "getStartServicePackage", emptyList(), "Ljava/lang/String;",
        AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(2, listOf(
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(PITT_GMS_PACKAGE)),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), emptyList(), emptyList())),
    ImmutableMethod(PITT_GMS_CLIENT, "requiresGooglePlayServices", emptyList(), "Z",
        AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(2, listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
            ImmutableInstruction11x(Opcode.RETURN, 0)), emptyList(), emptyList()))
)

internal fun requirePittGmsBaseContract(methods: Iterable<Method>) {
    for ((name, returns) in mapOf("getStartServicePackage" to "Ljava/lang/String;", "requiresGooglePlayServices" to "Z")) {
        val method = methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() && it.returnType == returns }
        require(method != null && method.accessFlags and AccessFlags.PUBLIC.value != 0 &&
            method.accessFlags and (AccessFlags.FINAL.value or AccessFlags.STATIC.value) == 0) { "Unsupported PiTT GmsClient base contract" }
    }
}

/** No package rename, permission removal, client-ID replacement or global GMS redirect. */
internal fun applyPittGmsManifest(doc: Document, certificateSha1: String) {
    require(certificateSha1 == PITT_STOCK_SHA1) { "Unsupported PiTT certificate identity" }
    val manifest = doc.documentElement
    require(manifest.tagName == "manifest" && manifest.getAttribute("package") == PITT_PACKAGE &&
        manifest.getAttribute("android:versionName") == PITT_VERSION &&
        manifest.getAttribute("android:versionCode") == PITT_CODE.toString()) { "Unsupported PiTT GmsCore manifest" }
    val applications = doc.getElementsByTagName("application")
    require(applications.length == 1) { "Ambiguous PiTT application" }
    val app = applications.item(0) as Element
    val metadata = doc.getElementsByTagName("meta-data")
    val prefix = "$PITT_GMS_PACKAGE.SPOOFED_PACKAGE_"
    require((0 until metadata.length).none { (metadata.item(it) as Element).getAttribute("android:name").startsWith(prefix) }) {
        "Existing PiTT GmsCore identity metadata"
    }
    val queries = doc.getElementsByTagName("queries")
    require(queries.length == 1 && queries.item(0).parentNode == manifest) { "Unsupported PiTT package queries" }
    val query = queries.item(0)
    val packages = (0 until query.childNodes.length).mapNotNull { query.childNodes.item(it) as? Element }
    require(packages.none { it.tagName == "package" && it.getAttribute("android:name") == PITT_GMS_PACKAGE }) {
        "Existing PiTT GmsCore query"
    }
    // All rejection checks precede any mutation.
    val visible = doc.createElement("package")
    visible.setAttribute("android:name", PITT_GMS_PACKAGE)
    query.appendChild(visible)
    for ((key, value) in mapOf("NAME" to PITT_PACKAGE, "SIGNATURE" to certificateSha1)) {
        val node = doc.createElement("meta-data")
        node.setAttribute("android:name", prefix + key)
        node.setAttribute("android:value", value)
        app.appendChild(node)
    }
}

/** App-specific Auth transport/getter/register contract; never match other Firebase products. */
private val pittFirebaseHeaderContract = FirebaseCertificateHeaderContract(
    methodId = PITT_FIREBASE_HEADERS,
    identityOwner = PITT_FIREBASE_IDENTITY,
    packageGetter = "zzb",
    certificateGetter = "zza",
    registerCount = 5,
    identityRegister = 1,
    connectionRegister = 4,
    keyRegister = 2,
    valueRegister = 1,
    nextHeader = "Accept-Language"
)

internal fun restorePittFirebaseClientIdentity(method: MutableMethod, certificateSha1: String) {
    require(certificateSha1 == PITT_STOCK_SHA1) { "Unsupported PiTT certificate identity" }
    restoreFirebaseCertificateHeader(method, certificateSha1, pittFirebaseHeaderContract)
}
