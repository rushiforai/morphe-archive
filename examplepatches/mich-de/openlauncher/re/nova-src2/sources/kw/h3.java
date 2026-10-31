package kw;

import java.util.List;

/* loaded from: classes4.dex */
public final class h3 extends i3 {

    /* renamed from: b, reason: collision with root package name */
    public final boolean f72395b;

    public h3(w0 w0Var, boolean z11) {
        super(w0Var);
        this.f72395b = z11;
    }

    @Override // kw.e3
    public final boolean a() {
        return false;
    }

    @Override // kw.e3
    public final boolean b(boolean z11, boolean z12) {
        return true;
    }

    @Override // kw.i3, kw.e3
    public final boolean c() {
        return this.f72395b;
    }

    public /* synthetic */ h3(int i5, int i11, List list) {
        this(i5, (i11 & 2) != 0 ? null : list, (i11 & 4) == 0);
    }

    public h3(int i5, List list, boolean z11) {
        super(new u0(i5, list));
        this.f72395b = z11;
    }
}
