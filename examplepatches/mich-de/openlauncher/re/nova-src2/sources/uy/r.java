package uy;

import android.content.Context;

/* loaded from: classes4.dex */
public final class r extends j {

    /* renamed from: j, reason: collision with root package name */
    public static r f91748j;

    public static r g(Context context) {
        r rVar;
        synchronized (r.class) {
            try {
                if (f91748j == null) {
                    r rVar2 = new r(context.getResources().getString(2132017983));
                    rVar2.f91753e = -1;
                    rVar2.f91750b = true;
                    rVar2.f91751c = n0.f91731c;
                    rVar2.f91757i = d0.f91699e.g();
                    f91748j = rVar2;
                }
                rVar = f91748j;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return rVar;
    }
}
