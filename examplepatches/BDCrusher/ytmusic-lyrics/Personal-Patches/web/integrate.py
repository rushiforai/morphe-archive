"""One-time source integration into the owned prerelease fork. Never edits shared checkouts."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]
base=root/'extensions/music/src/main/java'
p=base/'app/morphe/extension/music/patches/lyrics/ui/LyricsPanelInstaller.java'
s=p.read_text(encoding='utf-8').replace('LyricsPanelView','BetterLyricsPanelView')
s=s.replace('import android.app.Activity;', 'import app.bdcrusher.ytmusic.lyrics.BetterLyricsPanelView;\nimport android.app.Activity;')
p.write_text(s,encoding='utf-8')
p=base/'app/morphe/extension/music/patches/lyrics/LyricsManager.java'
s=p.read_text(encoding='utf-8').replace('    public long getVideoPositionMs() {','    public boolean isPlaybackPlaying() { return playing; }\n\n    public float getPlaybackSpeed() { return playbackSpeed; }\n\n    public long getVideoPositionMs() {',1)
# Public Better Lyrics sources are orchestrated by the personal host. Keep the native
# authenticated YouTube loaders as adapters, without running unrelated upstream providers.
s=s.replace('LyricsProviders.providersInOrder(order)', 'LyricsProviders.providersInOrder("YTMusic,Captions")')
s=s.replace('        runOnFetchThread(LunaBeatProvider::preloadIndex);','        // Personal host does not query the unrelated LunaBeat source.')
p.write_text(s,encoding='utf-8')
p=root/'extensions/proguard-rules.pro'
p.write_text(p.read_text(encoding='utf-8')+'\n# BDCrusher personal host and @JavascriptInterface entry points.\n-keep class app.bdcrusher.** { *; }\n',encoding='utf-8')
p=root/'patches/src/main/kotlin/app/morphe/patches/music/layout/lyrics/LyricsPatch.kt'
s=p.read_text(encoding='utf-8')
s=s.replace('description = "Adds an option to show synced lyrics with experience enhancement from 18+ providers in the lyrics panel."',
            'description = "BDCrusher’s personal Better Lyrics renderer, sources, background vocals and singer placement. Replaces the native Third-party lyrics panel."')
start=s.index('        PreferenceScreen.LYRICS.addPreferences(')
# Find the balanced addPreferences call, retaining all following original bytecode hooks.
cursor=start+s[start:].index('(');depth=0;quoted=False;escape=False
for end in range(cursor,len(s)):
    char=s[end]
    if quoted:
        if escape:escape=False
        elif char=='\\':escape=True
        elif char=='"':quoted=False
    elif char=='"':quoted=True
    elif char=='(':depth+=1
    elif char==')':
        depth-=1
        if depth==0:break
s=s[:start]+'''        PreferenceScreen.LYRICS.addPreferences(
            SwitchPreference("morphe_music_lyrics_enabled", summary = true),
            NonInteractivePreference(
                key = "bdcrusher_better_lyrics_settings",
                titleKey = null,
                summaryKey = null,
                tag = "app.bdcrusher.ytmusic.lyrics.LyricsConfig\\$SettingsPreference",
                selectable = true
            )
        )'''+s[end+1:]
# Resource assets belong to this patch, not the .mpe (which carries only DEX).
asset_start=s.index('                copyResources(')
asset_code='''                val assets = listOf("index.html", "host.css", "renderer.js", "variables.css",
                    "lyrics.css", "image-highlights.css", "instrumental.css", "Satoshi-Variable.woff2")
                assets.forEach { name ->
                    val destination = context["assets/bdcrusher-lyrics/$name"]
                    destination.parentFile.mkdirs()
                    val stream = lyricsPatch.javaClass.classLoader!!.getResourceAsStream("bdcrusher-lyrics/$name")
                        ?: throw IllegalStateException("Missing bundled lyric asset: $name")
                    stream.use { input -> destination.outputStream().use { output -> input.copyTo(output) } }
                }
'''
s=s[:asset_start]+asset_code+s[asset_start:]
p.write_text(s,encoding='utf-8')
p=root/'gradle.properties'
s=p.read_text(encoding='utf-8').replace('version = 1.48.0-dev.18','version = 0.1.0-beta.1')
p.write_text(s,encoding='utf-8')
p=root/'patches/build.gradle.kts'
s=p.read_text(encoding='utf-8').replace('name = "Morphe Patches"','name = "BDCrusher YT-Music Lyrics"').replace('description = "Patches for Morphe"','description = "Personal YouTube Music lyrics build based on 1.48.0-dev.18; Braccato renderer and source adapters"').replace('author = "MorpheApp"','author = "BDCrusher; upstream MorpheApp and Better Lyrics contributors"')
p.write_text(s,encoding='utf-8')
print('Integrated one replacement patch; original host bytecode hooks retained')
