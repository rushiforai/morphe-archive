package defpackage;

import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u98 implements Runnable {
    public final Runnable a;
    public final String b;

    public u98(Runnable runnable, String str) {
        this.a = runnable;
        String strD = t98.a.d(str, "_");
        Locale locale = Locale.US;
        locale.getClass();
        String lowerCase = strD.toLowerCase(locale);
        lowerCase.getClass();
        this.b = lowerCase;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.a.run();
    }
}
