package y90;

/* loaded from: classes5.dex */
public final class a extends da0.a {

    /* renamed from: a, reason: collision with root package name */
    public final ba0.b f97005a = new ba0.b();

    public static boolean i(g gVar, int i5) {
        CharSequence charSequence = gVar.f97031a;
        return gVar.f97037g < 4 && i5 < charSequence.length() && charSequence.charAt(i5) == '>';
    }

    @Override // da0.a
    public final ba0.a e() {
        return this.f97005a;
    }

    @Override // da0.a
    public final cf.c h(g gVar) {
        char cCharAt;
        int i5 = gVar.f97035e;
        if (!i(gVar, i5)) {
            return null;
        }
        int i11 = gVar.f97033c + gVar.f97037g;
        int i12 = i11 + 1;
        CharSequence charSequence = gVar.f97031a;
        int i13 = i5 + 1;
        if (i13 < charSequence.length() && ((cCharAt = charSequence.charAt(i13)) == '\t' || cCharAt == ' ')) {
            i12 = i11 + 2;
        }
        return new cf.c(-1, i12, false);
    }
}
