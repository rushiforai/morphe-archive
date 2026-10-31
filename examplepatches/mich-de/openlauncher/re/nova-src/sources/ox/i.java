package ox;

import com.android.launcher3.allapps.FloatingHeaderView;
import com.teslacoilsw.launcher.ads.DrawerAdFloatingHeaderView;

/* loaded from: classes4.dex */
public final class i implements qx.f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81079a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DrawerAdFloatingHeaderView f81080b;

    public /* synthetic */ i(DrawerAdFloatingHeaderView drawerAdFloatingHeaderView, int i5) {
        this.f81079a = i5;
        this.f81080b = drawerAdFloatingHeaderView;
    }

    private final void a() {
    }

    private final void b() {
    }

    @Override // qx.f
    public final void i(String str) {
        switch (this.f81079a) {
            case 0:
                final DrawerAdFloatingHeaderView drawerAdFloatingHeaderView = this.f81080b;
                if (!drawerAdFloatingHeaderView.f45680f) {
                    drawerAdFloatingHeaderView.f45680f = true;
                    drawerAdFloatingHeaderView.setVisibility(0);
                    final int i5 = 0;
                    drawerAdFloatingHeaderView.post(new Runnable() { // from class: ox.h
                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (i5) {
                                case 0:
                                    DrawerAdFloatingHeaderView drawerAdFloatingHeaderView2 = drawerAdFloatingHeaderView;
                                    drawerAdFloatingHeaderView2.requestLayout();
                                    FloatingHeaderView floatingHeaderView = drawerAdFloatingHeaderView2.f45681g;
                                    if (floatingHeaderView != null) {
                                        floatingHeaderView.onHeightUpdated();
                                        break;
                                    }
                                    break;
                                default:
                                    DrawerAdFloatingHeaderView drawerAdFloatingHeaderView3 = drawerAdFloatingHeaderView;
                                    drawerAdFloatingHeaderView3.requestLayout();
                                    FloatingHeaderView floatingHeaderView2 = drawerAdFloatingHeaderView3.f45681g;
                                    if (floatingHeaderView2 != null) {
                                        floatingHeaderView2.onHeightUpdated();
                                        break;
                                    }
                                    break;
                            }
                        }
                    });
                    break;
                }
                break;
            default:
                final DrawerAdFloatingHeaderView drawerAdFloatingHeaderView2 = this.f81080b;
                if (!drawerAdFloatingHeaderView2.f45680f) {
                    drawerAdFloatingHeaderView2.f45680f = true;
                    drawerAdFloatingHeaderView2.setVisibility(0);
                    final int i11 = 1;
                    drawerAdFloatingHeaderView2.post(new Runnable() { // from class: ox.h
                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (i11) {
                                case 0:
                                    DrawerAdFloatingHeaderView drawerAdFloatingHeaderView22 = drawerAdFloatingHeaderView2;
                                    drawerAdFloatingHeaderView22.requestLayout();
                                    FloatingHeaderView floatingHeaderView = drawerAdFloatingHeaderView22.f45681g;
                                    if (floatingHeaderView != null) {
                                        floatingHeaderView.onHeightUpdated();
                                        break;
                                    }
                                    break;
                                default:
                                    DrawerAdFloatingHeaderView drawerAdFloatingHeaderView3 = drawerAdFloatingHeaderView2;
                                    drawerAdFloatingHeaderView3.requestLayout();
                                    FloatingHeaderView floatingHeaderView2 = drawerAdFloatingHeaderView3.f45681g;
                                    if (floatingHeaderView2 != null) {
                                        floatingHeaderView2.onHeightUpdated();
                                        break;
                                    }
                                    break;
                            }
                        }
                    });
                    break;
                }
                break;
        }
    }

    @Override // qx.f
    public final void y() {
        int i5 = this.f81079a;
    }
}
