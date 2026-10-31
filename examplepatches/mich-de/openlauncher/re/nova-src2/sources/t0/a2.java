package t0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a2 {

    /* renamed from: a, reason: collision with root package name */
    public x7.c f87901a;

    /* renamed from: b, reason: collision with root package name */
    public x7.c f87902b;

    /* renamed from: c, reason: collision with root package name */
    public int f87903c;

    /* renamed from: d, reason: collision with root package name */
    public Long f87904d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f87905e;

    /* JADX WARN: Removed duplicated region for block: B:31:0x0069  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(r3.z zVar) {
        x7.c cVar;
        m3.g gVar = zVar.f85471a;
        this.f87905e = false;
        x7.c cVar2 = this.f87901a;
        if (zVar.equals(cVar2 != null ? (r3.z) cVar2.f95127b : null)) {
            return;
        }
        String str = gVar.f75880b;
        x7.c cVar3 = this.f87901a;
        if (Intrinsics.b(str, cVar3 != null ? ((r3.z) cVar3.f95127b).f85471a.f75880b : null)) {
            x7.c cVar4 = this.f87901a;
            if (cVar4 != null) {
                cVar4.f95127b = zVar;
                return;
            }
            return;
        }
        this.f87901a = new x7.c(this.f87901a, zVar);
        this.f87902b = null;
        int length = gVar.f75880b.length() + this.f87903c;
        this.f87903c = length;
        if (length > 100000) {
            x7.c cVar5 = this.f87901a;
            if ((cVar5 != null ? (x7.c) cVar5.f95126a : null) == null) {
                return;
            }
            while (true) {
                if (cVar5 == null) {
                    cVar = null;
                } else {
                    x7.c cVar6 = (x7.c) cVar5.f95126a;
                    if (cVar6 != null) {
                        cVar = (x7.c) cVar6.f95126a;
                    }
                }
                if (cVar == null) {
                    break;
                } else {
                    cVar5 = (x7.c) cVar5.f95126a;
                }
            }
            if (cVar5 != null) {
                cVar5.f95126a = null;
            }
        }
    }
}
