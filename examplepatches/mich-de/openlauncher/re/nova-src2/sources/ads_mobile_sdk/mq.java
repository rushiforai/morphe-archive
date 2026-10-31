package ads_mobile_sdk;

import b.c0;
import b.t8;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/* loaded from: classes.dex */
public final class mq extends t8 {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f7304d;

    /* renamed from: e, reason: collision with root package name */
    public final int f7305e;

    /* renamed from: f, reason: collision with root package name */
    public final int f7306f;

    public mq(byte[] bArr, int i5, int i11) {
        sq.a(i5, i5 + i11, bArr.length);
        this.f7304d = bArr;
        this.f7305e = i5;
        this.f7306f = i11;
    }

    @Override // ads_mobile_sdk.sq
    public final void a(int i5, int i11, int i12, byte[] bArr) {
        System.arraycopy(this.f7304d, this.f7305e + i5, bArr, i11, i12);
    }

    @Override // ads_mobile_sdk.sq
    public final boolean b(sq sqVar) {
        return ((sqVar instanceof qq) || (sqVar instanceof mq)) ? a(sqVar, 0, this.f7306f) : sqVar.b(this);
    }

    @Override // ads_mobile_sdk.sq
    public final int size() {
        return this.f7306f;
    }

    @Override // b.t8
    public final boolean a(sq sqVar, int i5, int i11) {
        if (i11 > sqVar.size()) {
            throw new IllegalArgumentException("Length too large: " + i11 + this.f7306f);
        }
        int i12 = i5 + i11;
        if (i12 > sqVar.size()) {
            int size = sqVar.size();
            StringBuilder sbT = c0.t(i5, "Ran off end of other: ", ", ", i11, ", ");
            sbT.append(size);
            throw new IllegalArgumentException(sbT.toString());
        }
        boolean z11 = sqVar instanceof qq;
        byte[] bArr = this.f7304d;
        int i13 = this.f7305e;
        if (z11) {
            return sq.a(bArr, i13, ((qq) sqVar).f8777d, i5, i11);
        }
        if (!(sqVar instanceof mq)) {
            return sqVar.b(i5, i12).equals(b(i13, i11 + i13));
        }
        mq mqVar = (mq) sqVar;
        return sq.a(bArr, i13, mqVar.f7304d, mqVar.f7305e + i5, i11);
    }

    @Override // ads_mobile_sdk.sq
    public final byte b(int i5) {
        return this.f7304d[this.f7305e + i5];
    }

    @Override // ads_mobile_sdk.sq
    public final int b(int i5, int i11, int i12) {
        int i13 = this.f7305e + i11;
        byte[] bArr = rb1.f9048a;
        for (int i14 = i13; i14 < i13 + i12; i14++) {
            i5 = (i5 * 31) + this.f7304d[i14];
        }
        return i5;
    }

    @Override // ads_mobile_sdk.sq
    public final sq b(int i5, int i11) {
        int iA = sq.a(i5, i11, this.f7306f);
        if (iA == 0) {
            return sq.f9634b;
        }
        return new mq(this.f7304d, this.f7305e + i5, iA);
    }

    @Override // ads_mobile_sdk.sq
    public final sq a(int i5, int i11) {
        int iA = sq.a(i5, i11, this.f7306f);
        if (iA == 0) {
            return sq.f9634b;
        }
        return new mq(this.f7304d, this.f7305e + i5, iA);
    }

    @Override // ads_mobile_sdk.sq
    public final void a(yu yuVar) {
        yuVar.a(this.f7304d, this.f7305e, this.f7306f);
    }

    @Override // ads_mobile_sdk.sq
    /* renamed from: a */
    public final String mo3a() {
        Charset charset = StandardCharsets.ISO_8859_1;
        return new String(this.f7304d, this.f7305e, this.f7306f, charset);
    }
}
