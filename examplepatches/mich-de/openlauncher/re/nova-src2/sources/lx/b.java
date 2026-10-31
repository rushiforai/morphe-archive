package lx;

import android.os.SystemClock;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f75155a;

    /* renamed from: b, reason: collision with root package name */
    public long f75156b = SystemClock.uptimeMillis();

    public b(String str) {
        this.f75155a = str;
    }

    public final void a(String str) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r(this.f75155a);
        bVar.b(str + " " + (SystemClock.uptimeMillis() - this.f75156b) + "ms", new Object[0]);
        this.f75156b = SystemClock.uptimeMillis();
    }
}
