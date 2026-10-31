package m3;

/* loaded from: classes.dex */
public final class x {

    /* renamed from: b, reason: collision with root package name */
    public static final x f75987b = new x(false, 0);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f75988a;

    public x(boolean z11) {
        this.f75988a = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof x) {
            return this.f75988a == ((x) obj).f75988a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(0) + (Boolean.hashCode(this.f75988a) * 31);
    }

    public final String toString() {
        return a80.m.k(new StringBuilder("PlatformParagraphStyle(includeFontPadding="), this.f75988a, ", emojiSupportMatch=EmojiSupportMatch.Default)");
    }

    public x(boolean z11, int i5) {
        this.f75988a = z11;
    }
}
