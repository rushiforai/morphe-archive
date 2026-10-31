package ca;

import android.util.FloatProperty;
import android.view.View;
import com.android.launcher3.CellLayout;
import com.android.launcher3.allapps.AllAppsContainerView;
import q9.q;
import y9.a0;

/* loaded from: classes.dex */
public final class c extends FloatProperty {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19904a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(String str, int i5) {
        super(str);
        this.f19904a = i5;
    }

    @Override // android.util.Property
    public final Float get(Object obj) {
        switch (this.f19904a) {
            case 0:
                return Float.valueOf(((e) obj).f19922k);
            case 1:
                return Float.valueOf(((e) obj).f19920i);
            case 2:
                return Float.valueOf(((lz.a) obj).f75162b);
            case 3:
                return Float.valueOf(((CellLayout) obj).J);
            case 4:
                return Float.valueOf(((View) obj).getScaleX());
            case 5:
                return Float.valueOf(((AllAppsContainerView) obj).R);
            case 6:
                return Float.valueOf(((q) obj).f83874e);
            case 7:
                return Float.valueOf(0.0f);
            case 8:
                return Float.valueOf(((a0) obj).f96878k);
            case 9:
                return Float.valueOf(((ya.a0) obj).f97100b);
            case 10:
                return Float.valueOf(((z9.e) obj).f98369b);
            case 11:
                return Float.valueOf(((z9.h) obj).n);
            default:
                return Float.valueOf(((z9.h) obj).f98401q);
        }
    }

    @Override // android.util.FloatProperty
    public final void setValue(Object obj, float f11) {
        switch (this.f19904a) {
            case 0:
                e eVar = (e) obj;
                eVar.f19922k = f11;
                eVar.f19913b.setAlpha((int) (f11 * eVar.f19914c));
                break;
            case 1:
                ((e) obj).f19920i = f11;
                break;
            case 2:
                lz.a aVar = (lz.a) obj;
                if (Float.compare(f11, aVar.f75162b) != 0) {
                    aVar.f75162b = f11;
                    aVar.f75161a.run();
                    break;
                }
                break;
            case 3:
                CellLayout cellLayout = (CellLayout) obj;
                if (Float.compare(f11, cellLayout.J) != 0) {
                    cellLayout.J = f11;
                    cellLayout.f20912r.setAlpha((int) (255.0f * f11));
                    if (Float.compare(f11, cellLayout.H) != 0) {
                        cellLayout.H = f11;
                        cellLayout.invalidate();
                        break;
                    }
                }
                break;
            case 4:
                View view = (View) obj;
                view.setScaleX(f11);
                view.setScaleY(f11);
                break;
            case 5:
                ((AllAppsContainerView) obj).t(f11);
                break;
            case 6:
                ((q) obj).d(f11);
                break;
            case 7:
                break;
            case 8:
                a0 a0Var = (a0) obj;
                a0Var.f96878k = f11;
                a0Var.f96869b.invalidate();
                break;
            case 9:
                ((ya.a0) obj).a(f11);
                break;
            case 10:
                z9.e eVar2 = (z9.e) obj;
                if (eVar2.f98369b != f11) {
                    eVar2.f98369b = f11;
                    eVar2.f98371d = Math.round(f11 * 255.0f);
                    eVar2.f98368a.invalidate();
                    break;
                }
                break;
            case 11:
                z9.h hVar = (z9.h) obj;
                if (f11 != hVar.n) {
                    hVar.n = f11;
                    hVar.a();
                    if (!hVar.o) {
                        hVar.f98397k.invalidate();
                        break;
                    }
                }
                break;
            default:
                z9.h hVar2 = (z9.h) obj;
                hVar2.f98401q = f11;
                hVar2.a();
                if (!hVar2.o) {
                    hVar2.f98397k.invalidate();
                    break;
                }
                break;
        }
    }
}
