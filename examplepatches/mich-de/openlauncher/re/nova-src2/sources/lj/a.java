package lj;

import android.graphics.Typeface;
import com.google.android.material.chip.Chip;
import ps.i0;
import tj.f;
import tj.g;

/* loaded from: classes3.dex */
public final class a extends i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74953a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f74954b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f74953a = i5;
        this.f74954b = obj;
    }

    private final void r(int i5) {
    }

    @Override // ps.i0
    public final void l(int i5) {
        switch (this.f74953a) {
            case 0:
                break;
            default:
                g gVar = (g) this.f74954b;
                gVar.f89391d = true;
                f fVar = (f) gVar.f89392e.get();
                if (fVar != null) {
                    d dVar = (d) fVar;
                    dVar.x();
                    dVar.invalidateSelf();
                    break;
                }
                break;
        }
    }

    @Override // ps.i0
    public final void m(Typeface typeface, boolean z11) {
        switch (this.f74953a) {
            case 0:
                Chip chip = (Chip) this.f74954b;
                d dVar = chip.f34174e;
                chip.setText(dVar.A0 ? dVar.F : chip.getText());
                chip.requestLayout();
                chip.invalidate();
                break;
            default:
                if (!z11) {
                    g gVar = (g) this.f74954b;
                    gVar.f89391d = true;
                    f fVar = (f) gVar.f89392e.get();
                    if (fVar != null) {
                        d dVar2 = (d) fVar;
                        dVar2.x();
                        dVar2.invalidateSelf();
                        break;
                    }
                }
                break;
        }
    }
}
