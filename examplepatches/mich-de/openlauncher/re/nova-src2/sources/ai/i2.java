package ai;

import android.view.ViewGroup;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.google.android.exoplayer2.ui.AspectRatioFrameLayout;
import com.teslacoilsw.launcher.wallpaper.ui.GLRootView;
import com.teslacoilsw.launcher.widget.NumberPicker;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class i2 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13011a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f13012b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f13013c;

    public /* synthetic */ i2(ViewGroup viewGroup, int i5) {
        this.f13011a = i5;
        this.f13013c = viewGroup;
    }

    /* JADX WARN: Removed duplicated region for block: B:68:0x0124  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        switch (this.f13011a) {
            case 0:
                t2 t2Var = (t2) this.f13013c;
                m1 m1Var = (m1) t2Var.f13368a;
                boolean zF = m1Var.f();
                boolean z11 = m1Var.f13155y != null && m1Var.f13155y.booleanValue();
                boolean z12 = this.f13012b;
                m1Var.f13155y = Boolean.valueOf(z12);
                if (z11 == z12) {
                    o0 o0Var = m1Var.f13138f;
                    m1.l(o0Var);
                    o0Var.n.b(Boolean.valueOf(z12), "Default data collection state already set to");
                }
                if (m1Var.f() != zF) {
                    if (m1Var.f() != (m1Var.f13155y != null && m1Var.f13155y.booleanValue())) {
                        o0 o0Var2 = m1Var.f13138f;
                        m1.l(o0Var2);
                        o0Var2.f13195k.c(Boolean.valueOf(z12), "Default data collection is different than actual status", Boolean.valueOf(zF));
                    }
                }
                t2Var.V();
                return;
            case 1:
                synchronized (((GLRootView) this.f13013c).f46392g) {
                    try {
                        this.f13012b = false;
                        if (((GLRootView) this.f13013c).f46392g.isEmpty()) {
                            return;
                        }
                        i30.t tVar = (i30.t) ((GLRootView) this.f13013c).f46392g.removeFirst();
                        ((GLRootView) this.f13013c).f46394i.lock();
                        try {
                            GLRootView gLRootView = (GLRootView) this.f13013c;
                            if (tVar.a(gLRootView.f46387b, gLRootView.f46390e)) {
                                ((GLRootView) this.f13013c).f46394i.unlock();
                                synchronized (((GLRootView) this.f13013c).f46392g) {
                                    ((GLRootView) this.f13013c).f46392g.addLast(tVar);
                                    if (!((GLRootView) this.f13013c).f46390e && !this.f13012b) {
                                        this.f13012b = true;
                                        ((GLRootView) this.f13013c).queueEvent(this);
                                    }
                                }
                                return;
                            }
                            return;
                        } finally {
                            ((GLRootView) this.f13013c).f46394i.unlock();
                        }
                    } finally {
                    }
                }
            case 2:
                NumberPicker numberPicker = (NumberPicker) this.f13013c;
                boolean z13 = this.f13012b;
                char[] cArr = NumberPicker.f46425f0;
                numberPicker.b(z13);
                numberPicker.postDelayed(this, numberPicker.n);
                return;
            case 3:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = (LauncherWallpaperPickerActivity) this.f13013c;
                boolean z14 = this.f13012b;
                if (z14) {
                    launcherWallpaperPickerActivity.o.setVisibility(4);
                    return;
                }
                int i5 = z14 ? 1048576 : 0;
                if (i5 != (launcherWallpaperPickerActivity.getWindow().getAttributes().flags & 1048576)) {
                    launcherWallpaperPickerActivity.getWindow().setFlags(i5, 1048576);
                    return;
                }
                return;
            default:
                this.f13012b = false;
                AspectRatioFrameLayout aspectRatioFrameLayout = (AspectRatioFrameLayout) this.f13013c;
                int i11 = AspectRatioFrameLayout.f31578d;
                aspectRatioFrameLayout.getClass();
                return;
        }
    }

    public i2(t2 t2Var, boolean z11) {
        this.f13011a = 0;
        this.f13012b = z11;
        Objects.requireNonNull(t2Var);
        this.f13013c = t2Var;
    }

    public i2(GLRootView gLRootView) {
        this.f13011a = 1;
        this.f13013c = gLRootView;
        this.f13012b = false;
    }

    public i2(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, boolean z11) {
        this.f13011a = 3;
        this.f13013c = launcherWallpaperPickerActivity;
        this.f13012b = z11;
    }
}
