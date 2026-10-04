package app.template.patches.tiktok_lite.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Legacy ACL code gate. Kept for compatibility with the older Lite layout.
internal object DownloadAllowedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/Aweme;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lcom/ss/android/ugc/aweme/feed/model/AwemeACLShare;",
            name = "downloadGeneral",
        ),
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lcom/ss/android/ugc/aweme/feed/model/ACLCommonShare;",
            name = "code",
        ),
    ),
)

// Legacy download params builder.
internal object VideoGetDownloadAddrFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
            name = "video",
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lcom/ss/android/ugc/aweme/feed/model/Video;",
            name = "downloadAddr",
        ),
    ),
    custom = { _, classDef -> classDef.type == "LX/7ZV;" },
)

// TikTok Lite 47.0.3 video-status gate.
//
// Verified in the supplied 47.0.3 APK:
//   class:  LX/0eN;
//   method: LBL(Lcom/ss/android/ugc/aweme/minilite/feed/model/Aweme;)Z
//   access:  public static
//   registers: 3
//
// 47.0.3 no longer contains the previous X/5mk class, uses the MiniLite
// Aweme model, and this method is not FINAL.
internal object VideoStatusGateFingerprint : Fingerprint(
    definingClass = "LX/0eN;",
    name = "LBL",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/ss/android/ugc/aweme/minilite/feed/model/Aweme;"),
)

// Legacy music copyright gate.
internal object MusicCopyrightGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
            name = "music",
        ),
    ),
    custom = { _, classDef -> classDef.type.endsWith("/5mk;") },
)

// Legacy transcode URL selector.
internal object DownloadTranscodeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    custom = { method, _ ->
        method.parameterTypes.size == 3 &&
            method.parameterTypes[0] == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;" &&
            method.parameterTypes[1] == "I" &&
            method.parameterTypes[2].startsWith("L")
    },
)
