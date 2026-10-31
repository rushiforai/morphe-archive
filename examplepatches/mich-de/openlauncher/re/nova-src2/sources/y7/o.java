package y7;

import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import p7.x;

/* loaded from: classes.dex */
public final class o implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final p7.h f96756a;

    /* renamed from: b, reason: collision with root package name */
    public final p7.m f96757b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f96758c;

    /* renamed from: d, reason: collision with root package name */
    public final int f96759d;

    public o(p7.h processor, p7.m token, boolean z11, int i5) {
        Intrinsics.g(processor, "processor");
        Intrinsics.g(token, "token");
        this.f96756a = processor;
        this.f96757b = token;
        this.f96758c = z11;
        this.f96759d = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        x xVarB;
        if (this.f96758c) {
            p7.h hVar = this.f96756a;
            p7.m mVar = this.f96757b;
            int i5 = this.f96759d;
            hVar.getClass();
            String str = mVar.f82354a.f95141a;
            synchronized (hVar.f82346k) {
                xVarB = hVar.b(str);
            }
            p7.h.d(xVarB, i5);
        } else {
            p7.h hVar2 = this.f96756a;
            p7.m mVar2 = this.f96757b;
            int i11 = this.f96759d;
            hVar2.getClass();
            String str2 = mVar2.f82354a.f95141a;
            synchronized (hVar2.f82346k) {
                try {
                    if (hVar2.f82341f.get(str2) != null) {
                        o7.r.c().getClass();
                    } else {
                        Set set = (Set) hVar2.f82343h.get(str2);
                        if (set != null && set.contains(mVar2)) {
                            p7.h.d(hVar2.b(str2), i11);
                        }
                    }
                } finally {
                }
            }
        }
        o7.r rVarC = o7.r.c();
        o7.r.e("StopWorkRunnable");
        x7.i iVar = this.f96757b.f82354a;
        rVarC.getClass();
    }
}
