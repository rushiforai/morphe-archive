package um;

/* loaded from: classes3.dex */
public enum a implements jm.c {
    /* JADX INFO: Fake field, exist only in values array */
    UNKNOWN_EVENT(0),
    MESSAGE_DELIVERED(1),
    /* JADX INFO: Fake field, exist only in values array */
    MESSAGE_OPEN(2);


    /* renamed from: a, reason: collision with root package name */
    public final int f91345a;

    a(int i5) {
        this.f91345a = i5;
    }

    @Override // jm.c
    public final int getNumber() {
        return this.f91345a;
    }
}
