package app.badfella.patches.ultimateusb

import app.badfella.patches.util.commitAll
import app.badfella.patches.util.loadDexHandles
import app.badfella.patches.util.resolveUniqueClass
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import java.security.MessageDigest
import java.nio.ByteBuffer
import java.nio.ByteOrder

@Suppress("unused")
val ultimateUsbProPatch = resourcePatch(
    name = "Ultimate USB local Pro",
    description = "Enables local Pro checks, skips the cached-purchase validator and permits local bytecode/signing changes in the native integrity state. Retains operation confirmations and USB/filesystem operations. Reviewed on 12.5.0 build 1205000 ARM64; changed bytecode or native drivers require review. Does not create a Google Play purchase.",
) {
    compatibleWith(Compatibility(
        name = "Ultimate USB", packageName = "com.mixapplications.ultimateusb",
        apkFileType = ApkFileType.APKS,
        targets = listOf(AppTarget(version = "12.5.0",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1205000))),
    ))
    execute {
        val actual = MessageDigest.getInstance("SHA-256").digest(get("classes5.dex").readBytes())
            .joinToString("") { "%02x".format(it) }
        check(actual == "fb443ec0fbf1e2966779ea507b26ff158d2159810762d259e738edce135ea436") { "Ultimate USB classes5.dex changed; this APK needs review" }
        val nativeFile = get("lib/arm64-v8a/libmixapplications.so")
        val native = nativeFile.readBytes()
        val nativeHash = MessageDigest.getInstance("SHA-256").digest(native)
            .joinToString("") { "%02x".format(it) }
        check(nativeHash == "0d8ddb95ca3df6eea13a4537c4b4848973298933e7719a90a8e5c4d7c9615824") {
            "Ultimate USB ARM64 native driver changed; this APK needs review"
        }
        val image = ByteBuffer.wrap(native).order(ByteOrder.LITTLE_ENDIAN)
        // Re-signing and DEX edits must not leave the native USB initialisation or shared integrity flags blocking USB/filesystem calls.
        for ((offset, before, after) in listOf(
            Triple(0x3cf9b8, 0x14000007, 0x14000056),
            Triple(0x3d4a44, 0x54005041, 0xd503201f.toInt()),
            Triple(0x576c60, 0xd503245f.toInt(), 0xd65f03c0.toInt()),
        )) {
            check(image.getInt(offset) == before) { "Unexpected Ultimate USB native instruction at $offset" }
            image.putInt(offset, after)
        }
        val dexes = loadDexHandles(this)
        val (handle, owner) = dexes.resolveUniqueClass("Lc81;")
        var changed = 0
        val methods = owner.methods.map { method ->
            val implementation = when {
                method.name == "d" && method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                    check(method.accessFlags == 9)
                    ImmutableMethodImplementation(1, listOf(
                        ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                        ImmutableInstruction11x(Opcode.RETURN, 0)), emptyList(), emptyList())
                }
                method.name == "f" && method.parameterTypes.map { it.toString() } == listOf("Lfm1;") &&
                    method.returnType == "Ljava/lang/Object;" -> {
                    check(method.accessFlags == 17)
                    // The validator precedes the Pro predicate; retain the caller's operation confirmations.
                    ImmutableMethodImplementation(3, listOf(
                        ImmutableInstruction21c(Opcode.SGET_OBJECT, 0,
                            ImmutableFieldReference("Lkotlin/Unit;", "a", "Lkotlin/Unit;")),
                        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), emptyList(), emptyList())
                }
                else -> return@map method
            }
            checkNotNull(method.implementation)
            changed++
            ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions, implementation)
        }
        check(changed == 2) { "Expected two Ultimate USB entitlement methods, found $changed" }
        handle.replaceClass(owner, ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass,
            owner.interfaces, owner.sourceFile, owner.annotations, owner.fields, methods))
        dexes.commitAll()
        nativeFile.writeBytes(native)
    }
}
