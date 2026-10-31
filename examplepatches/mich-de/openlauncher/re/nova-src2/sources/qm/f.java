package qm;

import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import om.j;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: d, reason: collision with root package name */
    public static final long f84264d = TimeUnit.HOURS.toMillis(24);

    /* renamed from: e, reason: collision with root package name */
    public static final long f84265e = TimeUnit.MINUTES.toMillis(30);

    /* renamed from: a, reason: collision with root package name */
    public final j f84266a;

    /* renamed from: b, reason: collision with root package name */
    public long f84267b;

    /* renamed from: c, reason: collision with root package name */
    public int f84268c;

    public f() {
        if (o7.a.f79616b == null) {
            Pattern pattern = j.f80528c;
            o7.a.f79616b = new o7.a(6);
        }
        o7.a aVar = o7.a.f79616b;
        if (j.f80529d == null) {
            j.f80529d = new j(aVar);
        }
        this.f84266a = j.f80529d;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized boolean a() {
        boolean z11;
        if (this.f84268c != 0) {
            this.f84266a.f80530a.getClass();
            z11 = System.currentTimeMillis() > this.f84267b;
        }
        return z11;
    }

    public final synchronized void b(int i5) {
        long jMin;
        if ((i5 >= 200 && i5 < 300) || i5 == 401 || i5 == 404) {
            synchronized (this) {
                this.f84268c = 0;
            }
            return;
        }
        this.f84268c++;
        synchronized (this) {
            if (i5 == 429 || (i5 >= 500 && i5 < 600)) {
                double dPow = Math.pow(2.0d, this.f84268c);
                this.f84266a.getClass();
                jMin = (long) Math.min(dPow + ((long) (Math.random() * 1000.0d)), f84265e);
            } else {
                jMin = f84264d;
            }
            this.f84266a.f80530a.getClass();
            this.f84267b = System.currentTimeMillis() + jMin;
        }
        return;
    }
}
