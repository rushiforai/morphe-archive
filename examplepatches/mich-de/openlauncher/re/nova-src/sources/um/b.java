package um;

/* loaded from: classes3.dex */
public enum b implements jm.c {
    /* JADX INFO: Fake field, exist only in values array */
    UNKNOWN(0),
    DATA_MESSAGE(1),
    /* JADX INFO: Fake field, exist only in values array */
    TOPIC(2),
    DISPLAY_NOTIFICATION(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f91349a;

    b(int i5) {
        this.f91349a = i5;
    }

    @Override // jm.c
    public final int getNumber() {
        return this.f91349a;
    }
}
