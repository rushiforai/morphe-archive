package m30;

/* loaded from: classes4.dex */
public final class a extends zg.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f75992e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(int i5) {
        super(25);
        this.f75992e = i5;
    }

    @Override // zg.a
    public final String I() {
        switch (this.f75992e) {
        }
        return "…";
    }

    @Override // zg.a
    public final String J() {
        switch (this.f75992e) {
        }
        return b.f75995c;
    }

    public final boolean b0(char c11) {
        switch (this.f75992e) {
            case 0:
                return Character.isDigit(c11);
            case 1:
                return b.f75993a.compare("0", String.valueOf(c11)) > 0;
            default:
                return b.f75993a.compare("Z", String.valueOf(c11)) < 0;
        }
    }
}
