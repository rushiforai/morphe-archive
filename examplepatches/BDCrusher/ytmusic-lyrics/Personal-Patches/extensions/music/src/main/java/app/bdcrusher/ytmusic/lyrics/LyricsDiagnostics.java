/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.Context;
import android.widget.*;
import android.app.AlertDialog;
import app.morphe.extension.shared.theme.ThemeUtils;
/** Bounded process-local request evidence. Never accepts URLs, headers, tokens or lyric bodies. */
public final class LyricsDiagnostics {
    public static void record(String source,String message){app.bdcrusher.ytmusic.common.FeatureDiagnostics.record(source,message);}
    public static String snapshot(){return app.bdcrusher.ytmusic.common.FeatureDiagnostics.snapshot();}
    
}
