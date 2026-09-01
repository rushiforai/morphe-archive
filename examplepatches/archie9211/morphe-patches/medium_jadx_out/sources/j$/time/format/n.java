package j$.time.format;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class n implements f {
    public final String a;

    public n(String str) {
        this.a = str;
    }

    @Override // j$.time.format.f
    public final boolean h(t tVar, StringBuilder sb) {
        sb.append(this.a);
        return true;
    }

    @Override // j$.time.format.f
    public final int i(q qVar, CharSequence charSequence, int i) {
        if (i > charSequence.length() || i < 0) {
            throw new IndexOutOfBoundsException();
        }
        String str = this.a;
        return !qVar.g(charSequence, i, str, 0, str.length()) ? ~i : str.length() + i;
    }

    public final String toString() {
        return "'" + this.a.replace("'", "''") + "'";
    }
}
