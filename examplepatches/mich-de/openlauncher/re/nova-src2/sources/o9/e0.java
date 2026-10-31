package o9;

import android.content.Intent;
import android.util.Log;
import java.net.URISyntaxException;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes2.dex */
public final class e0 extends f {
    @Override // o9.f
    public final Intent b(XmlPullParser xmlPullParser) {
        String strE;
        try {
            strE = j.e(xmlPullParser, "uri");
        } catch (URISyntaxException unused) {
            strE = null;
        }
        try {
            return Intent.parseUri(strE, 0);
        } catch (URISyntaxException unused2) {
            Log.w("DefaultLayoutParser", "Shortcut has malformed uri: " + strE);
            return null;
        }
    }
}
