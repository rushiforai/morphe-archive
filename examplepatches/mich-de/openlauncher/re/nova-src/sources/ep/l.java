package ep;

import aq.b0;

/* loaded from: classes4.dex */
public final class l extends b0 {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f52877f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l(o oVar, int i5) {
        super(oVar);
        this.f52877f = i5;
    }

    @Override // aq.b0, java.util.Iterator
    public Object next() {
        switch (this.f52877f) {
            case 1:
                return b().f52885f;
            default:
                return super.next();
        }
    }
}
