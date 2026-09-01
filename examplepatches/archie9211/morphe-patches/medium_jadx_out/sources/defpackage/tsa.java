package defpackage;

import androidx.datastore.preferences.protobuf.a;
import androidx.datastore.preferences.protobuf.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tsa {
    public final a a;
    public final String b;
    public final Object[] c;
    public final int d;

    public tsa(e eVar, String str, Object[] objArr) {
        this.a = eVar;
        this.b = str;
        this.c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.d = cCharAt;
            return;
        }
        int i = cCharAt & 8191;
        int i2 = 13;
        int i3 = 1;
        while (true) {
            int i4 = i3 + 1;
            char cCharAt2 = str.charAt(i3);
            if (cCharAt2 < 55296) {
                this.d = i | (cCharAt2 << i2);
                return;
            } else {
                i |= (cCharAt2 & 8191) << i2;
                i2 += 13;
                i3 = i4;
            }
        }
    }

    public final q7a a() {
        int i = this.d;
        return (i & 1) != 0 ? q7a.PROTO2 : (i & 4) == 4 ? q7a.EDITIONS : q7a.PROTO3;
    }
}
