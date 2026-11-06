package app.spectre.patches.links

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.spectre.patches.shared.Constants.COMPATIBILITY_MAL

private val openLinksResourcePatch = resourcePatch {
    compatibleWith(COMPATIBILITY_MAL)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        var content = manifestFile.readText(Charsets.UTF_8)
        val intentFilterXml = """            <intent-filter>
                <action android:name="android.intent.action.VIEW"/>
                <category android:name="android.intent.category.DEFAULT"/>
                <category android:name="android.intent.category.BROWSABLE"/>
                <data android:host="myanimelist.net" android:scheme="https"/>
                <data android:host="www.myanimelist.net" android:scheme="https"/>
                <data android:host="m.myanimelist.net" android:scheme="https"/>
                <data android:host="myanimelist.net" android:scheme="http"/>
                <data android:host="www.myanimelist.net" android:scheme="http"/>
                <data android:host="m.myanimelist.net" android:scheme="http"/>
            </intent-filter>"""

        if (!content.contains("<data android:host=\"myanimelist.net\" android:scheme=\"https\"/>")) {
            val target = "android:name=\"net.myanimelist.presentation.activity.HomeActivity\""
            val idx = content.indexOf(target)
            if (idx != -1) {
                val endAct = content.indexOf("</activity>", idx)
                if (endAct != -1) {
                    content = content.substring(0, endAct) + intentFilterXml + "\n        " + content.substring(endAct)
                    manifestFile.writeText(content, Charsets.UTF_8)
                }
            }
        }
    }
}

@Suppress("unused")
val openLinksInAppPatch = bytecodePatch(
    name = "Open links in app",
    description = "Opens myanimelist.net web links directly in the MyAnimeList app instead of an external browser.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAL)
    dependsOn(openLinksResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        HandleIntentFingerprint.method.addInstructions(
            0,
            """
                if-eqz p1, :cond_mal_skip
                invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :cond_mal_skip
                invoke-static {v0}, Lapp/spectre/extension/MalUrlRouter;->route(Landroid/net/Uri;)Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :cond_mal_skip
                invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
                :cond_mal_skip
            """
        )
    }
}
