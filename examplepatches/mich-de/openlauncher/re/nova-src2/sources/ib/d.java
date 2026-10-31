package ib;

import android.os.SystemClock;
import android.view.Choreographer;
import com.android.launcher3.CropView;
import java.util.ArrayList;
import vk.j;
import z.c1;

/* loaded from: classes2.dex */
public final class d implements Choreographer.FrameCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61498a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f61499b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f61498a = i5;
        this.f61499b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0057  */
    @Override // android.view.Choreographer.FrameCallback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void doFrame(long j11) {
        long j12;
        int i5;
        float f11;
        boolean z11;
        boolean z12;
        switch (this.f61498a) {
            case 0:
                CropView cropView = (CropView) this.f61499b;
                cropView.f20924b = false;
                cropView.f20923a.requestRender();
                break;
            default:
                z5.a aVar = (z5.a) ((y90.f) ((j) this.f61499b).f92817b).f97028a;
                long jUptimeMillis = SystemClock.uptimeMillis();
                ArrayList arrayList = aVar.f98213b;
                long jUptimeMillis2 = SystemClock.uptimeMillis();
                boolean z13 = false;
                int i11 = 0;
                while (i11 < arrayList.size()) {
                    z5.c cVar = (z5.c) arrayList.get(i11);
                    if (cVar == null) {
                        i5 = i11;
                    } else {
                        c1 c1Var = aVar.f98212a;
                        Long l9 = (Long) c1Var.get(cVar);
                        if (l9 != null) {
                            if (l9.longValue() < jUptimeMillis2) {
                                c1Var.remove(cVar);
                                j12 = cVar.f98234i;
                                if (j12 != 0) {
                                    cVar.f98234i = jUptimeMillis;
                                    cVar.c(cVar.f98227b);
                                } else {
                                    long j13 = jUptimeMillis - j12;
                                    cVar.f98234i = jUptimeMillis;
                                    if (cVar.o) {
                                        float f12 = cVar.n;
                                        if (f12 != Float.MAX_VALUE) {
                                            z12 = true;
                                            cVar.f98238m.f98247i = f12;
                                            cVar.n = Float.MAX_VALUE;
                                        } else {
                                            z12 = true;
                                        }
                                        cVar.f98227b = (float) cVar.f98238m.f98247i;
                                        cVar.f98226a = 0.0f;
                                        cVar.o = z13;
                                        z11 = z12;
                                        i5 = i11;
                                    } else {
                                        if (cVar.n != Float.MAX_VALUE) {
                                            i5 = i11;
                                            long j14 = j13 / 2;
                                            jj.d dVarC = cVar.f98238m.c(cVar.f98227b, cVar.f98226a, j14);
                                            z5.d dVar = cVar.f98238m;
                                            dVar.f98247i = cVar.n;
                                            cVar.n = Float.MAX_VALUE;
                                            jj.d dVarC2 = dVar.c(dVarC.f69567a, dVarC.f69568b, j14);
                                            cVar.f98227b = dVarC2.f69567a;
                                            cVar.f98226a = dVarC2.f69568b;
                                            f11 = 0.0f;
                                        } else {
                                            i5 = i11;
                                            f11 = 0.0f;
                                            jj.d dVarC3 = cVar.f98238m.c(cVar.f98227b, cVar.f98226a, j13);
                                            cVar.f98227b = dVarC3.f69567a;
                                            cVar.f98226a = dVarC3.f69568b;
                                        }
                                        float fMax = Math.max(cVar.f98227b, cVar.f98233h);
                                        cVar.f98227b = fMax;
                                        cVar.f98227b = Math.min(fMax, cVar.f98232g);
                                        float f13 = cVar.f98226a;
                                        z5.d dVar2 = cVar.f98238m;
                                        if (Math.abs(f13) >= dVar2.f98243e || Math.abs(r8 - ((float) dVar2.f98247i)) >= dVar2.f98242d) {
                                            z11 = false;
                                        } else {
                                            cVar.f98227b = (float) cVar.f98238m.f98247i;
                                            cVar.f98226a = f11;
                                            z11 = true;
                                        }
                                    }
                                    float fMin = Math.min(cVar.f98227b, cVar.f98232g);
                                    cVar.f98227b = fMin;
                                    float fMax2 = Math.max(fMin, cVar.f98233h);
                                    cVar.f98227b = fMax2;
                                    cVar.c(fMax2);
                                    if (z11) {
                                        cVar.b();
                                    }
                                }
                            }
                            i5 = i11;
                        } else {
                            j12 = cVar.f98234i;
                            if (j12 != 0) {
                            }
                        }
                    }
                    i11 = i5 + 1;
                    z13 = false;
                }
                if (aVar.f98216e) {
                    for (int size = arrayList.size() - 1; size >= 0; size--) {
                        if (arrayList.get(size) == null) {
                            arrayList.remove(size);
                        }
                    }
                    aVar.f98216e = false;
                }
                if (arrayList.size() > 0) {
                    if (aVar.f98215d == null) {
                        aVar.f98215d = new j(aVar.f98214c);
                    }
                    j jVar = aVar.f98215d;
                    ((Choreographer) jVar.f92818c).postFrameCallback((d) jVar.f92819d);
                    break;
                }
                break;
        }
    }
}
