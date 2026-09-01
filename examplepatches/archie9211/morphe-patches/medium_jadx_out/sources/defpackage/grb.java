package defpackage;

import android.os.Trace;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class grb implements AutoCloseable {
    public static void f(String str) {
        if (str.length() > 127) {
            str = str.substring(0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH).concat("...");
        }
        Trace.beginSection(str);
    }
}
