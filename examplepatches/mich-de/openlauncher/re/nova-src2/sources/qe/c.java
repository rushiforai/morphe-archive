package qe;

import com.google.android.exoplayer2.ParserException;
import com.google.android.exoplayer2.drm.DrmInitData;
import ke.u;
import ke.v;
import ke.w;

/* loaded from: classes3.dex */
public final class c {
    public int A;
    public int B;
    public int C;
    public float D;
    public float E;
    public float F;
    public float G;
    public float H;
    public float I;
    public float J;
    public float K;
    public float L;
    public float M;
    public byte[] N;
    public int O;
    public int P;
    public int Q;
    public long R;
    public long S;
    public w T;
    public boolean U;
    public boolean V;
    public String W;
    public v X;
    public int Y;

    /* renamed from: a, reason: collision with root package name */
    public String f83931a;

    /* renamed from: b, reason: collision with root package name */
    public String f83932b;

    /* renamed from: c, reason: collision with root package name */
    public int f83933c;

    /* renamed from: d, reason: collision with root package name */
    public int f83934d;

    /* renamed from: e, reason: collision with root package name */
    public int f83935e;

    /* renamed from: f, reason: collision with root package name */
    public int f83936f;

    /* renamed from: g, reason: collision with root package name */
    public int f83937g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f83938h;

    /* renamed from: i, reason: collision with root package name */
    public byte[] f83939i;

    /* renamed from: j, reason: collision with root package name */
    public u f83940j;

    /* renamed from: k, reason: collision with root package name */
    public byte[] f83941k;

    /* renamed from: l, reason: collision with root package name */
    public DrmInitData f83942l;

    /* renamed from: m, reason: collision with root package name */
    public int f83943m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f83944p;

    /* renamed from: q, reason: collision with root package name */
    public int f83945q;

    /* renamed from: r, reason: collision with root package name */
    public int f83946r;

    /* renamed from: s, reason: collision with root package name */
    public float f83947s;

    /* renamed from: t, reason: collision with root package name */
    public float f83948t;

    /* renamed from: u, reason: collision with root package name */
    public float f83949u;

    /* renamed from: v, reason: collision with root package name */
    public byte[] f83950v;

    /* renamed from: w, reason: collision with root package name */
    public int f83951w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f83952x;

    /* renamed from: y, reason: collision with root package name */
    public int f83953y;

    /* renamed from: z, reason: collision with root package name */
    public int f83954z;

    public final byte[] a(String str) throws ParserException {
        byte[] bArr = this.f83941k;
        if (bArr != null) {
            return bArr;
        }
        throw ParserException.a("Missing CodecPrivate for codec " + str, null);
    }
}
