package dev.freeman022026.rustore.patches

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.rawResourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private val knownSourcePermissions = setOf(
    "android.permission.INSTALL_PACKAGES",
    "android.permission.REQUEST_INSTALL_PACKAGES",
    "android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION",
    "android.permission.ENFORCE_UPDATE_OWNERSHIP",
    "android.permission.INTERNET",
    "android.permission.ACCESS_NETWORK_STATE",
    "android.permission.ACCESS_WIFI_STATE",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.POST_NOTIFICATIONS",
    "android.permission.WAKE_LOCK",
    "com.android.permission.GET_INSTALLED_APPS",
    "android.permission.FOREGROUND_SERVICE",
    "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS",
    "android.permission.FOREGROUND_SERVICE_SPECIAL_USE",
    "android.permission.QUERY_ALL_PACKAGES",
    "android.permission.PACKAGE_USAGE_STATS",
    "android.permission.READ_PHONE_STATE",
    "android.permission.READ_CALL_LOG",
    "android.permission.DETECT_SCREEN_CAPTURE",
    "android.permission.READ_PHONE_NUMBERS",
    "android.provider.Telephony.SMS_RECEIVED",
    "android.permission.RECEIVE_BOOT_COMPLETED",
    "android.permission.CHANGE_WIFI_STATE",
    "android.permission.CHANGE_NETWORK_STATE",
    "com.google.android.c2dm.permission.RECEIVE",
    "android.permission.CALL_PHONE",
    "ru.sb.mobile.sid.BIND_PERSONALIZATION_SERVICE",
    "android.permission.REQUEST_DELETE_PACKAGES",
    "android.permission.ACCESS_FINE_LOCATION",
    "android.permission.ACCESS_COARSE_LOCATION",
    "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
    "android.permission.READ_BASIC_PHONE_STATE",
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "com.android.vending.BILLING",
    "ru.vk.store.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
    "android.permission.USB_HOST",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.WRITE_EXTERNAL_STORAGE",
    "com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA"
)

private val knownProviderClasses = setOf(
    "androidx.core.content.FileProvider",
    "ru.vk.store.feature.storeapp.search.system.mobile.impl.presentation.SystemSearchContentProvider",
    "androidx.startup.InitializationProvider",
    "ru.vk.store.feature.storeapp.details.direct.impl.presentation.contentprovider.WarmingContentProvider",
    "com.inappstory.sdk.share.InAppStoryFileProvider",
    "com.vk.superapp.logs.LogsFileProvider",
    "com.vk.superapp.provider.SakFileProvider",
    "com.vk.usersstore.contentprovider.UsersContentProvider",
    "com.vk.id.captcha.init.SdkInitContentProvider",
    "ru.mail.libverify.utils.VerifyInitProvider",
    "ru.rustore.sdk.pushclient.provider.RuStorePushClientInitProvider",
    "com.my.target.common.MyTargetContentProvider",
    "ru.vk.store.lib.logging.impl.data.LogFileProvider",
    "ru.vk.store.lib.zip.ZippedFileProvider",
    "ru.mail.auth.sdk.MailIDInitProvider",
    "io.appmetrica.analytics.internal.PreloadInfoContentProvider",
    "com.vk.push.core.deviceid.contentprovider.VkpnsDeviceIdContentProvider",
    "ru.ok.tracer.startup.InitializationProvider",
    "ru.mail.network.NetworkStateListenerProvider",
    "ru.rustore.sdk.imaging.ImageLoaderContentProvider",
    "com.huawei.hms.update.provider.UpdateProvider",
    "com.huawei.updatesdk.fileprovider.UpdateSdkFileProvider",
    "com.huawei.agconnect.core.provider.AGConnectInitializeProvider"
)

private val samsungRequiredCapabilities = setOf(
    "android.permission.REQUEST_INSTALL_PACKAGES",
    "android.permission.QUERY_ALL_PACKAGES",
    "com.android.permission.GET_INSTALLED_APPS",
    "android.permission.POST_NOTIFICATIONS",
    "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS",
    "android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION",
    "android.permission.ENFORCE_UPDATE_OWNERSHIP",
    "android.permission.REQUEST_DELETE_PACKAGES"
)

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private fun String.decodeHex(): ByteArray {
    require(length % 2 == 0)
    return chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

private val officialRuStoreCertificateDigest =
    "661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914".decodeHex()

private data class NativeSignaturePatchSpec(
    val abi: String,
    val digestOffset: Int,
    val codeOffset: Int,
    val expectedCode: ByteArray,
    val replacementCode: ByteArray
)

private val nativeSignaturePatchSpecs = listOf(
    NativeSignaturePatchSpec(
        "arm64-v8a",
        0x87e0,
        0x1594c,
        "220340f9e10216cbe00316aad3fcff97760000b4e00316aaf9030094".decodeHex(),
        "280340f98974f910200540ad000500ad760000b4e00316aaf9030094".decodeHex()
    ),
    NativeSignaturePatchSpec(
        "armeabi-v7a",
        0x3e96,
        0x9c40,
        "d9f80020a8eb07013846fff729fb002f1cbf384600f088fc".decodeHex(),
        "d9f8000045f6b6517a46a2eb010121f90f0200f90f02ffe7".decodeHex()
    ),
    NativeSignaturePatchSpec(
        "x86",
        0x320e,
        0x140f4,
        "29f78b450089442408897c2404893424e807f3ffff85f67408893424e84b0e0000".decodeHex(),
        "568b7d008db35ae7fcffb908000000f3a55e85f6740b893424e84e0e0000909090".decodeHex()
    ),
    NativeSignaturePatchSpec(
        "x86_64",
        0x8600,
        0x15556,
        "4c29ed488b134c89ef4889eee8d9f3ffff4d85ed74084c89efe84c0f0000".decodeHex(),
        "488b3b488d35a030ffff6a0459f348a54d85ed74094c89efe84d0f000090".decodeHex()
    )
)

@Suppress("unused")
val restoreSecureSessionCompatibilityPatch = rawResourcePatch(
    name = "Restore secure-session compatibility",
    description = "Adapts secure-session requests to RuStore 1.108 API changes for re-signed APKs.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        val expectedDigestStorage =
            "(base != 0) && \"DW_EH_PE_datarel".encodeToByteArray()
        nativeSignaturePatchSpecs.forEach { spec ->
            val library = get("lib/${spec.abi}/libbridge_helper.so", false)
            val bytes = library.readBytes()
            require(bytes.copyOfRange(
                spec.digestOffset,
                spec.digestOffset + expectedDigestStorage.size
            ).contentEquals(expectedDigestStorage)) {
                "RuStore native signature digest storage anchor changed for ${spec.abi}"
            }
            require(bytes.copyOfRange(
                spec.codeOffset,
                spec.codeOffset + spec.expectedCode.size
            ).contentEquals(spec.expectedCode)) {
                "RuStore native signature code anchor changed for ${spec.abi}"
            }

            officialRuStoreCertificateDigest.copyInto(bytes, spec.digestOffset)
            spec.replacementCode.copyInto(bytes, spec.codeOffset)
            library.writeBytes(bytes)
        }
    }
}

private val manifestComponentTags = setOf(
    "activity",
    "activity-alias",
    "service",
    "receiver",
    "provider"
)

private fun Document.attributeValues(): List<String> = buildList {
    val elements = getElementsByTagName("*")
    for (elementIndex in 0 until elements.length) {
        val attributes = (elements.item(elementIndex) as Element).attributes
        for (attributeIndex in 0 until attributes.length) {
            add(attributes.item(attributeIndex).nodeValue)
        }
    }
}

private fun Document.sourcePermissions(): Set<String> =
    listOf("uses-permission", "uses-permission-sdk-23")
        .flatMap { tagName ->
            val nodes = getElementsByTagName(tagName)
            (0 until nodes.length)
                .map { nodes.item(it) as Element }
                .map { it.getAttribute("android:name") }
        }
        .toSet()

private val manifestInventoryValidationPatch = resourcePatch {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val sourcePermissions = document.sourcePermissions()
            require(sourcePermissions == knownSourcePermissions) {
                val added = sourcePermissions - knownSourcePermissions
                val removed = knownSourcePermissions - sourcePermissions
                "RuStore permission inventory changed. Added: ${added.sorted()}; removed: ${removed.sorted()}"
            }

            val providers = document.getElementsByTagName("provider")
            val providerNames = (0 until providers.length)
                .map { providers.item(it) as Element }
                .map { it.getAttribute("android:name") }
                .toSet()
            require(providerNames == knownProviderClasses) {
                val added = providerNames - knownProviderClasses
                val removed = knownProviderClasses - providerNames
                "RuStore provider inventory changed. Added: ${added.sorted()}; " +
                    "removed: ${removed.sorted()}"
            }

            val values = document.attributeValues()
            samsungRequiredCapabilities.forEach { capability ->
                require(values.any { it == capability }) {
                    "Samsung-required RuStore capability is missing: $capability"
                }
            }
        }
    }
}

private fun String.occurrencesOf(needle: String): Int {
    var count = 0
    var offset = 0
    while (true) {
        val index = indexOf(needle, offset)
        if (index < 0) return count
        count++
        offset = index + needle.length
    }
}

private fun Document.replaceAuditedValues(
    feature: String,
    replacements: LinkedHashMap<String, String>,
    requiredAnchors: Set<String>,
    forbiddenExactValues: Set<String> = emptySet(),
    inertComponentPrefixes: Set<String> = emptySet()
) {
    val counts = replacements.keys.associateWith { 0 }.toMutableMap()
    val elements = getElementsByTagName("*")
    for (elementIndex in 0 until elements.length) {
        val element = elements.item(elementIndex) as Element
        val attributes = element.attributes
        var disableComponent = false
        for (attributeIndex in 0 until attributes.length) {
            val attribute = attributes.item(attributeIndex)
            var value = attribute.nodeValue
            val isComponentClass = element.tagName in manifestComponentTags &&
                ((attribute.namespaceURI == ANDROID_NAMESPACE && attribute.localName == "name") ||
                    attribute.nodeName == "android:name")
            val preserveComponentClass = isComponentClass &&
                inertComponentPrefixes.any(value::startsWith)
            replacements.forEach { (old, new) ->
                val count = value.occurrencesOf(old)
                if (count > 0) {
                    counts[old] = counts.getValue(old) + count
                    if (!preserveComponentClass) value = value.replace(old, new)
                }
            }
            attribute.nodeValue = value
            disableComponent = disableComponent || preserveComponentClass
        }
        if (disableComponent) {
            element.setAttribute("android:enabled", "false")
        }
    }

    requiredAnchors.forEach { anchor ->
        require(counts.getValue(anchor) > 0) {
            "$feature manifest anchor is missing: $anchor"
        }
    }

    val values = attributeValues()
    forbiddenExactValues.forEach { forbidden ->
        require(forbidden !in values) {
            "$feature manifest value remains enabled: $forbidden"
        }
    }
    inertComponentPrefixes.forEach { prefix ->
        val matchingComponents = manifestComponentTags.flatMap { tagName ->
            val nodes = getElementsByTagName(tagName)
            (0 until nodes.length)
                .map { nodes.item(it) as Element }
                .filter { it.getAttribute("android:name").startsWith(prefix) }
        }
        require(matchingComponents.isNotEmpty()) {
            "$feature manifest component prefix is missing: $prefix"
        }
        require(matchingComponents.all { it.getAttribute("android:enabled") == "false" }) {
            "$feature manifest component remains enabled: $prefix"
        }
    }
    samsungRequiredCapabilities.forEach { capability ->
        require(capability in values) {
            "$feature removed Samsung-required capability: $capability"
        }
    }
}

private fun featureReplacements(
    direct: Map<String, String>,
    prefixes: Map<String, String> = emptyMap(),
    inertComponents: List<String> = emptyList()
) = linkedMapOf<String, String>().apply {
    putAll(direct)
    putAll(prefixes)
    inertComponents.forEach { component ->
        val disabled = prefixes.entries.fold(component) { value, (old, new) ->
            value.replace(old, new)
        }
        if (disabled != component) put(disabled, component)
    }
}

@Suppress("unused")
val disableInvasivePermissionsPatch = resourcePatch(
    name = "Disable invasive permissions",
    description = "Removes privileged install, location, storage, billing, USB, and vendor data access while preserving user-driven installs.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val replacements = linkedMapOf(
            "android.permission.INSTALL_PACKAGES" to "android.permission.XNSTALL_PACKAGES",
            "android.permission.ACCESS_FINE_LOCATION" to "android.permission.XCCESS_FINE_LOCATION",
            "android.permission.ACCESS_COARSE_LOCATION" to "android.permission.XCCESS_COARSE_LOCATION",
            "com.android.vending.BILLING" to "com.android.vending.XILLING",
            "android.permission.USB_HOST" to "android.permission.XSB_HOST",
            "android.permission.WRITE_EXTERNAL_STORAGE" to "android.permission.XRITE_EXTERNAL_STORAGE",
            "com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA" to
                "com.huawei.appmarket.service.commondata.permission.XET_COMMON_DATA"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Invasive permissions",
                replacements,
                replacements.keys,
                replacements.keys
            )
        }
    }
}

internal val advertisingManifestPatch = resourcePatch {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val direct = linkedMapOf(
            "com.google.android.gms.permission.AD_ID" to "com.google.android.gms.permission.XD_ID"
        )
        val prefixes = linkedMapOf(
            "com.my.target" to "xom.my.target",
            "com.inappstory.sdk" to "xom.inappstory.sdk"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Advertising",
                featureReplacements(direct, prefixes),
                direct.keys + prefixes.keys,
                direct.keys,
                prefixes.keys
            )
        }
    }
}

internal val analyticsManifestPatch = resourcePatch {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val direct = linkedMapOf(
            "com.google.android.providers.gsf.permission.READ_GSERVICES" to
                "com.google.android.providers.gsf.permission.XEAD_GSERVICES",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" to
                "com.google.android.finsky.permission.XIND_GET_INSTALL_REFERRER_SERVICE"
        )
        val prefixes = linkedMapOf(
            "ru.vk.store.feature.storeapp.install.referrer" to
                "xu.vk.store.feature.storeapp.install.referrer",
            "ru.rustore.sdk.metrics" to "xu.rustore.sdk.metrics",
            "ru.ok.tracer" to "xu.ok.tracer",
            "io.appmetrica" to "xo.appmetrica",
            "com.vk.superapp.logs" to "xom.vk.superapp.logs",
            "com.google.android.datatransport" to "xom.google.android.datatransport"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Analytics",
                featureReplacements(direct, prefixes),
                direct.keys + prefixes.keys,
                direct.keys,
                prefixes.keys
            )
        }
    }
}

@Suppress("unused")
val disablePushServicesPatch = resourcePatch(
    name = "Disable push services",
    description = "Disables RuStore and VK push initialization, services, and audited push receivers.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val direct = linkedMapOf(
            "com.google.android.c2dm.permission.RECEIVE" to
                "com.google.android.c2dm.permission.XECEIVE"
        )
        val prefixes = linkedMapOf(
            "ru.rustore.sdk.pushclient" to "xu.rustore.sdk.pushclient",
            "ru.vk.store.feature.push.client" to "xu.vk.store.feature.push.client",
            "com.vk.push" to "xom.vk.push"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Push services",
                featureReplacements(direct, prefixes),
                direct.keys + prefixes.keys,
                direct.keys,
                prefixes.keys
            )
        }
    }
}

@Suppress("unused")
val disableVerificationHooksPatch = resourcePatch(
    name = "Disable verification hooks",
    description = "Disables audited SMS, call, phone-state, SID, and Mail.ru verification hooks.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val direct = linkedMapOf(
            "android.permission.READ_CALL_LOG" to "android.permission.XEAD_CALL_LOG",
            "android.permission.READ_PHONE_NUMBERS" to "android.permission.XEAD_PHONE_NUMBERS",
            "android.provider.Telephony.SMS_RECEIVED" to "android.provider.Xelephony.SMS_RECEIVED",
            "android.permission.CALL_PHONE" to "android.permission.XALL_PHONE",
            "ru.sb.mobile.sid.BIND_PERSONALIZATION_SERVICE" to
                "ru.sb.mobile.sid.XIND_PERSONALIZATION_SERVICE",
            "android.permission.READ_BASIC_PHONE_STATE" to
                "android.permission.XEAD_BASIC_PHONE_STATE"
        )
        val prefixes = linkedMapOf(
            "ru.mail.libverify" to "xu.mail.libverify",
            "ru.mail.verify" to "xu.mail.verify",
            "sid.sdk.global.utils.sms" to "xid.sdk.global.utils.sms"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Verification hooks",
                featureReplacements(direct, prefixes),
                direct.keys + prefixes.keys,
                direct.keys,
                prefixes.keys
            )
        }
    }
}

@Suppress("unused")
val disableBackgroundHooksPatch = resourcePatch(
    name = "Disable background hooks",
    description = "Disables audited boot, network-state, VPN, and Connect session hooks.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val direct = linkedMapOf(
            "android.permission.RECEIVE_BOOT_COMPLETED" to
                "android.permission.XECEIVE_BOOT_COMPLETED",
            "android.permission.CHANGE_WIFI_STATE" to "android.permission.XHANGE_WIFI_STATE",
            "android.permission.CHANGE_NETWORK_STATE" to
                "android.permission.XHANGE_NETWORK_STATE",
            "android.permission.BIND_VPN_SERVICE" to "android.permission.XIND_VPN_SERVICE",
            "android.intent.action.BOOT_COMPLETED" to "android.intent.action.XOOT_COMPLETED",
            "android.net.VpnService" to "android.net.XpnService"
        )
        val prefixes = linkedMapOf(
            "ru.vk.store.feature.connect.session" to "xu.vk.store.feature.connect.session",
            "ru.mail.network" to "xu.mail.network"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Background hooks",
                featureReplacements(direct, prefixes),
                direct.keys + prefixes.keys,
                direct.keys,
                prefixes.keys
            )
        }
    }
}

internal val kasperskyManifestPatch = resourcePatch {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val prefixes = linkedMapOf(
            "com.kavsdk" to "xom.kavsdk",
            "kavsdk." to "xavsdk."
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Kaspersky background scan",
                featureReplacements(emptyMap(), prefixes),
                prefixes.keys,
                inertComponentPrefixes = setOf("com.kavsdk")
            )
        }
    }
}

internal val gamingManifestPatch = resourcePatch {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(manifestInventoryValidationPatch)

    execute {
        val replacements = linkedMapOf(
            "android.permission.PACKAGE_USAGE_STATS" to
                "android.permission.XACKAGE_USAGE_STATS"
        )
        document("AndroidManifest.xml").use { document ->
            document.replaceAuditedValues(
                "Gaming profile",
                replacements,
                replacements.keys,
                replacements.keys
            )
        }
    }
}

internal val validatedManifestPatch = manifestInventoryValidationPatch
