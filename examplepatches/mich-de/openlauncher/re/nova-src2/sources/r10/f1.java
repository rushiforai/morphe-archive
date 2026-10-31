package r10;

/* loaded from: classes4.dex */
public final class f1 extends m1 {
    @Override // r10.m1
    public final boolean i(String str) {
        char cF1 = r70.l.F1(str);
        if ('0' <= cF1 && cF1 < ':') {
            return ((int) (Long.parseLong(r70.l.C1(str)) % ((long) 7))) == cF1 - '0';
        }
        throw new NumberFormatException("'" + cF1 + "' is not 0-9");
    }
}
