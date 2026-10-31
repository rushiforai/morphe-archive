package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mkv;

import android.util.Log;
import androidx.recyclerview.widget.u1;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.j;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.r;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.util.i;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class d {
    public boolean L;
    public r O;
    public int P;

    /* renamed from: a, reason: collision with root package name */
    public String f29381a;

    /* renamed from: b, reason: collision with root package name */
    public int f29382b;

    /* renamed from: c, reason: collision with root package name */
    public int f29383c;

    /* renamed from: d, reason: collision with root package name */
    public int f29384d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29385e;

    /* renamed from: f, reason: collision with root package name */
    public byte[] f29386f;

    /* renamed from: g, reason: collision with root package name */
    public byte[] f29387g;

    /* renamed from: h, reason: collision with root package name */
    public byte[] f29388h;

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.drm.d f29389i;

    /* renamed from: j, reason: collision with root package name */
    public int f29390j = -1;

    /* renamed from: k, reason: collision with root package name */
    public int f29391k = -1;

    /* renamed from: l, reason: collision with root package name */
    public int f29392l = -1;

    /* renamed from: m, reason: collision with root package name */
    public int f29393m = -1;
    public int n = 0;
    public byte[] o = null;

    /* renamed from: p, reason: collision with root package name */
    public int f29394p = -1;

    /* renamed from: q, reason: collision with root package name */
    public boolean f29395q = false;

    /* renamed from: r, reason: collision with root package name */
    public int f29396r = -1;

    /* renamed from: s, reason: collision with root package name */
    public int f29397s = -1;

    /* renamed from: t, reason: collision with root package name */
    public int f29398t = -1;

    /* renamed from: u, reason: collision with root package name */
    public int f29399u = 1000;

    /* renamed from: v, reason: collision with root package name */
    public int f29400v = 200;

    /* renamed from: w, reason: collision with root package name */
    public float f29401w = -1.0f;

    /* renamed from: x, reason: collision with root package name */
    public float f29402x = -1.0f;

    /* renamed from: y, reason: collision with root package name */
    public float f29403y = -1.0f;

    /* renamed from: z, reason: collision with root package name */
    public float f29404z = -1.0f;
    public float A = -1.0f;
    public float B = -1.0f;
    public float C = -1.0f;
    public float D = -1.0f;
    public float E = -1.0f;
    public float F = -1.0f;
    public int G = 1;
    public int H = -1;
    public int I = 8000;
    public long J = 0;
    public long K = 0;
    public boolean M = true;
    public String N = "eng";

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:237:0x042f  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x0431  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x0440  */
    /* JADX WARN: Removed duplicated region for block: B:242:0x0469  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(j jVar, int i5) {
        char c11;
        List listSingletonList;
        String str;
        int iA;
        List list;
        int i11;
        String str2;
        List list2;
        String str3;
        int i12;
        List listSingletonList2;
        List list3;
        String str4;
        int i13;
        int i14;
        o oVar;
        int i15;
        com.fyber.inneractive.sdk.player.exoplayer2.video.c cVar;
        byte[] bArr;
        int i16;
        String str5 = this.f29381a;
        str5.getClass();
        int i17 = 2;
        switch (str5.hashCode()) {
            case -2095576542:
                if (str5.equals("V_MPEG4/ISO/AP")) {
                    c11 = 0;
                    break;
                } else {
                    c11 = 65535;
                    break;
                }
            case -2095575984:
                if (str5.equals("V_MPEG4/ISO/SP")) {
                    c11 = 1;
                    break;
                }
                break;
            case -1985379776:
                if (str5.equals("A_MS/ACM")) {
                    c11 = 2;
                    break;
                }
                break;
            case -1784763192:
                if (str5.equals("A_TRUEHD")) {
                    c11 = 3;
                    break;
                }
                break;
            case -1730367663:
                if (str5.equals("A_VORBIS")) {
                    c11 = 4;
                    break;
                }
                break;
            case -1482641358:
                if (str5.equals("A_MPEG/L2")) {
                    c11 = 5;
                    break;
                }
                break;
            case -1482641357:
                if (str5.equals("A_MPEG/L3")) {
                    c11 = 6;
                    break;
                }
                break;
            case -1373388978:
                if (str5.equals("V_MS/VFW/FOURCC")) {
                    c11 = 7;
                    break;
                }
                break;
            case -933872740:
                if (str5.equals("S_DVBSUB")) {
                    c11 = '\b';
                    break;
                }
                break;
            case -538363189:
                if (str5.equals("V_MPEG4/ISO/ASP")) {
                    c11 = '\t';
                    break;
                }
                break;
            case -538363109:
                if (str5.equals("V_MPEG4/ISO/AVC")) {
                    c11 = '\n';
                    break;
                }
                break;
            case -425012669:
                if (str5.equals("S_VOBSUB")) {
                    c11 = 11;
                    break;
                }
                break;
            case -356037306:
                if (str5.equals("A_DTS/LOSSLESS")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 62923557:
                if (str5.equals("A_AAC")) {
                    c11 = '\r';
                    break;
                }
                break;
            case 62923603:
                if (str5.equals("A_AC3")) {
                    c11 = 14;
                    break;
                }
                break;
            case 62927045:
                if (str5.equals("A_DTS")) {
                    c11 = 15;
                    break;
                }
                break;
            case 82338133:
                if (str5.equals("V_VP8")) {
                    c11 = 16;
                    break;
                }
                break;
            case 82338134:
                if (str5.equals("V_VP9")) {
                    c11 = 17;
                    break;
                }
                break;
            case 99146302:
                if (str5.equals("S_HDMV/PGS")) {
                    c11 = 18;
                    break;
                }
                break;
            case 444813526:
                if (str5.equals("V_THEORA")) {
                    c11 = 19;
                    break;
                }
                break;
            case 542569478:
                if (str5.equals("A_DTS/EXPRESS")) {
                    c11 = 20;
                    break;
                }
                break;
            case 725957860:
                if (str5.equals("A_PCM/INT/LIT")) {
                    c11 = 21;
                    break;
                }
                break;
            case 855502857:
                if (str5.equals("V_MPEGH/ISO/HEVC")) {
                    c11 = 22;
                    break;
                }
                break;
            case 1422270023:
                if (str5.equals("S_TEXT/UTF8")) {
                    c11 = 23;
                    break;
                }
                break;
            case 1809237540:
                if (str5.equals("V_MPEG2")) {
                    c11 = 24;
                    break;
                }
                break;
            case 1950749482:
                if (str5.equals("A_EAC3")) {
                    c11 = 25;
                    break;
                }
                break;
            case 1950789798:
                if (str5.equals("A_FLAC")) {
                    c11 = 26;
                    break;
                }
                break;
            case 1951062397:
                if (str5.equals("A_OPUS")) {
                    c11 = 27;
                    break;
                }
                break;
        }
        String str6 = "video/x-unknown";
        String str7 = "audio/raw";
        switch (c11) {
            case 0:
            case 1:
            case '\t':
                byte[] bArr2 = this.f29388h;
                listSingletonList = bArr2 == null ? null : Collections.singletonList(bArr2);
                str = "video/mp4v-es";
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i18 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                    oVar = o.a(Integer.toString(i5), str2, -1, i12, this.G, this.I, i14, -1, -1, list2, this.f29389i, i18, this.N, null);
                    i17 = 1;
                } else {
                    int i19 = i12;
                    if ("video".equals(i.b(str2))) {
                        if (this.n == 0) {
                            int i21 = this.f29392l;
                            i15 = -1;
                            if (i21 == -1) {
                                i21 = this.f29390j;
                            }
                            this.f29392l = i21;
                            int i22 = this.f29393m;
                            if (i22 == -1) {
                                i22 = this.f29391k;
                            }
                            this.f29393m = i22;
                        } else {
                            i15 = -1;
                        }
                        float f11 = (this.f29392l == i15 || (i16 = this.f29393m) == i15) ? -1.0f : (this.f29391k * r1) / (this.f29390j * i16);
                        if (this.f29395q) {
                            if (this.f29401w == -1.0f || this.f29402x == -1.0f || this.f29403y == -1.0f || this.f29404z == -1.0f || this.A == -1.0f || this.B == -1.0f || this.C == -1.0f || this.D == -1.0f || this.E == -1.0f || this.F == -1.0f) {
                                bArr = null;
                            } else {
                                bArr = new byte[25];
                                ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
                                byteBufferWrap.put((byte) 0);
                                byteBufferWrap.putShort((short) ((this.f29401w * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.f29402x * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.f29403y * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.f29404z * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.A * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.B * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.C * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) ((this.D * 50000.0f) + 0.5f));
                                byteBufferWrap.putShort((short) (this.E + 0.5f));
                                byteBufferWrap.putShort((short) (this.F + 0.5f));
                                byteBufferWrap.putShort((short) this.f29399u);
                                byteBufferWrap.putShort((short) this.f29400v);
                            }
                            cVar = new com.fyber.inneractive.sdk.player.exoplayer2.video.c(this.f29396r, this.f29398t, this.f29397s, bArr);
                        } else {
                            cVar = null;
                        }
                        oVar = o.a(Integer.toString(i5), str2, i19, this.f29390j, this.f29391k, list2, -1, f11, this.o, this.f29394p, cVar, this.f29389i);
                    } else {
                        String str8 = str2;
                        if ("application/x-subrip".equals(str8)) {
                            oVar = o.a(Integer.toString(i5), str8, i18, this.N, -1, this.f29389i, Long.MAX_VALUE, Collections.EMPTY_LIST);
                            i17 = 3;
                        } else {
                            if (!"application/vobsub".equals(str8) && !"application/pgs".equals(str8) && !"application/dvbsubs".equals(str8)) {
                                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Unexpected MIME type.");
                            }
                            i17 = 3;
                            oVar = new o(Integer.toString(i5), null, str8, null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, this.N, -1, Long.MAX_VALUE, list2, this.f29389i, null);
                        }
                    }
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(this.f29382b, i17);
                this.O = gVarA;
                gVarA.a(oVar);
                return;
            case 2:
                n nVar = new n(this.f29388h);
                try {
                    int iF = nVar.f();
                    if (iF != 1) {
                        if (iF == 65534) {
                            nVar.e(24);
                            long jG = nVar.g();
                            UUID uuid = e.f29406b0;
                            if (jG == uuid.getMostSignificantBits()) {
                                if (nVar.g() == uuid.getLeastSignificantBits()) {
                                }
                                str6 = "audio/x-unknown";
                                list = null;
                                iA = -1;
                                str7 = str6;
                                i13 = iA;
                                listSingletonList = list;
                                str = str7;
                                list2 = listSingletonList;
                                str2 = str;
                                i14 = i13;
                                i12 = -1;
                                int i182 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                                if ("audio".equals(i.b(str2))) {
                                }
                                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2 = jVar.a(this.f29382b, i17);
                                this.O = gVarA2;
                                gVarA2.a(oVar);
                                return;
                            }
                        }
                        Log.w("MatroskaExtractor", "Non-PCM MS/ACM is unsupported. Setting mimeType to audio/x-unknown");
                        str6 = "audio/x-unknown";
                        list = null;
                        iA = -1;
                        str7 = str6;
                        i13 = iA;
                        listSingletonList = list;
                        str = str7;
                        list2 = listSingletonList;
                        str2 = str;
                        i14 = i13;
                        i12 = -1;
                        int i1822 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                        if ("audio".equals(i.b(str2))) {
                        }
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22 = jVar.a(this.f29382b, i17);
                        this.O = gVarA22;
                        gVarA22.a(oVar);
                        return;
                    }
                    iA = z.a(this.H);
                    if (iA != 0) {
                        str6 = "audio/raw";
                        list = null;
                        str7 = str6;
                        i13 = iA;
                        listSingletonList = list;
                        str = str7;
                        list2 = listSingletonList;
                        str2 = str;
                        i14 = i13;
                        i12 = -1;
                        int i18222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                        if ("audio".equals(i.b(str2))) {
                        }
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222 = jVar.a(this.f29382b, i17);
                        this.O = gVarA222;
                        gVarA222.a(oVar);
                        return;
                    }
                    Log.w("MatroskaExtractor", "Unsupported PCM bit depth: " + this.H + ". Setting mimeType to audio/x-unknown");
                    str6 = "audio/x-unknown";
                    list = null;
                    iA = -1;
                    str7 = str6;
                    i13 = iA;
                    listSingletonList = list;
                    str = str7;
                    list2 = listSingletonList;
                    str2 = str;
                    i14 = i13;
                    i12 = -1;
                    int i182222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                    if ("audio".equals(i.b(str2))) {
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222 = jVar.a(this.f29382b, i17);
                    this.O = gVarA2222;
                    gVarA2222.a(oVar);
                    return;
                } catch (ArrayIndexOutOfBoundsException unused) {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing MS/ACM codec private");
                }
            case 3:
                str6 = "audio/true-hd";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222;
                gVarA22222.a(oVar);
                return;
            case 4:
                byte[] bArr3 = this.f29388h;
                try {
                    if (bArr3[0] != 2) {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing vorbis codec private");
                    }
                    int i23 = 1;
                    int i24 = 0;
                    while (true) {
                        int i25 = bArr3[i23];
                        int i26 = -1;
                        if (i25 == -1) {
                            i24 += 255;
                            i23++;
                        } else {
                            int i27 = i23 + 1;
                            int i28 = i24 + i25;
                            int i29 = 0;
                            while (true) {
                                int i31 = bArr3[i27];
                                if (i31 != i26) {
                                    int i32 = i27 + 1;
                                    int i33 = i29 + i31;
                                    if (bArr3[i32] != 1) {
                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing vorbis codec private");
                                    }
                                    byte[] bArr4 = new byte[i28];
                                    System.arraycopy(bArr3, i32, bArr4, 0, i28);
                                    int i34 = i32 + i28;
                                    if (bArr3[i34] != 3) {
                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing vorbis codec private");
                                    }
                                    int i35 = i34 + i33;
                                    if (bArr3[i35] != 5) {
                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing vorbis codec private");
                                    }
                                    byte[] bArr5 = new byte[bArr3.length - i35];
                                    System.arraycopy(bArr3, i35, bArr5, 0, bArr3.length - i35);
                                    ArrayList arrayList = new ArrayList(2);
                                    arrayList.add(bArr4);
                                    arrayList.add(bArr5);
                                    i11 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
                                    str2 = "audio/vorbis";
                                    list2 = arrayList;
                                    i12 = i11;
                                    i14 = -1;
                                    int i18222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                                    if ("audio".equals(i.b(str2))) {
                                    }
                                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222 = jVar.a(this.f29382b, i17);
                                    this.O = gVarA222222;
                                    gVarA222222.a(oVar);
                                    return;
                                }
                                i29 += 255;
                                i27++;
                                i26 = -1;
                            }
                        }
                    }
                } catch (ArrayIndexOutOfBoundsException unused2) {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing vorbis codec private");
                }
                break;
            case 5:
                str3 = "audio/mpeg-L2";
                str2 = str3;
                list2 = null;
                i12 = u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                i14 = -1;
                int i182222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222;
                gVarA2222222.a(oVar);
                return;
            case 6:
                str3 = "audio/mpeg";
                str2 = str3;
                list2 = null;
                i12 = u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                i14 = -1;
                int i1822222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222;
                gVarA22222222.a(oVar);
                return;
            case 7:
                byte[] bArr6 = this.f29388h;
                try {
                    if (16 > bArr6.length) {
                        throw new IllegalArgumentException();
                    }
                    if (((bArr6[16] & 255) | ((bArr6[17] & 255) << 8) | ((bArr6[18] & 255) << 16) | ((bArr6[19] & 255) << 24)) == 826496599) {
                        for (int i36 = 40; i36 < bArr6.length - 4; i36++) {
                            if (bArr6[i36] == 0 && bArr6[i36 + 1] == 0 && bArr6[i36 + 2] == 1 && bArr6[i36 + 3] == 15) {
                                listSingletonList2 = Collections.singletonList(Arrays.copyOfRange(bArr6, i36, bArr6.length));
                            }
                        }
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Failed to find FourCC VC1 initialization data");
                    }
                    listSingletonList2 = null;
                    if (listSingletonList2 != null) {
                        str6 = "video/wvc1";
                    } else {
                        Log.w("MatroskaExtractor", "Unsupported FourCC. Setting mimeType to video/x-unknown");
                    }
                    list = listSingletonList2;
                    iA = -1;
                    str7 = str6;
                    i13 = iA;
                    listSingletonList = list;
                    str = str7;
                    list2 = listSingletonList;
                    str2 = str;
                    i14 = i13;
                    i12 = -1;
                    int i18222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                    if ("audio".equals(i.b(str2))) {
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222 = jVar.a(this.f29382b, i17);
                    this.O = gVarA222222222;
                    gVarA222222222.a(oVar);
                    return;
                } catch (ArrayIndexOutOfBoundsException unused3) {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Error parsing FourCC VC1 codec private");
                }
            case '\b':
                byte[] bArr7 = this.f29388h;
                listSingletonList = Collections.singletonList(new byte[]{bArr7[0], bArr7[1], bArr7[2], bArr7[3]});
                str = "application/dvbsubs";
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i182222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222;
                gVarA2222222222.a(oVar);
                return;
            case '\n':
                com.fyber.inneractive.sdk.player.exoplayer2.video.a aVarA = com.fyber.inneractive.sdk.player.exoplayer2.video.a.a(new n(this.f29388h));
                list3 = aVarA.f30519a;
                this.P = aVarA.f30520b;
                str4 = "video/avc";
                List list4 = list3;
                str = str4;
                listSingletonList = list4;
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222222;
                gVarA22222222222.a(oVar);
                return;
            case 11:
                listSingletonList = Collections.singletonList(this.f29388h);
                str = "application/vobsub";
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i18222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA222222222222;
                gVarA222222222222.a(oVar);
                return;
            case '\f':
                str6 = "audio/vnd.dts.hd";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i182222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222222;
                gVarA2222222222222.a(oVar);
                return;
            case '\r':
                listSingletonList = Collections.singletonList(this.f29388h);
                str = "audio/mp4a-latm";
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222222222;
                gVarA22222222222222.a(oVar);
                return;
            case 14:
                str6 = "audio/ac3";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i18222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA222222222222222;
                gVarA222222222222222.a(oVar);
                return;
            case 15:
            case 20:
                str6 = "audio/vnd.dts";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i182222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222222222;
                gVarA2222222222222222.a(oVar);
                return;
            case 16:
                str6 = "video/x-vnd.on2.vp8";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222222222222;
                gVarA22222222222222222.a(oVar);
                return;
            case 17:
                str6 = "video/x-vnd.on2.vp9";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i18222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA222222222222222222;
                gVarA222222222222222222.a(oVar);
                return;
            case 18:
                str6 = "application/pgs";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i182222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222222222222;
                gVarA2222222222222222222.a(oVar);
                return;
            case 19:
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222222222222222;
                gVarA22222222222222222222.a(oVar);
                return;
            case 21:
                iA = z.a(this.H);
                if (iA != 0) {
                    list = null;
                    i13 = iA;
                    listSingletonList = list;
                    str = str7;
                    list2 = listSingletonList;
                    str2 = str;
                    i14 = i13;
                    i12 = -1;
                    int i18222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                    if ("audio".equals(i.b(str2))) {
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222222222222222 = jVar.a(this.f29382b, i17);
                    this.O = gVarA222222222222222222222;
                    gVarA222222222222222222222.a(oVar);
                    return;
                }
                Log.w("MatroskaExtractor", "Unsupported PCM bit depth: " + this.H + ". Setting mimeType to audio/x-unknown");
                str6 = "audio/x-unknown";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i182222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222222222222222;
                gVarA2222222222222222222222.a(oVar);
                return;
            case 22:
                com.fyber.inneractive.sdk.player.exoplayer2.video.d dVarA = com.fyber.inneractive.sdk.player.exoplayer2.video.d.a(new n(this.f29388h));
                list3 = dVarA.f30529a;
                this.P = dVarA.f30530b;
                str4 = "video/hevc";
                List list42 = list3;
                str = str4;
                listSingletonList = list42;
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222222222222222222;
                gVarA22222222222222222222222.a(oVar);
                return;
            case 23:
                str6 = "application/x-subrip";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i18222222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA222222222222222222222222;
                gVarA222222222222222222222222.a(oVar);
                return;
            case 24:
                str6 = "video/mpeg2";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i182222222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222222222222222222;
                gVarA2222222222222222222222222.a(oVar);
                return;
            case 25:
                str6 = "audio/eac3";
                list = null;
                iA = -1;
                str7 = str6;
                i13 = iA;
                listSingletonList = list;
                str = str7;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i1822222222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA22222222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA22222222222222222222222222;
                gVarA22222222222222222222222222.a(oVar);
                return;
            case 26:
                listSingletonList = Collections.singletonList(this.f29388h);
                str = "audio/flac";
                i13 = -1;
                list2 = listSingletonList;
                str2 = str;
                i14 = i13;
                i12 = -1;
                int i18222222222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA222222222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA222222222222222222222222222;
                gVarA222222222222222222222222222.a(oVar);
                return;
            case 27:
                ArrayList arrayList2 = new ArrayList(3);
                arrayList2.add(this.f29388h);
                arrayList2.add(ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong(this.J).array());
                arrayList2.add(ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong(this.K).array());
                i11 = 5760;
                list2 = arrayList2;
                str2 = "audio/opus";
                i12 = i11;
                i14 = -1;
                int i182222222222222222222222222222 = (this.M ? 1 : 0) | (this.L ? 2 : 0);
                if ("audio".equals(i.b(str2))) {
                }
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA2222222222222222222222222222 = jVar.a(this.f29382b, i17);
                this.O = gVarA2222222222222222222222222222;
                gVarA2222222222222222222222222222.a(oVar);
                return;
            default:
                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Unrecognized codec identifier.");
        }
    }
}
