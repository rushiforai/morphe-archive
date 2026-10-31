package wv;

import android.util.Log;
import ps.f0;

/* loaded from: classes4.dex */
public final class k extends f0 {

    /* renamed from: b, reason: collision with root package name */
    public static final k f94731b = new k(0);

    /* renamed from: c, reason: collision with root package name */
    public static final k f94732c = new k(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94733a;

    public /* synthetic */ k(int i5) {
        this.f94733a = i5;
    }

    private final void y(String str, Throwable th2) {
    }

    private final void z() {
    }

    @Override // ps.f0
    public final void l(String str, Throwable th2) {
        switch (this.f94733a) {
            case 0:
                break;
            default:
                Log.e("StripeSdk", str, th2);
                break;
        }
    }

    @Override // ps.f0
    public final void u() {
        switch (this.f94733a) {
            case 0:
                break;
            default:
                Log.i("StripeSdk", "Make initial challenge request.");
                break;
        }
    }
}
