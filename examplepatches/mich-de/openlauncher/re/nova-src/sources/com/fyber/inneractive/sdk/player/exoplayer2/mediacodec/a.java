package com.fyber.inneractive.sdk.player.exoplayer2.mediacodec;

import android.graphics.Point;
import android.media.MediaCodecInfo;
import android.util.Log;
import android.util.Pair;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f30054a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f30055b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f30056c;

    /* renamed from: d, reason: collision with root package name */
    public final String f30057d;

    /* renamed from: e, reason: collision with root package name */
    public final MediaCodecInfo.CodecCapabilities f30058e;

    public a(String str, String str2, MediaCodecInfo.CodecCapabilities codecCapabilities, boolean z11) {
        str.getClass();
        this.f30054a = str;
        this.f30057d = str2;
        this.f30058e = codecCapabilities;
        boolean z12 = false;
        this.f30055b = !z11 && codecCapabilities != null && z.f30489a >= 19 && codecCapabilities.isFeatureSupported("adaptive-playback");
        if (codecCapabilities != null && z.f30489a >= 21 && codecCapabilities.isFeatureSupported("tunneled-playback")) {
            z12 = true;
        }
        this.f30056c = z12;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public final boolean a(String str) {
        String strA;
        MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArr;
        Integer numValueOf;
        Integer numValueOf2;
        if (str == null || this.f30057d == null || (strA = com.fyber.inneractive.sdk.player.exoplayer2.util.i.a(str)) == null) {
            return true;
        }
        if (!this.f30057d.equals(strA)) {
            b("codec.mime " + str + ", " + strA);
            return false;
        }
        Pattern pattern = j.f30081a;
        String[] strArrSplit = str.split("\\.");
        String str2 = strArrSplit[0];
        str2.getClass();
        int i5 = 2;
        char c11 = 65535;
        switch (str2.hashCode()) {
            case 3006243:
                if (str2.equals("avc1")) {
                    c11 = 0;
                    break;
                }
                break;
            case 3006244:
                if (str2.equals("avc2")) {
                    c11 = 1;
                    break;
                }
                break;
            case 3199032:
                if (str2.equals("hev1")) {
                    c11 = 2;
                    break;
                }
                break;
            case 3214780:
                if (str2.equals("hvc1")) {
                    c11 = 3;
                    break;
                }
                break;
        }
        Pair pair = null;
        switch (c11) {
            case 0:
            case 1:
                if (strArrSplit.length < 2) {
                    Log.w("MediaCodecUtil", "Ignoring malformed AVC codec string: ".concat(str));
                    break;
                } else {
                    try {
                        if (strArrSplit[1].length() == 6) {
                            numValueOf = Integer.valueOf(Integer.parseInt(strArrSplit[1].substring(0, 2), 16));
                            numValueOf2 = Integer.valueOf(Integer.parseInt(strArrSplit[1].substring(4), 16));
                        } else if (strArrSplit.length < 3) {
                            Log.w("MediaCodecUtil", "Ignoring malformed AVC codec string: ".concat(str));
                            break;
                        } else {
                            numValueOf = Integer.valueOf(Integer.parseInt(strArrSplit[1]));
                            numValueOf2 = Integer.valueOf(Integer.parseInt(strArrSplit[2]));
                        }
                        pair = new Pair(Integer.valueOf(j.f30083c.get(numValueOf.intValue())), Integer.valueOf(j.f30084d.get(numValueOf2.intValue())));
                        break;
                    } catch (NumberFormatException unused) {
                        Log.w("MediaCodecUtil", "Ignoring malformed AVC codec string: ".concat(str));
                        break;
                    }
                }
            case 2:
            case 3:
                if (strArrSplit.length < 4) {
                    Log.w("MediaCodecUtil", "Ignoring malformed HEVC codec string: ".concat(str));
                    break;
                } else {
                    Matcher matcher = j.f30081a.matcher(strArrSplit[1]);
                    if (matcher.matches()) {
                        String strGroup = matcher.group(1);
                        if ("1".equals(strGroup)) {
                            i5 = 1;
                        } else if (!"2".equals(strGroup)) {
                            Log.w("MediaCodecUtil", "Unknown HEVC profile string: " + strGroup);
                            break;
                        }
                        Integer num = (Integer) j.f30085e.get(strArrSplit[3]);
                        if (num == null) {
                            Log.w("MediaCodecUtil", "Unknown HEVC level string: " + matcher.group(1));
                            break;
                        } else {
                            pair = new Pair(Integer.valueOf(i5), num);
                            break;
                        }
                    } else {
                        Log.w("MediaCodecUtil", "Ignoring malformed HEVC codec string: ".concat(str));
                        break;
                    }
                }
        }
        if (pair == null) {
            return true;
        }
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f30058e;
        if (codecCapabilities == null || (codecProfileLevelArr = codecCapabilities.profileLevels) == null) {
            codecProfileLevelArr = new MediaCodecInfo.CodecProfileLevel[0];
        }
        for (MediaCodecInfo.CodecProfileLevel codecProfileLevel : codecProfileLevelArr) {
            if (codecProfileLevel.profile == ((Integer) pair.first).intValue() && codecProfileLevel.level >= ((Integer) pair.second).intValue()) {
                return true;
            }
        }
        b("codec.profileLevel, " + str + ", " + strA);
        return false;
    }

    public final boolean b(int i5) {
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f30058e;
        if (codecCapabilities == null) {
            b("sampleRate.caps");
            return false;
        }
        MediaCodecInfo.AudioCapabilities audioCapabilities = codecCapabilities.getAudioCapabilities();
        if (audioCapabilities == null) {
            b("sampleRate.aCaps");
            return false;
        }
        if (audioCapabilities.isSampleRateSupported(i5)) {
            return true;
        }
        b("sampleRate.support, " + i5);
        return false;
    }

    public final void b(String str) {
        int i5 = z.f30489a;
    }

    public final boolean a(int i5, int i11, double d5) {
        boolean zIsSizeSupported;
        boolean zIsSizeSupported2;
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f30058e;
        if (codecCapabilities == null) {
            b("sizeAndRate.caps");
            return false;
        }
        MediaCodecInfo.VideoCapabilities videoCapabilities = codecCapabilities.getVideoCapabilities();
        if (videoCapabilities == null) {
            b("sizeAndRate.vCaps");
            return false;
        }
        if (d5 != -1.0d && d5 > 0.0d) {
            zIsSizeSupported = videoCapabilities.areSizeAndRateSupported(i5, i11, d5);
        } else {
            zIsSizeSupported = videoCapabilities.isSizeSupported(i5, i11);
        }
        if (zIsSizeSupported) {
            return true;
        }
        if (i5 < i11) {
            if (d5 != -1.0d && d5 > 0.0d) {
                zIsSizeSupported2 = videoCapabilities.areSizeAndRateSupported(i11, i5, d5);
            } else {
                zIsSizeSupported2 = videoCapabilities.isSizeSupported(i11, i5);
            }
            if (zIsSizeSupported2) {
                c0.t(i5, "sizeAndRate.rotated, ", "x", i11, "x").append(d5);
                int i12 = z.f30489a;
                return true;
            }
        }
        StringBuilder sbT = c0.t(i5, "sizeAndRate.support, ", "x", i11, "x");
        sbT.append(d5);
        b(sbT.toString());
        return false;
    }

    public final Point a(int i5, int i11) {
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f30058e;
        if (codecCapabilities == null) {
            b("align.caps");
            return null;
        }
        MediaCodecInfo.VideoCapabilities videoCapabilities = codecCapabilities.getVideoCapabilities();
        if (videoCapabilities == null) {
            b("align.vCaps");
            return null;
        }
        int widthAlignment = videoCapabilities.getWidthAlignment();
        int heightAlignment = videoCapabilities.getHeightAlignment();
        int i12 = z.f30489a;
        return new Point((((i5 + widthAlignment) - 1) / widthAlignment) * widthAlignment, (((i11 + heightAlignment) - 1) / heightAlignment) * heightAlignment);
    }

    public final boolean a(int i5) {
        int i11;
        MediaCodecInfo.CodecCapabilities codecCapabilities = this.f30058e;
        if (codecCapabilities == null) {
            b("channelCount.caps");
            return false;
        }
        MediaCodecInfo.AudioCapabilities audioCapabilities = codecCapabilities.getAudioCapabilities();
        if (audioCapabilities == null) {
            b("channelCount.aCaps");
            return false;
        }
        String str = this.f30054a;
        String str2 = this.f30057d;
        int maxInputChannelCount = audioCapabilities.getMaxInputChannelCount();
        if (maxInputChannelCount <= 1 && ((z.f30489a < 26 || maxInputChannelCount <= 0) && !"audio/mpeg".equals(str2) && !"audio/3gpp".equals(str2) && !"audio/amr-wb".equals(str2) && !"audio/mp4a-latm".equals(str2) && !"audio/vorbis".equals(str2) && !"audio/opus".equals(str2) && !"audio/raw".equals(str2) && !"audio/flac".equals(str2) && !"audio/g711-alaw".equals(str2) && !"audio/g711-mlaw".equals(str2) && !"audio/gsm".equals(str2))) {
            if ("audio/ac3".equals(str2)) {
                i11 = 6;
            } else {
                i11 = "audio/eac3".equals(str2) ? 16 : 30;
            }
            StringBuilder sbV = c0.v("AssumedMaxChannelAdjustment: ", maxInputChannelCount, str, ", [", " to ");
            sbV.append(i11);
            sbV.append("]");
            Log.w("MediaCodecInfo", sbV.toString());
            maxInputChannelCount = i11;
        }
        if (maxInputChannelCount >= i5) {
            return true;
        }
        b("channelCount.support, " + i5);
        return false;
    }
}
