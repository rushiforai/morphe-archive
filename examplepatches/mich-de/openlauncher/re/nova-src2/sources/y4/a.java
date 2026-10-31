package y4;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: e, reason: collision with root package name */
    public static final byte[] f96631e = new byte[1792];

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f96632a;

    /* renamed from: b, reason: collision with root package name */
    public final int f96633b;

    /* renamed from: c, reason: collision with root package name */
    public int f96634c;

    /* renamed from: d, reason: collision with root package name */
    public char f96635d;

    static {
        for (int i5 = 0; i5 < 1792; i5++) {
            f96631e[i5] = Character.getDirectionality(i5);
        }
    }

    public a(CharSequence charSequence) {
        this.f96632a = charSequence;
        this.f96633b = charSequence.length();
    }

    public final byte a() {
        int i5 = this.f96634c - 1;
        CharSequence charSequence = this.f96632a;
        char cCharAt = charSequence.charAt(i5);
        this.f96635d = cCharAt;
        if (Character.isLowSurrogate(cCharAt)) {
            int iCodePointBefore = Character.codePointBefore(charSequence, this.f96634c);
            this.f96634c -= Character.charCount(iCodePointBefore);
            return Character.getDirectionality(iCodePointBefore);
        }
        this.f96634c--;
        char c11 = this.f96635d;
        return c11 < 1792 ? f96631e[c11] : Character.getDirectionality(c11);
    }
}
