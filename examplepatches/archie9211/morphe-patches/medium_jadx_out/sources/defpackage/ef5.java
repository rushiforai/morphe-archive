package defpackage;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ef5 implements cf5 {
    public final ArrayList a;

    public ef5(int i) {
        switch (i) {
            case 2:
                this.a = k80.s0(new no7[0]);
                break;
            default:
                this.a = new ArrayList(32);
                break;
        }
    }

    @Override // defpackage.cf5
    public void a(String str, String str2) {
        str2.getClass();
        this.a.add(String.format(Locale.US, "%s=%s", Arrays.copyOf(new Object[]{str, URLEncoder.encode(str2, "UTF-8")}, 2)));
    }

    public void b(float f, float f2) {
        this.a.add(new s59(f, f2));
    }

    public ef5(ArrayList arrayList) {
        this.a = arrayList;
    }
}
