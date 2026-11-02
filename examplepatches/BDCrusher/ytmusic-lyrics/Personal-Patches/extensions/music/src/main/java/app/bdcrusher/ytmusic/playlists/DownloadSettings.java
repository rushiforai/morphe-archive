/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.content.*;
import android.preference.*;
import app.bdcrusher.ytmusic.common.FeaturePreferences;

/** Added to the existing Downloads page; the existing mode/app selector stays authoritative. */
@SuppressWarnings("deprecation")
public final class DownloadSettings {
    private DownloadSettings(){}
    public static void install(PreferenceFragment fragment){
        Preference page=fragment.findPreference("morphe_external_downloader_screen");
        if(!(page instanceof PreferenceScreen screen)||screen.findPreference("bd_audio_quality")!=null)return;
        Context c=fragment.getActivity();SharedPreferences p=DownloadPrompt.preferences(c);
        PreferenceCategory heading=FeaturePreferences.heading(c);heading.setTitle("In-app audio downloads");screen.addPreference(heading);
        ListPreference quality=FeaturePreferences.choice(c);quality.setKey("bd_audio_quality");quality.setPersistent(false);quality.setTitle("Download quality");quality.setEntries(new String[]{"High · Opus","Standard · Opus","Low · Opus"});quality.setEntryValues(new String[]{"HIGH","STANDARD","LOW"});quality.setValue(DownloadPrompt.selected(c).name());quality.setSummary(DownloadPrompt.selected(c).label+" · Opus in WebM");quality.setOnPreferenceChangeListener((row,value)->{AudioQuality.Tier tier=AudioQuality.Tier.parse(String.valueOf(value));p.edit().putString("quality",tier.name()).apply();quality.setSummary(tier.label+" · Opus in WebM");return true;});screen.addPreference(quality);
        SwitchPreference ask=FeaturePreferences.toggle(c);ask.setKey("bd_audio_ask");ask.setPersistent(false);ask.setTitle("Ask each time");ask.setSummary("Choose audio quality and see the estimated size before a song downloads. Playlists ask once for the batch.");ask.setChecked(!p.getBoolean("remember",false));ask.setOnPreferenceChangeListener((row,value)->{p.edit().putBoolean("remember",!Boolean.TRUE.equals(value)).apply();return true;});screen.addPreference(ask);
        SwitchPreference chapters=FeaturePreferences.toggle(c);chapters.setKey("bd_audio_chapters");chapters.setPersistent(false);chapters.setTitle("Save SponsorBlock chapters");chapters.setSummary("When SponsorBlock is installed and enabled, retain its category names, colors and timestamps. Audio is kept intact.");chapters.setChecked(p.getBoolean("chapters",true));chapters.setOnPreferenceChangeListener((row,value)->{p.edit().putBoolean("chapters",Boolean.TRUE.equals(value)).apply();return true;});screen.addPreference(chapters);
        screen.addPreference(new AudioStoragePreference(c));
        if(!app.bdcrusher.ytmusic.common.PersonalRuntime.installed(c,"sponsorblock")){chapters.setEnabled(false);chapters.setSummary("Select the SponsorBlock patch to save named segments and use its normal colors and skip settings.");}
    }
}
