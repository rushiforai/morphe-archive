package io.github.bryceaspringfield.morphe.patches.kick

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import io.github.bryceaspringfield.morphe.patches.hookReturns
import io.github.bryceaspringfield.morphe.patches.kick.Constants.COMPATIBILITY_KICK

private const val EXT = "Lio/github/bryceaspringfield/morphe/extension/kick"
private const val HTTP = "$EXT/KickHttp;"
private const val PLAYER = "$EXT/KickPlayer;"
private const val SETTINGS_ACTIVITY = "io.github.bryceaspringfield.morphe.extension.kick.KickSettingsActivity"
private const val VIDEO_PLAYER = "Lcom/kick/mobile/playerv3/player/VideoPlayer;"

/** A launcher icon of its own opens the settings, since KICK has no Morphe settings screen. */
private val kickSettingsActivityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_ACTIVITY)
            activity.setAttribute("android:label", "KICK Extras")
            activity.setAttribute("android:exported", "true")
            activity.setAttribute("android:taskAffinity", "com.kick.mobile.extras")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            val filter = document.createElement("intent-filter")
            val action = document.createElement("action")
            action.setAttribute("android:name", "android.intent.action.MAIN")
            val category = document.createElement("category")
            category.setAttribute("android:name", "android.intent.category.LAUNCHER")
            filter.appendChild(action)
            filter.appendChild(category)
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }
}

@Suppress("unused")
val kickExtrasPatch = bytecodePatch(
    name = "KICK Extras",
    description = "Adds Audio only to the player's quality menu, filters of streams, clips, and chat (title words, " +
            "channels, categories, chat words, and chat users), and switches for the Top gifted shelf, set from a " +
            "KICK Extras launcher icon.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsActivityPatch)
    extendWith("extensions/kick-extras.mpe")

    execute {
        fun method(type: String, name: String, params: String): MutableMethod {
            val c = mutableClassDefByOrNull(type) ?: throw PatchException("KICK class $type is missing")
            return c.methods.firstOrNull { m -> m.name == name && m.parameterTypes.joinToString("") == params }
                ?: throw PatchException("KICK method $type->$name($params) is missing")
        }

        // Every OkHttp client the app builds gets the filtering interceptor.
        method("Lokhttp3/OkHttpClient\$Builder;", "build", "").addInstructions(
            0, "invoke-static {p0}, $HTTP->onBuild(Lokhttp3/OkHttpClient\$Builder;)V"
        )
        // Every socket (the chat's) gets the filtering listener.
        method("Lokhttp3/OkHttpClient;", "newWebSocket", "Lokhttp3/Request;Lokhttp3/WebSocketListener;").addInstructions(
            0, """
                invoke-static {p1, p2}, $HTTP->onWebSocket(Lokhttp3/Request;Lokhttp3/WebSocketListener;)Lokhttp3/WebSocketListener;
                move-result-object p2
            """
        )
        // The quality menu's tracks get Audio only, and its choice is read.
        method(VIDEO_PLAYER, "getAvailableVideoTracks", "").hookReturns(
            Opcode.RETURN_OBJECT, """
                invoke-static {p0, {reg}}, $PLAYER->tracks(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object {reg}
            """
        )
        method(VIDEO_PLAYER, "setMaxResolution", "Lcom/kick/mobile/playerv3/records/VideoSize;").addInstructions(
            0, """
                invoke-static {p0, p1}, $PLAYER->onMaxResolution(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, Lcom/kick/mobile/playerv3/records/VideoSize;
            """
        )
    }
}
