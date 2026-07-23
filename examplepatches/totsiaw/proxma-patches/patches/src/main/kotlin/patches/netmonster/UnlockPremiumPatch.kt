package patches.netmonster

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.ArrayEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import org.w3c.dom.Element

/*
 * NetMonster premium = an Adapty (server-validated) subscription surfaced through a Kotlin Flow
 * pipeline in the premium repo `er/o` (R8-obfuscated). The repo exposes the current premium / no-ads
 * state as two `StateFlow<Boolean>` getters that the UI collects to gate ads and the "manta"
 * LTE/NR-NSA location calc. Forcing the upstream Flow emit true (the 3.4.0 crack's trick) does NOT
 * transfer to 3.4.1 (the obfuscation reshuffled which flow the twin lambda feeds — verified: ad stays).
 *
 * Consumers read the repo's `StateFlow<Boolean>` FIELDS DIRECTLY (`iget-object …, Ler/o;->k/l:Lkv/y0;`)
 * — they never call the getters (verified: 0 getter calls, 2+ direct field reads). So we overwrite the
 * FIELDS: at the end of the repo's constructor, after the real flow pipeline has populated them, store
 * a constant `MutableStateFlow(Boolean.TRUE)` into every `StateFlow` field. Every direct field read
 * then sees premium=true, downstream of all the Adapty/flow wiring (immune to the emit-vs-flow shuffle
 * that broke the 3.4.0-crack technique on 3.4.1, and to the getters being bypassed).
 *
 * Name-agnostic anchoring: the repo is found by its STABLE string constant "netmonster-premium"
 * (Adapty access-level id, unobfuscated); the MutableStateFlow factory is derived from the repo's own
 * bytecode (an `invoke-static (Object)Lkv/j0;`) rather than hardcoding the obfuscated `kv/a1`. We touch
 * only `Lkv/y0;` (StateFlow) instance fields — k and l, the premium + no-ads booleans.
 *
 * Injected at constructor end, per StateFlow field F:
 *   sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
 *   invoke-static {v0}, <factory>(Ljava/lang/Object;)Lkv/j0;
 *   move-result-object v0
 *   iput-object v0, p0, Ler/o;->F:Lkv/y0;
 */

private const val PREMIUM_ACCESS_LEVEL = "netmonster-premium"
private const val STATEFLOW = "Lkv/y0;"        // kotlinx StateFlow (obfuscated)
private const val FLOW = "Lkv/i;"              // kotlinx Flow (obfuscated)
private const val MUTABLE_STATEFLOW = "Lkv/j0;" // kotlinx MutableStateFlow (obfuscated)

/**
 * OPTIONAL. NetMonster's built-in Google Maps key is restricted to their release signing certificate,
 * so it stops working the moment the APK is re-signed → the map renders blank (Google logo, no tiles).
 * This is a re-signing artifact, independent of premium (the map is a free feature).
 *
 * We do NOT ship a key (that would mean embedding/leeching someone else's Google Cloud quota). Instead
 * this is opt-in: supply YOUR OWN key and it gets written into the manifest; leave it empty and the map
 * is left untouched (stays blank on the re-signed build — the rest of the app works fine).
 *
 * How to get one (free): Google Cloud Console → enable "Maps SDK for Android" → create an API key.
 * Either leave it unrestricted, or restrict it to application `cz.mroczis.netmonster` + the SHA-1 of the
 * keystore you sign the patched APK with. Then pass it at patch time:
 *   morphe-cli patch … -e "Unlock premium (NetMonster)" -O maps-api-key=AIza...
 */
private val fixMapsApiKeyPatch = resourcePatch(
    description = "Optional: write YOUR OWN Google Maps API key so the map renders after re-signing " +
        "(NetMonster's built-in key is cert-locked). No key = map left as-is.",
) {
    compatibleWith(COMPATIBILITY_NETMONSTER)

    val mapsApiKey by stringOption(
        key = "maps-api-key",
        default = null,
        title = "Google Maps API key",
        description = "Your own unrestricted 'Maps SDK for Android' key (Google Cloud Console). " +
            "NetMonster's built-in key is locked to their signing cert and dies on re-sign (blank map). " +
            "Leave empty to keep the map disabled.",
        required = false,
    )

    finalize {
        val key = mapsApiKey?.takeIf { it.isNotBlank() } ?: return@finalize
        document("AndroidManifest.xml").use { doc ->
            val metas = doc.getElementsByTagName("meta-data")
            var replaced = false
            for (i in 0 until metas.length) {
                val el = metas.item(i) as Element
                if (el.getAttribute("android:name") == "com.google.android.geo.API_KEY") {
                    el.setAttribute("android:value", key)
                    replaced = true
                }
            }
            check(replaced) { "NetMonster: com.google.android.geo.API_KEY meta-data not found" }
        }
    }
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium (NetMonster)",
    description = "Unlocks NetMonster Premium — forces the premium repo's derived flows so real-time " +
        "LTE/NR-NSA location calculation is unlocked, ads are removed, and the status shows Active " +
        "(far-future expiry) without an Adapty subscription.",
) {
    compatibleWith(COMPATIBILITY_NETMONSTER)
    // Optional map-key fix (no-op unless the user supplies -O maps-api-key=…).
    dependsOn(fixMapsApiKeyPatch)

    execute {
        // Locate er/o via its stable access-level string constant.
        val repoType = getAllClassesWithString(PREMIUM_ACCESS_LEVEL).firstOrNull()?.type
            ?: error("NetMonster: premium repo (string \"$PREMIUM_ACCESS_LEVEL\") not found")
        val repo = mutableClassDefBy(repoType)

        // Derive the MutableStateFlow factory from the repo's own code: invoke-static (Object)->Lkv/j0;.
        val factory: MethodReference = repo.methods.asSequence()
            .flatMap { it.implementation?.instructions?.asSequence().orEmpty() }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .firstOrNull {
                it.returnType == MUTABLE_STATEFLOW &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0] == "Ljava/lang/Object;"
            }
            ?: error("NetMonster: MutableStateFlow factory not found in repo")

        val mutableStateFlowOf = "${factory.definingClass}->${factory.name}(Ljava/lang/Object;)$MUTABLE_STATEFLOW"

        // Read a field's generic signature, e.g. "Lkv/y0<Ljava/lang/Boolean;>;", to know what it carries.
        fun genericOf(field: com.android.tools.smali.dexlib2.iface.Field): String =
            field.annotations.firstOrNull { it.type == "Ldalvik/annotation/Signature;" }
                ?.elements?.firstOrNull { it.name == "value" }
                ?.let { (it.value as? ArrayEncodedValue)?.value }
                ?.joinToString("") { (it as? StringEncodedValue)?.value ?: "" }
                ?: ""

        // The repo's derived Flow/StateFlow fields the UI reads directly:
        //   Boolean ones (k, l, j) → premium + no-ads gates + "is active" state  -> force MutableStateFlow(true)
        //   OffsetDateTime one (i) → subscription EXPIRY the status label shows   -> force a far-future date,
        //                                                                            so it reads "Active till …"
        val flowFields = repo.fields.filter { it.type == STATEFLOW || it.type == FLOW }
        var patchedBool = 0
        var patchedDate = 0
        val overwrite = flowFields.mapNotNull { f ->
            val g = genericOf(f)
            when {
                g.contains("Ljava/lang/Boolean;") -> {
                    patchedBool++
                    """
                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                        invoke-static {v0}, $mutableStateFlowOf
                        move-result-object v0
                        iput-object v0, p0, $repoType->${f.name}:${f.type}
                    """.trimIndent()
                }
                g.contains("Ljava/time/OffsetDateTime;") -> {
                    patchedDate++
                    """
                        invoke-static {}, Ljava/time/OffsetDateTime;->now()Ljava/time/OffsetDateTime;
                        move-result-object v0
                        const-wide/16 v1, 0x64
                        invoke-virtual {v0, v1, v2}, Ljava/time/OffsetDateTime;->plusYears(J)Ljava/time/OffsetDateTime;
                        move-result-object v0
                        invoke-static {v0}, $mutableStateFlowOf
                        move-result-object v0
                        iput-object v0, p0, $repoType->${f.name}:${f.type}
                    """.trimIndent()
                }
                else -> null // unknown generic (e.g. the raw subscription list) — leave untouched
            }
        }.joinToString("\n")
        check(patchedBool >= 1) { "NetMonster: no Boolean premium flow fields found on $repoType" }

        // After the constructor's real flow pipeline populates the fields, force them to constant-true.
        val ctor = repo.methods.first { it.name == "<init>" && it.parameters.isNotEmpty() }
        val returnIdx = ctor.implementation!!.instructions.toList()
            .indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(returnIdx >= 0) { "NetMonster: constructor return-void not found" }
        ctor.addInstructions(returnIdx, overwrite)
    }
}
