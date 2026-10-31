package com.fyber.inneractive.sdk.player.exoplayer2.mediacodec;

import android.media.MediaCodecInfo;
import android.util.Log;
import android.util.SparseIntArray;
import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import h6.c1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f30081a;

    /* renamed from: b, reason: collision with root package name */
    public static final HashMap f30082b;

    /* renamed from: c, reason: collision with root package name */
    public static final SparseIntArray f30083c;

    /* renamed from: d, reason: collision with root package name */
    public static final SparseIntArray f30084d;

    /* renamed from: e, reason: collision with root package name */
    public static final HashMap f30085e;

    /* renamed from: f, reason: collision with root package name */
    public static int f30086f;

    static {
        new a("OMX.google.raw.decoder", null, null, false);
        f30081a = Pattern.compile("^\\D?(\\d+)$");
        f30082b = new HashMap();
        f30086f = -1;
        SparseIntArray sparseIntArray = new SparseIntArray();
        f30083c = sparseIntArray;
        sparseIntArray.put(66, 1);
        sparseIntArray.put(77, 2);
        sparseIntArray.put(88, 4);
        sparseIntArray.put(100, 8);
        SparseIntArray sparseIntArray2 = new SparseIntArray();
        f30084d = sparseIntArray2;
        sparseIntArray2.put(10, 1);
        sparseIntArray2.put(11, 4);
        sparseIntArray2.put(12, 8);
        sparseIntArray2.put(13, 16);
        sparseIntArray2.put(20, 32);
        sparseIntArray2.put(21, 64);
        sparseIntArray2.put(22, 128);
        sparseIntArray2.put(30, 256);
        sparseIntArray2.put(31, EventBridgeChannel.QUEUE_CAPACITY);
        sparseIntArray2.put(32, 1024);
        sparseIntArray2.put(40, 2048);
        sparseIntArray2.put(41, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
        sparseIntArray2.put(42, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        sparseIntArray2.put(50, ReaderJsonLexerKt.BATCH_SIZE);
        sparseIntArray2.put(51, SQLiteDatabase.OPEN_NOMUTEX);
        sparseIntArray2.put(52, SQLiteDatabase.OPEN_FULLMUTEX);
        HashMap map = new HashMap();
        f30085e = map;
        c1.x(1, map, "L30", 4, "L60");
        c1.x(16, map, "L63", 64, "L90");
        c1.x(256, map, "L93", 1024, "L120");
        c1.x(u1.FLAG_APPEARED_IN_PRE_LAYOUT, map, "L123", ReaderJsonLexerKt.BATCH_SIZE, "L150");
        c1.x(SQLiteDatabase.OPEN_FULLMUTEX, map, "L153", SQLiteDatabase.OPEN_PRIVATECACHE, "L156");
        c1.x(1048576, map, "L180", 4194304, "L183");
        c1.x(16777216, map, "L186", 2, "H30");
        c1.x(8, map, "H60", 32, "H63");
        c1.x(128, map, "H90", EventBridgeChannel.QUEUE_CAPACITY, "H93");
        c1.x(2048, map, "H120", UserMetadata.MAX_INTERNAL_KEY_SIZE, "H123");
        c1.x(SQLiteDatabase.OPEN_NOMUTEX, map, "H150", SQLiteDatabase.OPEN_SHAREDCACHE, "H153");
        c1.x(524288, map, "H156", 2097152, "H180");
        c1.x(8388608, map, "H183", 33554432, "H186");
    }

    public static a a(boolean z11, String str) {
        List listUnmodifiableList;
        synchronized (j.class) {
            try {
                e eVar = new e(z11, str);
                listUnmodifiableList = (List) f30082b.get(eVar);
                if (listUnmodifiableList == null) {
                    int i5 = z.f30489a;
                    ArrayList arrayListA = a(eVar, i5 >= 21 ? new i(z11) : new h());
                    if (z11 && arrayListA.isEmpty() && 21 <= i5 && i5 <= 23) {
                        arrayListA = a(eVar, new h());
                        if (!arrayListA.isEmpty()) {
                            Log.w("MediaCodecUtil", "MediaCodecList API didn't list secure decoder for: " + str + ". Assuming: " + ((a) arrayListA.get(0)).f30054a);
                        }
                    }
                    if (i5 < 26) {
                        int i11 = 1;
                        if (arrayListA.size() > 1 && "OMX.MTK.AUDIO.DECODER.RAW".equals(((a) arrayListA.get(0)).f30054a)) {
                            while (true) {
                                if (i11 >= arrayListA.size()) {
                                    break;
                                }
                                a aVar = (a) arrayListA.get(i11);
                                if ("OMX.google.raw.decoder".equals(aVar.f30054a)) {
                                    arrayListA.remove(i11);
                                    arrayListA.add(0, aVar);
                                    break;
                                }
                                i11++;
                            }
                        }
                    }
                    listUnmodifiableList = Collections.unmodifiableList(arrayListA);
                    f30082b.put(eVar, listUnmodifiableList);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (listUnmodifiableList.isEmpty()) {
            return null;
        }
        return (a) listUnmodifiableList.get(0);
    }

    public static int a() {
        MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArr;
        int i5;
        if (f30086f == -1) {
            int iMax = 0;
            a aVarA = a(false, "video/avc");
            if (aVarA != null) {
                MediaCodecInfo.CodecCapabilities codecCapabilities = aVarA.f30058e;
                if (codecCapabilities == null || (codecProfileLevelArr = codecCapabilities.profileLevels) == null) {
                    codecProfileLevelArr = new MediaCodecInfo.CodecProfileLevel[0];
                }
                int length = codecProfileLevelArr.length;
                int iMax2 = 0;
                while (iMax < length) {
                    int i11 = codecProfileLevelArr[iMax].level;
                    if (i11 != 1 && i11 != 2) {
                        switch (i11) {
                            case 8:
                            case 16:
                            case 32:
                                i5 = 101376;
                                break;
                            case 64:
                                i5 = 202752;
                                break;
                            case 128:
                            case 256:
                                i5 = 414720;
                                break;
                            case EventBridgeChannel.QUEUE_CAPACITY /* 512 */:
                                i5 = 921600;
                                break;
                            case 1024:
                                i5 = 1310720;
                                break;
                            case 2048:
                            case u1.FLAG_APPEARED_IN_PRE_LAYOUT /* 4096 */:
                                i5 = 2097152;
                                break;
                            case UserMetadata.MAX_INTERNAL_KEY_SIZE /* 8192 */:
                                i5 = 2228224;
                                break;
                            case ReaderJsonLexerKt.BATCH_SIZE /* 16384 */:
                                i5 = 5652480;
                                break;
                            case SQLiteDatabase.OPEN_NOMUTEX /* 32768 */:
                            case SQLiteDatabase.OPEN_FULLMUTEX /* 65536 */:
                                i5 = 9437184;
                                break;
                            default:
                                i5 = -1;
                                break;
                        }
                    } else {
                        i5 = 25344;
                    }
                    iMax2 = Math.max(i5, iMax2);
                    iMax++;
                }
                iMax = Math.max(iMax2, z.f30489a >= 21 ? 345600 : 172800);
            }
            f30086f = iMax;
        }
        return f30086f;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0081 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00e7 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ArrayList a(e eVar, g gVar) throws Exception {
        g gVar2 = gVar;
        try {
            ArrayList arrayList = new ArrayList();
            String str = eVar.f30077a;
            int iA = gVar2.a();
            boolean zB = gVar2.b();
            int i5 = 0;
            loop0: while (i5 < iA) {
                MediaCodecInfo mediaCodecInfoA = gVar2.a(i5);
                String name = mediaCodecInfoA.getName();
                if (a(mediaCodecInfoA, name, zB)) {
                    String[] supportedTypes = mediaCodecInfoA.getSupportedTypes();
                    int length = supportedTypes.length;
                    int i11 = 0;
                    while (i11 < length) {
                        String str2 = supportedTypes[i11];
                        if (str2.equalsIgnoreCase(str)) {
                            try {
                                MediaCodecInfo.CodecCapabilities capabilitiesForType = mediaCodecInfoA.getCapabilitiesForType(str2);
                                boolean zA = gVar2.a(str, capabilitiesForType);
                                if (z.f30489a <= 22) {
                                    String str3 = z.f30492d;
                                    if (!str3.equals("ODROID-XU3")) {
                                        if (str3.equals("Nexus 10")) {
                                        }
                                    }
                                    boolean z11 = "OMX.Exynos.AVC.Decoder".equals(name) || "OMX.Exynos.AVC.Decoder.secure".equals(name);
                                    if ((!zB && eVar.f30078b == zA) || (!zB && !eVar.f30078b)) {
                                        arrayList.add(new a(name, str, capabilitiesForType, z11));
                                    } else if (zB && zA) {
                                        arrayList.add(new a(name + ".secure", str, capabilitiesForType, z11));
                                        break loop0;
                                    }
                                }
                                if (!zB) {
                                    if (zB) {
                                        continue;
                                    }
                                } else if (zB) {
                                }
                            } catch (Exception e3) {
                                if (z.f30489a <= 23 && !arrayList.isEmpty()) {
                                    Log.e("MediaCodecUtil", "Skipping codec " + name + " (failed to query capabilities)");
                                } else {
                                    Log.e("MediaCodecUtil", "Failed to query codec " + name + " (" + str2 + ")");
                                    throw e3;
                                }
                            }
                        }
                        i11++;
                        gVar2 = gVar;
                    }
                }
                i5++;
                gVar2 = gVar;
            }
            return arrayList;
        } catch (Exception e11) {
            throw new f(e11);
        }
    }

    public static boolean a(MediaCodecInfo mediaCodecInfo, String str, boolean z11) {
        if (mediaCodecInfo.isEncoder() || (!z11 && str.endsWith(".secure"))) {
            return false;
        }
        int i5 = z.f30489a;
        if (i5 < 21 && ("CIPAACDecoder".equals(str) || "CIPMP3Decoder".equals(str) || "CIPVorbisDecoder".equals(str) || "CIPAMRNBDecoder".equals(str) || "AACDecoder".equals(str) || "MP3Decoder".equals(str))) {
            return false;
        }
        if (i5 < 18 && "OMX.SEC.MP3.Decoder".equals(str)) {
            return false;
        }
        if (i5 < 18 && "OMX.MTK.AUDIO.DECODER.AAC".equals(str) && "a70".equals(z.f30490b)) {
            return false;
        }
        if (i5 == 16 && "OMX.qcom.audio.decoder.mp3".equals(str)) {
            String str2 = z.f30490b;
            if ("dlxu".equals(str2) || "protou".equals(str2) || "ville".equals(str2) || "villeplus".equals(str2) || "villec2".equals(str2) || str2.startsWith("gee") || "C6602".equals(str2) || "C6603".equals(str2) || "C6606".equals(str2) || "C6616".equals(str2) || "L36h".equals(str2) || "SO-02E".equals(str2)) {
                return false;
            }
        }
        if (i5 == 16 && "OMX.qcom.audio.decoder.aac".equals(str)) {
            String str3 = z.f30490b;
            if ("C1504".equals(str3) || "C1505".equals(str3) || "C1604".equals(str3) || "C1605".equals(str3)) {
                return false;
            }
        }
        if (i5 <= 19 && "OMX.SEC.vp8.dec".equals(str) && "samsung".equals(z.f30491c)) {
            String str4 = z.f30490b;
            if (str4.startsWith("d2") || str4.startsWith("serrano") || str4.startsWith("jflte") || str4.startsWith("santos") || str4.startsWith("t0")) {
                return false;
            }
        }
        return (i5 <= 19 && z.f30490b.startsWith("jflte") && "OMX.qcom.video.decoder.vp8".equals(str)) ? false : true;
    }
}
