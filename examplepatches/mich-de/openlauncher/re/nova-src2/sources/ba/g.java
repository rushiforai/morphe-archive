package ba;

import android.content.pm.PackageInfo;
import android.os.SystemClock;
import android.os.UserHandle;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

/* loaded from: classes.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final long f17749a;

    /* renamed from: b, reason: collision with root package name */
    public final UserHandle f17750b;

    /* renamed from: c, reason: collision with root package name */
    public final Stack f17751c;

    /* renamed from: d, reason: collision with root package name */
    public final Stack f17752d;

    /* renamed from: e, reason: collision with root package name */
    public final d f17753e;

    /* renamed from: f, reason: collision with root package name */
    public final HashSet f17754f = new HashSet();

    /* renamed from: g, reason: collision with root package name */
    public final f f17755g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ h f17756h;

    public g(h hVar, long j11, UserHandle userHandle, Stack stack, Stack stack2, d dVar, f fVar) {
        this.f17756h = hVar;
        this.f17750b = userHandle;
        this.f17749a = j11;
        this.f17751c = stack;
        this.f17752d = stack2;
        this.f17753e = dVar;
        this.f17755g = fVar;
    }

    public final void a() {
        this.f17756h.f17759b.f559e.postAtTime(this, h.f17757f, SystemClock.uptimeMillis() + 1);
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        h hVar = this.f17756h;
        HashMap map = hVar.f17758a;
        Stack stack = this.f17752d;
        boolean zIsEmpty = stack.isEmpty();
        d dVar = this.f17753e;
        if (zIsEmpty) {
            Stack stack2 = this.f17751c;
            if (stack2.isEmpty()) {
                return;
            }
            Object objPop = stack2.pop();
            PackageInfo packageInfo = (PackageInfo) map.get(dVar.m(objPop).getPackageName());
            if (packageInfo != null) {
                hVar.f17759b.b(objPop, this.f17753e, packageInfo, this.f17749a, false);
            }
            if (stack2.isEmpty()) {
                return;
            }
            a();
            return;
        }
        Object objPop2 = stack.pop();
        String packageName = dVar.m(objPop2).getPackageName();
        PackageInfo packageInfo2 = (PackageInfo) map.get(packageName);
        hVar.f17759b.b(objPop2, this.f17753e, packageInfo2, this.f17749a, true);
        HashSet hashSet = this.f17754f;
        hashSet.add(packageName);
        if (stack.isEmpty() && !hashSet.isEmpty()) {
            this.f17755g.a(hashSet, this.f17750b);
        }
        a();
    }
}
