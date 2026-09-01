package defpackage;

import android.util.Log;
import java.util.Arrays;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cpd {
    public static final Pattern d = Pattern.compile("[a-zA-Z0-9-_.~%]{1,900}");
    public final String a;
    public final String b;
    public final String c;

    public cpd(String str, String str2) {
        String strSubstring;
        if (str2 == null || !str2.startsWith("/topics/")) {
            strSubstring = str2;
        } else {
            Log.w("FirebaseMessaging", "Format /topics/topic-name is deprecated. Only 'topic-name' should be used in " + str + ".");
            strSubstring = str2.substring(8);
        }
        if (strSubstring == null || !d.matcher(strSubstring).matches()) {
            ay0.e(ev6.x("Invalid topic name: ", strSubstring, " does not match the allowed format [a-zA-Z0-9-_.~%]{1,900}."));
            throw null;
        }
        this.a = strSubstring;
        this.b = str;
        this.c = b09.y(str, "!", str2);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof cpd)) {
            return false;
        }
        cpd cpdVar = (cpd) obj;
        return this.a.equals(cpdVar.a) && this.b.equals(cpdVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.b, this.a});
    }
}
