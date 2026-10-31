package tm;

import android.util.Log;
import b.c0;
import b.u4;
import java.util.Arrays;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: d, reason: collision with root package name */
    public static final Pattern f89505d = Pattern.compile("[a-zA-Z0-9-_.~%]{1,900}");

    /* renamed from: a, reason: collision with root package name */
    public final String f89506a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89507b;

    /* renamed from: c, reason: collision with root package name */
    public final String f89508c;

    public r(String str, String str2) {
        String strSubstring;
        if (str2 == null || !str2.startsWith("/topics/")) {
            strSubstring = str2;
        } else {
            Log.w("FirebaseMessaging", "Format /topics/topic-name is deprecated. Only 'topic-name' should be used in " + str + ".");
            strSubstring = str2.substring(8);
        }
        if (strSubstring == null || !f89505d.matcher(strSubstring).matches()) {
            throw new IllegalArgumentException(c0.l("Invalid topic name: ", strSubstring, " does not match the allowed format [a-zA-Z0-9-_.~%]{1,900}."));
        }
        this.f89506a = strSubstring;
        this.f89507b = str;
        this.f89508c = u4.m(str, "!", str2);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return this.f89506a.equals(rVar.f89506a) && this.f89507b.equals(rVar.f89507b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f89507b, this.f89506a});
    }
}
