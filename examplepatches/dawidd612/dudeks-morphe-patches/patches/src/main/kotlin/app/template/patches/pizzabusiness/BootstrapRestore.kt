package app.template.patches.pizzabusiness

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import java.io.DataInputStream
import java.io.InputStream
import java.nio.ByteBuffer
import java.security.MessageDigest
import java.util.Base64
import java.util.zip.GZIPInputStream

/** Version-specific initialization recovered from two original signed-app runs. */
internal object PizzaBootstrap {
    fun restoreNative(original: ByteArray, delta: InputStream): ByteArray =
        DataInputStream(GZIPInputStream(delta)).use { input ->
            val digest = MessageDigest.getInstance("SHA-256")
            require(input.readInt() == 0x505a4232) { "Invalid Pizza native delta" }
            val expectedInput = ByteArray(32).also(input::readFully)
            val expectedOutput = ByteArray(32).also(input::readFully)
            require(digest.digest(original).contentEquals(expectedInput)) {
                "Pizza native initialization does not match this clean ARM64 library; capture a matching bootstrap profile."
            }
            val size = input.readInt()
            require(size in 1..64 * 1024 * 1024) { "Invalid Pizza library size" }
            val output = ByteArray(size)
            var position = 0
            val count = input.readInt()
            require(count in 1..size) { "Invalid Pizza delta operation count" }
            repeat(count) {
                when (input.readUnsignedByte()) {
                    0 -> {
                        val length = input.readInt()
                        require(length in 1..(size - position)) { "Invalid Pizza literal length" }
                        input.readFully(output, position, length)
                        position += length
                    }
                    1 -> {
                        val source = input.readInt()
                        val length = input.readInt()
                        require(source in 0..original.size && length in 1..(original.size - source) &&
                            length <= size - position) { "Invalid Pizza copy range" }
                        original.copyInto(output, position, source, source + length)
                        position += length
                    }
                    else -> throw PatchException("Invalid Pizza delta operation")
                }
            }
            require(position == size && input.read() == -1 && digest.digest(output).contentEquals(expectedOutput)) {
                "Pizza native reconstruction is incomplete or corrupt"
            }
            output
        }
}

internal val pizzaNativeBootstrap = rawResourcePatch {
    execute {
        val library = get("lib/arm64-v8a/libcocos2dcpp.so")
        if (!library.isFile) throw PatchException("Pizza startup repair requires the complete ARM64 APKM.")
        val profile = PizzaProfiles.forPackage(packageMetadata)
        if (!profile.protectedInitialization) {
            require(MessageDigest.getInstance("SHA-256").digest(library.readBytes())
                .joinToString("") { "%02x".format(it) } == profile.nativeSha256) {
                "Pizza native library differs from the verified unprotected profile"
            }
            return@execute
        }
        val restored = profile.resource("arm64-init.delta.gz").use {
            PizzaBootstrap.restoreNative(library.readBytes(), it)
        }
        library.writeBytes(restored)
    }
}

internal fun BytecodePatchContext.restorePizzaBootstrap() {
    val profile = PizzaProfiles.forPackage(packageMetadata)
    val strings = GZIPInputStream(profile.resource("strings.tsv.gz")).bufferedReader().use { reader ->
        reader.readLines().map { it.split('\t') }.groupBy { it[0] }
    }
    strings.forEach { (owner, rows) ->
        val holder = mutableClassDefBy(owner)
        val values = rows.associate { it[1] to String(Base64.getDecoder().decode(it[2]), Charsets.UTF_8) }
        requirePizza(holder.methods.isEmpty() && holder.fields.map { it.name }.toSet() == values.keys,
            "bootstrap string holder changed: $owner")
        holder.fields.forEach { field ->
            requirePizza(field.type == STRING && field.initialValue == null, "bootstrap constant already initialized")
            field.initialValue = MutableStringEncodedValue(ImmutableStringEncodedValue(values.getValue(field.name)))
        }
    }

    // Recover matching SDK behavior, including receivers and async provider tasks.
    val sdk = profile.resource("sdk-receivers.dex").use {
        DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(it.readBytes()))
    }
    sdk.classes.forEach { restoredClass ->
        val target = mutableClassDefBy(restoredClass.type)
        restoredClass.methods.forEach { replacement ->
            val old = target.methods.single { it.name == replacement.name &&
                it.parameterTypes == replacement.parameterTypes && it.returnType == replacement.returnType }
            requirePizza(old.calls("Lcom/pairip/VMRunner;", "invoke"), "SDK method changed or already restored")
            target.methods.remove(old)
            target.methods.add(MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions, replacement.implementation)))
        }
    }
}
