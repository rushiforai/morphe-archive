package app.template.patches.coffeebusiness

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
internal object CoffeeBootstrap {
    fun restoreNative(original: ByteArray, delta: InputStream): ByteArray =
        DataInputStream(GZIPInputStream(delta)).use { input ->
            val digest = MessageDigest.getInstance("SHA-256")
            require(input.readInt() == 0x505a4232) { "Invalid Coffee native delta" }
            val expectedInput = ByteArray(32).also(input::readFully)
            val expectedOutput = ByteArray(32).also(input::readFully)
            require(digest.digest(original).contentEquals(expectedInput)) {
                "Coffee native initialization requires a matching clean ARM64 library."
            }
            val size = input.readInt()
            require(size in 1..128 * 1024 * 1024) { "Invalid Coffee library size" }
            val output = ByteArray(size)
            var position = 0
            val count = input.readInt()
            require(count in 1..size) { "Invalid Coffee delta operation count" }
            repeat(count) {
                when (input.readUnsignedByte()) {
                    0 -> {
                        val length = input.readInt()
                        require(length in 1..(size - position)) { "Invalid Coffee literal length" }
                        input.readFully(output, position, length)
                        position += length
                    }
                    1 -> {
                        val source = input.readInt()
                        val length = input.readInt()
                        require(source in 0..original.size && length in 1..(original.size - source) &&
                            length <= size - position) { "Invalid Coffee copy range" }
                        original.copyInto(output, position, source, source + length)
                        position += length
                    }
                    else -> throw PatchException("Invalid Coffee delta operation")
                }
            }
            require(position == size && input.read() == -1 && digest.digest(output).contentEquals(expectedOutput)) {
                "Coffee native reconstruction is incomplete or corrupt"
            }
            output
        }
}

internal val coffeeNativeBootstrap = rawResourcePatch {
    execute {
        val profile = CoffeeProfiles.forPackage(packageMetadata)
        listOf("assets/bin/Data/datapack.unity3d", "assets/bin/Data/data.unity3d", "assets/aa/settings.json").forEach {
            if (!get(it).isFile) throw PatchException("Coffee requires all Unity asset-pack splits: $it")
        }
        get("assets/morphe/coffee-asset-packs.tsv.gz").apply {
            parentFile.mkdirs()
            writeBytes(profile.resource("asset-packs.tsv.gz").use { it.readBytes() })
        }
        listOf("libunity.so", "libil2cpp.so").forEach { name ->
            val library = get("lib/arm64-v8a/$name")
            if (!library.isFile) throw PatchException("Coffee startup requires the complete ARM64 APKM.")
            if (profile.protectedInitialization) {
                library.writeBytes(profile.resource("$name.delta.gz").use {
                    CoffeeBootstrap.restoreNative(library.readBytes(), it)
                })
            }
        }
    }
}

internal fun BytecodePatchContext.restoreCoffeeBootstrap() {
    val profile = CoffeeProfiles.forPackage(packageMetadata)
    // Restore stock Fyber 8.4.6, Ad Quality 9.9.0 and Singular 12.6.1 callbacks.
    // Restore their SDK behavior, including initialization, instead of no-oping them.
    checkCoffee(coffeeMethod("Lcom/singular/sdk/internal/Constants;", "<clinit>", emptyList(), "V")
        .hasString("Singular/v12.6.1"), "Singular SDK version changed")
    val sdk = profile.resource("sdk-receivers.dex").use {
        DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(it.readBytes()))
    }
    sdk.classes.forEach { cls ->
        val target = mutableClassDefBy(cls.type)
        cls.methods.forEach { replacement ->
            val old = target.methods.single { it.name == replacement.name &&
                it.parameterTypes == replacement.parameterTypes && it.returnType == replacement.returnType }
            checkCoffee(old.calls("Lcom/pairip/VMRunner;", "invoke"), "SDK receiver changed or already restored")
            target.methods.remove(old)
            target.methods.add(MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions, replacement.implementation)))
        }
    }
    val strings = GZIPInputStream(profile.resource("strings.tsv.gz")).bufferedReader().use {
        it.readLines().map { row -> row.split('\t') }.groupBy { row -> row[0] }
    }
    strings.forEach { (owner, rows) ->
        val holder = mutableClassDefBy(owner)
        checkCoffee(holder.methods.isEmpty(), "constant holder changed: $owner")
        rows.forEach { row ->
            val field = holder.fields.single { it.name == row[1] && it.type == STRING }
            checkCoffee(field.initialValue == null, "constant already initialized")
            field.initialValue = MutableStringEncodedValue(ImmutableStringEncodedValue(
                String(Base64.getDecoder().decode(row[2]), Charsets.UTF_8)))
        }
    }
    // Static recovered wrappers take their receiver as the first parameter.
    // Their register layout is identical to the original instance method.
    val dex = profile.resource("startup-methods.dex").use {
        DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(it.readBytes()))
    }
    dex.classes.forEach { cls ->
        val target = mutableClassDefBy(cls.type.substringBefore("$" ) + ";")
        cls.methods.filter { it.name != "<init>" }.forEach { replacement ->
            val old = target.methods.single { it.name == replacement.name &&
                it.parameterTypes == replacement.parameterTypes.drop(1) && it.returnType == replacement.returnType }
            checkCoffee(old.calls("Ljava/lang/reflect/Method;", "invoke"), "startup wrapper changed")
            target.methods.remove(old)
            target.methods.add(MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions, replacement.implementation)))
        }
    }
}
