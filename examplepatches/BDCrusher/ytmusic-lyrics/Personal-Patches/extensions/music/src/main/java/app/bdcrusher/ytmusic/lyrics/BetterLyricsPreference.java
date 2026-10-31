/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
/** A top-level class is required because Android preference names are XML element names. */
public final class BetterLyricsPreference extends Preference {
    public BetterLyricsPreference(Context context,AttributeSet attrs){
        super(context,attrs);setTitle("BDCrusher’s Settings · Better Lyrics");
        setSummary("Rendering, background vocals, singer placement and lyric sources");
    }
    @Override protected void onClick(){LyricsConfig.show(getContext());}
}
