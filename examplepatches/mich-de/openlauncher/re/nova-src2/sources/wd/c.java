package wd;

/* loaded from: classes3.dex */
public enum c implements jm.c {
    REASON_UNKNOWN(0),
    MESSAGE_TOO_OLD(1),
    CACHE_FULL(2),
    PAYLOAD_TOO_BIG(3),
    MAX_RETRIES_REACHED(4),
    INVALID_PAYLOD(5),
    SERVER_ERROR(6);


    /* renamed from: a, reason: collision with root package name */
    public final int f94199a;

    c(int i5) {
        this.f94199a = i5;
    }

    @Override // jm.c
    public final int getNumber() {
        return this.f94199a;
    }
}
