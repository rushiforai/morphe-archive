package ve;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.android.exoplayer2.ParserException;
import com.vungle.ads.internal.protos.Sdk;
import fe.j0;
import fe.k0;
import ke.l;
import ke.v;

/* loaded from: classes3.dex */
public final class a implements b {

    /* renamed from: m, reason: collision with root package name */
    public static final int[] f92591m = {-1, -1, -1, -1, 2, 4, 6, 8, -1, -1, -1, -1, 2, 4, 6, 8};
    public static final int[] n = {7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 19, 21, 23, 25, 28, 31, 34, 37, 41, 45, 50, 55, 60, 66, 73, 80, 88, 97, 107, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 143, 157, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 190, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 230, 253, 279, Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 337, 371, TTAdConstant.DOWNLOAD_URL_CODE, 449, 494, 544, 598, 658, 724, 796, 876, 963, 1060, 1166, 1282, 1411, 1552, 1707, 1878, 2066, 2272, 2499, 2749, 3024, 3327, 3660, 4026, 4428, 4871, 5358, 5894, 6484, 7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899, 15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767};

    /* renamed from: a, reason: collision with root package name */
    public final l f92592a;

    /* renamed from: b, reason: collision with root package name */
    public final v f92593b;

    /* renamed from: c, reason: collision with root package name */
    public final ma0.c f92594c;

    /* renamed from: d, reason: collision with root package name */
    public final int f92595d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f92596e;

    /* renamed from: f, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f92597f;

    /* renamed from: g, reason: collision with root package name */
    public final int f92598g;

    /* renamed from: h, reason: collision with root package name */
    public final k0 f92599h;

    /* renamed from: i, reason: collision with root package name */
    public int f92600i;

    /* renamed from: j, reason: collision with root package name */
    public long f92601j;

    /* renamed from: k, reason: collision with root package name */
    public int f92602k;

    /* renamed from: l, reason: collision with root package name */
    public long f92603l;

    public a(l lVar, v vVar, ma0.c cVar) throws ParserException {
        this.f92592a = lVar;
        this.f92593b = vVar;
        this.f92594c = cVar;
        int i5 = cVar.f76182b;
        int iMax = Math.max(1, i5 / 10);
        this.f92598g = iMax;
        byte[] bArr = (byte[]) cVar.f76185e;
        int length = bArr.length;
        byte b11 = bArr[0];
        byte b12 = bArr[1];
        int i11 = ((bArr[3] & 255) << 8) | (bArr[2] & 255);
        this.f92595d = i11;
        int i12 = cVar.f76181a;
        int i13 = cVar.f76183c;
        int i14 = (((i13 - (i12 * 4)) * 8) / (cVar.f76184d * i12)) + 1;
        if (i11 != i14) {
            throw ParserException.a("Expected frames per block: " + i14 + "; got: " + i11, null);
        }
        int iF = wf.v.f(iMax, i11);
        this.f92596e = new byte[iF * i13];
        this.f92597f = new com.google.android.gms.internal.consent_sdk.a(i11 * 2 * i12 * iF);
        int i15 = ((i13 * i5) * 8) / i11;
        j0 j0Var = new j0();
        j0Var.f54856k = "audio/raw";
        j0Var.f54851f = i15;
        j0Var.f54852g = i15;
        j0Var.f54857l = iMax * 2 * i12;
        j0Var.f54867x = i12;
        j0Var.f54868y = i5;
        j0Var.f54869z = 2;
        this.f92599h = new k0(j0Var);
    }

    @Override // ve.b
    public final void a(int i5, long j11) {
        this.f92592a.j(new f(this.f92594c, this.f92595d, i5, j11));
        this.f92593b.a(this.f92599h);
    }

    @Override // ve.b
    public final void b(long j11) {
        this.f92600i = 0;
        this.f92601j = j11;
        this.f92602k = 0;
        this.f92603l = 0L;
    }

    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0045 A[ADDED_TO_REGION, EDGE_INSN: B:43:0x0045->B:14:0x0045 BREAK  A[LOOP:0: B:6:0x0023->B:13:0x003f], REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0027  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x003c -> B:4:0x0020). Please report as a decompilation issue!!! */
    @Override // ve.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean c(ke.k r25, long r26) {
        /*
            Method dump skipped, instructions count: 329
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ve.a.c(ke.k, long):boolean");
    }

    public final void d(int i5) {
        long j11 = this.f92601j;
        long j12 = this.f92603l;
        ma0.c cVar = this.f92594c;
        long jD = j11 + wf.v.D(j12, 1000000L, cVar.f76182b);
        int i11 = i5 * 2 * cVar.f76181a;
        this.f92593b.b(jD, 1, i11, this.f92602k - i11, null);
        this.f92603l += i5;
        this.f92602k -= i11;
    }
}
