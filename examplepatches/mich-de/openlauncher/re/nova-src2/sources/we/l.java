package we;

import android.graphics.Point;
import android.media.MediaCodecInfo;
import android.util.Pair;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import fe.k0;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import wf.v;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final String f94250a;

    /* renamed from: b, reason: collision with root package name */
    public final String f94251b;

    /* renamed from: c, reason: collision with root package name */
    public final String f94252c;

    /* renamed from: d, reason: collision with root package name */
    public final MediaCodecInfo.CodecCapabilities f94253d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f94254e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f94255f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f94256g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f94257h;

    public l(String str, String str2, String str3, MediaCodecInfo.CodecCapabilities codecCapabilities, boolean z11, boolean z12, boolean z13) {
        str.getClass();
        this.f94250a = str;
        this.f94251b = str2;
        this.f94252c = str3;
        this.f94253d = codecCapabilities;
        this.f94256g = z11;
        this.f94254e = z12;
        this.f94255f = z13;
        this.f94257h = wf.j.i(str2);
    }

    public static boolean a(MediaCodecInfo.VideoCapabilities videoCapabilities, int i5, int i11, double d5) {
        int widthAlignment = videoCapabilities.getWidthAlignment();
        int heightAlignment = videoCapabilities.getHeightAlignment();
        Point point = new Point(v.f(i5, widthAlignment) * widthAlignment, v.f(i11, heightAlignment) * heightAlignment);
        int i12 = point.x;
        int i13 = point.y;
        return (d5 == -1.0d || d5 < 1.0d) ? videoCapabilities.isSizeSupported(i12, i13) : videoCapabilities.areSizeAndRateSupported(i12, i13, Math.floor(d5));
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static l g(String str, String str2, String str3, MediaCodecInfo.CodecCapabilities codecCapabilities, boolean z11, boolean z12) {
        boolean z13;
        boolean z14;
        String str4;
        String str5;
        MediaCodecInfo.CodecCapabilities codecCapabilities2;
        boolean z15;
        String str6;
        int i5;
        if (codecCapabilities == null || (i5 = v.f94376a) < 19 || !codecCapabilities.isFeatureSupported("adaptive-playback")) {
            z13 = false;
        } else {
            if (i5 <= 22) {
                String str7 = v.f94379d;
                if (("ODROID-XU3".equals(str7) || "Nexus 10".equals(str7)) && ("OMX.Exynos.AVC.Decoder".equals(str) || "OMX.Exynos.AVC.Decoder.secure".equals(str))) {
                }
            }
            z13 = true;
        }
        if (codecCapabilities != null && v.f94376a >= 21) {
            codecCapabilities.isFeatureSupported("tunneled-playback");
        }
        if (z12 || (codecCapabilities != null && v.f94376a >= 21 && codecCapabilities.isFeatureSupported("secure-playback"))) {
            z14 = true;
            str4 = str;
            str5 = str3;
            codecCapabilities2 = codecCapabilities;
            z15 = z11;
            str6 = str2;
        } else {
            z14 = false;
            str6 = str2;
            str5 = str3;
            codecCapabilities2 = codecCapabilities;
            z15 = z11;
            str4 = str;
        }
        return new l(str4, str6, str5, codecCapabilities2, z15, z13, z14);
    }

    public final ie.g b(k0 k0Var, k0 k0Var2) {
        k0 k0Var3;
        k0 k0Var4;
        int i5 = !v.a(k0Var.f54883l, k0Var2.f54883l) ? 8 : 0;
        if (this.f94257h) {
            if (k0Var.f54889t != k0Var2.f54889t) {
                i5 |= 1024;
            }
            if (!this.f94254e && (k0Var.f54886q != k0Var2.f54886q || k0Var.f54887r != k0Var2.f54887r)) {
                i5 |= EventBridgeChannel.QUEUE_CAPACITY;
            }
            if (!v.a(k0Var.f54893x, k0Var2.f54893x)) {
                i5 |= 2048;
            }
            if (v.f94379d.startsWith("SM-T230") && "OMX.MARVELL.VIDEO.HW.CODA7542DECODER".equals(this.f94250a) && !k0Var.b(k0Var2)) {
                i5 |= 2;
            }
            if (i5 == 0) {
                return new ie.g(this.f94250a, k0Var, k0Var2, k0Var.b(k0Var2) ? 3 : 2, 0);
            }
            k0Var3 = k0Var;
            k0Var4 = k0Var2;
        } else {
            k0Var3 = k0Var;
            k0Var4 = k0Var2;
            if (k0Var3.f54894y != k0Var4.f54894y) {
                i5 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            }
            if (k0Var3.f54895z != k0Var4.f54895z) {
                i5 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            }
            if (k0Var3.A != k0Var4.A) {
                i5 |= ReaderJsonLexerKt.BATCH_SIZE;
            }
            String str = this.f94251b;
            if (i5 == 0 && "audio/mp4a-latm".equals(str)) {
                Pair pairD = s.d(k0Var3);
                Pair pairD2 = s.d(k0Var4);
                if (pairD != null && pairD2 != null) {
                    int iIntValue = ((Integer) pairD.first).intValue();
                    int iIntValue2 = ((Integer) pairD2.first).intValue();
                    if (iIntValue == 42 && iIntValue2 == 42) {
                        return new ie.g(this.f94250a, k0Var3, k0Var4, 3, 0);
                    }
                }
            }
            if (!k0Var3.b(k0Var4)) {
                i5 |= 32;
            }
            if ("audio/opus".equals(str)) {
                i5 |= 2;
            }
            if (i5 == 0) {
                return new ie.g(this.f94250a, k0Var3, k0Var4, 1, 0);
            }
        }
        return new ie.g(this.f94250a, k0Var3, k0Var4, 0, i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0028  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean c(k0 k0Var) {
        Pair pairD;
        MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArr;
        boolean z11;
        MediaCodecInfo.VideoCapabilities videoCapabilities;
        String str = k0Var.f54883l;
        int i5 = k0Var.f54887r;
        int i11 = k0Var.f54886q;
        String str2 = k0Var.f54880i;
        String str3 = this.f94251b;
        if (!str3.equals(str) && !str3.equals(s.b(k0Var))) {
            return false;
        }
        boolean z12 = this.f94257h;
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f94253d;
        if (str2 != null && (pairD = s.d(k0Var)) != null) {
            int iIntValue = ((Integer) pairD.first).intValue();
            int iIntValue2 = ((Integer) pairD.second).intValue();
            if ("video/dolby-vision".equals(k0Var.f54883l)) {
                if ("video/avc".equals(str3)) {
                    iIntValue2 = 0;
                    iIntValue = 8;
                } else if ("video/hevc".equals(str3)) {
                    iIntValue2 = 0;
                    iIntValue = 2;
                }
            }
            if (z12 || iIntValue == 42) {
                if (codecCapabilities == null || (codecProfileLevelArr = codecCapabilities.profileLevels) == null) {
                    codecProfileLevelArr = new MediaCodecInfo.CodecProfileLevel[0];
                }
                z11 = false;
                if (v.f94376a <= 23 && "video/x-vnd.on2.vp9".equals(str3) && codecProfileLevelArr.length == 0) {
                    int iIntValue3 = (codecCapabilities == null || (videoCapabilities = codecCapabilities.getVideoCapabilities()) == null) ? 0 : ((Integer) videoCapabilities.getBitrateRange().getUpper()).intValue();
                    int i12 = iIntValue3 >= 180000000 ? 1024 : iIntValue3 >= 120000000 ? EventBridgeChannel.QUEUE_CAPACITY : iIntValue3 >= 60000000 ? 256 : iIntValue3 >= 30000000 ? 128 : iIntValue3 >= 18000000 ? 64 : iIntValue3 >= 12000000 ? 32 : iIntValue3 >= 7200000 ? 16 : iIntValue3 >= 3600000 ? 8 : iIntValue3 >= 1800000 ? 4 : iIntValue3 >= 800000 ? 2 : 1;
                    MediaCodecInfo.CodecProfileLevel codecProfileLevel = new MediaCodecInfo.CodecProfileLevel();
                    codecProfileLevel.profile = 1;
                    codecProfileLevel.level = i12;
                    codecProfileLevelArr = new MediaCodecInfo.CodecProfileLevel[]{codecProfileLevel};
                }
                for (MediaCodecInfo.CodecProfileLevel codecProfileLevel2 : codecProfileLevelArr) {
                    if (codecProfileLevel2.profile == iIntValue && codecProfileLevel2.level >= iIntValue2) {
                        if ("video/hevc".equals(str3) && 2 == iIntValue) {
                            String str4 = v.f94377b;
                            if (!"sailfish".equals(str4) && !"marlin".equals(str4)) {
                            }
                        }
                    }
                }
                StringBuilder sbK = u4.k("codec.profileLevel, ", str2, ", ");
                sbK.append(this.f94252c);
                f(sbK.toString());
                return false;
            }
            z11 = false;
        }
        if (z12) {
            if (i11 <= 0 || i5 <= 0) {
                return true;
            }
            if (v.f94376a >= 21) {
                return e(k0Var.f54888s, i11, i5);
            }
            boolean z13 = i11 * i5 <= s.i() ? true : z11;
            if (!z13) {
                f("legacyFrameSize, " + i11 + "x" + i5);
            }
            return z13;
        }
        int i13 = v.f94376a;
        if (i13 < 21) {
            return true;
        }
        int i14 = k0Var.f54895z;
        if (i14 != -1) {
            if (codecCapabilities == null) {
                f("sampleRate.caps");
                return z11;
            }
            MediaCodecInfo.AudioCapabilities audioCapabilities = codecCapabilities.getAudioCapabilities();
            if (audioCapabilities == null) {
                f("sampleRate.aCaps");
                return z11;
            }
            if (!audioCapabilities.isSampleRateSupported(i14)) {
                f("sampleRate.support, " + i14);
                return z11;
            }
        }
        int i15 = k0Var.f54894y;
        if (i15 == -1) {
            return true;
        }
        if (codecCapabilities == null) {
            f("channelCount.caps");
            return z11;
        }
        MediaCodecInfo.AudioCapabilities audioCapabilities2 = codecCapabilities.getAudioCapabilities();
        if (audioCapabilities2 == null) {
            f("channelCount.aCaps");
            return z11;
        }
        int maxInputChannelCount = audioCapabilities2.getMaxInputChannelCount();
        if (maxInputChannelCount <= 1 && ((i13 < 26 || maxInputChannelCount <= 0) && !"audio/mpeg".equals(str3) && !"audio/3gpp".equals(str3) && !"audio/amr-wb".equals(str3) && !"audio/mp4a-latm".equals(str3) && !"audio/vorbis".equals(str3) && !"audio/opus".equals(str3) && !"audio/raw".equals(str3) && !"audio/flac".equals(str3) && !"audio/g711-alaw".equals(str3) && !"audio/g711-mlaw".equals(str3) && !"audio/gsm".equals(str3))) {
            int i16 = "audio/ac3".equals(str3) ? 6 : "audio/eac3".equals(str3) ? 16 : 30;
            StringBuilder sbV = c0.v("AssumedMaxChannelAdjustment: ", maxInputChannelCount, this.f94250a, ", [", " to ");
            sbV.append(i16);
            sbV.append("]");
            wf.a.D("MediaCodecInfo", sbV.toString());
            maxInputChannelCount = i16;
        }
        if (maxInputChannelCount >= i15) {
            return true;
        }
        f("channelCount.support, " + i15);
        return z11;
    }

    public final boolean d(k0 k0Var) {
        if (this.f94257h) {
            return this.f94254e;
        }
        Pair pairD = s.d(k0Var);
        return pairD != null && ((Integer) pairD.first).intValue() == 42;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean e(double d5, int i5, int i11) {
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f94253d;
        if (codecCapabilities == null) {
            f("sizeAndRate.caps");
            return false;
        }
        MediaCodecInfo.VideoCapabilities videoCapabilities = codecCapabilities.getVideoCapabilities();
        if (videoCapabilities == null) {
            f("sizeAndRate.vCaps");
            return false;
        }
        if (v.f94376a >= 29) {
            int iA = k.a(videoCapabilities, i5, i11, d5);
            if (iA != 2) {
                if (iA == 1) {
                    StringBuilder sbT = c0.t(i5, "sizeAndRate.cover, ", "x", i11, "@");
                    sbT.append(d5);
                    f(sbT.toString());
                    return false;
                }
                if (!a(videoCapabilities, i5, i11, d5)) {
                }
            }
        } else if (!a(videoCapabilities, i5, i11, d5)) {
            if (i5 >= i11 || (("OMX.MTK.VIDEO.DECODER.HEVC".equals(this.f94250a) && "mcv5a".equals(v.f94377b)) || !a(videoCapabilities, i11, i5, d5))) {
                StringBuilder sbT2 = c0.t(i5, "sizeAndRate.support, ", "x", i11, "@");
                sbT2.append(d5);
                f(sbT2.toString());
                return false;
            }
            c0.t(i5, "sizeAndRate.rotated, ", "x", i11, "@").append(d5);
            int i12 = v.f94376a;
            wf.a.n();
            return true;
        }
        return true;
    }

    public final void f(String str) {
        int i5 = v.f94376a;
        wf.a.n();
    }

    public final String toString() {
        return this.f94250a;
    }
}
