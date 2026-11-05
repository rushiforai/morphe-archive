import app.morphe.patcher.patch.Patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import java.io.File

// Shared pieces of the "DNS filter" smoke tests (Brave, Firefox, Firefox Focus).

internal const val DNS_FILTER = "DNS filter"
internal const val DEFAULT_DOH_URL = "https://doh.cleanbrowsing.org/doh/family-filter/"
internal const val OTHER_DOH_URL = "https://family.adguard-dns.com/dns-query"

private const val GECKO_RUNTIME = "Lorg/mozilla/geckoview/GeckoRuntime;"
private const val GECKO_RUNTIME_SETTINGS = "Lorg/mozilla/geckoview/GeckoRuntimeSettings;"

private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.stringRef(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Method.lastRegister(): Int = implementation!!.registerCount - 1

/**
 * Applies only "DNS filter" to [apk] with the non-default options (fallback mode, [OTHER_DOH_URL]),
 * from a freshly loaded bundle: the first run's patch and Fingerprint objects keep their matches.
 */
internal fun applyDnsFilterFallback(apk: File, workDir: File, pkg: String, version: String): List<ClassDef> {
    val root = repoRoot()
    val patches: Set<Patch<*>> = loadAllPatches(newestPatchBundle(root))
    val dnsFilter = patches.single { it.name == DNS_FILTER && it.compatibility.orEmpty().any { c -> c.packageName == pkg } }
    assertEquals(setOf("dohUrl", "dohMode"), dnsFilter.options.keys, "$pkg DNS filter options")
    assertEquals(DEFAULT_DOH_URL, dnsFilter.options["dohUrl"]?.default, "$pkg DNS filter default resolver")
    assertEquals("strict", dnsFilter.options["dohMode"]?.default, "$pkg DNS filter default mode")
    dnsFilter.options.set("dohUrl", OTHER_DOH_URL)
    dnsFilter.options.set("dohMode", "fallback")
    return applyPatches(
        apk = apk,
        workDir = File(workDir, "dns-fallback").apply { mkdirs() },
        pkg = pkg,
        version = version,
        patchNames = setOf(DNS_FILTER),
        allPatches = patches,
    )
}

/**
 * Checks the shared GeckoView half of "DNS filter": the TRR mode, URI and excluded-domains setters
 * overwrite p1 at entry (mode [trrMode], [url], an empty list) and GeckoRuntime.create(Context,
 * GeckoRuntimeSettings) calls the mode and URI setters on its settings before its own code.
 */
internal fun assertGeckoViewDnsForced(classes: List<ClassDef>, url: String, trrMode: Int) {
    val settings = classes.firstOrNull { it.type == GECKO_RUNTIME_SETTINGS } ?: error("$GECKO_RUNTIME_SETTINGS not found")

    val setMode = settings.method("setTrustedRecursiveResolverMode", listOf("I"))
    val modeHead = setMode.instructions().first()
    assertTrue(
        modeHead.opcode == Opcode.CONST_4 && (modeHead as NarrowLiteralInstruction).narrowLiteral == trrMode &&
            (modeHead as OneRegisterInstruction).registerA == setMode.lastRegister(),
        "setTrustedRecursiveResolverMode does not force p1 = $trrMode: ${modeHead.opcode}",
    )

    val setUri = settings.method("setTrustedRecursiveResolverUri", listOf("Ljava/lang/String;"))
    val uriHead = setUri.instructions().first()
    assertTrue(
        uriHead.opcode == Opcode.CONST_STRING && uriHead.stringRef() == url &&
            (uriHead as OneRegisterInstruction).registerA == setUri.lastRegister(),
        "setTrustedRecursiveResolverUri does not force p1 = $url: ${uriHead.opcode} ${uriHead.stringRef()}",
    )

    val setExcluded = settings.method("setTrustedRecursiveResolverExcludedDomains", listOf("Ljava/util/List;"))
    val excludedHead = setExcluded.instructions().take(2)
    val emptyList = excludedHead.getOrNull(0)?.methodRef()
    assertTrue(
        excludedHead.getOrNull(0)?.opcode == Opcode.INVOKE_STATIC && emptyList?.definingClass == "Ljava/util/Collections;" &&
            emptyList.name == "emptyList" && excludedHead.getOrNull(1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            (excludedHead[1] as OneRegisterInstruction).registerA == setExcluded.lastRegister(),
        "setTrustedRecursiveResolverExcludedDomains does not force p1 = emptyList(): ${excludedHead.map { it.opcode }}",
    )

    // Other patches (Focus's Enable about:config) also insert at the entry, so the calls are found
    // by reference, and both must come before the method's own first call (assertOnUiThread).
    val create = classes.firstOrNull { it.type == GECKO_RUNTIME }?.method("create", listOf("Landroid/content/Context;", GECKO_RUNTIME_SETTINGS))
        ?: error("$GECKO_RUNTIME->create(Context, GeckoRuntimeSettings) not found")
    val insns = create.instructions()
    val p1 = create.lastRegister()
    val uiCheck = insns.indexOfFirst { it.methodRef()?.name == "assertOnUiThread" }
    fun setterCall(name: String) = insns.indices.singleOrNull { i ->
        insns[i].methodRef()?.let { it.definingClass == GECKO_RUNTIME_SETTINGS && it.name == name } == true
    } ?: error("GeckoRuntime.create calls $name ${insns.count { it.methodRef()?.name == name }} times, expected once")
    val modeCall = setterCall("setTrustedRecursiveResolverMode")
    val uriCall = setterCall("setTrustedRecursiveResolverUri")
    for ((call, label) in listOf(modeCall to "mode", uriCall to "URI")) {
        val invoke = insns[call] as FiveRegisterInstruction
        assertTrue(call in 1 until uiCheck && invoke.registerC == p1, "GeckoRuntime.create: the $label setter is not called on p1 before assertOnUiThread")
        val value = insns[call - 1]
        assertTrue((value as OneRegisterInstruction).registerA == invoke.registerD, "GeckoRuntime.create: the $label argument is not loaded right before the call")
    }
    val modeValue = insns[modeCall - 1]
    assertTrue(
        modeValue.opcode == Opcode.CONST_4 && (modeValue as NarrowLiteralInstruction).narrowLiteral == trrMode,
        "GeckoRuntime.create does not pass mode $trrMode: ${modeValue.opcode}",
    )
    assertEquals(url, insns[uriCall - 1].stringRef(), "GeckoRuntime.create resolver URI")
}
