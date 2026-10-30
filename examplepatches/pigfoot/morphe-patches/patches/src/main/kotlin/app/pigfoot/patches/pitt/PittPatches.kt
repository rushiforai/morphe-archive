package app.pigfoot.patches.pitt

import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private val pittTarget = Compatibility(packageName = PITT_PACKAGE, name = "PiTT", apkFileType = ApkFileType.APKS,
    targets = listOf(AppTarget(PITT_VERSION, versionCodes = mapOf(SupportedAbi.ARM64_V8A to PITT_CODE), minSdk = 26)))

internal val pittInputPatch = bytecodePatch {
    execute {
        require(packageMetadata.packageName == PITT_PACKAGE) { "Unsupported PiTT package" }
        requirePittVersion(packageMetadata.versionName, packageMetadata.versionCode)
        for ((type, expected) in pittClassPins) {
            val definition = requireNotNull(classDefByOrNull(type)) { "Missing qualified PiTT class: $type" }
            require(definition.methods.none { it.name == PITT_SETTER }) { "PiTT local sponsored helper already exists" }
            require(pittClassHash(definition) == expected) { "Unsupported or already modified PiTT class: $type" }
        }
        val writers = mutableMapOf<String, Int>()
        classDefForEach { definition ->
            for (method in definition.methods) {
                val count = pittWriteIndices(method).size
                if (count > 0) require(writers.put(method.pittId(), count) == null) { "Duplicate PiTT writer" }
            }
        }
        requirePittWriterInventory(writers)
    }
}

val pittLocalSponsoredPatch = bytecodePatch(
    name = "PiTT local sponsored features",
    description = "Keep the qualified local sponsored state enabled for original ad suppression and IP-detail quota gates, and suppress only the false no-purchased-subscription expiry notice. Subscription UI may reflect this local override. Preserves receipt verification and network code; does not create purchases, valid receipts, backend subscription rights or a zero-telemetry guarantee.",
    default = true
) {
    compatibleWith(pittTarget)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(pittInputPatch)
    execute {
        val replacements = pittWriterCounts.keys.map { id ->
            val owner = mutableClassDefBy(id.substringBefore("->"))
            val original = owner.methods.single { it.pittId() == id }
            val replacement = MutableMethod(original)
            redirectPittWrites(replacement)
            Triple(owner, original, replacement)
        }
        val state = mutableClassDefBy(PITT_STATE)
        require(state.methods.none { it.name == PITT_SETTER }) { "PiTT local sponsored helper already exists" }
        val setter = MutableMethod(pittSetterMethod())
        val noticeOwner = mutableClassDefBy(PITT_EXPIRY_NOTICE_OWNER)
        val originalNotice = noticeOwner.methods.single { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        val notice = MutableMethod(originalNotice)
        suppressPittExpiryNotice(notice)
        // Validate every replacement before attaching any changed method to its class.
        for ((owner, original, replacement) in replacements) {
            require(owner.methods.remove(original))
            require(owner.methods.add(replacement))
        }
        require(state.methods.add(setter))
        require(noticeOwner.methods.remove(originalNotice))
        require(noticeOwner.methods.add(notice))
    }
}

internal val pittGmsInputPatch = bytecodePatch {
    dependsOn(pittInputPatch)
    execute {
        for ((type, expected) in pittGmsClassPins) {
            val definition = requireNotNull(classDefByOrNull(type)) { "Missing qualified PiTT auth class: $type" }
            require(definition.methods.none { it.name == PITT_GOOGLE_PREPARE }) { "Existing PiTT Google login helper" }
            require(pittClassHash(definition) == expected) { "Unsupported or already modified PiTT auth class: $type" }
        }
        requirePittGmsBaseContract(classDefBy(PITT_GMS_BASE).methods)
        require(classDefBy(PITT_GMS_CLIENT).methods.none { it.name in pittGmsOverrideNames }) { "Existing PiTT auth override" }
    }
}

private val pittGmsResources = resourcePatch {
    dependsOn(pittGmsInputPatch)
    execute { document("AndroidManifest.xml").use { applyPittGmsManifest(it) } }
}

val pittGmsCorePatch = bytecodePatch(
    name = "PiTT Google account sign-in",
    description = "Enable Google-account sign-in to PiTT, not PTT BBS login. Reuse compatible app.revanced.android.gms (MicroG-RE 7.2.2 reference); guide missing/disabled MicroG only when starting Google login. No automatic sign-in or installation. Keeps PiTT package and original Google client; restores the original certificate metadata only in the qualified Firebase Auth HTTP header, preserving real Firebase verification; does not fabricate tokens, accounts or purchases.",
    default = true
) {
    compatibleWith(pittTarget)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(pittGmsInputPatch, pittGmsResources)
    execute {
        val replacements = (pittGmsStrings.keys + PITT_GMS_MODE + PITT_FIREBASE_HEADERS).map { id ->
            val owner = mutableClassDefBy(id.substringBefore("->"))
            val original = owner.methods.single { it.pittId() == id }
            val replacement = MutableMethod(original)
            when (id) {
                PITT_GMS_MODE -> selectPittLegacyGmsMode(replacement)
                PITT_FIREBASE_HEADERS -> restorePittFirebaseClientIdentity(replacement)
                else -> redirectPittGmsStrings(replacement)
            }
            Triple(owner, original, replacement)
        }
        val click = mutableClassDefBy(PITT_GOOGLE_CLICK)
        val originalClick = click.methods.single { it.pittId() == "$PITT_GOOGLE_CLICK->onClick(Landroid/view/View;)V" }
        val replacementClick = MutableMethod(originalClick)
        guardPittGoogleEntry(replacementClick)
        require(click.methods.none { it.name == PITT_GOOGLE_PREPARE }) { "Existing PiTT Google login helper" }
        val prepare = MutableMethod(pittGooglePrepareMethod())
        val client = mutableClassDefBy(PITT_GMS_CLIENT)
        require(client.methods.none { it.name in pittGmsOverrideNames }) { "Existing PiTT auth override" }
        val overrides = pittGmsClientOverrides().map(::MutableMethod)
        for ((owner, original, replacement) in replacements) {
            require(owner.methods.remove(original))
            require(owner.methods.add(replacement))
        }
        require(click.methods.remove(originalClick))
        require(click.methods.add(replacementClick))
        require(click.methods.add(prepare))
        overrides.forEach { require(client.methods.add(it)) }
    }
}
