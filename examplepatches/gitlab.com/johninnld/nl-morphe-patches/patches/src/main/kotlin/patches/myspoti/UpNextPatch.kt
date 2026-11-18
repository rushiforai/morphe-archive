package patches.myspoti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import patches.shared.uniqueMatch

private const val SERVICE = "Lapp/myspoti/host/android/PlaybackService;"
private const val EXPORT = "Lnl/johninnl/myspoti/queue/QueueExport;"
private const val SONG = "Lcom/music/spotui/data/entity/SongsModel;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val QUERY_ALL_PACKAGES = "android.permission.QUERY_ALL_PACKAGES"

/** Marks the inserted admission code, so a second application is detected. */
internal const val UP_NEXT_HOST_MARKER = "morphe:myspoti:android-auto-hosts"

private val hostPackage = Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+")

private val queueTarget = Compatibility(
    name = "Myspoti", packageName = "app.myspoti.stable", apkFileType = ApkFileType.APK,
    signatures = setOf("2b8f54daf60ce32cee1ab9206553c7e5741e96f2f32efdf2545758bf210a2c41"),
    targets = listOf(
        AppTarget(version = "2.3.0", versionCode = 1121, minSdk = 29),
        AppTarget(version = "2.4.0", versionCode = 1142, minSdk = 29),
        AppTarget(version = "2.4.1", versionCode = 1175, minSdk = 29),
    ),
)

/** Orpheon is the rebranded Myspoti: same code and media session under its own package. */
private val orpheonTarget = Compatibility(
    name = "Orpheon", packageName = "app.orpheon", apkFileType = ApkFileType.APK,
    signatures = setOf("2b8f54daf60ce32cee1ab9206553c7e5741e96f2f32efdf2545758bf210a2c41"),
    targets = listOf(AppTarget(version = "1.0.0", versionCode = 1194, minSdk = 29)),
)

/** Versions that publish the current and upcoming queue through the framework media session. */
private val nativeQueueVersions = setOf("2.4.0", "2.4.1", "1.0.0")

private val queueOriginalInput = patches.shared.originalInput(queueTarget, variants = listOf(orpheonTarget))

private fun hosts(value: String?): List<String> {
    if (value.isNullOrBlank()) return emptyList()
    require(value.length <= 2000) { "Myspoti Android Auto host package list is too long" }
    return value.split(',').map(String::trim).distinct().also { names ->
        require(names.all(hostPackage::matches)) { "Use comma-separated Android host package names" }
    }
}

@Suppress("unused")
val upNext = bytecodePatch(
    name = "Android Auto Up next",
    description = "Myspoti 2.4.x and Orpheon publish their current and upcoming playlist/radio queue with " +
        "metadata and queue selection themselves; on Myspoti 2.3.0 this patch exports that queue. " +
        "It also lets every Android Auto host, or only the host packages you list, browse the library " +
        "and control that queue.",
    default = false,
) {
    compatibleWith(queueTarget, orpheonTarget)
    val allowedHostPackages by stringOption(
        key = "allowedHostPackages", default = "", title = "Allowed host packages",
        description = "Leave empty to allow every Android Auto host, including third-party systems. " +
            "Otherwise enter comma-separated host app package names; every other app is denied browsing. " +
            "Include Android Auto itself in the list when you restrict it. Repatch to change this list.",
        required = false,
    )

    val visibility = resourcePatch {
        dependsOn(queueOriginalInput)
        execute {
            val names = hosts(allowedHostPackages)
            document("AndroidManifest.xml").use { document ->
                val root = document.documentElement
                if (names.isEmpty()) {
                    // An arbitrary host package must be visible to the package/UID checks.
                    val permissions = document.getElementsByTagName("uses-permission")
                    if ((0 until permissions.length).none {
                        (permissions.item(it) as Element).getAttributeNS(ANDROID, "name") == QUERY_ALL_PACKAGES
                    }) root.appendChild(document.createElement("uses-permission").apply {
                        setAttributeNS(ANDROID, "android:name", QUERY_ALL_PACKAGES)
                    })
                } else {
                    val queries = document.getElementsByTagName("queries").item(0) as? Element
                        ?: document.createElement("queries").also(root::appendChild)
                    val existing = queries.getElementsByTagName("package")
                    for (name in names) if ((0 until existing.length).none {
                        (existing.item(it) as Element).getAttributeNS(ANDROID, "name") == name
                    }) queries.appendChild(document.createElement("package").apply {
                        setAttributeNS(ANDROID, "android:name", name)
                    })
                }
            }
        }
    }
    dependsOn(queueOriginalInput, visibility)
    extendWith("extensions/myspoti-queue.mpe")

    execute {
        val configuredHosts = hosts(allowedHostPackages)
        val service = mutableClassDefBy(SERVICE)

        // Admit car hosts at the shared library predicate. The browser root still proves
        // that the caller's UID owns the package it claims.
        val discovered = BrowserDiscovery.permissionPredicate(service)
        val predicate = service.methods.single { it.toString() == discovered.toString() }
        check(predicate.instructions.none {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == UP_NEXT_HOST_MARKER
        }) { "Myspoti Android Auto Up next is already applied" }
        val admitted = (listOf(packageMetadata.packageName) + configuredHosts)
            .distinct()
        val admission = buildString {
            append("const-string v0, \"$UP_NEXT_HOST_MARKER\"\n")
            if (configuredHosts.isEmpty()) {
                append("const/4 v0, 0x1\nreturn v0")
            } else {
                admitted.forEachIndexed { index, name ->
                    append("const-string v0, \"$name\"\n")
                    append("invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n")
                    append("move-result v0\n")
                    append("if-nez v0, :host_$index\n")
                    append("const/4 v0, 0x1\nreturn v0\n")
                    append(":host_$index\n")
                }
                append("const/4 v0, 0x0\nreturn v0")
            }
        }
        predicate.addInstructions(0, admission)

        if (packageMetadata.versionName in nativeQueueVersions) {
            // The app publishes the same queue itself. Fail closed if that native support disappears,
            // rather than reporting Up next while nothing exports it.
            check(service.methods.any { method ->
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ==
                        "Landroid/media/session/MediaSession;->setQueue(Ljava/util/List;)V"
                } == true
            }) { "Myspoti ${packageMetadata.versionName} native Android Auto queue changed" }
        } else {
            fun exact(owner: String, name: String, result: String = "V", vararg args: String) =
                Fingerprint(definingClass = owner, name = name, returnType = result, parameters = args.toList())
                    .uniqueMatch().method

            // Fail closed if any reflected member or callback no longer has the audited shape.
            val fields = mapOf(
                SERVICE to mapOf("t" to "Ltv4;", "J" to "Lag5;"),
                "Ltv4;" to mapOf("l" to "Ljava/lang/Object;"),
                "Lsv4;" to mapOf("a" to "Landroid/media/session/MediaSession;"),
                "Lke7;" to mapOf("a" to "Lke7;", "t" to "Ler5;", "u" to "Lvb6;"),
                "Ldg4;" to mapOf("a" to "Ler5;", "b" to "Ljava/util/ArrayList;"),
                "Lra7;" to mapOf("a" to SONG, "b" to "Ljava/util/List;", "c" to "Ljava/util/List;"),
                "Lva7;" to mapOf("a" to SONG, "b" to "Ljava/lang/String;", "c" to "Ljava/lang/String;", "d" to "Ljava/lang/String;"),
                "Lqv4;" to mapOf("a" to "Lat4;"), "Lzv5;" to mapOf("e" to SERVICE),
                "Lag5;" to mapOf("a" to "Ljava/lang/String;"),
                "Lng4;" to mapOf("a" to "J", "b" to "Landroid/net/Uri;"),
            )
            fields.forEach { (owner, expected) ->
                val cls = mutableClassDefBy(owner)
                expected.forEach { (name, type) ->
                    check(cls.fields.count { it.name == name && it.type == type } == 1) {
                        "Unsupported Myspoti queue field $owner->$name:$type"
                    }
                }
            }
            exact("Lke7;", "M0", "V", "Lva7;")
            exact("Lvb6;", "b", "Lzf5;")
            exact("Lzf5;", "k", "Ljava/lang/String;")
            exact("Lzf5;", "j", "Ljava/lang/String;")
            exact("Ldg4;", "i", "Lng4;")
            exact("Ler5;", "getValue", "Ljava/lang/Object;")
            exact("Lqv4;", "a", "Lsv4;")
            listOf("getTitle", "getSinger", "getAlbum", "getCoverUri", "getUrl", "getSpotifyTrackId").forEach {
                exact(SONG, it, "Ljava/lang/String;")
            }
            exact(SONG, "getDurationMs", "I")

            val create = exact(SERVICE, "onCreate")
            check(create.instructions.none {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == EXPORT
            }) { "Myspoti Up next is already applied" }
            create.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach {
                    create.addInstruction(it, "invoke-static/range {p0 .. p0}, $EXPORT->bind(Ljava/lang/Object;)V")
                }
            exact(SERVICE, "onDestroy").addInstruction(0,
                "invoke-static/range {p0 .. p0}, $EXPORT->unbind(Ljava/lang/Object;)V")

            // The app's compat adapter has one framework state sink. Preserve the original
            // object and attach the matching public queue ID without rebuilding app policy.
            val state = exact("Ltv4;", "Y", "V", "Landroid/support/v4/media/session/PlaybackStateCompat;")
            val sink = state.instructions.withIndex().single { (_, instruction) ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ==
                    "Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V"
            }
            val registers = sink.value as Instruction35c
            state.replaceInstruction(sink.index,
                "invoke-static {v${registers.registerC}, v${registers.registerD}}, $EXPORT->publishState(Landroid/media/session/MediaSession;Landroid/media/session/PlaybackState;)V")

            val setter = exact("Ler5;", "setValue", "V", "Ljava/lang/Object;")
            setter.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach {
                    setter.addInstruction(it, "invoke-static/range {p1 .. p1}, $EXPORT->changed(Ljava/lang/Object;)V")
                }
            val remote = exact("Lke7;", "d", "V", "Lvb6;")
            remote.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach {
                    remote.addInstruction(it, "invoke-static {}, $EXPORT->refreshSoon()V")
                }
            val select = exact("Lqv4;", "onSkipToQueueItem", "V", "J")
            check(select.instructions.count { it.opcode == Opcode.RETURN_VOID } == 1)
            select.addInstruction(0, "invoke-static/range {p0 .. p2}, $EXPORT->select(Ljava/lang/Object;J)V")
        }
    }
}
