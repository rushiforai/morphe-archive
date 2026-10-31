package vf;

import android.net.Uri;
import android.util.Base64;
import com.google.android.exoplayer2.ParserException;
import com.google.android.exoplayer2.upstream.DataSourceException;
import h6.c1;
import java.net.URLDecoder;

/* loaded from: classes3.dex */
public final class i extends f {

    /* renamed from: e, reason: collision with root package name */
    public l f92686e;

    /* renamed from: f, reason: collision with root package name */
    public byte[] f92687f;

    /* renamed from: g, reason: collision with root package name */
    public int f92688g;

    /* renamed from: h, reason: collision with root package name */
    public int f92689h;

    @Override // vf.k
    public final void close() {
        if (this.f92687f != null) {
            this.f92687f = null;
            h();
        }
        this.f92686e = null;
    }

    @Override // vf.k
    public final Uri getUri() {
        l lVar = this.f92686e;
        if (lVar != null) {
            return lVar.f92691a;
        }
        return null;
    }

    @Override // vf.k
    public final long open(l lVar) throws DataSourceException, ParserException {
        i();
        this.f92686e = lVar;
        Uri uri = lVar.f92691a;
        long j11 = lVar.f92696f;
        String scheme = uri.getScheme();
        wf.a.d("Unsupported scheme: " + scheme, "data".equals(scheme));
        String schemeSpecificPart = uri.getSchemeSpecificPart();
        int i5 = wf.v.f94376a;
        String[] strArrSplit = schemeSpecificPart.split(",", -1);
        if (strArrSplit.length != 2) {
            throw new ParserException(c1.p(uri, "Unexpected URI format: "), null, true, 0);
        }
        String str = strArrSplit[1];
        if (strArrSplit[0].contains(";base64")) {
            try {
                this.f92687f = Base64.decode(str, 0);
            } catch (IllegalArgumentException e3) {
                throw new ParserException(b.c0.k("Error while parsing Base64 encoded string: ", str), e3, true, 0);
            }
        } else {
            this.f92687f = URLDecoder.decode(str, vk.e.f92807a.name()).getBytes(vk.e.f92809c);
        }
        long j12 = lVar.f92695e;
        byte[] bArr = this.f92687f;
        if (j12 > bArr.length) {
            this.f92687f = null;
            throw new DataSourceException(2008);
        }
        int i11 = (int) j12;
        this.f92688g = i11;
        int length = bArr.length - i11;
        this.f92689h = length;
        if (j11 != -1) {
            this.f92689h = (int) Math.min(length, j11);
        }
        j(lVar);
        return j11 != -1 ? j11 : this.f92689h;
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) {
        if (i11 == 0) {
            return 0;
        }
        int i12 = this.f92689h;
        if (i12 == 0) {
            return -1;
        }
        int iMin = Math.min(i11, i12);
        byte[] bArr2 = this.f92687f;
        int i13 = wf.v.f94376a;
        System.arraycopy(bArr2, this.f92688g, bArr, i5, iMin);
        this.f92688g += iMin;
        this.f92689h -= iMin;
        a(iMin);
        return iMin;
    }
}
