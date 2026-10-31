package rn;

/* loaded from: classes3.dex */
public enum a {
    /* JADX INFO: Fake field, exist only in values array */
    TERMINATOR(new int[]{0, 0, 0}, 0),
    NUMERIC(new int[]{10, 12, 14}, 1),
    ALPHANUMERIC(new int[]{9, 11, 13}, 2),
    /* JADX INFO: Fake field, exist only in values array */
    STRUCTURED_APPEND(new int[]{0, 0, 0}, 3),
    BYTE(new int[]{8, 16, 16}, 4),
    ECI(new int[]{0, 0, 0}, 7),
    KANJI(new int[]{8, 10, 12}, 8),
    FNC1_FIRST_POSITION(new int[]{0, 0, 0}, 5),
    /* JADX INFO: Fake field, exist only in values array */
    FNC1_SECOND_POSITION(new int[]{0, 0, 0}, 9),
    /* JADX INFO: Fake field, exist only in values array */
    HANZI(new int[]{8, 10, 12}, 13);


    /* renamed from: a, reason: collision with root package name */
    public final int[] f86121a;

    /* renamed from: b, reason: collision with root package name */
    public final int f86122b;

    a(int[] iArr, int i5) {
        this.f86121a = iArr;
        this.f86122b = i5;
    }

    public final int a(b bVar) {
        int i5 = bVar.f86124a;
        return this.f86121a[i5 <= 9 ? (char) 0 : i5 <= 26 ? (char) 1 : (char) 2];
    }
}
