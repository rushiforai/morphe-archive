package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private val AD_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

private val removeAdIdResourcePatch = resourcePatch(
    description = "Removes advertising ID permissions from AndroidManifest.xml.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val nodes = document.getElementsByTagName("uses-permission")
            val toRemove = ArrayList<Element>()
            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as Element
                if (element.getAttribute("android:name") in AD_ID_PERMISSIONS) {
                    toRemove.add(element)
                }
            }
            toRemove.forEach { it.parentNode.removeChild(it) }

            val application = document.getElementsByTagName("application").item(0) as? Element
            if (application != null) {
                val metas = application.getElementsByTagName("meta-data")
                var hasCrashlyticsMeta = false
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as Element
                    if (meta.getAttribute("android:name") == "firebase_crashlytics_collection_enabled") {
                        meta.setAttribute("android:value", "false")
                        hasCrashlyticsMeta = true
                        break
                    }
                }
                if (!hasCrashlyticsMeta) {
                    application.appendChild(
                        document.createElement("meta-data").apply {
                            setAttribute("android:name", "firebase_crashlytics_collection_enabled")
                            setAttribute("android:value", "false")
                        },
                    )
                }
            }
        }
    }
}

@Suppress("unused")
val anhpanBlockAdsPatch = bytecodePatch(
    name = "Block ads & tracking",
    description = "Removes ads from chats and feed, and stops analytics and crash reporting.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Zalo",
            packageName = "com.zing.zalo",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0x0068FF,
            targets = listOf(AppTarget(version = "26.11.01")),
        ),
    )

    dependsOn(removeAdIdResourcePatch)

    execute {
        // 1. Chat list Zinstant ads: NOP ArrayList.add(int, Object) after ad card constructor.
        ZinstantAdListInsertion261101.matchAll(0..1).singleOrNull()?.let { match ->
            val ctorIndex = match.instructionMatches.firstOrNull {
                it.instruction.opcode == Opcode.INVOKE_DIRECT
            }?.index
            if (ctorIndex != null) {
                val instructions = match.method.implementation?.instructions?.toList().orEmpty()
                val addIndex = instructions.indices.firstOrNull { index ->
                    index > ctorIndex && instructions[index].let { insn ->
                        insn.opcode == Opcode.INVOKE_VIRTUAL &&
                            (insn as? ReferenceInstruction)?.reference.let { ref ->
                                ref is MethodReference &&
                                    ref.definingClass == "Ljava/util/ArrayList;" &&
                                    ref.name == "add" &&
                                    ref.parameterTypes == listOf("I", "Ljava/lang/Object;") &&
                                    ref.returnType == "V"
                            }
                    }
                }
                if (addIndex != null) {
                    match.method.replaceInstruction(addIndex, "nop")
                }
            }
        }

        // 2. Newsfeed ZInstant ads & suggested Zalo Video channel: skip bind if either field is non-null.
        NewsfeedBind261101.matchAll(0..1).singleOrNull()?.let { match ->
            val method = match.method
            if (method.implementation?.registerCount == 28) {
                method.addInstructionsWithLabels(
                    0,
                    """
                        iget-object v2, p1, Lyv9;->v1:Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;
                        if-nez v2, :skip_ad_bind
                        iget-object v2, p1, Lyv9;->u1:Lcom/zing/zalo/social/presentation/timeline/components/section_zalo_video/FeedItemVideoChannel;
                        if-nez v2, :skip_ad_bind
                        goto :normal_feed_bind
                        :skip_ad_bind
                        return-void
                        :normal_feed_bind
                        nop
                    """.trimIndent(),
                )
            }
        }

        // 3. Adtima offline ads window & tracker gate: force return false.
        OfflineAdsWindow261101.matchAll(0..1).singleOrNull()?.let { match ->
            match.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
        OfflineAdsGate261101.matchAll(0..1).singleOrNull()?.let { match ->
            match.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        // 4. Adtima Google ads network gate: NOP IF_NEZ skip branch so admob/dfp/ima are always removed.
        GoogleAdsNetworkGate261101.matchAll(0..1).singleOrNull()?.let { match ->
            val skip = match.instructionMatches.firstOrNull { it.instruction.opcode == Opcode.IF_NEZ }
            if (skip != null) {
                match.method.replaceInstruction(skip.index, "nop")
            }
        }

        // 5. Adtima limit-ad-tracking: report opted-out without calling Play API.
        AdtimaLatRead261101.matchAll(0..1).singleOrNull()?.let { match ->
            match.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    sput v0, Lcom/adtima/Adtima;->mIsLat:I
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
            )
        }

        // 6. Firebase Crashlytics sinks: return-void at entry.
        listOf(
            CrashlyticsRecordException,
            CrashlyticsLog,
            CrashlyticsSetUserId,
            CrashlyticsSetEnabled,
        ).forEach { fp ->
            fp.matchAll(0..1).singleOrNull()?.method?.addInstructions(0, "return-void")
        }
    }
}

private object ZinstantAdListInsertion261101 : Fingerprint(
    definingClass = "Lp8g;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;"),
    filters = listOf(
        methodCall(definingClass = "Lx5w;", name = "<init>", parameters = listOf("Lqow;"), returnType = "V"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add", parameters = listOf("I", "Ljava/lang/Object;"), returnType = "V"),
    ),
)

private object NewsfeedBind261101 : Fingerprint(
    definingClass = "Lfaq;",
    name = "a0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lyv9;", "I"),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lyv9;",
            name = "v1",
            type = "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;",
        ),
    ),
)

private object OfflineAdsWindow261101 : Fingerprint(
    definingClass = "Lrdg;",
    name = "v",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = "Laxy;", name = "I", type = "Z"),
        methodCall(definingClass = "Ljava/lang/Long;", name = "longValue"),
    ),
)

private object OfflineAdsGate261101 : Fingerprint(
    definingClass = "Lrdg;",
    name = "u",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lrdg;", name = "v", returnType = "Z"),
        fieldAccess(definingClass = "Laxy;", name = "J", type = "Z"),
    ),
)

private object GoogleAdsNetworkGate261101 : Fingerprint(
    definingClass = "Lcom/adtima/Adtima;",
    name = "updateSupportNetwork",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = "Laxy;", name = "L", type = "Z"),
        opcode(Opcode.IF_NEZ),
        string("admob"),
        string("dfp"),
        string("ima"),
    ),
)

private object AdtimaLatRead261101 : Fingerprint(
    definingClass = "Lcom/adtima/d;",
    name = "doInBackground",
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.VARARGS),
    returnType = "Ljava/lang/Void;",
    parameters = listOf("[Ljava/lang/Void;"),
    filters = listOf(
        string("AdvertisingIdClient"),
    ),
)

private object CrashlyticsRecordException : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "recordException",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
)

private object CrashlyticsLog : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "log",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object CrashlyticsSetUserId : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setUserId",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object CrashlyticsSetEnabled : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z"),
)
