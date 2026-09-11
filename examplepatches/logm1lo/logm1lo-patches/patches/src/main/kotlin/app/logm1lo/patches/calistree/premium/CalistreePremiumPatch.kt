package app.logm1lo.patches.calistree.premium

import app.logm1lo.patches.shared.COMPATIBILITY_CALISTREE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch

private val FAKE_ENTITLEMENT_SMALI = """
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
    const-string v1, "identifier"
    const-string v2, "pro"
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "isActive"
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "willRenew"
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "isSandbox"
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    new-instance v1, Ljava/util/LinkedHashMap;
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V
    const-string v2, "pro"
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
    const-string v2, "all"
    invoke-static {v2, v0}, Lpm/v;->a(Ljava/lang/Object;Ljava/lang/Object;)Lpm/p;
    move-result-object v0
    const-string v2, "active"
    invoke-static {v2, v1}, Lpm/v;->a(Ljava/lang/Object;Ljava/lang/Object;)Lpm/p;
    move-result-object v1
    const-string v2, "verification"
    const-string v3, "NOT_REQUESTED"
    invoke-static {v2, v3}, Lpm/v;->a(Ljava/lang/Object;Ljava/lang/Object;)Lpm/p;
    move-result-object v2
    filled-new-array {v0, v1, v2}, [Lpm/p;
    move-result-object v0
    invoke-static {v0}, Lqm/o0;->l([Lpm/p;)Ljava/util/Map;
    move-result-object v0
    return-object v0
""".trimIndent()

@Suppress("unused")
val calistreePremiumPatch = bytecodePatch(
    name = "Premium Unlock",
    description = "Unlocks all Calistree PRO features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CALISTREE)

    execute {
        GetActiveFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.replaceInstruction(fp.instructionMatches[0].index,
                "iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;")
        }

        GetActiveSubsFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, """
                new-instance v0, Ljava/util/HashSet;
                invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
                const-string v1, "pro"
                invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
                return-object v0
            """)
        }

        EntitlementMapFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, FAKE_ENTITLEMENT_SMALI)
        }

        AllPurchasedIdsFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, """
                new-instance v0, Ljava/util/HashSet;
                invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
                const-string v1, "pro"
                invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
                return-object v0
            """)
        }

        CustomerInfoMapFingerprint.let { fp ->
            val match = fp.matchOrNull() ?: return@let
            val returnIdx = match.method.implementation!!.instructions
                .indexOfLast { it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT }
            if (returnIdx >= 0) {
                match.method.addInstructions(returnIdx, """
                    const-string v3, "latestExpirationDate"
                    const-string v4, "2099-01-01T00:00:00.000Z"
                    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v3, "allExpirationDates"
                    new-instance v4, Ljava/util/LinkedHashMap;
                    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V
                    const-string v5, "pro"
                    const-string v6, "2099-01-01T00:00:00.000Z"
                    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                """.trimIndent())
            }
        }
    }
}

/**
 * Dart AOT hex patches for libapp.so — the REAL Calistree Pro gates.
 *
 * Calistree is a Flutter (Dart AOT) app; the actual premium checks
 * (hasProAccess, plan limits, promotional access, StateNotifier init)
 * are compiled into native ARM64 code in libapp.so. The Java RevenueCat
 * patches above only fake the SDK layer — without these native patches
 * Pro is NOT unlocked.
 *
 * Offsets per version. 5.8.5 offsets from B(l)utter analysis; 5.9.1 offsets
 * relocated via masked-context binary matching + cluster-relative prediction,
 * verified byte-for-byte against the 5.9.1 libapp.so.
 *
 * The patch is all-or-nothing per table: it only writes when EVERY site of a
 * known version matches its expected bytes. A partial table is never written.
 */
@Suppress("unused")
val calistreeDartHexPatch = rawResourcePatch(
    name = "Dart Pro gates (libapp.so)",
    description = "Applies the 10 Dart AOT hex patches to libapp.so that unlock the native Pro gates.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CALISTREE)
    dependsOn(calistreePremiumPatch)

    execute {
        // offset -> (expected bytes, replacement bytes)
        val tables = mapOf(
            "5.8.5" to mapOf(
                0x20aa36c to ("e00302aa" to "60830091"), // updateState setHasProAccess param → true
                0x20aa398 to ("a2035ff8" to "62830091"), // updateState state= → true
                0x20aa414 to ("c0c20091" to "c0820091"), // hasProAccess default → true
                0x20aa41c to ("e00301aa" to "c0820091"), // hasProAccess cached → true
                0x20a9b28 to ("e20303aa" to "e2830091"), // init() setHasProAccess → true
                0x29f5360 to ("c0c20091" to "c0820091"), // Promotional check → true
                0x22d6914 to ("40000054" to "10000014"), // Plan limit null gate → skip
                0x20a98bc to ("01012037" to "1f2003d5"), // backup skip gate → NOP
                0x20a9860 to ("e20316aa" to "c2820091"), // StateNotifier init → true
                0x22d6960 to ("8b040054" to "24000014"), // Plan limits → unlimited
            ),
            "5.9.1" to mapOf(
                0x22cc468 to ("e00302aa" to "60830091"), // updateState setHasProAccess param → true
                0x22cc494 to ("a2035ff8" to "62830091"), // updateState state= → true
                0x22cc510 to ("c0c20091" to "c0820091"), // hasProAccess default → true
                0x22cc518 to ("e00301aa" to "c0820091"), // hasProAccess cached → true
                0x22cbc24 to ("e20303aa" to "e2830091"), // init() setHasProAccess → true
                0x2c3c9f4 to ("c0c20091" to "c0820091"), // Promotional check → true
                0x252a8fc to ("40000054" to "10000014"), // Plan limit null gate → skip
                0x22cb9b8 to ("01012037" to "1f2003d5"), // backup skip gate → NOP
                0x22cb95c to ("e20316aa" to "c2820091"), // StateNotifier init → true
                0x252a948 to ("8b040054" to "24000014"), // Plan limits → unlimited
            ),
        )

        val soPath = "lib/arm64-v8a/libapp.so"
        val libapp = get(soPath) ?: return@execute

        val bytes = libapp.readBytes()

        var matchedVersion: String? = null
        var applied = 0
        for ((version, table) in tables) {
            val hits = table.count { (offset, pair) ->
                offset + 4 <= bytes.size &&
                    bytes.copyOfRange(offset, offset + 4).contentEquals(hexToBytes(pair.first))
            }
            if (hits == table.size) { matchedVersion = version; break }
        }

        if (matchedVersion == null) {
            println("Calistree Dart hex patches: libapp.so matches NO known version table (${tables.keys}) — skipping native patch")
            return@execute
        }

        for ((offset, pair) in tables.getValue(matchedVersion)) {
            hexToBytes(pair.second).copyInto(bytes, offset)
            applied++
        }

        libapp.writeBytes(bytes)
        println("Calistree Dart hex patches: matched $matchedVersion table, applied $applied/10 to $soPath")
    }
}

private fun hexToBytes(hex: String): ByteArray {
    require(hex.length % 2 == 0) { "hex string must have even length" }
    return ByteArray(hex.length / 2) { i ->
        ((Character.digit(hex[i * 2], 16) shl 4) + Character.digit(hex[i * 2 + 1], 16)).toByte()
    }
}
