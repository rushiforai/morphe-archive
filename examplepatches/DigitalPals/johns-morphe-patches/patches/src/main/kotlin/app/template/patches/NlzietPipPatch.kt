package app.template.patches

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ACTIVITY = "Lnl/nlziet/mobile/app/di/mobile/InjectActivity;"
private const val FRAGMENT = "Lnl/nlziet/mobile/presentation/ui/player/PlayerFragment;"
private const val VIEW = "Lcom/bitmovin/player/PlayerView;"
private const val EXT = "Lnl/nlziet/pip/NativePip;"

private fun PackageMetadata.requireInspectedVersion() {
    if (packageName != "nl.nlziet" || versionName != "5.15.3" || versionCode != "740503") {
        throw PatchException("Native PiP requires inspected nl.nlziet 5.15.3 (740503); got $packageName $versionName ($versionCode)")
    }
}

private val pipManifestPatch = resourcePatch {
    execute {
        packageMetadata.requireInspectedVersion()
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("activity")
            val matches = (0 until nodes.length).map { nodes.item(it) as org.w3c.dom.Element }
                .filter { it.getAttribute("android:name") == "nl.nlziet.mobile.app.di.mobile.InjectActivity" }
            val activity = matches.singleOrNull() ?: throw PatchException("Expected exactly one InjectActivity manifest entry; found ${matches.size}")
            if (activity.getAttribute("android:launchMode") != "singleTask") {
                throw PatchException("Unexpected InjectActivity launchMode")
            }
            // Morphe Document uses a namespace-unaware DOM parser; use qualified attribute names.
            activity.setAttribute("android:supportsPictureInPicture", "true")
            val changes = activity.getAttribute("android:configChanges").split('|').toMutableSet()
            changes.addAll(listOf("orientation", "screenSize", "smallestScreenSize", "screenLayout"))
            activity.setAttribute("android:configChanges", changes.joinToString("|"))
        }
    }
}

private fun BytecodePatchContext.target(type: String, name: String, parameters: List<String> = emptyList(), result: String = "V"): Method {
    val cls = classDefByOrNull(type) ?: throw PatchException("Missing inspected class $type")
    return cls.methods.filter { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result }
        .singleOrNull() ?: throw PatchException("Missing or ambiguous inspected method $type->$name(${parameters.joinToString("")})$result")
}

private fun Method.calls(reference: String): List<Int> = implementation?.instructions?.mapIndexedNotNull { index, instruction ->
    if ((instruction as? ReferenceInstruction)?.reference?.toString() == reference) index else null
} ?: emptyList()

@Suppress("unused")
val nlzietPipPatch = bytecodePatch(
    name = "NLZIET native picture-in-picture",
    description = "Enable Android PiP on Home/Recents during active local playback. Experimental until device playback is verified.",
) {
    compatibleWith(Compatibility(
        name = "NLZIET", packageName = "nl.nlziet", apkFileType = ApkFileType.APKM,
        appIconColor = 0xff407c,
        targets = listOf(AppTarget(version = "5.15.3", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 740503), isExperimental = true, minSdk = 29)),
    ))
    dependsOn(pipManifestPatch)
    extendWith("extensions/extension.mpe")
    execute {
        packageMetadata.requireInspectedVersion()
        val activity = classDefByOrNull(ACTIVITY) ?: throw PatchException("Missing inspected playback activity")
        if (activity.superclass != "Lfi5;") throw PatchException("Unexpected InjectActivity superclass")
        // Resolve every target before mutating. Exact descriptors come from the supplied APK.
        val resume = target(ACTIVITY, "onResume")
        val pause = target(FRAGMENT, "onPause")
        val stop = target(FRAGMENT, "onStop")
        target(FRAGMENT, "onDestroyView")
        target("Lfi5;", "getCurrentFragment", result = "Landroidx/fragment/app/o;")
        val pauseIndex = pause.calls("$VIEW->onPause()V").singleOrNull()
            ?: throw PatchException("Expected exactly one PlayerView.onPause call in PlayerFragment.onPause")
        if (stop.calls("$VIEW->onStop()V").size != 1 || stop.calls("Lcom/bitmovin/player/api/Player;->unload()V").size != 1) {
            throw PatchException("Unexpected PlayerFragment stop/unload lifecycle")
        }
        if (resume.calls("Lfi5;->onResume()V").size != 1) throw PatchException("Unexpected InjectActivity resume lifecycle")
        listOf("onUserLeaveHint", "onPictureInPictureModeChanged").forEach { name ->
            var type: String? = ACTIVITY
            // u61 is the inspected AndroidX ComponentActivity; retain its listener dispatch
            // with invoke-super. No app-specific override may be silently replaced.
            while (type != null && type != "Lu61;") {
                val cls = classDefByOrNull(type) ?: break
                if (cls.methods.any { it.name == name }) throw PatchException("Unexpected existing $name override in $type")
                type = cls.superclass
            }
            if (type != "Lu61;") throw PatchException("Unexpected activity framework hierarchy")
        }
        target("Lu61;", "onUserLeaveHint")
        target("Lu61;", "onPictureInPictureModeChanged", listOf("Z", "Landroid/content/res/Configuration;"))
        // Validate reflective runtime SDK entry points before merging them into the app.
        val api = "Lcom/bitmovin/player/api/Player;"
        target(VIEW, "getPlayer", result = api)
        target(VIEW, "onPictureInPictureModeChanged", listOf("Z", "Landroid/content/res/Configuration;"))
        target(VIEW, "setPictureInPictureHandler", listOf("Lcom/bitmovin/player/api/ui/PictureInPictureHandler;"))
        target("Lcom/bitmovin/player/ui/DefaultPictureInPictureHandler;", "<init>", listOf("Landroid/app/Activity;", api))
        target(api, "isPlaying", result = "Z")
        target(api, "isDestroyed", result = "Z")
        target("Lcom/bitmovin/player/api/casting/RemoteControlApi;", "isCasting", result = "Z")
        target(api, "getSource", result = "Lcom/bitmovin/player/api/source/Source;")

        val mutable = mutableClassDefBy(ACTIVITY)
        fun addCallback(name: String, params: List<String>, body: String) {
            val method = ImmutableMethod(ACTIVITY, name,
                params.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
                AccessFlags.PUBLIC.value, emptySet(), emptySet(),
                ImmutableMethodImplementation(1 + params.size, emptyList(), emptyList(), emptyList())).toMutable()
            method.addInstructions(0, body)
            mutable.methods.add(method)
        }
        addCallback("onUserLeaveHint", emptyList(), """
            invoke-super {p0}, Lfi5;->onUserLeaveHint()V
            invoke-static {p0}, $EXT->onUserLeaveHint(Landroid/app/Activity;)V
            return-void
        """)
        addCallback("onPictureInPictureModeChanged", listOf("Z", "Landroid/content/res/Configuration;"), """
            invoke-super {p0, p1, p2}, Lfi5;->onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V
            invoke-static {p0, p1, p2}, $EXT->onModeChanged(Landroid/app/Activity;ZLandroid/content/res/Configuration;)V
            return-void
        """)
        mutable.methods.single { it.name == "onResume" && it.parameterTypes.isEmpty() }.addInstructions(
            resume.implementation!!.instructions.count() - 1,
            "invoke-static {p0}, $EXT->onResume(Landroid/app/Activity;)V",
        )
        val mutablePause = mutableClassDefBy(FRAGMENT).methods.single { it.name == "onPause" && it.parameterTypes.isEmpty() }
        // The inspected call uses v0; reject any other register/encoding rather than assuming it.
        val call = mutablePause.implementation!!.instructions[pauseIndex]
        val registers = call as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        if (registers?.registerCount != 1 || registers.registerC != 0) throw PatchException("Unexpected PlayerView.onPause call register")
        mutablePause.replaceInstruction(pauseIndex, "invoke-static {v0}, $EXT->onPlayerPause(Ljava/lang/Object;)V")
    }
}
