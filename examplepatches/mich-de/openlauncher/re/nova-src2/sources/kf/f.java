package kf;

import android.text.Layout;
import android.text.SpannableStringBuilder;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import ke.x;

/* loaded from: classes3.dex */
public final class f extends h {

    /* renamed from: g, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f71507g = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);

    /* renamed from: h, reason: collision with root package name */
    public final x f71508h = new x();

    /* renamed from: i, reason: collision with root package name */
    public int f71509i = -1;

    /* renamed from: j, reason: collision with root package name */
    public final int f71510j;

    /* renamed from: k, reason: collision with root package name */
    public final e[] f71511k;

    /* renamed from: l, reason: collision with root package name */
    public e f71512l;

    /* renamed from: m, reason: collision with root package name */
    public List f71513m;
    public List n;
    public x o;

    /* renamed from: p, reason: collision with root package name */
    public int f71514p;

    public f(int i5, List list) {
        this.f71510j = i5 == -1 ? 1 : i5;
        if (list != null && list.size() == 1 && ((byte[]) list.get(0)).length == 1) {
            byte b11 = ((byte[]) list.get(0))[0];
        }
        this.f71511k = new e[8];
        for (int i11 = 0; i11 < 8; i11++) {
            this.f71511k[i11] = new e();
        }
        this.f71512l = this.f71511k[0];
    }

    @Override // kf.h
    public final i e() {
        List list = this.f71513m;
        this.n = list;
        list.getClass();
        return new i(0, list);
    }

    @Override // kf.h
    public final void f(g gVar) {
        ByteBuffer byteBuffer = gVar.f61580d;
        byteBuffer.getClass();
        byte[] bArrArray = byteBuffer.array();
        int iLimit = byteBuffer.limit();
        com.google.android.gms.internal.consent_sdk.a aVar = this.f71507g;
        aVar.V(iLimit, bArrArray);
        while (aVar.g() >= 3) {
            int iN = aVar.N();
            int i5 = iN & 3;
            boolean z11 = (iN & 4) == 4;
            byte bN = (byte) aVar.N();
            byte bN2 = (byte) aVar.N();
            if (i5 == 2 || i5 == 3) {
                if (z11) {
                    if (i5 == 3) {
                        i();
                        int i11 = (bN & 192) >> 6;
                        int i12 = this.f71509i;
                        if (i12 != -1 && i11 != (i12 + 1) % 4) {
                            k();
                            wf.a.D("Cea708Decoder", "Sequence number discontinuity. previous=" + this.f71509i + " current=" + i11);
                        }
                        this.f71509i = i11;
                        int i13 = bN & 63;
                        if (i13 == 0) {
                            i13 = 64;
                        }
                        x xVar = new x(i11, i13);
                        this.o = xVar;
                        byte[] bArr = xVar.f71449d;
                        xVar.f71450e = 1;
                        bArr[0] = bN2;
                    } else {
                        wf.a.e(i5 == 2);
                        x xVar2 = this.o;
                        if (xVar2 == null) {
                            wf.a.o("Cea708Decoder", "Encountered DTVCC_PACKET_DATA before DTVCC_PACKET_START");
                        } else {
                            byte[] bArr2 = xVar2.f71449d;
                            int i14 = xVar2.f71450e;
                            int i15 = i14 + 1;
                            xVar2.f71450e = i15;
                            bArr2[i14] = bN;
                            xVar2.f71450e = i14 + 2;
                            bArr2[i15] = bN2;
                        }
                    }
                    x xVar3 = this.o;
                    if (xVar3.f71450e == (xVar3.f71448c * 2) - 1) {
                        i();
                    }
                }
            }
        }
    }

    @Override // kf.h, ie.d
    public final void flush() {
        super.flush();
        this.f71513m = null;
        this.n = null;
        this.f71514p = 0;
        this.f71512l = this.f71511k[0];
        k();
        this.o = null;
    }

    @Override // kf.h
    public final boolean h() {
        return this.f71513m != this.n;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final void i() {
        int i5;
        int i11;
        boolean z11;
        char c11;
        int i12;
        x xVar = this.o;
        if (xVar == null) {
            return;
        }
        int i13 = 2;
        if (xVar.f71450e != (xVar.f71448c * 2) - 1) {
            int i14 = xVar.f71447b;
            wf.a.n();
        }
        x xVar2 = this.o;
        byte[] bArr = xVar2.f71449d;
        int i15 = xVar2.f71450e;
        x xVar3 = this.f71508h;
        xVar3.n(i15, bArr);
        boolean z12 = false;
        while (true) {
            if (xVar3.b() > 0) {
                int i16 = 3;
                int i17 = xVar3.i(3);
                int i18 = xVar3.i(5);
                if (i17 == 7) {
                    xVar3.r(i13);
                    i17 = xVar3.i(6);
                    if (i17 < 7) {
                        k2.t(i17, "Invalid extended service number: ", "Cea708Decoder");
                    }
                }
                if (i18 == 0) {
                    if (i17 != 0) {
                        wf.a.D("Cea708Decoder", "serviceNumber is non-zero (" + i17 + ") when blockSize is 0");
                    }
                } else if (i17 != this.f71510j) {
                    xVar3.s(i18);
                } else {
                    int iG = (i18 * 8) + xVar3.g();
                    while (xVar3.g() < iG) {
                        int i19 = xVar3.i(8);
                        if (i19 != 16) {
                            if (i19 <= 31) {
                                if (i19 != 0) {
                                    if (i19 == i16) {
                                        this.f71513m = j();
                                    } else if (i19 != 8) {
                                        switch (i19) {
                                            case 12:
                                                k();
                                                break;
                                            case 13:
                                                this.f71512l.a('\n');
                                                break;
                                            case 14:
                                                break;
                                            default:
                                                if (i19 < 17 || i19 > 23) {
                                                    if (i19 < 24 || i19 > 31) {
                                                        k2.t(i19, "Invalid C0 command: ", "Cea708Decoder");
                                                        break;
                                                    } else {
                                                        wf.a.D("Cea708Decoder", "Currently unsupported COMMAND_P16 Command: " + i19);
                                                        xVar3.r(16);
                                                        break;
                                                    }
                                                } else {
                                                    wf.a.D("Cea708Decoder", "Currently unsupported COMMAND_EXT1 Command: " + i19);
                                                    xVar3.r(8);
                                                    break;
                                                }
                                        }
                                    } else {
                                        SpannableStringBuilder spannableStringBuilder = this.f71512l.f71488b;
                                        int length = spannableStringBuilder.length();
                                        if (length > 0) {
                                            spannableStringBuilder.delete(length - 1, length);
                                        }
                                    }
                                }
                                i12 = i13;
                                i5 = i16;
                                i11 = iG;
                            } else if (i19 <= 127) {
                                if (i19 == 127) {
                                    this.f71512l.a((char) 9835);
                                } else {
                                    this.f71512l.a((char) (i19 & 255));
                                }
                                i12 = i13;
                                i5 = i16;
                                i11 = iG;
                                z12 = true;
                            } else {
                                if (i19 <= 159) {
                                    e[] eVarArr = this.f71511k;
                                    switch (i19) {
                                        case 128:
                                        case EMPTY_TPAT_ERROR_VALUE:
                                        case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                                        case MRAID_JS_WRITE_FAILED_VALUE:
                                        case OMSDK_DOWNLOAD_JS_ERROR_VALUE:
                                        case OMSDK_JS_WRITE_FAILED_VALUE:
                                        case STORE_REGION_CODE_ERROR_VALUE:
                                        case INVALID_CONFIG_RESPONSE_VALUE:
                                            i5 = i16;
                                            i11 = iG;
                                            z11 = true;
                                            int i21 = i19 - 128;
                                            if (this.f71514p != i21) {
                                                this.f71514p = i21;
                                                this.f71512l = eVarArr[i21];
                                                break;
                                            }
                                            break;
                                        case PRIVACY_URL_ERROR_VALUE:
                                            i5 = i16;
                                            i11 = iG;
                                            z11 = true;
                                            for (int i22 = 1; i22 <= 8; i22++) {
                                                if (xVar3.h()) {
                                                    e eVar = eVarArr[8 - i22];
                                                    eVar.f71487a.clear();
                                                    eVar.f71488b.clear();
                                                    eVar.f71500p = -1;
                                                    eVar.f71501q = -1;
                                                    eVar.f71502r = -1;
                                                    eVar.f71504t = -1;
                                                    eVar.f71506v = 0;
                                                }
                                            }
                                            break;
                                        case TPAT_RETRY_FAILED_VALUE:
                                            i5 = i16;
                                            i11 = iG;
                                            for (int i23 = 1; i23 <= 8; i23++) {
                                                if (xVar3.h()) {
                                                    eVarArr[8 - i23].f71490d = true;
                                                }
                                            }
                                            z11 = true;
                                            break;
                                        case CONFIG_REFRESH_FAILED_VALUE:
                                            i5 = i16;
                                            i11 = iG;
                                            for (int i24 = 1; i24 <= 8; i24++) {
                                                if (xVar3.h()) {
                                                    eVarArr[8 - i24].f71490d = false;
                                                }
                                            }
                                            z11 = true;
                                            break;
                                        case 139:
                                            i5 = i16;
                                            i11 = iG;
                                            for (int i25 = 1; i25 <= 8; i25++) {
                                                if (xVar3.h()) {
                                                    eVarArr[8 - i25].f71490d = !r1.f71490d;
                                                }
                                            }
                                            z11 = true;
                                            break;
                                        case 140:
                                            i5 = i16;
                                            i11 = iG;
                                            for (int i26 = 1; i26 <= 8; i26++) {
                                                if (xVar3.h()) {
                                                    eVarArr[8 - i26].d();
                                                }
                                            }
                                            z11 = true;
                                            break;
                                        case 141:
                                            i5 = i16;
                                            i11 = iG;
                                            xVar3.r(8);
                                            z11 = true;
                                            break;
                                        case 142:
                                            i5 = i16;
                                            i11 = iG;
                                            z11 = true;
                                            break;
                                        case 143:
                                            i5 = i16;
                                            i11 = iG;
                                            k();
                                            z11 = true;
                                            break;
                                        case 144:
                                            int i27 = i13;
                                            i11 = iG;
                                            if (!this.f71512l.f71489c) {
                                                xVar3.r(16);
                                                i5 = 3;
                                                z11 = true;
                                                break;
                                            } else {
                                                xVar3.i(4);
                                                xVar3.i(i27);
                                                xVar3.i(i27);
                                                boolean zH = xVar3.h();
                                                boolean zH2 = xVar3.h();
                                                i5 = 3;
                                                xVar3.i(3);
                                                xVar3.i(3);
                                                this.f71512l.e(zH, zH2);
                                                z11 = true;
                                            }
                                        case 145:
                                            i11 = iG;
                                            if (this.f71512l.f71489c) {
                                                int iC = e.c(xVar3.i(2), xVar3.i(2), xVar3.i(2), xVar3.i(2));
                                                int iC2 = e.c(xVar3.i(2), xVar3.i(2), xVar3.i(2), xVar3.i(2));
                                                xVar3.r(2);
                                                e.c(xVar3.i(2), xVar3.i(2), xVar3.i(2), 0);
                                                this.f71512l.f(iC, iC2);
                                            } else {
                                                xVar3.r(24);
                                            }
                                            i5 = 3;
                                            z11 = true;
                                            break;
                                        case 146:
                                            i11 = iG;
                                            if (this.f71512l.f71489c) {
                                                xVar3.r(4);
                                                int i28 = xVar3.i(4);
                                                xVar3.r(2);
                                                xVar3.i(6);
                                                e eVar2 = this.f71512l;
                                                if (eVar2.f71506v != i28) {
                                                    eVar2.a('\n');
                                                }
                                                eVar2.f71506v = i28;
                                            } else {
                                                xVar3.r(16);
                                            }
                                            i5 = 3;
                                            z11 = true;
                                            break;
                                        case 147:
                                        case 148:
                                        case 149:
                                        case PerAppFeatureCatalog.MAX_TOOLS /* 150 */:
                                        default:
                                            k2.t(i19, "Invalid C1 command: ", "Cea708Decoder");
                                            i5 = i16;
                                            i11 = iG;
                                            z11 = true;
                                            break;
                                        case 151:
                                            i11 = iG;
                                            if (this.f71512l.f71489c) {
                                                int iC3 = e.c(xVar3.i(2), xVar3.i(2), xVar3.i(2), xVar3.i(2));
                                                xVar3.i(2);
                                                e.c(xVar3.i(2), xVar3.i(2), xVar3.i(2), 0);
                                                xVar3.h();
                                                xVar3.h();
                                                xVar3.i(2);
                                                xVar3.i(2);
                                                int i29 = xVar3.i(2);
                                                xVar3.r(8);
                                                e eVar3 = this.f71512l;
                                                eVar3.o = iC3;
                                                eVar3.f71498l = i29;
                                            } else {
                                                xVar3.r(32);
                                            }
                                            i5 = 3;
                                            z11 = true;
                                            break;
                                        case 152:
                                        case 153:
                                        case 154:
                                        case 155:
                                        case 156:
                                        case 157:
                                        case 158:
                                        case 159:
                                            int i31 = i19 - 152;
                                            e eVar4 = eVarArr[i31];
                                            xVar3.r(i13);
                                            boolean zH3 = xVar3.h();
                                            boolean zH4 = xVar3.h();
                                            xVar3.h();
                                            int i32 = xVar3.i(i16);
                                            boolean zH5 = xVar3.h();
                                            int i33 = xVar3.i(7);
                                            int i34 = xVar3.i(8);
                                            int i35 = xVar3.i(4);
                                            int i36 = xVar3.i(4);
                                            xVar3.r(i13);
                                            xVar3.i(6);
                                            xVar3.r(i13);
                                            int i37 = xVar3.i(3);
                                            int i38 = xVar3.i(3);
                                            ArrayList arrayList = eVar4.f71487a;
                                            i11 = iG;
                                            eVar4.f71489c = true;
                                            eVar4.f71490d = zH3;
                                            eVar4.f71497k = zH4;
                                            eVar4.f71491e = i32;
                                            eVar4.f71492f = zH5;
                                            eVar4.f71493g = i33;
                                            eVar4.f71494h = i34;
                                            eVar4.f71495i = i35;
                                            int i39 = i36 + 1;
                                            if (eVar4.f71496j != i39) {
                                                eVar4.f71496j = i39;
                                                while (true) {
                                                    if ((zH4 && arrayList.size() >= eVar4.f71496j) || arrayList.size() >= 15) {
                                                        arrayList.remove(0);
                                                    }
                                                }
                                            }
                                            if (i37 != 0 && eVar4.f71499m != i37) {
                                                eVar4.f71499m = i37;
                                                int i40 = i37 - 1;
                                                int i41 = e.C[i40];
                                                boolean z13 = e.B[i40];
                                                int i42 = e.f71486z[i40];
                                                int i43 = e.A[i40];
                                                int i44 = e.f71485y[i40];
                                                eVar4.o = i41;
                                                eVar4.f71498l = i44;
                                            }
                                            if (i38 != 0 && eVar4.n != i38) {
                                                eVar4.n = i38;
                                                int i45 = i38 - 1;
                                                int i46 = e.E[i45];
                                                int i47 = e.D[i45];
                                                eVar4.e(false, false);
                                                eVar4.f(e.f71483w, e.F[i45]);
                                            }
                                            if (this.f71514p != i31) {
                                                this.f71514p = i31;
                                                this.f71512l = eVarArr[i31];
                                            }
                                            i5 = 3;
                                            z11 = true;
                                            break;
                                    }
                                } else {
                                    i5 = i16;
                                    i11 = iG;
                                    z11 = true;
                                    if (i19 <= 255) {
                                        this.f71512l.a((char) (i19 & 255));
                                    } else {
                                        k2.t(i19, "Invalid base command: ", "Cea708Decoder");
                                        i12 = 2;
                                        c11 = 7;
                                    }
                                }
                                z12 = z11;
                                i12 = 2;
                                c11 = 7;
                            }
                            z11 = true;
                            c11 = 7;
                        } else {
                            i5 = i16;
                            i11 = iG;
                            z11 = true;
                            int i48 = xVar3.i(8);
                            if (i48 <= 31) {
                                c11 = 7;
                                if (i48 > 7) {
                                    if (i48 <= 15) {
                                        xVar3.r(8);
                                    } else if (i48 <= 23) {
                                        xVar3.r(16);
                                    } else if (i48 <= 31) {
                                        xVar3.r(24);
                                    }
                                }
                            } else {
                                c11 = 7;
                                if (i48 <= 127) {
                                    if (i48 == 32) {
                                        this.f71512l.a(' ');
                                    } else if (i48 == 33) {
                                        this.f71512l.a((char) 160);
                                    } else if (i48 == 37) {
                                        this.f71512l.a((char) 8230);
                                    } else if (i48 == 42) {
                                        this.f71512l.a((char) 352);
                                    } else if (i48 == 44) {
                                        this.f71512l.a((char) 338);
                                    } else if (i48 == 63) {
                                        this.f71512l.a((char) 376);
                                    } else if (i48 == 57) {
                                        this.f71512l.a((char) 8482);
                                    } else if (i48 == 58) {
                                        this.f71512l.a((char) 353);
                                    } else if (i48 == 60) {
                                        this.f71512l.a((char) 339);
                                    } else if (i48 != 61) {
                                        switch (i48) {
                                            case 48:
                                                this.f71512l.a((char) 9608);
                                                break;
                                            case 49:
                                                this.f71512l.a((char) 8216);
                                                break;
                                            case 50:
                                                this.f71512l.a((char) 8217);
                                                break;
                                            case 51:
                                                this.f71512l.a((char) 8220);
                                                break;
                                            case 52:
                                                this.f71512l.a((char) 8221);
                                                break;
                                            case 53:
                                                this.f71512l.a((char) 8226);
                                                break;
                                            default:
                                                switch (i48) {
                                                    case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                                                        this.f71512l.a((char) 8539);
                                                        break;
                                                    case JSON_ENCODE_ERROR_VALUE:
                                                        this.f71512l.a((char) 8540);
                                                        break;
                                                    case 120:
                                                        this.f71512l.a((char) 8541);
                                                        break;
                                                    case TPAT_ERROR_VALUE:
                                                        this.f71512l.a((char) 8542);
                                                        break;
                                                    case INVALID_ADS_ENDPOINT_VALUE:
                                                        this.f71512l.a((char) 9474);
                                                        break;
                                                    case INVALID_RI_ENDPOINT_VALUE:
                                                        this.f71512l.a((char) 9488);
                                                        break;
                                                    case INVALID_LOG_ERROR_ENDPOINT_VALUE:
                                                        this.f71512l.a((char) 9492);
                                                        break;
                                                    case INVALID_METRICS_ENDPOINT_VALUE:
                                                        this.f71512l.a((char) 9472);
                                                        break;
                                                    case ASSET_FAILED_INSUFFICIENT_SPACE_VALUE:
                                                        this.f71512l.a((char) 9496);
                                                        break;
                                                    case ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE:
                                                        this.f71512l.a((char) 9484);
                                                        break;
                                                    default:
                                                        k2.t(i48, "Invalid G2 character: ", "Cea708Decoder");
                                                        break;
                                                }
                                        }
                                    } else {
                                        this.f71512l.a((char) 8480);
                                    }
                                    z12 = true;
                                } else if (i48 > 159) {
                                    i12 = 2;
                                    if (i48 <= 255) {
                                        if (i48 == 160) {
                                            this.f71512l.a((char) 13252);
                                        } else {
                                            k2.t(i48, "Invalid G3 character: ", "Cea708Decoder");
                                            this.f71512l.a('_');
                                        }
                                        z12 = true;
                                    } else {
                                        k2.t(i48, "Invalid extended command: ", "Cea708Decoder");
                                    }
                                } else if (i48 <= 135) {
                                    xVar3.r(32);
                                } else if (i48 <= 143) {
                                    xVar3.r(40);
                                } else if (i48 <= 159) {
                                    i12 = 2;
                                    xVar3.r(2);
                                    xVar3.r(xVar3.i(6) * 8);
                                }
                            }
                            i12 = 2;
                        }
                        iG = i11;
                        i16 = i5;
                        i13 = i12;
                    }
                }
            }
        }
        if (z12) {
            this.f71513m = j();
        }
        this.o = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00df  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final List j() {
        d dVar;
        Layout.Alignment alignment;
        float f11;
        float f12;
        int i5;
        int i11;
        int i12;
        ArrayList arrayList = new ArrayList();
        for (int i13 = 0; i13 < 8; i13++) {
            e[] eVarArr = this.f71511k;
            e eVar = eVarArr[i13];
            if (eVar.f71489c && (!eVar.f71487a.isEmpty() || eVar.f71488b.length() != 0)) {
                e eVar2 = eVarArr[i13];
                if (eVar2.f71490d) {
                    ArrayList arrayList2 = eVar2.f71487a;
                    if (!eVar2.f71489c || (arrayList2.isEmpty() && eVar2.f71488b.length() == 0)) {
                        dVar = null;
                    } else {
                        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
                        for (int i14 = 0; i14 < arrayList2.size(); i14++) {
                            spannableStringBuilder.append((CharSequence) arrayList2.get(i14));
                            spannableStringBuilder.append('\n');
                        }
                        spannableStringBuilder.append((CharSequence) eVar2.b());
                        int i15 = eVar2.f71498l;
                        if (i15 == 0) {
                            alignment = Layout.Alignment.ALIGN_NORMAL;
                            Layout.Alignment alignment2 = alignment;
                            if (eVar2.f71492f) {
                                f11 = eVar2.f71494h / 209.0f;
                                f12 = eVar2.f71493g / 74.0f;
                            } else {
                                f11 = eVar2.f71494h / 99.0f;
                                f12 = eVar2.f71493g / 99.0f;
                            }
                            float f13 = (f11 * 0.9f) + 0.05f;
                            float f14 = (f12 * 0.9f) + 0.05f;
                            int i16 = eVar2.f71495i;
                            i5 = i16 / 3;
                            if (i5 != 0) {
                                i11 = i16;
                                i12 = 0;
                            } else if (i5 == 1) {
                                i11 = i16;
                                i12 = 1;
                            } else {
                                i11 = i16;
                                i12 = 2;
                            }
                            int i17 = i11 % 3;
                            int i18 = i17 != 0 ? 0 : i17 == 1 ? 1 : 2;
                            int i19 = eVar2.o;
                            dVar = new d(spannableStringBuilder, alignment2, f14, i12, f13, i18, i19 == e.f71484x, i19, eVar2.f71491e);
                        } else {
                            if (i15 == 1) {
                                alignment = Layout.Alignment.ALIGN_OPPOSITE;
                            } else if (i15 != 2) {
                                if (i15 != 3) {
                                    throw new IllegalArgumentException("Unexpected justification value: " + eVar2.f71498l);
                                }
                                alignment = Layout.Alignment.ALIGN_NORMAL;
                            } else {
                                alignment = Layout.Alignment.ALIGN_CENTER;
                            }
                            Layout.Alignment alignment22 = alignment;
                            if (eVar2.f71492f) {
                            }
                            float f132 = (f11 * 0.9f) + 0.05f;
                            float f142 = (f12 * 0.9f) + 0.05f;
                            int i162 = eVar2.f71495i;
                            i5 = i162 / 3;
                            if (i5 != 0) {
                            }
                            int i172 = i11 % 3;
                            if (i172 != 0) {
                            }
                            int i192 = eVar2.o;
                            dVar = new d(spannableStringBuilder, alignment22, f142, i12, f132, i18, i192 == e.f71484x, i192, eVar2.f71491e);
                        }
                    }
                    if (dVar != null) {
                        arrayList.add(dVar);
                    }
                } else {
                    continue;
                }
            }
        }
        Collections.sort(arrayList, d.f71480c);
        ArrayList arrayList3 = new ArrayList(arrayList.size());
        for (int i21 = 0; i21 < arrayList.size(); i21++) {
            arrayList3.add(((d) arrayList.get(i21)).f71481a);
        }
        return Collections.unmodifiableList(arrayList3);
    }

    public final void k() {
        for (int i5 = 0; i5 < 8; i5++) {
            this.f71511k[i5].d();
        }
    }
}
