package app.pigfoot.patches.pikiewalker

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.shared.certificate.requireOriginalCertificate
import app.pigfoot.patches.shared.pairip.PAIRIP_LICENSE_OWNER
import app.pigfoot.patches.shared.pairip.preparePairipLicenseSkip
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest

internal const val PIKIE_PACKAGE = "com.kairosvector.pikiewalker"
internal const val PIKIE_OWNER = "Lcom/example/pikiewalker/data/AdManager;"
internal const val PIKIE_RESULT = "Lcom/example/pikiewalker/data/AdResult;"
internal const val PIKIE_LICENSE_PIN = "f08d2d194009abacb04324c4f8bdf00a9198048b9d7fd3a20866cbd8fc210c66"
internal const val PIKIE_SIGNER = "5f3dd3b2f97653a84e65f7b8fe58052944aabe4c"
internal val pikieClassPins = mapOf(
    PIKIE_OWNER to "aa77cf260c3813bf8f812c379d4158886db3b835ad2eee741adefb0e22ad5ee4",
    PIKIE_RESULT to "f20134a05254fa39afde599508394dc1e96aaad26822506c7ebf41e900466fe9"
)

internal fun requirePikieTarget(pkg: String?, version: String?, code: String?) {
    require(pkg == PIKIE_PACKAGE && version == "2.0.4" && code == "42") {
        "Unsupported PikieWalker package/version/build"
    }
}

internal fun pikieClassHash(definition: ClassDef): String {
    val pool = DexPool(Opcodes.forDexVersion(39))
    pool.internClass(definition)
    val store = MemoryDataStore()
    pool.writeTo(store)
    return MessageDigest.getInstance("SHA-256").digest(store.data).joinToString("") { "%02x".format(it) }
}

/** Called only after both original classes and input identity have passed. */
internal fun skipPikieRewardPlayback(method: MutableMethod) {
    require(method.definingClass == PIKIE_OWNER && method.name == "showAd" &&
        method.parameterTypes == listOf("Landroid/app/Activity;", "Lkotlin/jvm/functions/Function1;") &&
        method.returnType == "V" && method.accessFlags == 17) { "Unsupported PikieWalker ad entry" }
    val impl = requireNotNull(method.implementation)
    require(impl.registerCount == 13 && impl.tryBlocks.isEmpty()) { "Unsupported PikieWalker ad layout" }
    // p2 = v12. v0 is a qualified local, not the Activity/callback receiver.
    // Return immediately; never load/show an SDK ad or replay after a thrown callback.
    method.addInstructions(0, """
        sget-object v0, $PIKIE_RESULT->SUCCESS:$PIKIE_RESULT
        invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
        return-void
    """.trimIndent())
}

private val target = Compatibility(packageName = PIKIE_PACKAGE, name = "PikieWalker", apkFileType = ApkFileType.APKS,
    targets = listOf(AppTarget("2.0.4", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 42), minSdk = 32)))

internal val pikieInputPatch = bytecodePatch {
    execute {
        requirePikieTarget(packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode)
        requireOriginalCertificate(packageMetadata.signingCertificates.values.flatten(), PIKIE_SIGNER)
        for ((type, pin) in pikieClassPins) {
            val definition = requireNotNull(classDefByOrNull(type)) { "Missing PikieWalker class: $type" }
            require(pikieClassHash(definition) == pin) { "Unsupported or already modified PikieWalker class: $type" }
        }
    }
}

val pikieWalkerStartupPatch = bytecodePatch(
    name = "PikieWalker: Skip Google Play install check",
    description = "Let the patched app open without asking you to install it from Google Play. This patch is required and included automatically. Technical reference: Pairip client-side license check.",
    default = true
) {
    compatibleWith(target)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.REQUIRED }
    dependsOn(pikieInputPatch)
    execute {
        val definition = requireNotNull(classDefByOrNull(PAIRIP_LICENSE_OWNER)) { "Missing PikieWalker Pairip license class" }
        val replacement = preparePairipLicenseSkip(definition, PIKIE_LICENSE_PIN, 39)
        val owner = mutableClassDefBy(PAIRIP_LICENSE_OWNER)
        val original = owner.methods.single { it.name == replacement.name &&
            it.parameterTypes == replacement.parameterTypes && it.returnType == replacement.returnType }
        require(owner.methods.remove(original))
        require(owner.methods.add(replacement))
    }
}

val pikieWalkerRewardPatch = bytecodePatch(
    name = "PikieWalker rewards without video ads",
    description = "Skip reward videos and receive the normal in-app reward. Existing reward amounts and daily limits stay unchanged.",
    default = true
) {
    compatibleWith(target)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(pikieWalkerStartupPatch)
    execute {
        val owner = mutableClassDefBy(PIKIE_OWNER)
        val original = owner.methods.single { it.name == "showAd" &&
            it.parameterTypes == listOf("Landroid/app/Activity;", "Lkotlin/jvm/functions/Function1;") && it.returnType == "V" }
        val replacement = MutableMethod(original)
        skipPikieRewardPlayback(replacement)
        require(owner.methods.remove(original))
        require(owner.methods.add(replacement))
    }
}
