package com.openbubbles.wear.patches

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

internal const val SERVICE_CLASS = "Lcom/openbubbles/wear/bridge/WearBridgeService;"
private const val MEDIA_PROVIDER_CLASS = "Lcom/openbubbles/wear/patch/CompanionMediaProvider;"

private val verifyBackendPatch = bytecodePatch {
    execute {
        requireSupportedVersion()
        val shell = classDefByOrNull("Lcom/localob/messaging/shell/ShellApplication;")
            ?: throw PatchException("Native ShellApplication is missing")
        if (shell.superclass != "Lcom/localob/messaging/app/LocalObApplication;" ||
            shell.methods.any { it.name == "onCreate" }) {
            throw PatchException("ShellApplication must inherit the native startup hook")
        }
        if (listOf(SERVICE_CLASS, MEDIA_PROVIDER_CLASS, "Lcom/openbubbles/wear/patch/EmbeddedHooks;",
                "Lcom/openbubbles/wear/patch/BridgeOps;").any { classDefByOrNull(it) != null }) {
            throw PatchException("The bridge is already present")
        }
        REQUIRED_BACKEND_METHODS.forEach { (type, signatures) ->
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Required backend class missing: $type")
            val methods = definition.methods.map { method ->
                "${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
            }.toSet()
            requireExactMethods(type, signatures, methods)
        }
    }
}

private val settingsManifestPatch = resourcePatch {
    dependsOn(verifyBackendPatch)
    execute {
        document("AndroidManifest.xml").use(::addSettingsToManifest)
    }
}

internal val sharedSettingsPatch = bytecodePatch {
    dependsOn(settingsManifestPatch)
    extendWith("openbubbles-wear.mpe")
    execute {
        skipBackendInRestartProcess()
        addSettingsMenu()
    }
}

private val bridgeManifestPatch = resourcePatch {
    dependsOn(sharedSettingsPatch)
    execute {
        document("AndroidManifest.xml").use(::addBridgeToManifest)
    }
}

@Suppress("unused")
val openBubblesWearBridgePatch = bytecodePatch(
    name = "Wear companion bridge",
    description = "Embeds the Wear companion in OpenBubbles and includes a background notification control; no separate phone app is needed.",
) {
    compatibleWith(
        Compatibility(
            packageName = "com.openbubbles.messaging",
            name = "OpenBubbles",
            targets = listOf(AppTarget(version = "2.0.0", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 20002293))),
        ),
    )
    // Check the original backend before extension merging can mask missing classes.
    dependsOn(bridgeManifestPatch)
    execute {
        addEmbeddedHooks()
        val service = classDefByOrNull(SERVICE_CLASS)
            ?: throw PatchException("Embedded WearBridgeService is missing")
        if (service.superclass != "Lcom/google/android/gms/wearable/WearableListenerService;") {
            throw PatchException("Embedded service must extend WearableListenerService")
        }
        val provider = classDefByOrNull(MEDIA_PROVIDER_CLASS)
            ?: throw PatchException("Extension CompanionMediaProvider is missing")
        if (provider.superclass != "Landroid/content/ContentProvider;") {
            throw PatchException("Extension CompanionMediaProvider must extend ContentProvider")
        }
        requireExactMethods(MEDIA_PROVIDER_CLASS, listOf(
            "<init>()V", "onCreate()Z",
            "openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;",
            "getType(Landroid/net/Uri;)Ljava/lang/String;",
            "getTypeAnonymous(Landroid/net/Uri;)Ljava/lang/String;",
            "query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;",
            "insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;",
            "update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I",
            "delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I",
        ), provider.methods.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }.toSet())
    }
}

@Suppress("unused")
val readyNotificationSettingsPatch = bytecodePatch(
    name = "Ready for messages notification control",
    description = "Adds a setting to hide or show the background connection notification independently of the Wear bridge.",
) {
    compatibleWith(
        Compatibility(
            packageName = "com.openbubbles.messaging",
            name = "OpenBubbles",
            targets = listOf(AppTarget(version = "2.0.0", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 20002293))),
        ),
    )
    dependsOn(sharedSettingsPatch)
}

private fun app.morphe.patcher.patch.BytecodePatchContext.requireSupportedVersion() {
    requireSupportedVersion(packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode)
}

internal fun requireSupportedVersion(packageName: String, versionName: String, versionCode: String) {
    if (packageName != "com.openbubbles.messaging" || versionName != "2.0.0" || versionCode != "20002293") {
        throw PatchException("Unsupported app: $packageName $versionName ($versionCode); expected native OpenBubbles 2.0.0 (20002293)")
    }
}

internal fun requireExactMethods(type: String, required: List<String>, methods: Set<String>) {
    required.forEach { signature ->
        if (signature !in methods) throw PatchException("Required backend method missing: $type->$signature")
    }
}

internal val REQUIRED_BACKEND_METHODS = mapOf(
    "Lcom/localob/messaging/app/LocalObApplication;" to listOf("onCreate()V"),
    "Lcom/localob/messaging/backend/db/Database;" to listOf(
        "getChats()Lio/objectbox/Box;",
        "getMessages()Lio/objectbox/Box;",
        "getHandles()Lio/objectbox/Box;",
        "getAttachments()Lio/objectbox/Box;",
        "getAttachmentsDir()Ljava/io/File;",
    ),
    "Lcom/localob/messaging/app/service/BackendForegroundService\$Companion;" to listOf(
        "getState()Lkotlinx/coroutines/flow/StateFlow;",
        "getInstance()Lcom/localob/messaging/app/service/BackendForegroundService;",
        "start(Landroid/content/Context;)V",
    ),
    "Lcom/localob/messaging/app/service/BackendState\$Ready;" to listOf(
        "getBackend()Lcom/localob/messaging/backend/domain/BackendService;",
    ),
    "Lcom/localob/messaging/backend/domain/BackendService;" to listOf(
        "chat(Ljava/util/List;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "findChats(Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "chatById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
    ),
    "Lcom/localob/messaging/backend/domain/Chat;" to listOf(
        "send(Lcom/localob/messaging/backend/domain/MessageContent;Lkotlinx/datetime/Instant;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "markRead(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "messageById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "isIMessage()Z",
        "getGuid()Ljava/lang/String;",
        "isGroup()Z",
        "getHandlesFlow()Lkotlinx/coroutines/flow/StateFlow;",
        "getDisplayNameFlow()Lkotlinx/coroutines/flow/StateFlow;",
        "getHasUnreadFlow()Lkotlinx/coroutines/flow/StateFlow;",
        "getLastActivityFlow()Lkotlinx/coroutines/flow/StateFlow;",
        "getLastMessageFlow()Lkotlinx/coroutines/flow/StateFlow;",
    ),
    "Lcom/localob/messaging/backend/db/Chat;" to listOf(
        "getGuid()Ljava/lang/String;",
        "isIMessage()Z",
        "getHandles()Lio/objectbox/relation/ToMany;",
        "getId()J", "getDateDeleted()Ljava/util/Date;", "isRoutingStub()Z", "isGroup()Z",
        "getDisplayName()Ljava/lang/String;", "getTitle()Ljava/lang/String;",
        "getChatIdentifier()Ljava/lang/String;", "getHasUnreadMessage()Ljava/lang/Boolean;",
        "getDbLatestMessage()Lio/objectbox/relation/ToOne;", "getDbOnlyLatestMessageDate()Ljava/util/Date;",
    ),
    "Lcom/localob/messaging/backend/domain/Message;" to listOf(
        "getGuid()Ljava/lang/String;", "getSender()Ljava/lang/String;", "isFromMe()Ljava/lang/Boolean;",
        "getTimestamp()Lkotlinx/datetime/Instant;",
        "getContentFlow()Lkotlinx/coroutines/flow/StateFlow;",
        "getDeliveryStateFlow()Lkotlinx/coroutines/flow/StateFlow;",
        "react(Lcom/localob/messaging/backend/domain/ReactionKind;IZLkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getThreadOriginatorGuid()Ljava/lang/String;",
        "getThreadOriginatorPartIndex()Ljava/lang/Integer;",
    ),
    "Lcom/localob/messaging/backend/db/Message;" to listOf(
        "getGuid()Ljava/lang/String;", "getId()J", "getText()Ljava/lang/String;",
        "getHasAttachments()Ljava/lang/Boolean;", "getDateCreated()Ljava/util/Date;",
        "getDateDeleted()Ljava/util/Date;", "getAssociatedMessageType()Ljava/lang/String;",
        "getSender()Ljava/lang/String;", "isFromMe()Ljava/lang/Boolean;",
    ),
    "Lcom/localob/messaging/backend/db/Handle;" to listOf("getAddress()Ljava/lang/String;"),
    "Lcom/localob/messaging/backend/db/Attachment;" to listOf(
        "getGuid()Ljava/lang/String;", "getMimeType()Ljava/lang/String;",
        "isDownloaded()Ljava/lang/Boolean;", "getMessage()Lio/objectbox/relation/ToOne;",
        "getLocalPathFlow()Lkotlinx/coroutines/flow/StateFlow;",
    ),
    "Lcom/localob/messaging/backend/domain/ContentRun\$Text;" to listOf(
        "<init>(Ljava/lang/String;Lcom/localob/messaging/backend/domain/RunFormat;)V",
        "getText()Ljava/lang/String;",
    ),
    "Lcom/localob/messaging/backend/domain/MessageContent;" to listOf(
        "<init>(Ljava/util/List;Ljava/util/List;Lcom/localob/messaging/backend/domain/BalloonContent;Lcom/localob/messaging/backend/domain/MessageRef;Lcom/localob/messaging/backend/domain/MessageEffect;Ljava/lang/String;Z)V",
        "getRuns()Ljava/util/List;",
    ),
    "Lcom/localob/messaging/backend/domain/MessageRef;" to listOf(
        "<init>(Ljava/lang/String;Ljava/lang/Integer;)V",
    ),
    "Lcom/localob/messaging/app/messaging/ReplyThreadingKt;" to listOf(
        "resolveReplyTarget(Lcom/localob/messaging/backend/domain/Message;I)Lcom/localob/messaging/backend/domain/MessageRef;",
    ),
    "Lcom/localob/messaging/backend/domain/RunFormat\$Companion;" to listOf(
        "getPlain()Lcom/localob/messaging/backend/domain/RunFormat\$Flags;",
    ),
)
