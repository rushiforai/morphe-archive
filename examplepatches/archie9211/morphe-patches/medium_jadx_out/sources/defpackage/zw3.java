package defpackage;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import androidx.emoji2.text.EmojiCompatInitializer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zw3 implements f03 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ Object b;

    public zw3(x51 x51Var) {
        this.b = x51Var;
    }

    @Override // defpackage.f03
    public final void onCreate(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.f03
    public final void onDestroy(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.f03
    public final void onPause(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.f03
    public final void onResume(iy6 iy6Var) {
        switch (this.a) {
            case 0:
                (Build.VERSION.SDK_INT >= 28 ? h32.a(Looper.getMainLooper()) : new Handler(Looper.getMainLooper())).postDelayed(new bx3(0), 500L);
                ((wx6) this.b).b(this);
                break;
        }
    }

    @Override // defpackage.f03
    public final void onStart(iy6 iy6Var) {
        switch (this.a) {
            case 0:
                break;
            default:
                ((x51) this.b).resumeWith(c1e.a);
                break;
        }
    }

    @Override // defpackage.f03
    public final void onStop(iy6 iy6Var) {
        int i = this.a;
    }

    public zw3(EmojiCompatInitializer emojiCompatInitializer, wx6 wx6Var) {
        this.b = wx6Var;
    }

    private final void a(iy6 iy6Var) {
    }

    private final void b(iy6 iy6Var) {
    }

    private final void c(iy6 iy6Var) {
    }

    private final void d(iy6 iy6Var) {
    }

    private final void e(iy6 iy6Var) {
    }

    private final void g(iy6 iy6Var) {
    }

    private final void h(iy6 iy6Var) {
    }

    private final void i(iy6 iy6Var) {
    }

    private final void j(iy6 iy6Var) {
    }

    private final void k(iy6 iy6Var) {
    }
}
