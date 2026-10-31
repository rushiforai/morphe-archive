package xq;

import android.util.Log;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96222a;

    /* JADX WARN: Failed to find 'out' block for switch in B:3:0x0002. Please report as an issue. */
    public final void a(String msg) {
        switch (this.f96222a) {
        }
        Intrinsics.g(msg, "msg");
    }

    public final void b(String msg, Throwable th2) {
        switch (this.f96222a) {
            case 0:
                Intrinsics.g(msg, "msg");
                break;
            default:
                Intrinsics.g(msg, "msg");
                Log.e("StripeSdk", msg, th2);
                break;
        }
    }

    public final void c(String msg) {
        switch (this.f96222a) {
            case 0:
                Intrinsics.g(msg, "msg");
                break;
            default:
                Intrinsics.g(msg, "msg");
                Log.i("StripeSdk", msg);
                break;
        }
    }

    public final void d(String msg) {
        switch (this.f96222a) {
            case 0:
                Intrinsics.g(msg, "msg");
                break;
            default:
                Intrinsics.g(msg, "msg");
                Log.w("StripeSdk", msg);
                break;
        }
    }
}
