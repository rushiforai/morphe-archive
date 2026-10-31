package n3;

import java.text.CharacterIterator;

/* loaded from: classes.dex */
public final class c implements CharacterIterator {

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f77741a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77742b;

    /* renamed from: c, reason: collision with root package name */
    public int f77743c = 0;

    public c(int i5, CharSequence charSequence) {
        this.f77741a = charSequence;
        this.f77742b = i5;
    }

    @Override // java.text.CharacterIterator
    public final Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException unused) {
            throw new InternalError();
        }
    }

    @Override // java.text.CharacterIterator
    public final char current() {
        int i5 = this.f77743c;
        if (i5 == this.f77742b) {
            return (char) 65535;
        }
        return this.f77741a.charAt(i5);
    }

    @Override // java.text.CharacterIterator
    public final char first() {
        this.f77743c = 0;
        return current();
    }

    @Override // java.text.CharacterIterator
    public final int getBeginIndex() {
        return 0;
    }

    @Override // java.text.CharacterIterator
    public final int getEndIndex() {
        return this.f77742b;
    }

    @Override // java.text.CharacterIterator
    public final int getIndex() {
        return this.f77743c;
    }

    @Override // java.text.CharacterIterator
    public final char last() {
        int i5 = this.f77742b;
        if (i5 == 0) {
            this.f77743c = i5;
            return (char) 65535;
        }
        int i11 = i5 - 1;
        this.f77743c = i11;
        return this.f77741a.charAt(i11);
    }

    @Override // java.text.CharacterIterator
    public final char next() {
        int i5 = this.f77743c + 1;
        this.f77743c = i5;
        int i11 = this.f77742b;
        if (i5 < i11) {
            return this.f77741a.charAt(i5);
        }
        this.f77743c = i11;
        return (char) 65535;
    }

    @Override // java.text.CharacterIterator
    public final char previous() {
        int i5 = this.f77743c;
        if (i5 <= 0) {
            return (char) 65535;
        }
        int i11 = i5 - 1;
        this.f77743c = i11;
        return this.f77741a.charAt(i11);
    }

    @Override // java.text.CharacterIterator
    public final char setIndex(int i5) {
        if (i5 > this.f77742b || i5 < 0) {
            throw new IllegalArgumentException("invalid position");
        }
        this.f77743c = i5;
        return current();
    }
}
