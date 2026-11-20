package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Any app with an Android media browser service as a Waze audio partner.
 *
 * Waze normally only talks to apps that ship its own SDK and answer the `com.waze.sdk.audio.ACTION_INIT`
 * broadcast. This row skips that contract in three places:
 *
 *  1. the package is appended to the four server arrays Waze turns into partner entries, with the
 *     audio-only scope `0x200000` (no transport flags, so Waze never asks for navigation data);
 *  2. Waze's "is this partner installed" check answers yes for the configured package;
 *  3. when Waze connects, the entry is registered straight away instead of waiting for a callback
 *     that will never come.
 *
 * Playback then rides on the app's own `MediaBrowserService`, the same path Android Auto uses, so the
 * app needs nothing from Waze.
 *
 * TECHNIQUE: the three-step approach is pomee4's (`pomee4/waze-audio-patches`, row "Add custom audio
 * app"). This is an independent implementation of it inside our own bundle; the fingerprints, the
 * register call assembly and the guards are ours.
 */

/** Audio-only scope flag (`SdkConfiguration`). No transport bits, so no partner consent dialog. */
private const val SCOPE_AUDIO = 0x200000

/** Accent Waze paints the entry with; a real value also avoids a resource lookup. */
private const val THEME_COLOR = 0xFF1DB954.toInt()

private const val SDK_CONFIGURATION = "Lcom/waze/sdk/SdkConfiguration;"

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z]\\w*(\\.[a-zA-Z]\\w*)+$")

internal val audioAppPackageOption = stringOption(
    key = "audioApp",
    default = "com.music.bitchord",
    title = "Audio app package name",
    description = "Package of the app Waze should offer. It must expose a media browser service, " +
        "the same one Android Auto uses (BitChord, myspoti and other media clients do).",
    required = true,
) { it != null && it.matches(PACKAGE_NAME_REGEX) }

internal val audioAppNameOption = stringOption(
    key = "audioAppName",
    default = "BitChord",
    title = "Audio app name",
    description = "Name Waze shows for that app.",
    required = true,
) { !it.isNullOrBlank() }

/** Android 11+ package visibility: Waze cannot find a browser service in an app it cannot see. */
private val audioAppVisibilityPatch = resourcePatch {
    execute {
        val packageName = audioAppPackageOption.value!!
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val queries = document.getElementsByTagName("queries").item(0) as Element?
                ?: document.createElement("queries").also { manifest.appendChild(it) }
            val declared = (0 until queries.childNodes.length)
                .map { queries.childNodes.item(it) }
                .filterIsInstance<Element>()
                .any { it.getAttribute("android:name") == packageName }
            if (!declared) {
                queries.appendChild(
                    document.createElement("package").apply { setAttribute("android:name", packageName) },
                )
                println("customAudioAppPatch: declared $packageName in <queries>")
            }
        }
    }
}

/** `updateAppList()`: rebuilds the partner map from the server arrays; absent on 5.27.9x. */
private object CustomAppListFingerprint : Fingerprint(
    definingClass = SDK_CONFIGURATION,
    name = "updateAppList",
    returnType = "V",
    parameters = listOf(),
)

/** `getPartners()`: assembles the roster on 5.27.9x. */
private object CustomPartnersFingerprint : Fingerprint(
    definingClass = SDK_CONFIGURATION,
    name = "getPartners",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

/**
 * Connects to an audio partner:
 *
 * ```java
 * final boolean e(String packageName, String token, Runnable onTimeout) {
 *     boolean spotify = "com.spotify.music".equals(packageName);
 *     Intent intent = g(packageName, token);
 *     ...
 *     handler.postDelayed(onTimeout, 15000L);
 * }
 * ```
 */
private object ConnectAudioPartnerFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Runnable;"),
    filters = listOf(
        string("com.spotify.music"),
        literal(15000L),
    ),
)

/** Same class: whether a partner answered the `ACTION_INIT` broadcast. */
private object IsAudioPartnerInstalledFingerprint : Fingerprint(
    classFingerprint = ConnectAudioPartnerFingerprint,
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = "this", returnType = "Landroid/content/Intent;"),
        methodCall(
            definingClass = "this",
            parameters = listOf("Landroid/content/Intent;"),
            returnType = "Z",
        ),
    ),
)

/**
 * Called when a partner app binds to `com.waze.sdk.SdkService` and registers itself:
 * `boolean P(Resources, String packageName, String token, Bundle options, Messenger messenger)`.
 */
private object RegisterAudioPartnerFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/res/Resources;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
        "Landroid/os/Messenger;",
    ),
    filters = listOf(
        methodCall(definingClass = SDK_CONFIGURATION, name = "getAppConfig"),
        methodCall(definingClass = SDK_CONFIGURATION, name = "isWhiteListed"),
    ),
)

/**
 * `aw.g(Context)`: whether this partner is installed. `getPartnerAudioApps` drops any entry that
 * answers false here, so a package without Waze's `ACTION_INIT` receiver never reaches the list even
 * when the roster arrays contain it.
 */
private object PartnerInstalledFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sdk/aw;",
    name = "g",
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("com.spotify.music")),
)

/** `getPartnerAudioApps(Context, boolean)`: the list the audio partner screen renders. */
private object AudioAppsListFingerprint : Fingerprint(
    definingClass = SDK_CONFIGURATION,
    name = "getPartnerAudioApps",
    isStatic = true,
    returnType = "Ljava/util/List;",
    parameters = listOf("Landroid/content/Context;", "Z"),
)

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.isStaticMethod() = AccessFlags.STATIC.isSet(accessFlags)

@Suppress("unused")
val customAudioAppPatch = bytecodePatch(
    name = "Any audio app as a Waze audio partner",
    description = "Adds a music app of your choice to Waze's audio player, even though it does not " +
        "ship Waze's SDK. It only needs a media browser service, like Android Auto. Default: BitChord.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(audioAppVisibilityPatch)
    dependsOn(configOverridesPatch)

    audioAppPackageOption()
    audioAppNameOption()

    execute {
        val packageName = audioAppPackageOption.value!!
        val appName = audioAppNameOption.value!!

        // region 1: append the package to the arrays Waze turns into partner entries.

        val configClass = mutableClassDefBy(SDK_CONFIGURATION)
        val implementation: MutableMethodImplementation
        val host: com.android.tools.smali.dexlib2.iface.Method
        val instance: String
        val registers: Triple<Int, Int, Int>
        val insertIndex: Int

        val partnersMethod = configClass.methods.firstOrNull {
            it.name == "getPartners" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;"
        }
        if (partnersMethod != null) {
            host = partnersMethod
            implementation = partnersMethod.implementation
                ?: throw PatchException("customAudioAppPatch: getPartners() has no body")
            instance = "p0"
            registers = Triple(5, 6, 7)
            // Must land before `array-length`, not before `new-array`: getPartners sizes the au[]
            // from the length it read off PackageNames, so appending after that read adds an entry
            // the loop never copies.
            insertIndex = implementation.instructions.indexOfFirst { it.opcode == Opcode.ARRAY_LENGTH }
            if (insertIndex < 0) throw PatchException(
                "customAudioAppPatch: getPartners() no longer measures the partner arrays"
            )
        } else {
            host = configClass.methods.firstOrNull { it.name == "updateAppList" }
                ?: throw PatchException(
                    "customAudioAppPatch: neither getPartners() nor updateAppList() is present"
                )
            implementation = host.implementation
                ?: throw PatchException("customAudioAppPatch: updateAppList() has no body")
            val instructions = implementation.instructions
            val configIndex = instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.contains("configGetSdkConfigurationNTV") == true
            }
            if (configIndex < 0) throw PatchException(
                "customAudioAppPatch: updateAppList() no longer fetches the SDK configuration"
            )
            instance = "v" + host.getInstruction<OneRegisterInstruction>(configIndex + 1).registerA
            registers = Triple(10, 9, 8)
            val hashMapIndex = instructions.drop(configIndex).indexOfFirst { instruction ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    (instruction as? ReferenceInstruction)?.reference?.toString()
                        ?.contains("Ljava/util/HashMap;") == true
            }
            if (hashMapIndex < 0) throw PatchException(
                "customAudioAppPatch: updateAppList() no longer builds its app config map"
            )
            insertIndex = configIndex + hashMapIndex
        }
        if (implementation.registerCount <= registers.third) throw PatchException(
            "customAudioAppPatch: ${host.name} has only ${implementation.registerCount} registers"
        )

        val (rArray, rIndex, rValue) = registers
        fun stringArray(field: String, values: List<String>): String = buildString {
            append("iget-object v$rArray, $instance, $SDK_CONFIGURATION->$field:[Ljava/lang/String;\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, ${values.size}\n")
            append("invoke-static {v$rArray, v$rIndex}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;\n")
            append("move-result-object v$rArray\n")
            append("check-cast v$rArray, [Ljava/lang/String;\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, -${values.size}\n")
            values.forEachIndexed { position, value ->
                if (position > 0) append("add-int/lit8 v$rIndex, v$rIndex, 0x1\n")
                append("const-string v$rValue, \"$value\"\n")
                append("aput-object v$rValue, v$rArray, v$rIndex\n")
            }
            append("iput-object v$rArray, $instance, $SDK_CONFIGURATION->$field:[Ljava/lang/String;\n")
        }
        fun intArray(field: String, values: List<Int>): String = buildString {
            append("iget-object v$rArray, $instance, $SDK_CONFIGURATION->$field:[I\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, ${values.size}\n")
            append("invoke-static {v$rArray, v$rIndex}, Ljava/util/Arrays;->copyOf([II)[I\n")
            append("move-result-object v$rArray\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, -${values.size}\n")
            values.forEachIndexed { position, value ->
                if (position > 0) append("add-int/lit8 v$rIndex, v$rIndex, 0x1\n")
                append("const v$rValue, 0x${value.toString(16)}\n")
                append("aput v$rValue, v$rArray, v$rIndex\n")
            }
            append("iput-object v$rArray, $instance, $SDK_CONFIGURATION->$field:[I\n")
        }

        host.addInstructions(
            insertIndex,
            buildString {
                append(stringArray("PackageNames", listOf(packageName)))
                append(stringArray("AppNames", listOf(appName)))
                append(stringArray("InstallationUrls", listOf("https://play.google.com/store/apps/details?id=$packageName")))
                append(intArray("Scopes", listOf(SCOPE_AUDIO)))
            }.trimIndent(),
        )
        println("customAudioAppPatch: appended $packageName to Waze's partner arrays inside ${host.name}")

        // endregion

        // region 1b: put the entry straight into the map the list is built from.

        // The arrays feed getPartners() on 5.27.9x, but that list is cached and the map is built once;
        // writing the entry into appConfigs as well removes every dependency on that ordering branch.
        if (partnersMethod != null) {
            val updateMethod = configClass.methods.firstOrNull { it.name == "updateAppList" }
                ?: throw PatchException("customAudioAppPatch: updateAppList() is missing")
            val updateImpl = updateMethod.implementation
                ?: throw PatchException("customAudioAppPatch: updateAppList() has no body")
            val putIndex = updateImpl.instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.contains("savePackageScopesToSharedPref") == true
            }
            if (putIndex < 0) throw PatchException(
                "customAudioAppPatch: updateAppList() no longer saves the package scopes"
            )
            updateMethod.apply {
                addInstructions(
                    putIndex,
                    """
                        sget-object v3, Lcom/waze/sdk/SdkConfiguration;->appConfigs:Ljava/util/Map;
                        new-instance v4, Lcom/waze/sdk/aw;
                        const-string v5, "$packageName"
                        const-string v6, "$appName"
                        const v7, 0x200000
                        const-string v8, "https://play.google.com/store/apps/details?id=$packageName"
                        const/4 v9, 0x0
                        invoke-direct/range { v4 .. v9 }, Lcom/waze/sdk/aw;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)V
                        invoke-interface { v3, v5, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    """.trimIndent(),
                )
            }
            println("customAudioAppPatch: $packageName inserted into appConfigs directly")
        }

        // region 1c: guarantee the entry in the list the screen actually renders.

        // getPartnerAudioApps() is the render path. Putting the entry into appConfigs here means the row
        // shows up even if updateAppList() has not run yet in this process.
        try {
            val originalList = AudioAppsListFingerprint.originalMethod.implementation
                ?: throw PatchException("customAudioAppPatch: getPartnerAudioApps() has no body")
            if (originalList.registerCount - 2 < 7) throw PatchException(
                "customAudioAppPatch: getPartnerAudioApps() has only ${originalList.registerCount - 2} local registers"
            )
            // Read the shape from the original body: the mutable copy does not always expose the same
            // opcode list, which is how the monitor-enter lookup came back empty.
            val monitorIndex = originalList.instructions
                .indexOfFirst { it.opcode == Opcode.MONITOR_ENTER }
            if (monitorIndex < 0) throw PatchException(
                "customAudioAppPatch: getPartnerAudioApps() lost its monitor"
            )
            AudioAppsListFingerprint.method.apply {
                addInstructions(
                    0,
                    """
                        sget-object v0, Lcom/waze/sdk/SdkConfiguration;->appConfigs:Ljava/util/Map;
                        if-nez v0, :hasMap
                        new-instance v0, Ljava/util/HashMap;
                        invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
                        sput-object v0, Lcom/waze/sdk/SdkConfiguration;->appConfigs:Ljava/util/Map;
                        :hasMap
                        new-instance v1, Lcom/waze/sdk/aw;
                        const-string v2, "$packageName"
                        const-string v3, "$appName"
                        const v4, 0x200000
                        const-string v5, "https://play.google.com/store/apps/details?id=$packageName"
                        const/4 v6, 0x0
                        invoke-direct/range { v1 .. v6 }, Lcom/waze/sdk/aw;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)V
                        invoke-interface { v0, v2, v1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    """.trimIndent(),
                )
            }
            println("customAudioAppPatch: $packageName inserted into the audio partner list itself")
        } catch (e: PatchException) {
            println("customAudioAppPatch: getPartnerAudioApps() skipped: ${e.message}")
        }

        // region 2: answer "installed" for this package without its ACTION_INIT receiver.

        // The mutable copy reports a padded frame; the original method carries the real one, and an
        // oversized register here is a VerifyError at class load, not a patch error.
        val installedFrame = IsAudioPartnerInstalledFingerprint.originalMethod.implementation?.registerCount
            ?: throw PatchException("customAudioAppPatch: installed check has no body")
        if (installedFrame < 2) throw PatchException(
            "customAudioAppPatch: installed check has only $installedFrame registers"
        )
        IsAudioPartnerInstalledFingerprint.method.apply {
            val registerCount = installedFrame
            val thisRegister = registerCount - 2
            val packageNameRegister = registerCount - 1
            val freeRegister = if (thisRegister > 0) {
                0
            } else {
                val first = getInstruction<OneRegisterInstruction>(0)
                if (first.opcode !in listOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) ||
                    first.registerA != thisRegister
                ) {
                    throw PatchException(
                        "customAudioAppPatch: no free register in the installed check"
                    )
                }
                thisRegister
            }
            addInstructionsWithLabels(
                0,
                """
                    const-string v$freeRegister, "$packageName"
                    invoke-virtual { v$freeRegister, v$packageNameRegister }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v$freeRegister
                    if-eqz v$freeRegister, :original
                    return v$freeRegister
                """.trimIndent(),
                ExternalLabel("original", getInstruction(0)),
            )
        }
        println("customAudioAppPatch: $packageName reports as installed")

        // endregion

        // region 2b: make the entry survive the list filter.

        // getPartnerAudioApps() drops a partner whose aw.g(Context) is false, and that check looks for
        // the ACTION_INIT receiver. We bypass it for this one package. The class only exists on 5.27.9x
        // (5.27.4.900 keeps the check elsewhere), so an absent fingerprint is not an error.
        try {

            val installedFrameAw = PartnerInstalledFingerprint.originalMethod.implementation?.registerCount
                ?: throw PatchException("customAudioAppPatch: partner installed check has no body")
            if (installedFrameAw - 2 < 2) throw PatchException(
                "customAudioAppPatch: partner installed check has ${installedFrameAw - 2} local registers"
            )
            PartnerInstalledFingerprint.method.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        iget-object v0, p0, Lcom/waze/sdk/aw;->a:Ljava/lang/String;
                        const-string v1, "$packageName"
                        invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :original
                        const/4 v0, 0x1
                        return v0
                    """.trimIndent(),
                    ExternalLabel("original", getInstruction(0)),
                )
            }
            println("customAudioAppPatch: $packageName survives the audio partner list filter")

            // endregion

        } catch (e: PatchException) {
            println("customAudioAppPatch: no aw.g(Context) on this base, relying on the installed check")
        }

        // region 3: register the app on connect instead of waiting for the SDK callback.

        val registerMethod = RegisterAudioPartnerFingerprint.originalMethod
        val sdkManagerClass = RegisterAudioPartnerFingerprint.originalClassDef
        val sdkManagerGetter = sdkManagerClass.methods.singleOrNull { method ->
            method.isStaticMethod() && method.parameterTypes.isEmpty() &&
                method.returnType == sdkManagerClass.type
        } ?: throw PatchException("customAudioAppPatch: no SDK manager singleton getter")

        val connectClass = ConnectAudioPartnerFingerprint.originalClassDef
        if (AccessFlags.PRIVATE.isSet(registerMethod.accessFlags) &&
            sdkManagerClass.type.substringBeforeLast('/') != connectClass.type.substringBeforeLast('/')
        ) {
            throw PatchException(
                "customAudioAppPatch: the register method is private to another package"
            )
        }

        val connectFrame = ConnectAudioPartnerFingerprint.originalMethod.implementation?.registerCount
            ?: throw PatchException("customAudioAppPatch: connect has no body")
        ConnectAudioPartnerFingerprint.method.apply {
            val registerCount = connectFrame
            val localCount = registerCount - 4
            if (localCount < 2) throw PatchException(
                "customAudioAppPatch: not enough registers in the connect method"
            )
            val manager = localCount - 2
            val resources = localCount - 1
            val pkg = localCount
            val token = localCount + 1
            val options = localCount + 2
            val messenger = localCount + 3
            val packageNameParam = localCount + 1
            val tokenParam = localCount + 2
            if (messenger >= registerCount) throw PatchException(
                "customAudioAppPatch: connect needs v$messenger but only has $registerCount registers"
            )

            addInstructionsWithLabels(
                0,
                """
                    const-string v$manager, "$packageName"
                    invoke-virtual { v$manager, v$packageNameParam }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v$manager
                    if-eqz v$manager, :original

                    move-object v$manager, v$packageNameParam
                    move-object v$resources, v$tokenParam
                    move-object v$pkg, v$manager
                    move-object v$token, v$resources

                    new-instance v$options, Landroid/os/Bundle;
                    invoke-direct { v$options }, Landroid/os/Bundle;-><init>()V
                    const-string v$messenger, "themeColor"
                    const v$manager, $THEME_COLOR
                    invoke-virtual { v$options, v$messenger, v$manager }, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
                    const/4 v$messenger, 0x0

                    invoke-static { }, ${sdkManagerGetter.toSmali()}
                    move-result-object v$manager
                    invoke-static { }, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;
                    move-result-object v$resources

                    invoke-virtual/range { v$manager .. v$messenger }, ${registerMethod.toSmali()}
                    move-result v$manager
                    return v$manager
                """.trimIndent(),
                ExternalLabel("original", getInstruction(0)),
            )
        }
        println("customAudioAppPatch: $packageName registers without the Waze SDK callback")

        // endregion
    }
}
