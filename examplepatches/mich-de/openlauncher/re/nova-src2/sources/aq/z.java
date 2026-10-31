package aq;

/* loaded from: classes4.dex */
public final class z extends b0 {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f15541f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z(d0 d0Var, int i5) {
        super(d0Var);
        this.f15541f = i5;
    }

    @Override // aq.b0, java.util.Iterator
    public Object next() {
        switch (this.f15541f) {
            case 1:
                return a().f15428f;
            default:
                return super.next();
        }
    }
}
