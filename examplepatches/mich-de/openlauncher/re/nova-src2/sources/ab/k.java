package ab;

import ads_mobile_sdk.zm3;
import android.view.View;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.material.sidesheet.SideSheetBehavior;
import com.tiktok.appevents.TTAppEventLogger;
import fa.p0;
import java.util.function.IntConsumer;
import o9.c2;
import s90.j1;

/* loaded from: classes2.dex */
public final /* synthetic */ class k implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f728a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f729b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f730c;

    public /* synthetic */ k(Object obj, int i5, int i11) {
        this.f728a = i11;
        this.f730c = obj;
        this.f729b = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f728a) {
            case 0:
                ((o9.k) this.f730c).onActivityResult(this.f729b, 0, null);
                break;
            case 1:
                ((zm3) this.f730c).c(this.f729b + 1);
                break;
            case 2:
                ((IntConsumer) this.f730c).accept(this.f729b);
                break;
            case 3:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) this.f730c;
                View view = (View) sideSheetBehavior.f34344p.get();
                if (view != null) {
                    sideSheetBehavior.z(view, this.f729b, false);
                    break;
                }
                break;
            case 4:
                ((TTAppEventLogger) this.f730c).lambda$doStartScheduler$4(this.f729b);
                break;
            case 5:
                ag agVar = (ag) this.f730c;
                p0 p0Var = (p0) agVar.f32386b;
                int i5 = p0Var.f54457c.f54471h;
                int i11 = this.f729b;
                if (i5 <= i11 && i11 != agVar.f32385a) {
                    c2 c2Var = p0Var.f54456b;
                    if (c2Var.i()) {
                        c2Var.o(new fa.p[0]);
                        break;
                    }
                }
                break;
            case 6:
                h hVar = ((fe.b) this.f730c).f54714b;
                int i12 = this.f729b;
                if (i12 != -3 && i12 != -2) {
                    if (i12 == -1) {
                        fe.x xVar = (fe.x) hVar.f725e;
                        if (xVar != null) {
                            fe.a0 a0Var = xVar.f55061a;
                            boolean zS = a0Var.S();
                            a0Var.p0(-1, zS ? 2 : 1, zS);
                        }
                        hVar.a();
                        break;
                    } else if (i12 == 1) {
                        hVar.d(1);
                        fe.x xVar2 = (fe.x) hVar.f725e;
                        if (xVar2 != null) {
                            fe.a0 a0Var2 = xVar2.f55061a;
                            a0Var2.p0(1, 1, a0Var2.S());
                            break;
                        }
                    } else {
                        k2.t(i12, "Unknown focus change type: ", "AudioFocusManager");
                        break;
                    }
                } else if (i12 == -2) {
                    fe.x xVar3 = (fe.x) hVar.f725e;
                    if (xVar3 != null) {
                        fe.a0 a0Var3 = xVar3.f55061a;
                        boolean zS2 = a0Var3.S();
                        a0Var3.p0(0, zS2 ? 2 : 1, zS2);
                    }
                    hVar.d(2);
                    break;
                } else {
                    hVar.d(3);
                    break;
                }
                break;
            case 7:
                ((v9.s) this.f730c).f92534m.setBackgroundColor(this.f729b);
                break;
            case 8:
                o9.l lVar = (o9.l) this.f730c;
                lVar.getClass();
                k0.w(lVar, this.f729b, 0).show();
                break;
            case 9:
                ((q4.b) this.f730c).f(this.f729b);
                break;
            case 10:
                ((j1) this.f730c).onStatus(this.f729b);
                break;
            default:
                ((ua.c) this.f730c).h(this.f729b);
                break;
        }
    }
}
