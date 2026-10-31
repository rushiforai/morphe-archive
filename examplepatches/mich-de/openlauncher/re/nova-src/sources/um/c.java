package um;

/* loaded from: classes3.dex */
public enum c implements jm.c {
    /* JADX INFO: Fake field, exist only in values array */
    UNKNOWN_OS(0),
    ANDROID(1),
    /* JADX INFO: Fake field, exist only in values array */
    IOS(2),
    /* JADX INFO: Fake field, exist only in values array */
    WEB(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f91352a;

    c(int i5) {
        this.f91352a = i5;
    }

    @Override // jm.c
    public final int getNumber() {
        return this.f91352a;
    }
}
