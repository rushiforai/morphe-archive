package me.toidicakhia.patches.locket

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import java.net.URI
import java.security.MessageDigest
import java.util.zip.Adler32
import me.toidicakhia.patches.shared.Constants.LOCKET_COMPATIBILITY

private const val PATCH_NAME = "Spoofer server"

private const val APP_CONFIG_PATH = "assets/app.config"
private const val BUNDLE_PATH = "assets/index.android.bundle"
private const val APP_DEX_PATH = "classes2.dex"
private const val REMOTE_CONFIG_DEX_PATH = "classes3.dex"
private const val REVENUECAT_DEX_PATH = "classes4.dex"

private const val HERMES_VERSION = 96
private const val HERMES_SHA1_SIZE = 20
private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F, 0xBC.toByte(), 0x03, 0xC1.toByte(), 0x03, 0x19, 0x1F
)

/**
 * The app reads its API base URL from Firebase Remote Config (`functions_domains`),
 * and Locket's production config always answers with the real API host, which
 * overrides the Expo default built from `extra.api.baseUrl`. Reading a key that
 * production never defines keeps the local default in charge.
 */
private const val FUNCTIONS_DOMAINS = "functions_domains"
private const val LOCAL_FUNCTIONS_DOMAINS = "functions_domainz"

/** The single `baseUrl` in `assets/app.config`, inside `extra.api`. */
private val API_BASE_URL = Regex(""""baseUrl"\s*:\s*"[^"]*"""")

/**
 * Points every Locket API call (including the Firebase Functions callables such as
 * `generateFilteredImage` and `fetchUserV2`) at a self-hosted spoofer server, and
 * optionally sends RevenueCat and Firebase Remote Config there too.
 *
 * Only the hosts are rewritten, so the server must answer HTTPS with a certificate
 * for its own name; no DNS profile and no custom CA are needed on the device.
 */
@Suppress("unused")
val locketSpooferServerPatch = resourcePatch(
    name = PATCH_NAME,
    description = "Sends Locket's API traffic (feed, profile, AI frames, captions) to a self-hosted " +
        "spoofer server instead of api.locketcamera.com. Enter the server address; the app keeps " +
        "using the server's own HTTPS certificate, so no DNS profile or CA install is needed. " +
        "Enable the second option to route RevenueCat and Firebase Remote Config through the same " +
        "server as well. Not selected by default.",
    default = false
) {
    compatibleWith(LOCKET_COMPATIBILITY)

    val server by stringOption(
        key = "spooferServer",
        default = null,
        title = "Spoofer server",
        description = "Address of the spoofer server, for example https://spoofer.example. " +
            "It must answer HTTPS with a certificate for this name. A scheme is optional and is " +
            "assumed to be https when missing; a path is not supported.",
        required = true
    )

    val routeRevenueCat by booleanOption(
        key = "routeRevenueCat",
        default = false,
        title = "Route RevenueCat and Remote Config",
        description = "Also sends api.revenuecat.com and firebaseremoteconfig.googleapis.com to the " +
            "spoofer server, so its Gold payload and feature flags reach the app without a DNS " +
            "profile. The server must answer /v1/subscribers*, /v1/receipts* and /v1/projects*. " +
            "Rebuilding the app's dex files makes patching take noticeably longer."
    )

    execute {
        val spoofer = spooferServerUrl(server)

        patchAppConfig(spoofer)
        patchFunctionsDomainsKey()

        if (routeRevenueCat == true) {
            rewriteDexStrings(
                get(REVENUECAT_DEX_PATH),
                mapOf(
                    "https://api.revenuecat.com/" to "$spoofer/",
                    "https://api-production.8-lives-cat.io/" to "$spoofer/"
                )
            )
            rewriteDexStrings(
                get(REMOTE_CONFIG_DEX_PATH),
                mapOf(
                    // The realtime invalidation stream has no patch payload; leaving it on Google
                    // only means it keeps asking the app to re-fetch, which then hits the server.
                    "https://firebaseremoteconfig.googleapis.com/v1/projects/%s/namespaces/%s:fetch" to
                        "$spoofer/v1/projects/%s/namespaces/%s:fetch"
                )
            )
        }
    }
}

/** `spoofer.example`, `https://spoofer.example/` and `https://spoofer.example` all become the latter. */
private fun spooferServerUrl(raw: String?): String {
    val trimmed = raw?.trim().orEmpty()
    if (trimmed.isEmpty()) {
        throw PatchException("$PATCH_NAME: enter the spoofer server address.")
    }

    val url = if (trimmed.startsWith("https://")) {
        trimmed
    } else if (trimmed.startsWith("http://")) {
        throw PatchException("$PATCH_NAME: the server must use HTTPS, because the app blocks cleartext.")
    } else {
        "https://$trimmed"
    }.trimEnd('/')

    val uri = try {
        URI(url)
    } catch (exception: Exception) {
        throw PatchException("$PATCH_NAME: \"$trimmed\" is not a valid address.", exception)
    }

    if (uri.scheme != "https" || uri.host.isNullOrBlank()) {
        throw PatchException("$PATCH_NAME: \"$trimmed\" is not an https address.")
    }
    if (!uri.path.isNullOrEmpty() || uri.query != null || uri.fragment != null) {
        throw PatchException("$PATCH_NAME: \"$trimmed\" must be a bare server address without a path.")
    }
    if (uri.userInfo != null) {
        throw PatchException("$PATCH_NAME: \"$trimmed\" must not contain credentials.")
    }

    return url
}

/**
 * `extra.api.baseUrl` feeds the Expo-side API client and the Remote Config defaults.
 * The groups WebSocket is deliberately left alone: the spoofer forwarder is HTTP-only.
 */
private fun app.morphe.patcher.patch.ResourcePatchContext.patchAppConfig(spoofer: String) {
    val configFile = get(APP_CONFIG_PATH)
    val config = configFile.readText()
    val matches = API_BASE_URL.findAll(config).count()
    if (matches != 1) {
        throw PatchException("$PATCH_NAME: expected one extra.api.baseUrl in $APP_CONFIG_PATH, found $matches.")
    }

    configFile.writeText(API_BASE_URL.replace(config) { "\"baseUrl\":\"$spoofer\"" })
}

/**
 * Both carriers of the Remote Config key are renamed to a same-length name:
 * the Hermes string table stores it once and the dex stores it once, so the
 * bytes can be swapped in place without moving anything.
 */
private fun app.morphe.patcher.patch.ResourcePatchContext.patchFunctionsDomainsKey() {
    val bundle = get(BUNDLE_PATH)
    val bundleBytes = bundle.readBytes()
    requireHermes(bundleBytes)
    replaceUnique(
        bytes = bundleBytes,
        old = FUNCTIONS_DOMAINS.toByteArray(),
        new = LOCAL_FUNCTIONS_DOMAINS.toByteArray(),
        label = "$BUNDLE_PATH (functions_domains)"
    )
    rehashHermes(bundleBytes)
    bundle.writeBytes(bundleBytes)

    val dex = get(APP_DEX_PATH)
    val dexBytes = dex.readBytes()
    replaceUnique(
        bytes = dexBytes,
        old = FUNCTIONS_DOMAINS.toByteArray(),
        new = LOCAL_FUNCTIONS_DOMAINS.toByteArray(),
        label = "$APP_DEX_PATH (functions_domains)"
    )
    fixDexHeader(dexBytes)
    dex.writeBytes(dexBytes)
}

private fun replaceUnique(bytes: ByteArray, old: ByteArray, new: ByteArray, label: String) {
    check(old.size == new.size) { "replacement must keep the same length" }

    val offset = bytes.indexOfSequence(old)
    if (offset == -1) {
        throw PatchException("$PATCH_NAME: could not find the expected string in $label.")
    }
    if (bytes.indexOfSequence(old, offset + 1) != -1) {
        throw PatchException("$PATCH_NAME: the expected string is not unique in $label.")
    }

    new.copyInto(bytes, offset)
}

private fun requireHermes(bytes: ByteArray) {
    val hasMagic = bytes.size > HERMES_SHA1_SIZE &&
        bytes.copyOfRange(0, HERMES_MAGIC.size).contentEquals(HERMES_MAGIC)
    if (!hasMagic) {
        throw PatchException("$PATCH_NAME: $BUNDLE_PATH is not a Hermes bytecode bundle.")
    }

    val version = (bytes[8].toInt() and 0xFF) or
        ((bytes[9].toInt() and 0xFF) shl 8) or
        ((bytes[10].toInt() and 0xFF) shl 16) or
        ((bytes[11].toInt() and 0xFF) shl 24)
    if (version != HERMES_VERSION) {
        throw PatchException("$PATCH_NAME: unsupported Hermes bytecode version $version.")
    }
}

/** Hermes stores a SHA-1 of the whole file in its footer. */
private fun rehashHermes(bytes: ByteArray) {
    val footerOffset = bytes.size - HERMES_SHA1_SIZE
    val digest = MessageDigest.getInstance("SHA-1")
    digest.update(bytes, 0, footerOffset)
    digest.digest().copyInto(bytes, footerOffset)
}

/** A dex keeps an Adler-32 checksum at 8 and a SHA-1 signature at 12, both over the header tail. */
private fun fixDexHeader(bytes: ByteArray) {
    val checksum = Adler32().apply { update(bytes, 12, bytes.size - 12) }.value.toInt()
    writeIntLe(bytes, 8, checksum)
    MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(32, bytes.size)).copyInto(bytes, 12)
}

private fun writeIntLe(bytes: ByteArray, offset: Int, value: Int) {
    bytes[offset] = value.toByte()
    bytes[offset + 1] = (value ushr 8).toByte()
    bytes[offset + 2] = (value ushr 16).toByte()
    bytes[offset + 3] = (value ushr 24).toByte()
}

/**
 * Rewrites exact string constants (both `const-string` instructions and static field
 * initial values) and rebuilds the dex. Rebuilding is what allows a replacement to be
 * longer than the original.
 */
private fun rewriteDexStrings(dexFile: File, replacements: Map<String, String>) {
    val workingCopy = File.createTempFile("locket-dex", ".dex")
    try {
        val dexBytes = dexFile.readBytes()
        workingCopy.writeBytes(dexBytes)

        // Keep the original dex version: a newer one would be rejected on the app's older
        // supported Android versions (the bundle ships dex 038).
        val opcodes = Opcodes.forDexVersion(dexVersion(dexBytes))
        val dex = DexFileFactory.loadDexFile(workingCopy, opcodes)
        val pool = DexPool(opcodes)
        var replaced = 0

        for (classDef in dex.classes) {
            val mutableClass = MutableClass(classDef)

            for (field in mutableClass.fields) {
                val initialValue = field.initialValue
                if (initialValue is StringEncodedValue && initialValue.value in replacements) {
                    field.initialValue = MutableStringEncodedValue(
                        ImmutableStringEncodedValue(replacements.getValue(initialValue.value))
                    )
                    replaced++
                }
            }

            for (method in mutableClass.methods) {
                val implementation = method.implementation ?: continue
                for (index in implementation.instructions.indices) {
                    val instruction = implementation.instructions[index]
                    if (instruction !is ReferenceInstruction) continue

                    val reference = instruction.reference
                    if (reference !is StringReference) continue

                    val replacement = replacements[reference.string] ?: continue
                    val register = (instruction as OneRegisterInstruction).registerA
                    val stringReference = ImmutableStringReference(replacement)

                    implementation.replaceInstruction(
                        index,
                        if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, stringReference)
                        } else {
                            BuilderInstruction21c(Opcode.CONST_STRING, register, stringReference)
                        }
                    )
                    replaced++
                }
            }

            pool.internClass(mutableClass)
        }

        if (replaced == 0) {
            throw PatchException(
                "$PATCH_NAME: no host to rewrite in ${dexFile.name}. Enable this option only for " +
                    "the supported Locket build."
            )
        }

        val output = MemoryDataStore()
        pool.writeTo(output)
        dexFile.writeBytes(output.data)
    } finally {
        workingCopy.delete()
    }
}

private fun dexVersion(bytes: ByteArray): Int {
    if (bytes.size < 8 || bytes.copyOfRange(0, 4).decodeToString() != "dex\n") {
        throw PatchException("$PATCH_NAME: not a dex file.")
    }
    return bytes.copyOfRange(4, 7).decodeToString().toIntOrNull()
        ?: throw PatchException("$PATCH_NAME: unsupported dex version.")
}

private fun ByteArray.indexOfSequence(sequence: ByteArray, startIndex: Int = 0): Int {
    if (sequence.isEmpty() || sequence.size > size) return -1
    for (index in startIndex..size - sequence.size) {
        if (sequence.indices.all { this[index + it] == sequence[it] }) return index
    }
    return -1
}
