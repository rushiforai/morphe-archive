package app.template.patches.coffeebusiness

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import java.io.InputStream
import java.util.Properties

/** One profile owns compatibility, recovered initialization and reviewed native edits. */
internal class CoffeeProfile(val directory: String) {
    private val properties = Properties().apply { resource("profile.properties").use { load(it) } }
    val version: String = properties.getProperty("version")
    val versionCode: String = properties.getProperty("versionCode")
    val protectedInitialization: Boolean = properties.getProperty("protectedInitialization", "true").toBooleanStrict()
    val startupProgram: String? = properties.getProperty("startupProgram").also {
        require(!protectedInitialization || !it.isNullOrBlank()) { "Coffee $version requires a startup program" }
    }
    val gamesConnect: String = properties.getProperty("gamesConnect")
    val gamesService: String = properties.getProperty("gamesService")
    val gamesParent: String = properties.getProperty("gamesParent")
    val gamesBase: String = properties.getProperty("gamesBase", "Lyt;")
    val resolutionOwner: String = properties.getProperty("resolutionOwner")
    val retryOwner: String = properties.getProperty("retryOwner")
    val retryField: String = properties.getProperty("retryField", "d")
    val updateNoticeDelta: String? = properties.getProperty("updateNoticeDelta")
    val target = AppTarget(version = version,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to versionCode.toInt()),
        isExperimental = properties.getProperty("experimental").toBooleanStrict(),
        description = "Requires complete ARM64 APKM/XAPK initialization resources.")

    fun resource(name: String): InputStream = CoffeeProfiles::class.java
        .getResourceAsStream("/coffeebusiness/$directory/$name")
        ?: throw PatchException("Coffee $version bootstrap resource missing: $name")
}

internal object CoffeeProfiles {
    // The selected profiles embed byte-identical Firebase JNI classes. Keep one
    // extension in the app loader; VerifyCoffeeProfiles checks that invariant.
    val firebaseResource: String = "coffeebusiness/1.24.0/firebase-app.dex"
    val profiles: List<CoffeeProfile> = javaClass.getResourceAsStream("/coffeebusiness/profiles.txt")!!
        .bufferedReader().useLines { lines ->
            lines.filter { it.isNotBlank() && !it.startsWith("#") }.map(::CoffeeProfile).toList()
        }
    val compatibility = Compatibility(
        name = "Good Coffee, Great Coffee", packageName = "com.tapblaze.coffeebusiness",
        apkFileType = ApkFileType.APKM, appIconColor = 0x98704C,
        targets = profiles.map { it.target },
    )

    fun forPackage(metadata: PackageMetadata): CoffeeProfile = profiles.singleOrNull {
        metadata.packageName == "com.tapblaze.coffeebusiness" &&
            metadata.versionName == it.version && metadata.versionCode == it.versionCode
    } ?: throw PatchException("Coffee ${metadata.versionName} (${metadata.versionCode}) has no verified bootstrap profile. " +
        "Use a complete clean APKM/XAPK for a supported target; other builds need a reviewed version profile.")
}
