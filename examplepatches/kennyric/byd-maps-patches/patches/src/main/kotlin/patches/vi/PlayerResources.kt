package patches.vi

import app.morphe.patcher.patch.resourcePatch

// Guard activation before the ad plugins can block content or request a tag.
internal val adPlayerResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        val file = get("assets/jwplayer/jwplayer.js")
        val original = file.readText()
        val anchor = "n=(0,D.A)(e.edition);if(n(\"ads\")){"
        check(original.windowed(anchor.length).count { it == anchor } == 1) { "VI JW advertising selector changed" }
        val replacement = "n=(0,D.A)(e.edition);Object.keys(t).forEach(function(e){/^(?:vast|googima|imaPluginSdk|dai|daiPluginSdk|bidding|freewheel|ssai|cnx|jwx)\$/i.test((0,y.dB)(e))&&delete t[e]});if(false){"
        file.writeText(original.replace(anchor, replacement))
    }
}

internal val analyticsPlayerResources = resourcePatch {
    dependsOn(adPlayerResources)
    execute {
        val file = get("assets/jwplayer/jwplayer.js")
        val original = file.readText()
        val anchor = "if(n(\"jwpsrv\")){"
        check(original.windowed(anchor.length).count { it == anchor } == 1) { "VI JW analytics selector changed" }
        val replacement = "Object.keys(t).forEach(function(e){/^jwpsrv(?:-dnt)?\$/i.test((0,y.dB)(e))&&delete t[e]});if(false){"
        file.writeText(original.replace(anchor, replacement))
        val manifest = get("assets/jwplayer/manifest")
        val modules = manifest.readText()
        val collector = "local-player://jwpsrv.js\n"
        check(modules.windowed(collector.length).count { it == collector } == 1)
        manifest.writeText(modules.replace(collector, ""))
    }
}
