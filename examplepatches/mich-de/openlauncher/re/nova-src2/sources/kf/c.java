package kf;

import androidx.recyclerview.widget.n0;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class c extends h {

    /* renamed from: h, reason: collision with root package name */
    public final int f71465h;

    /* renamed from: i, reason: collision with root package name */
    public final int f71466i;

    /* renamed from: j, reason: collision with root package name */
    public final int f71467j;
    public List n;
    public List o;

    /* renamed from: p, reason: collision with root package name */
    public int f71471p;

    /* renamed from: q, reason: collision with root package name */
    public int f71472q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f71473r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f71474s;

    /* renamed from: t, reason: collision with root package name */
    public byte f71475t;

    /* renamed from: u, reason: collision with root package name */
    public byte f71476u;

    /* renamed from: w, reason: collision with root package name */
    public boolean f71478w;

    /* renamed from: x, reason: collision with root package name */
    public long f71479x;

    /* renamed from: y, reason: collision with root package name */
    public static final int[] f71462y = {11, 1, 3, 12, 14, 5, 7, 9};

    /* renamed from: z, reason: collision with root package name */
    public static final int[] f71463z = {0, 4, 8, 12, 16, 20, 24, 28};
    public static final int[] A = {-1, -16711936, -16776961, -16711681, -65536, -256, -65281};
    public static final int[] B = {32, 33, 34, 35, 36, 37, 38, 39, 40, 41, Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 233, 93, 237, 243, n0.DEFAULT_SWIPE_ANIMATION_DURATION, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 120, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 231, 247, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 241, 9632};
    public static final int[] C = {174, 176, 189, 191, 8482, 162, 163, 9834, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 32, 232, Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 234, 238, 244, 251};
    public static final int[] D = {193, 201, 211, Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, 252, 8216, 161, 42, 39, 8212, 169, 8480, 8226, 8220, 8221, 192, 194, 199, 200, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 235, Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 239, Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, 249, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 171, 187};
    public static final int[] E = {195, Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 236, Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 242, Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 245, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 92, 94, 95, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 196, 228, Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, 246, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 165, 164, 9474, 197, 229, Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, 248, 9484, 9488, 9492, 9496};
    public static final boolean[] F = {false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false};

    /* renamed from: g, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f71464g = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f71469l = new ArrayList();

    /* renamed from: m, reason: collision with root package name */
    public b f71470m = new b(0, 4);

    /* renamed from: v, reason: collision with root package name */
    public int f71477v = 0;

    /* renamed from: k, reason: collision with root package name */
    public final long f71468k = 16000000;

    public c(String str, int i5) {
        this.f71465h = "application/x-mp4-cea-608".equals(str) ? 2 : 3;
        if (i5 == 1) {
            this.f71467j = 0;
            this.f71466i = 0;
        } else if (i5 == 2) {
            this.f71467j = 1;
            this.f71466i = 0;
        } else if (i5 == 3) {
            this.f71467j = 0;
            this.f71466i = 1;
        } else if (i5 != 4) {
            wf.a.D("Cea608Decoder", "Invalid channel. Defaulting to CC1.");
            this.f71467j = 0;
            this.f71466i = 0;
        } else {
            this.f71467j = 1;
            this.f71466i = 1;
        }
        k(0);
        j();
        this.f71478w = true;
        this.f71479x = -9223372036854775807L;
    }

    @Override // kf.h
    public final i e() {
        List list = this.n;
        this.o = list;
        list.getClass();
        return new i(0, list);
    }

    /* JADX WARN: Removed duplicated region for block: B:179:0x0085 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:181:0x007e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a6 A[FALL_THROUGH] */
    @Override // kf.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(g gVar) {
        ByteBuffer byteBuffer = gVar.f61580d;
        byteBuffer.getClass();
        byte[] bArrArray = byteBuffer.array();
        int iLimit = byteBuffer.limit();
        com.google.android.gms.internal.consent_sdk.a aVar = this.f71464g;
        aVar.V(iLimit, bArrArray);
        boolean z11 = false;
        while (true) {
            int iG = aVar.g();
            int i5 = this.f71465h;
            if (iG < i5) {
                if (z11) {
                    int i11 = this.f71471p;
                    if (i11 == 1 || i11 == 3) {
                        this.n = i();
                        this.f71479x = this.f71520e;
                        return;
                    }
                    return;
                }
                return;
            }
            int iN = i5 == 2 ? -4 : aVar.N();
            int iN2 = aVar.N();
            int iN3 = aVar.N();
            if ((iN & 2) == 0 && (iN & 1) == this.f71466i) {
                byte b11 = (byte) (iN2 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                byte b12 = (byte) (iN3 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                if (b11 != 0 || b12 != 0) {
                    boolean z12 = this.f71473r;
                    if ((iN & 4) == 4) {
                        boolean[] zArr = F;
                        boolean z13 = zArr[iN2] && zArr[iN3];
                        this.f71473r = z13;
                        if (!z13 || (b11 & 240) != 16) {
                            this.f71474s = false;
                            if (!z13) {
                                if (1 <= b11 && b11 <= 15) {
                                    this.f71478w = false;
                                } else if ((b11 & 246) == 20) {
                                    if (b12 != 32 && b12 != 47) {
                                        switch (b12) {
                                            default:
                                                switch (b12) {
                                                    case 42:
                                                    case 43:
                                                        this.f71478w = false;
                                                        break;
                                                }
                                            case 37:
                                            case 38:
                                            case 39:
                                                break;
                                        }
                                    } else {
                                        this.f71478w = true;
                                    }
                                }
                                if (this.f71478w) {
                                    int i12 = b11 & 224;
                                    if (i12 == 0) {
                                        this.f71477v = (b11 >> 3) & 1;
                                    }
                                    if (this.f71477v == this.f71467j) {
                                        if (i12 == 0) {
                                            int i13 = b11 & 247;
                                            if (i13 == 17 && (b12 & 240) == 48) {
                                                this.f71470m.a((char) C[b12 & 15]);
                                            } else {
                                                int i14 = b11 & 246;
                                                if (i14 == 18 && (b12 & 224) == 32) {
                                                    this.f71470m.b();
                                                    this.f71470m.a((char) ((b11 & 1) == 0 ? D[b12 & 31] : E[b12 & 31]));
                                                } else if (i13 == 17 && (b12 & 240) == 32) {
                                                    this.f71470m.a(' ');
                                                    boolean z14 = (b12 & 1) == 1;
                                                    b bVar = this.f71470m;
                                                    bVar.f71454a.add(new a((b12 >> 1) & 7, z14, bVar.f71456c.length()));
                                                } else if ((b11 & 240) == 16 && (b12 & 192) == 64) {
                                                    int i15 = f71462y[b11 & 7];
                                                    if ((b12 & 32) != 0) {
                                                        i15++;
                                                    }
                                                    b bVar2 = this.f71470m;
                                                    if (i15 != bVar2.f71457d) {
                                                        if (this.f71471p != 1 && !bVar2.e()) {
                                                            b bVar3 = new b(this.f71471p, this.f71472q);
                                                            this.f71470m = bVar3;
                                                            this.f71469l.add(bVar3);
                                                        }
                                                        this.f71470m.f71457d = i15;
                                                    }
                                                    boolean z15 = (b12 & 16) == 16;
                                                    boolean z16 = (b12 & 1) == 1;
                                                    int i16 = (b12 >> 1) & 7;
                                                    b bVar4 = this.f71470m;
                                                    bVar4.f71454a.add(new a(z15 ? 8 : i16, z16, bVar4.f71456c.length()));
                                                    if (z15) {
                                                        this.f71470m.f71458e = f71463z[i16];
                                                    }
                                                } else if (i13 == 23 && b12 >= 33 && b12 <= 35) {
                                                    this.f71470m.f71459f = b12 - 32;
                                                } else if (i14 == 20 && (b12 & 240) == 32) {
                                                    if (b12 == 32) {
                                                        k(2);
                                                    } else if (b12 != 41) {
                                                        switch (b12) {
                                                            case 37:
                                                                k(1);
                                                                this.f71472q = 2;
                                                                this.f71470m.f71461h = 2;
                                                                break;
                                                            case 38:
                                                                k(1);
                                                                this.f71472q = 3;
                                                                this.f71470m.f71461h = 3;
                                                                break;
                                                            case 39:
                                                                k(1);
                                                                this.f71472q = 4;
                                                                this.f71470m.f71461h = 4;
                                                                break;
                                                            default:
                                                                int i17 = this.f71471p;
                                                                if (i17 != 0) {
                                                                    if (b12 == 33) {
                                                                        this.f71470m.b();
                                                                        break;
                                                                    } else {
                                                                        switch (b12) {
                                                                            case 44:
                                                                                this.n = Collections.EMPTY_LIST;
                                                                                if (i17 == 1 || i17 == 3) {
                                                                                    j();
                                                                                    break;
                                                                                }
                                                                            case 45:
                                                                                if (i17 == 1 && !this.f71470m.e()) {
                                                                                    b bVar5 = this.f71470m;
                                                                                    ArrayList arrayList = bVar5.f71455b;
                                                                                    arrayList.add(bVar5.d());
                                                                                    bVar5.f71456c.setLength(0);
                                                                                    bVar5.f71454a.clear();
                                                                                    int iMin = Math.min(bVar5.f71461h, bVar5.f71457d);
                                                                                    while (arrayList.size() >= iMin) {
                                                                                        arrayList.remove(0);
                                                                                    }
                                                                                    break;
                                                                                }
                                                                                break;
                                                                            case 46:
                                                                                j();
                                                                                break;
                                                                            case 47:
                                                                                this.n = i();
                                                                                j();
                                                                                break;
                                                                        }
                                                                    }
                                                                }
                                                                break;
                                                        }
                                                    } else {
                                                        k(3);
                                                    }
                                                }
                                            }
                                        } else {
                                            b bVar6 = this.f71470m;
                                            int i18 = (b11 & AbstractJsonLexerKt.TC_INVALID) - 32;
                                            int[] iArr = B;
                                            bVar6.a((char) iArr[i18]);
                                            if ((b12 & 224) != 0) {
                                                this.f71470m.a((char) iArr[(b12 & AbstractJsonLexerKt.TC_INVALID) - 32]);
                                            }
                                        }
                                        z11 = true;
                                    }
                                }
                            } else if (z12) {
                                j();
                                z11 = true;
                            }
                        } else if (this.f71474s && this.f71475t == b11 && this.f71476u == b12) {
                            this.f71474s = false;
                        } else {
                            this.f71474s = true;
                            this.f71475t = b11;
                            this.f71476u = b12;
                            if (!z13) {
                            }
                        }
                    }
                }
            }
        }
    }

    @Override // kf.h, ie.d
    public final void flush() {
        super.flush();
        this.n = null;
        this.o = null;
        k(0);
        this.f71472q = 4;
        this.f71470m.f71461h = 4;
        j();
        this.f71473r = false;
        this.f71474s = false;
        this.f71475t = (byte) 0;
        this.f71476u = (byte) 0;
        this.f71477v = 0;
        this.f71478w = true;
        this.f71479x = -9223372036854775807L;
    }

    @Override // kf.h, ie.d
    /* renamed from: g */
    public final jf.d b() {
        jf.d dVar;
        jf.d dVarB = super.b();
        if (dVarB != null) {
            return dVarB;
        }
        long j11 = this.f71468k;
        if (j11 == -9223372036854775807L) {
            return null;
        }
        long j12 = this.f71479x;
        if (j12 == -9223372036854775807L || this.f71520e - j12 < j11 || (dVar = (jf.d) this.f71517b.pollFirst()) == null) {
            return null;
        }
        this.n = Collections.EMPTY_LIST;
        this.f71479x = -9223372036854775807L;
        dVar.t(this.f71520e, e(), Long.MAX_VALUE);
        return dVar;
    }

    @Override // kf.h
    public final boolean h() {
        return this.n != this.o;
    }

    public final ArrayList i() {
        ArrayList arrayList = this.f71469l;
        int size = arrayList.size();
        ArrayList arrayList2 = new ArrayList(size);
        int iMin = 2;
        for (int i5 = 0; i5 < size; i5++) {
            jf.b bVarC = ((b) arrayList.get(i5)).c(Integer.MIN_VALUE);
            arrayList2.add(bVarC);
            if (bVarC != null) {
                iMin = Math.min(iMin, bVarC.f69514i);
            }
        }
        ArrayList arrayList3 = new ArrayList(size);
        for (int i11 = 0; i11 < size; i11++) {
            jf.b bVarC2 = (jf.b) arrayList2.get(i11);
            if (bVarC2 != null) {
                if (bVarC2.f69514i != iMin) {
                    bVarC2 = ((b) arrayList.get(i11)).c(iMin);
                    bVarC2.getClass();
                }
                arrayList3.add(bVarC2);
            }
        }
        return arrayList3;
    }

    public final void j() {
        b bVar = this.f71470m;
        bVar.f71460g = this.f71471p;
        bVar.f71454a.clear();
        bVar.f71455b.clear();
        bVar.f71456c.setLength(0);
        bVar.f71457d = 15;
        bVar.f71458e = 0;
        bVar.f71459f = 0;
        ArrayList arrayList = this.f71469l;
        arrayList.clear();
        arrayList.add(this.f71470m);
    }

    public final void k(int i5) {
        int i11 = this.f71471p;
        if (i11 == i5) {
            return;
        }
        this.f71471p = i5;
        if (i5 != 3) {
            j();
            if (i11 == 3 || i5 == 1 || i5 == 0) {
                this.n = Collections.EMPTY_LIST;
                return;
            }
            return;
        }
        int i12 = 0;
        while (true) {
            ArrayList arrayList = this.f71469l;
            if (i12 >= arrayList.size()) {
                return;
            }
            ((b) arrayList.get(i12)).f71460g = i5;
            i12++;
        }
    }

    @Override // kf.h, ie.d
    public final void release() {
    }
}
