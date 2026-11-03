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
        PreferenceCategory heading=FeaturePreferences.heading(c);heading.setTitle("In-app media downloads");screen.addPreference(heading);
        ListPreference quality=FeaturePreferences.choice(c);quality.setKey("bd_audio_quality");quality.setPersistent(false);quality.setTitle("Download quality");quality.setEntries(new String[]{"High · Opus","Standard · Opus","Low · Opus"});quality.setEntryValues(new String[]{"HIGH","STANDARD","LOW"});quality.setValue(DownloadPrompt.selected(c).name());quality.setSummary(DownloadPrompt.selected(c).label+" · Opus in WebM");quality.setOnPreferenceChangeListener((row,value)->{AudioQuality.Tier tier=AudioQuality.Tier.parse(String.valueOf(value));p.edit().putString("quality",tier.name()).apply();quality.setSummary(tier.label+" · Opus in WebM");return true;});screen.addPreference(quality);
        SwitchPreference ask=FeaturePreferences.toggle(c);ask.setKey("bd_audio_ask");ask.setPersistent(false);ask.setTitle("Ask each time");ask.setSummary("Choose Audio or Video, quality and estimated size. Playlists ask once for the batch.");ask.setChecked(!p.getBoolean("remember",false));ask.setOnPreferenceChangeListener((row,value)->{p.edit().putBoolean("remember",!Boolean.TRUE.equals(value)).apply();return true;});screen.addPreference(ask);
        SwitchPreference chapters=FeaturePreferences.toggle(c);chapters.setKey("bd_audio_chapters");chapters.setPersistent(false);chapters.setTitle("Save SponsorBlock chapters");chapters.setSummary("When SponsorBlock is installed and enabled, retain its category names, colors and timestamps. Audio is kept intact.");chapters.setChecked(p.getBoolean("chapters",true));chapters.setOnPreferenceChangeListener((row,value)->{p.edit().putBoolean("chapters",Boolean.TRUE.equals(value)).apply();return true;});screen.addPreference(chapters);
        ListPreference video=FeaturePreferences.choice(c);video.setKey("bd_video_quality");video.setPersistent(false);video.setTitle("Preferred video resolution");video.setEntries(new String[]{"2160p","1440p","1080p","720p","480p","360p","144p"});video.setEntryValues(new String[]{"2160","1440","1080","720","480","360","144"});video.setValue(Integer.toString(p.getInt("videoHeight",1080)));video.setSummary("Actual compatible resolutions are checked for each item");video.setOnPreferenceChangeListener((row,value)->{p.edit().putInt("videoHeight",Integer.parseInt(String.valueOf(value))).apply();return true;});screen.addPreference(video);
        SwitchPreference videoAsk=FeaturePreferences.toggle(c);videoAsk.setKey("bd_video_ask");videoAsk.setPersistent(false);videoAsk.setTitle("Ask each time for Video");videoAsk.setChecked(!p.getBoolean("rememberVideo",false));videoAsk.setOnPreferenceChangeListener((row,value)->{p.edit().putBoolean("rememberVideo",!Boolean.TRUE.equals(value)).apply();return true;});screen.addPreference(videoAsk);
        screen.addPreference(new AudioStoragePreference(c));
        if(!app.bdcrusher.ytmusic.common.PersonalRuntime.installed(c,"sponsorblock")){chapters.setEnabled(false);chapters.setSummary("Select the SponsorBlock patch to save named segments and use its normal colors and skip settings.");}
    }
}
