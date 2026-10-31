package wf;

import android.os.Handler;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static final ArrayList f94369b = new ArrayList(50);

    /* renamed from: a, reason: collision with root package name */
    public final Handler f94370a;

    public s(Handler handler) {
        this.f94370a = handler;
    }

    public static r b() {
        r rVar;
        ArrayList arrayList = f94369b;
        synchronized (arrayList) {
            try {
                rVar = arrayList.isEmpty() ? new r() : (r) arrayList.remove(arrayList.size() - 1);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return rVar;
    }

    public final r a(int i5, Object obj) {
        r rVarB = b();
        rVarB.f94368a = this.f94370a.obtainMessage(i5, obj);
        return rVarB;
    }

    public final boolean c(int i5) {
        return this.f94370a.sendEmptyMessage(i5);
    }
}
