package ads_mobile_sdk;

import b.c0;
import b.t8;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class qq extends t8 {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f8777d;

    public qq(byte[] bArr) {
        bArr.getClass();
        this.f8777d = bArr;
    }

    @Override // ads_mobile_sdk.sq
    public final void a(int i5, int i11, int i12, byte[] bArr) {
        System.arraycopy(this.f8777d, i5, bArr, i11, i12);
    }

    @Override // ads_mobile_sdk.sq
    public final boolean b(sq sqVar) {
        boolean z11 = sqVar instanceof qq;
        byte[] bArr = this.f8777d;
        return z11 ? Arrays.equals(bArr, ((qq) sqVar).f8777d) : sqVar instanceof mq ? a(sqVar, 0, bArr.length) : sqVar.b(this);
    }

    @Override // ads_mobile_sdk.sq
    public final int size() {
        return this.f8777d.length;
    }

    @Override // b.t8
    public final boolean a(sq sqVar, int i5, int i11) {
        int size = sqVar.size();
        byte[] bArr = this.f8777d;
        if (i11 > size) {
            throw new IllegalArgumentException("Length too large: " + i11 + bArr.length);
        }
        int i12 = i5 + i11;
        if (i12 > sqVar.size()) {
            int size2 = sqVar.size();
            StringBuilder sbT = c0.t(i5, "Ran off end of other: ", ", ", i11, ", ");
            sbT.append(size2);
            throw new IllegalArgumentException(sbT.toString());
        }
        if (sqVar instanceof qq) {
            return sq.a(bArr, 0, ((qq) sqVar).f8777d, i5, i11);
        }
        if (!(sqVar instanceof mq)) {
            return sqVar.b(i5, i12).equals(b(0, i11));
        }
        mq mqVar = (mq) sqVar;
        return sq.a(bArr, 0, mqVar.f7304d, mqVar.f7305e + i5, i11);
    }

    @Override // ads_mobile_sdk.sq
    public final byte b(int i5) {
        return this.f8777d[i5];
    }

    @Override // ads_mobile_sdk.sq
    public final int b(int i5, int i11, int i12) {
        byte[] bArr = rb1.f9048a;
        for (int i13 = i11; i13 < i11 + i12; i13++) {
            i5 = (i5 * 31) + this.f8777d[i13];
        }
        return i5;
    }

    @Override // ads_mobile_sdk.sq
    public final sq b(int i5, int i11) {
        byte[] bArr = this.f8777d;
        int iA = sq.a(i5, i11, bArr.length);
        if (iA == 0) {
            return sq.f9634b;
        }
        return new mq(bArr, i5, iA);
    }

    @Override // ads_mobile_sdk.sq
    public final sq a(int i5, int i11) {
        byte[] bArr = this.f8777d;
        int iA = sq.a(i5, i11, bArr.length);
        if (iA == 0) {
            return sq.f9634b;
        }
        return new mq(bArr, i5, iA);
    }

    @Override // ads_mobile_sdk.sq
    public final void a(yu yuVar) {
        byte[] bArr = this.f8777d;
        yuVar.a(bArr, 0, bArr.length);
    }

    @Override // ads_mobile_sdk.sq
    /* renamed from: a */
    public final String mo3a() {
        return new String(this.f8777d, StandardCharsets.ISO_8859_1);
    }
}
