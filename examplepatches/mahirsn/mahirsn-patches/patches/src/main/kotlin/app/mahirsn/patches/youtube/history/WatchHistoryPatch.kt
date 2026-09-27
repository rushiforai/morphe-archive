package app.mahirsn.patches.youtube.history

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS = "Lapp/mahirsn/extension/youtube/history/WatchHistory;"
private const val ADD_ON_MANAGER_CLASS = "Lapp/morphe/extension/youtube/addon/AddOnManager;"
private const val NAVIGATION_BAR_CLASS = "Lapp/morphe/extension/youtube/shared/NavigationBar;"

/**
 * Methods of Morphe Patches the extension calls at runtime, as "name(parameters)return".
 * Checked while patching, so an incompatible Morphe Patches version fails here with a clear
 * message instead of on the device.
 */
private val REQUIRED_HOST_METHODS = mapOf(
    "Lapp/morphe/extension/youtube/addon/AddOnApi;" to setOf(
        "addVideoIdListener(Ljava/util/function/Consumer;)V",
        "addVideoTimeListener(Ljava/util/function/LongConsumer;)V",
        "addVideoStateListener(Ljava/util/function/Consumer;)V",
        "addPlayerOverlayButtonsListener(Ljava/util/function/Consumer;)V",
        "addLegacyPlayerControlsListener(Ljava/util/function/Consumer;)V",
        // Called by reflection, like addButton below.
        "createLegacyButton(Ljava/lang/String;Landroid/view/View;Ljava/lang/String;" +
            "Lapp/morphe/extension/shared/settings/BooleanSetting;Landroid/view/View\$OnClickListener;" +
            "Landroid/view/View\$OnLongClickListener;)Lapp/morphe/extension/youtube/videoplayer/LegacyPlayerControlButton;",
    ),
    "Lapp/morphe/extension/youtube/patches/VideoInformation;" to setOf(
        "getVideoTitle()Ljava/lang/String;",
        "getChannelName()Ljava/lang/String;",
        "getVideoLength()J",
        "lastVideoIdIsShort()Z",
        "seekTo(J)Z",
    ),
    "Lapp/morphe/extension/youtube/shared/PlayerType;" to setOf(
        "getCurrent()Lapp/morphe/extension/youtube/shared/PlayerType;",
    ),
    // Called by reflection, to keep Android types out of the compile-only stubs.
    "Lapp/morphe/extension/shared/Utils;" to setOf(
        "getActivity()Landroid/app/Activity;",
    ),
    "Lapp/morphe/extension/youtube/videoplayer/PlayerOverlayButton;" to setOf(
        "addButton(Landroid/view/View;Ljava/lang/String;Landroid/view/View\$OnClickListener;" +
            "Landroid/view/View\$OnLongClickListener;)Landroid/widget/ImageView;",
    ),
)

/** Instance methods and constructors, checked the same way. */
private val REQUIRED_HOST_MEMBERS = mapOf(
    "Lapp/morphe/extension/shared/settings/BooleanSetting;" to setOf(
        "<init>(Ljava/lang/String;Ljava/lang/Boolean;)V",
        "<init>(Ljava/lang/String;Ljava/lang/Boolean;Z)V",
        "get()Ljava/lang/Boolean;",
    ),
)

/** Supported versions are whatever the Morphe Patches bundle used alongside supports. */
private val COMPATIBILITY_YOUTUBE = Compatibility(
    packageName = "com.google.android.youtube",
    name = "YouTube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
)

private fun BytecodePatchContext.checkHost() {
    fun missing(required: Map<String, Set<String>>, static: Boolean) = required.flatMap { (type, members) ->
        val host = classDefByOrNull(type) ?: return@flatMap listOf(type)
        members.filter { wanted ->
            host.methods.none {
                it.name + "(" + it.parameters.joinToString("") + ")" + it.returnType == wanted &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static
            }
        }.map { "$type->$it" }
    }

    val missing = missing(REQUIRED_HOST_METHODS, true) + missing(REQUIRED_HOST_MEMBERS, false)
    if (missing.isNotEmpty()) throw PatchException(
        "This version of Morphe Patches is not compatible with Watch history. Missing: " +
            missing.joinToString()
    )
}

/** The token of the machine that patches, so patching on your own computer needs no typing. */
private fun localToken(): String? {
    System.getenv("YT_HISTORY_TOKEN")?.trim()?.takeIf { it.isNotEmpty() }?.let { return it }
    val file = java.io.File(System.getProperty("user.home") ?: return null, ".config/env/yt-history")
    return runCatching {
        file.readLines().firstOrNull { it.startsWith("YT_HISTORY_TOKEN=") }
            ?.substringAfter('=')?.trim()?.trim('"', '\'')?.takeIf { it.isNotEmpty() }
    }.getOrNull()
}

private fun String.smali() = replace("\\", "\\\\").replace("\"", "\\\"")

// Material "history" icon.
private const val HISTORY_ICON_PATH =
    "M13,3c-4.97,0 -9,4.03 -9,9L1,12l3.89,3.89 0.07,0.14L9,12L6,12c0,-3.87 3.13,-7 7,-7s7,3.13 7,7 " +
        "-3.13,7 -7,7c-1.93,0 -3.68,-0.79 -4.94,-2.06l-1.42,1.42C8.27,19.99 10.51,21 13,21c4.97,0 9,-4.03 " +
        "9,-9s-4.03,-9 -9,-9zM12,8v5l4.28,2.54 0.72,-1.21 -3.5,-2.08L13.5,8L12,8z"

private fun vector(fill: String) = """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="$fill" android:pathData="$HISTORY_ICON_PATH" />
</vector>
"""

/**
 * Settings, merged into the Morphe settings by its settings patch (see "Add-on preferences" in
 * Morphe Patches). Keys match WatchHistory.Prefs.
 */
// The Morphe settings list its sections by key: this one comes right after Player, with an
// icon drawn like theirs (outline, in the text color).
private const val PREFERENCES = """
    <screen>
        <PreferenceScreen android:key="morphe_settings_screen_05_zz_personal_history" android:title="Personal history"
            android:icon="@drawable/mahirsn_settings_history" android:layout="@layout/preference_with_icon"
            app:iconSpaceReserved="true">
            <SwitchPreference android:key="mahirsn_history_resume_ask" android:defaultValue="true"
                android:title="Ask to continue"
                android:summaryOn="A video you watched before offers &quot;Keep watching · 12:34&quot; in the player for a few seconds"
                android:summaryOff="A video you watched before continues where you left it by itself" />
            <SwitchPreference android:key="mahirsn_history_resume_button" android:defaultValue="true"
                android:title="Continue button in the player"
                android:summary="Next to the other player buttons: jumps to where you left the video. Long press opens your history" />
            <SwitchPreference android:key="mahirsn_history_tab_shorts" android:defaultValue="false"
                android:title="History instead of Shorts"
                android:summary="The Shorts button of the navigation bar opens your history. Shows the button even if Shorts is hidden in the navigation bar settings" />
            <SwitchPreference android:key="mahirsn_history_tab_home" android:defaultValue="false"
                android:title="History instead of Home"
                android:summary="The Home button of the navigation bar opens your history. Home stays the start page unless Change start page picks another" />
        </PreferenceScreen>
    </screen>
"""

private const val ADD_ON_PREFERENCES_FILE = "morphe_addon_prefs.xml"

private val watchHistoryResourcesPatch = resourcePatch {
    execute {
        get("res/drawable").mkdirs()
        // Player buttons: the plain name for the old style buttons, "_bold" for the current ones,
        // the same pair every Morphe player button has.
        get("res/drawable/mahirsn_history_resume.xml").writeText(vector("#FFFFFFFF"))
        get("res/drawable/mahirsn_history_resume_bold.xml").writeText(vector("#FFFFFFFF"))
        get("res/drawable/mahirsn_settings_history.xml").writeText(vector("?android:attr/textColorPrimary"))
        // Navigation bar fallback, where the app has no history icon of its own.
        get("res/drawable/mahirsn_history_tab.xml").writeText(vector("?android:attr/textColorPrimary"))

        // Other add-ons may have declared preferences in the same file already.
        val declarations = get(ADD_ON_PREFERENCES_FILE)
        val root = "<morphe-add-on-preferences xmlns:android=\"http://schemas.android.com/apk/res/android\" " +
            "xmlns:app=\"http://schemas.android.com/apk/res-auto\">"
        val existing = if (declarations.exists()) declarations.readText() else "$root\n</morphe-add-on-preferences>\n"
        val end = existing.lastIndexOf("</morphe-add-on-preferences>")
        if (end < 0) throw PatchException("Unexpected $ADD_ON_PREFERENCES_FILE")
        val merged = existing.substring(0, end) + PREFERENCES + existing.substring(end)
        // An existing file may not declare the namespaces this one uses.
        var withNamespaces = merged
        mapOf(
            "xmlns:android" to "http://schemas.android.com/apk/res/android",
            "xmlns:app" to "http://schemas.android.com/apk/res-auto",
        ).forEach { (prefix, uri) ->
            if (!withNamespaces.contains("$prefix=")) {
                withNamespaces = withNamespaces.replaceFirst("<morphe-add-on-preferences", "<morphe-add-on-preferences $prefix=\"$uri\"")
            }
        }
        declarations.writeText(withNamespaces)
    }
}

@Suppress("unused")
val watchHistoryPatch = bytecodePatch(
    name = "Watch history on your server",
    description = "Keeps the watch history and resume positions on your own server instead of Google's, " +
        "so YouTube's history can stay off. Adds a Personal history section to the Morphe settings. " +
        "Requires Morphe official patches and a yt-history server.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(watchHistoryResourcesPatch)

    extendWith("extensions/extension.mpe")

    val serverUrl by stringOption(
        key = "serverUrl",
        default = "https://mahirsn.net/yt/api",
        title = "Server URL",
        description = "Base URL of the history API of your yt-history server.",
        required = true,
    )
    val token by stringOption(
        key = "token",
        default = "",
        title = "Token",
        description = "Sent to the server in the X-Token header. Leave empty to use YT_HISTORY_TOKEN " +
            "from the environment or from ~/.config/env/yt-history on the computer that patches.",
        required = false,
    )

    execute {
        val url = (serverUrl ?: "").trim().trimEnd('/')
        if (!url.startsWith("https://") && !url.startsWith("http://")) {
            throw PatchException("Watch history: set \"Server URL\" in the options of this patch (it must start with https://).")
        }
        val key = (token ?: "").trim().ifEmpty { localToken() }
            ?: throw PatchException(
                "Watch history: no token. Set \"Token\" in the options of this patch, or put " +
                    "YT_HISTORY_TOKEN=... into ~/.config/env/yt-history on this computer."
            )
        val extension = mutableClassDefBy(EXTENSION_CLASS)
        mapOf("serverUrl" to url, "token" to key).forEach { (name, value) ->
            extension.methods.first { it.name == name }.addInstructions(
                0,
                """
                    const-string v0, "${value.smali()}"
                    return-object v0
                """,
            )
        }
    }

    finalize {
        // The extension of Morphe Patches is merged while its patches execute, so it is
        // only certain to be there now.
        val manager = mutableClassDefByOrNull(ADD_ON_MANAGER_CLASS) ?: throw PatchException(
            "Watch history needs Morphe official patches. Patch together with the Morphe bundle."
        )
        checkHost()
        manager.methods.first {
            it.name == "registerAddOns" && it.parameters.isEmpty() && it.returnType == "V"
        }.addInstruction(0, "invoke-static { }, $EXTENSION_CLASS->register()V")

        // History in place of a navigation bar button. The callback is where Morphe's own
        // navigation bar patches act on each button as it is created; running after them lets
        // a button they hid come back as History. Without the hook, only this option is missing.
        mutableClassDefByOrNull(NAVIGATION_BAR_CLASS)?.methods?.firstOrNull {
            it.name == "navigationTabCreatedCallback" && it.parameters.size == 2 && it.returnType == "V"
        }?.let { callback ->
            val instructions = callback.implementation!!.instructions
            val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            callback.addInstruction(
                end,
                "invoke-static { p0, p1 }, $EXTENSION_CLASS->navigationTabCreated(Ljava/lang/Enum;Landroid/view/View;)V",
            )
        }
    }
}
