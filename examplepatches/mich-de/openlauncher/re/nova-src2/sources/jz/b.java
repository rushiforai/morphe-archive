package jz;

import android.util.Property;
import android.view.animation.Interpolator;
import androidx.appcompat.widget.SwitchCompat;
import com.teslacoilsw.launcher.launcher3.pageindicators.WorkspacePageIndicatorDots;
import java.util.ArrayList;
import java.util.Iterator;
import wj.n;
import wj.p;
import wj.r;
import y9.t;
import y9.z;

/* loaded from: classes4.dex */
public final class b extends Property {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70508a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(int i5, Class cls, String str) {
        super(cls, str);
        this.f70508a = i5;
    }

    @Override // android.util.Property
    public final Object get(Object obj) {
        switch (this.f70508a) {
            case 0:
                return Float.valueOf(((c) obj).f70514g);
            case 1:
                return Float.valueOf(((WorkspacePageIndicatorDots) obj).f45869z);
            case 2:
                return Float.valueOf(((SwitchCompat) obj).f13799z);
            case 3:
                return Float.valueOf(((wj.g) obj).f94436l);
            case 4:
                return Float.valueOf(((wj.g) obj).f94437m);
            case 5:
                return Float.valueOf(((wj.l) obj).b());
            case 6:
                return Float.valueOf(((p) obj).f94476l);
            case 7:
                return Float.valueOf(((r) obj).f94487m);
            case 8:
                float[] fArr = t.f96958g;
                z zVar = ((t) obj).f96961c;
                fArr[0] = zVar.f96999d;
                fArr[1] = zVar.f96997b;
                fArr[2] = zVar.f96998c;
                return fArr;
            case 9:
                return Float.valueOf(((z9.d) obj).E);
            default:
                return Float.valueOf(((za.c) obj).f98415i);
        }
    }

    @Override // android.util.Property
    public final void set(Object obj, Object obj2) {
        switch (this.f70508a) {
            case 0:
                ((c) obj).f0(((Number) obj2).floatValue());
                break;
            case 1:
                WorkspacePageIndicatorDots workspacePageIndicatorDots = (WorkspacePageIndicatorDots) obj;
                workspacePageIndicatorDots.f45869z = ((Float) obj2).floatValue();
                workspacePageIndicatorDots.invalidate();
                workspacePageIndicatorDots.invalidateOutline();
                break;
            case 2:
                SwitchCompat switchCompat = (SwitchCompat) obj;
                switchCompat.f13799z = ((Float) obj2).floatValue();
                switchCompat.invalidate();
                break;
            case 3:
                wj.g gVar = (wj.g) obj;
                float fFloatValue = ((Float) obj2).floatValue();
                gVar.f94436l = fFloatValue;
                int i5 = (int) (fFloatValue * 5400.0f);
                f6.a aVar = gVar.f94433i;
                ArrayList arrayList = (ArrayList) gVar.f19223b;
                wj.m mVar = (wj.m) arrayList.get(0);
                float f11 = gVar.f94436l * 1520.0f;
                mVar.f94459a = (-20.0f) + f11;
                mVar.f94460b = f11;
                for (int i11 = 0; i11 < 4; i11++) {
                    mVar.f94460b = (aVar.getInterpolation(c3.b.m(i5, wj.g.o[i11], 667)) * 250.0f) + mVar.f94460b;
                    mVar.f94459a = (aVar.getInterpolation(c3.b.m(i5, wj.g.f94427p[i11], 667)) * 250.0f) + mVar.f94459a;
                }
                float f12 = mVar.f94459a;
                float f13 = mVar.f94460b;
                mVar.f94459a = (((f13 - f12) * gVar.f94437m) + f12) / 360.0f;
                mVar.f94460b = f13 / 360.0f;
                int i12 = 0;
                while (true) {
                    if (i12 < 4) {
                        float fM = c3.b.m(i5, wj.g.f94428q[i12], 333);
                        if (fM < 0.0f || fM > 1.0f) {
                            i12++;
                        } else {
                            int i13 = i12 + gVar.f94435k;
                            int[] iArr = gVar.f94434j.f94415c;
                            int length = i13 % iArr.length;
                            int length2 = (length + 1) % iArr.length;
                            int i14 = iArr[length];
                            int i15 = iArr[length2];
                            ((wj.m) arrayList.get(0)).f94461c = cj.b.a(aVar.getInterpolation(fM), Integer.valueOf(i14), Integer.valueOf(i15)).intValue();
                        }
                    }
                }
                ((n) gVar.f19222a).invalidateSelf();
                break;
            case 4:
                ((wj.g) obj).f94437m = ((Float) obj2).floatValue();
                break;
            case 5:
                wj.l lVar = (wj.l) obj;
                float fFloatValue2 = ((Float) obj2).floatValue();
                if (lVar.f94456h != fFloatValue2) {
                    lVar.f94456h = fFloatValue2;
                    lVar.invalidateSelf();
                    break;
                }
                break;
            case 6:
                p pVar = (p) obj;
                float fFloatValue3 = ((Float) obj2).floatValue();
                pVar.f94476l = fFloatValue3;
                ArrayList arrayList2 = (ArrayList) pVar.f19223b;
                ((wj.m) arrayList2.get(0)).f94459a = 0.0f;
                float fM2 = c3.b.m((int) (fFloatValue3 * 333.0f), 0, 667);
                wj.m mVar2 = (wj.m) arrayList2.get(0);
                wj.m mVar3 = (wj.m) arrayList2.get(1);
                f6.a aVar2 = pVar.f94472h;
                float interpolation = aVar2.getInterpolation(fM2);
                mVar3.f94459a = interpolation;
                mVar2.f94460b = interpolation;
                wj.m mVar4 = (wj.m) arrayList2.get(1);
                wj.m mVar5 = (wj.m) arrayList2.get(2);
                float interpolation2 = aVar2.getInterpolation(fM2 + 0.49925038f);
                mVar5.f94459a = interpolation2;
                mVar4.f94460b = interpolation2;
                ((wj.m) arrayList2.get(2)).f94460b = 1.0f;
                if (pVar.f94475k && ((wj.m) arrayList2.get(1)).f94460b < 1.0f) {
                    ((wj.m) arrayList2.get(2)).f94461c = ((wj.m) arrayList2.get(1)).f94461c;
                    ((wj.m) arrayList2.get(1)).f94461c = ((wj.m) arrayList2.get(0)).f94461c;
                    ((wj.m) arrayList2.get(0)).f94461c = pVar.f94473i.f94415c[pVar.f94474j];
                    pVar.f94475k = false;
                }
                ((n) pVar.f19222a).invalidateSelf();
                break;
            case 7:
                r rVar = (r) obj;
                float fFloatValue4 = ((Float) obj2).floatValue();
                rVar.f94487m = fFloatValue4;
                int i16 = (int) (fFloatValue4 * 1800.0f);
                Interpolator[] interpolatorArr = rVar.f94483i;
                ArrayList arrayList3 = (ArrayList) rVar.f19223b;
                for (int i17 = 0; i17 < arrayList3.size(); i17++) {
                    wj.m mVar6 = (wj.m) arrayList3.get(i17);
                    int[] iArr2 = r.f94479p;
                    int i18 = i17 * 2;
                    int i19 = iArr2[i18];
                    int[] iArr3 = r.o;
                    mVar6.f94459a = v4.a.e(interpolatorArr[i18].getInterpolation(c3.b.m(i16, i19, iArr3[i18])), 0.0f, 1.0f);
                    int i21 = i18 + 1;
                    mVar6.f94460b = v4.a.e(interpolatorArr[i21].getInterpolation(c3.b.m(i16, iArr2[i21], iArr3[i21])), 0.0f, 1.0f);
                }
                if (rVar.f94486l) {
                    Iterator it = arrayList3.iterator();
                    while (it.hasNext()) {
                        ((wj.m) it.next()).f94461c = rVar.f94484j.f94415c[rVar.f94485k];
                    }
                    rVar.f94486l = false;
                }
                ((n) rVar.f19222a).invalidateSelf();
                break;
            case 8:
                t tVar = (t) obj;
                float[] fArr = (float[]) obj2;
                z zVar = tVar.f96961c;
                zVar.f96999d = fArr[0];
                zVar.f96997b = fArr[1];
                zVar.f96998c = fArr[2];
                tVar.f96960b.f96869b.invalidate();
                break;
            case 9:
                ((z9.d) obj).n(((Float) obj2).floatValue());
                break;
            default:
                ((za.c) obj).Y(((Float) obj2).floatValue());
                break;
        }
    }
}
