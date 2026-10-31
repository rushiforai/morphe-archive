package y9;

import com.android.launcher3.CellLayout;

/* loaded from: classes2.dex */
public final /* synthetic */ class v implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96965a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y f96966b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ CellLayout f96967c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f96968d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f96969e;

    public /* synthetic */ v(y yVar, CellLayout cellLayout, int i5, int i11, int i12) {
        this.f96965a = i12;
        this.f96966b = yVar;
        this.f96967c = cellLayout;
        this.f96968d = i5;
        this.f96969e = i11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f96965a) {
            case 0:
                y yVar = this.f96966b;
                CellLayout cellLayout = yVar.f96987p;
                CellLayout cellLayout2 = this.f96967c;
                if (cellLayout != cellLayout2) {
                    cellLayout2.f20910p.add(yVar);
                }
                yVar.f96987p = cellLayout2;
                yVar.f80127a = this.f96968d;
                yVar.f80128b = this.f96969e;
                yVar.i();
                break;
            default:
                y yVar2 = this.f96966b;
                CellLayout cellLayout3 = yVar2.f96987p;
                CellLayout cellLayout4 = this.f96967c;
                if (cellLayout3 != cellLayout4) {
                    cellLayout4.f20910p.add(yVar2);
                }
                yVar2.f96987p = cellLayout4;
                yVar2.f80127a = this.f96968d;
                yVar2.f80128b = this.f96969e;
                yVar2.i();
                break;
        }
    }
}
