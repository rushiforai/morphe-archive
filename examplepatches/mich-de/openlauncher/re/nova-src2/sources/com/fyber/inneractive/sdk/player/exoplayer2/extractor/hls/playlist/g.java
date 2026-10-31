package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist;

import android.net.Uri;
import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.r;
import com.fyber.inneractive.sdk.player.exoplayer2.source.a0;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class g implements c0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f29324a = Pattern.compile("AVERAGE-BANDWIDTH=(\\d+)\\b");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f29325b = Pattern.compile("[^-]BANDWIDTH=(\\d+)\\b");

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f29326c = Pattern.compile("CODECS=\"(.+?)\"");

    /* renamed from: d, reason: collision with root package name */
    public static final Pattern f29327d = Pattern.compile("RESOLUTION=(\\d+x\\d+)");

    /* renamed from: e, reason: collision with root package name */
    public static final Pattern f29328e = Pattern.compile("#EXT-X-TARGETDURATION:(\\d+)\\b");

    /* renamed from: f, reason: collision with root package name */
    public static final Pattern f29329f = Pattern.compile("#EXT-X-VERSION:(\\d+)\\b");

    /* renamed from: g, reason: collision with root package name */
    public static final Pattern f29330g = Pattern.compile("#EXT-X-PLAYLIST-TYPE:(.+)\\b");

    /* renamed from: h, reason: collision with root package name */
    public static final Pattern f29331h = Pattern.compile("#EXT-X-MEDIA-SEQUENCE:(\\d+)\\b");

    /* renamed from: i, reason: collision with root package name */
    public static final Pattern f29332i = Pattern.compile("#EXTINF:([\\d\\.]+)\\b");

    /* renamed from: j, reason: collision with root package name */
    public static final Pattern f29333j = Pattern.compile("TIME-OFFSET=(-?[\\d\\.]+)\\b");

    /* renamed from: k, reason: collision with root package name */
    public static final Pattern f29334k = Pattern.compile("#EXT-X-BYTERANGE:(\\d+(?:@\\d+)?)\\b");

    /* renamed from: l, reason: collision with root package name */
    public static final Pattern f29335l = Pattern.compile("BYTERANGE=\"(\\d+(?:@\\d+)?)\\b\"");

    /* renamed from: m, reason: collision with root package name */
    public static final Pattern f29336m = Pattern.compile("METHOD=(NONE|AES-128)");
    public static final Pattern n = Pattern.compile("URI=\"(.+?)\"");
    public static final Pattern o = Pattern.compile("IV=([^,.*]+)");

    /* renamed from: p, reason: collision with root package name */
    public static final Pattern f29337p = Pattern.compile("TYPE=(AUDIO|VIDEO|SUBTITLES|CLOSED-CAPTIONS)");

    /* renamed from: q, reason: collision with root package name */
    public static final Pattern f29338q = Pattern.compile("LANGUAGE=\"(.+?)\"");

    /* renamed from: r, reason: collision with root package name */
    public static final Pattern f29339r = Pattern.compile("NAME=\"(.+?)\"");

    /* renamed from: s, reason: collision with root package name */
    public static final Pattern f29340s = Pattern.compile("INSTREAM-ID=\"((?:CC|SERVICE)\\d+)\"");

    /* renamed from: t, reason: collision with root package name */
    public static final Pattern f29341t = Pattern.compile("AUTOSELECT".concat("=(NO|YES)"));

    /* renamed from: u, reason: collision with root package name */
    public static final Pattern f29342u = Pattern.compile("DEFAULT".concat("=(NO|YES)"));

    /* renamed from: v, reason: collision with root package name */
    public static final Pattern f29343v = Pattern.compile("FORCED".concat("=(NO|YES)"));

    public static d b(f fVar, String str) throws r, NumberFormatException {
        String str2;
        long j11;
        int i5;
        f fVar2 = fVar;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        String str3 = null;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        boolean zEquals = false;
        long j12 = -9223372036854775807L;
        c cVar = null;
        String strB = null;
        String strA = null;
        long j13 = 0;
        long j14 = 0;
        long j15 = 0;
        long j16 = 0;
        long j17 = -1;
        int i14 = 1;
        boolean z11 = false;
        int i15 = 0;
        int i16 = 0;
        boolean z12 = false;
        long j18 = -9223372036854775807L;
        while (fVar2.a()) {
            if (fVar2.a()) {
                str2 = fVar2.f29323c;
                fVar2.f29323c = str3;
            } else {
                str2 = str3;
            }
            if (str2.startsWith("#EXT-X-PLAYLIST-TYPE")) {
                String strB2 = b(str2, f29330g);
                if ("VOD".equals(strB2)) {
                    fVar2 = fVar;
                    str3 = null;
                    i11 = 1;
                } else if ("EVENT".equals(strB2)) {
                    fVar2 = fVar;
                    str3 = null;
                    i11 = 2;
                } else {
                    j11 = j18;
                }
            } else {
                if (str2.startsWith("#EXT-X-START")) {
                    j18 = (long) (Double.parseDouble(b(str2, f29333j)) * 1000000.0d);
                } else {
                    if (str2.startsWith("#EXT-X-MAP")) {
                        String strB3 = b(str2, n);
                        String strA2 = a(str2, f29335l);
                        if (strA2 != null) {
                            String[] strArrSplit = strA2.split("@");
                            j17 = Long.parseLong(strArrSplit[0]);
                            if (strArrSplit.length > 1) {
                                j14 = Long.parseLong(strArrSplit[1]);
                            }
                        }
                        c cVar2 = new c(strB3, 0L, -1, -9223372036854775807L, false, null, null, j14, j17);
                        fVar2 = fVar;
                        j14 = 0;
                        j17 = -1;
                        cVar = cVar2;
                    } else if (str2.startsWith("#EXT-X-TARGETDURATION")) {
                        j12 = 1000000 * Integer.parseInt(b(str2, f29328e));
                    } else if (str2.startsWith("#EXT-X-MEDIA-SEQUENCE")) {
                        i12 = Integer.parseInt(b(str2, f29331h));
                        fVar2 = fVar;
                        i16 = i12;
                    } else if (str2.startsWith("#EXT-X-VERSION")) {
                        i14 = Integer.parseInt(b(str2, f29329f));
                    } else if (str2.startsWith("#EXTINF")) {
                        fVar2 = fVar;
                        j15 = (long) (Double.parseDouble(b(str2, f29332i)) * 1000000.0d);
                    } else if (str2.startsWith("#EXT-X-KEY")) {
                        zEquals = "AES-128".equals(b(str2, f29336m));
                        if (zEquals) {
                            strB = b(str2, n);
                            strA = a(str2, o);
                        } else {
                            fVar2 = fVar;
                            str3 = null;
                            strB = null;
                            strA = null;
                        }
                    } else if (str2.startsWith("#EXT-X-BYTERANGE")) {
                        String[] strArrSplit2 = b(str2, f29334k).split("@");
                        j17 = Long.parseLong(strArrSplit2[0]);
                        if (strArrSplit2.length > 1) {
                            j14 = Long.parseLong(strArrSplit2[1]);
                        }
                    } else if (str2.startsWith("#EXT-X-DISCONTINUITY-SEQUENCE")) {
                        i15 = Integer.parseInt(str2.substring(str2.indexOf(58) + 1));
                        z11 = true;
                    } else if (str2.equals("#EXT-X-DISCONTINUITY")) {
                        i13++;
                    } else if (!str2.startsWith("#EXT-X-PROGRAM-DATE-TIME")) {
                        j11 = j18;
                        if (str2.startsWith("#EXT-X-DATERANGE")) {
                            arrayList2.add(str2);
                        } else if (str2.startsWith("#")) {
                            if (str2.equals("#EXT-X-ENDLIST")) {
                                fVar2 = fVar;
                                z12 = true;
                            }
                            j18 = j11;
                        } else {
                            String hexString = !zEquals ? null : strA != null ? strA : Integer.toHexString(i12);
                            int i17 = i12 + 1;
                            long j19 = j17 == -1 ? 0L : j14;
                            arrayList.add(new c(str2, j15, i13, j16, zEquals, strB, hexString, j19, j17));
                            j16 += j15;
                            if (j17 != -1) {
                                j19 += j17;
                            }
                            j14 = j19;
                            i12 = i17;
                            j15 = 0;
                            j17 = -1;
                            j18 = j11;
                            str3 = null;
                            fVar2 = fVar;
                        }
                    } else if (j13 == 0) {
                        String strSubstring = str2.substring(str2.indexOf(58) + 1);
                        Matcher matcher = z.f30494f.matcher(strSubstring);
                        if (!matcher.matches()) {
                            throw new r(b.c0.k("Invalid date/time format: ", strSubstring));
                        }
                        if (matcher.group(9) == null || matcher.group(9).equalsIgnoreCase("Z")) {
                            i5 = 0;
                        } else {
                            i5 = Integer.parseInt(matcher.group(13)) + (Integer.parseInt(matcher.group(12)) * 60);
                            if (matcher.group(11).equals(Identify.UNSET_VALUE)) {
                                i5 *= -1;
                            }
                        }
                        GregorianCalendar gregorianCalendar = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
                        gregorianCalendar.clear();
                        gregorianCalendar.set(Integer.parseInt(matcher.group(1)), Integer.parseInt(matcher.group(2)) - 1, Integer.parseInt(matcher.group(3)), Integer.parseInt(matcher.group(4)), Integer.parseInt(matcher.group(5)), Integer.parseInt(matcher.group(6)));
                        if (TextUtils.isEmpty(matcher.group(8))) {
                            j11 = j18;
                        } else {
                            j11 = j18;
                            gregorianCalendar.set(14, new BigDecimal("0." + matcher.group(8)).movePointRight(3).intValue());
                        }
                        long timeInMillis = gregorianCalendar.getTimeInMillis();
                        if (i5 != 0) {
                            timeInMillis -= i5 * 60000;
                        }
                        int i18 = com.fyber.inneractive.sdk.player.exoplayer2.b.f29095a;
                        j13 = (timeInMillis == -9223372036854775807L ? -9223372036854775807L : timeInMillis * 1000) - j16;
                    } else {
                        j11 = j18;
                    }
                    str3 = null;
                }
                fVar2 = fVar;
                str3 = null;
            }
            fVar2 = fVar;
            j18 = j11;
            str3 = null;
        }
        return new d(i11, str, j18, j13, z11, i15, i16, i14, j12, z12, j13 != 0, cVar, arrayList, arrayList2);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0041 A[Catch: all -> 0x002c, TryCatch #0 {all -> 0x002c, blocks: (B:3:0x000f, B:5:0x0017, B:7:0x001f, B:9:0x0027, B:36:0x006f, B:37:0x0076, B:14:0x0032, B:16:0x0038, B:20:0x0041, B:22:0x0049, B:25:0x0056, B:27:0x005c, B:31:0x0063, B:32:0x0068, B:38:0x0077, B:40:0x007d, B:43:0x0088, B:45:0x0090, B:46:0x00a1, B:48:0x00a9, B:50:0x00b1, B:52:0x00b9, B:54:0x00c1, B:56:0x00c9, B:58:0x00d1, B:60:0x00d9, B:63:0x00e2, B:64:0x00e6), top: B:71:0x000f }] */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0050 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final e a(Uri uri, com.fyber.inneractive.sdk.player.exoplayer2.upstream.j jVar) throws IOException {
        int i5;
        String strTrim;
        e eVarA;
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(jVar));
        LinkedList linkedList = new LinkedList();
        try {
            int i11 = bufferedReader.read();
            if (i11 != 239) {
                while (i11 != -1 && Character.isWhitespace(i11)) {
                    i11 = bufferedReader.read();
                }
                i5 = 0;
                while (true) {
                    if (i5 < 7) {
                        while (i11 != -1 && Character.isWhitespace(i11)) {
                            int i12 = z.f30489a;
                            if (i11 == 10 || i11 == 13) {
                                break;
                            }
                            i11 = bufferedReader.read();
                        }
                        int i13 = z.f30489a;
                        if (i11 != 10) {
                            if (i11 == 13) {
                            }
                        }
                        while (true) {
                            String line = bufferedReader.readLine();
                            if (line == null) {
                                z.a(bufferedReader);
                                throw new r("Failed to parse the playlist, could not identify any tags.");
                            }
                            strTrim = line.trim();
                            if (!strTrim.isEmpty()) {
                                if (!strTrim.startsWith("#EXT-X-STREAM-INF")) {
                                    if (strTrim.startsWith("#EXT-X-TARGETDURATION") || strTrim.startsWith("#EXT-X-MEDIA-SEQUENCE") || strTrim.startsWith("#EXTINF") || strTrim.startsWith("#EXT-X-KEY") || strTrim.startsWith("#EXT-X-BYTERANGE") || strTrim.equals("#EXT-X-DISCONTINUITY") || strTrim.equals("#EXT-X-DISCONTINUITY-SEQUENCE") || strTrim.equals("#EXT-X-ENDLIST")) {
                                        break;
                                    }
                                    linkedList.add(strTrim);
                                } else {
                                    linkedList.add(strTrim);
                                    eVarA = a(new f(linkedList, bufferedReader), uri.toString());
                                    break;
                                }
                            }
                        }
                        linkedList.add(strTrim);
                        eVarA = b(new f(linkedList, bufferedReader), uri.toString());
                        z.a(bufferedReader);
                        return eVarA;
                    }
                    if (i11 != "#EXTM3U".charAt(i5)) {
                        break;
                    }
                    i11 = bufferedReader.read();
                    i5++;
                }
            } else if (bufferedReader.read() == 187 && bufferedReader.read() == 191) {
                i11 = bufferedReader.read();
                while (i11 != -1) {
                    i11 = bufferedReader.read();
                }
                i5 = 0;
                while (true) {
                    if (i5 < 7) {
                    }
                    i11 = bufferedReader.read();
                    i5++;
                }
            }
            throw new a0("Input does not start with the #EXTM3U header.");
        } catch (Throwable th2) {
            z.a(bufferedReader);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:73:0x021d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static b a(f fVar, String str) throws r, NumberFormatException {
        String str2;
        int i5;
        String strA;
        String strB;
        String strA2;
        int i11;
        String str3;
        int i12;
        int i13;
        String str4;
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        o oVar = null;
        List arrayList4 = null;
        boolean zContains = false;
        while (fVar.a()) {
            if (fVar.a()) {
                str2 = fVar.f29323c;
                fVar.f29323c = null;
            } else {
                str2 = null;
            }
            if (str2.startsWith("#EXT-X-MEDIA")) {
                Matcher matcher = f29342u.matcher(str2);
                boolean zEquals = matcher.find() ? matcher.group(1).equals("YES") : 0;
                Matcher matcher2 = f29343v.matcher(str2);
                int i14 = zEquals | (matcher2.find() ? matcher2.group(1).equals("YES") : false ? 2 : 0);
                Matcher matcher3 = f29341t.matcher(str2);
                i5 = i14 | (matcher3.find() ? matcher3.group(1).equals("YES") : false ? 4 : 0);
                strA = a(str2, n);
                strB = b(str2, f29339r);
                strA2 = a(str2, f29338q);
                String strB2 = b(str2, f29337p);
                strB2.getClass();
                switch (strB2) {
                    case "SUBTITLES":
                        arrayList3.add(new a(strA, new o(strB, "application/x-mpegURL", "text/vtt", null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, i5, strA2, -1, Long.MAX_VALUE, null, null, null)));
                        break;
                    case "CLOSED-CAPTIONS":
                        String strB3 = b(str2, f29340s);
                        if (strB3.startsWith("CC")) {
                            i11 = Integer.parseInt(strB3.substring(2));
                            str3 = "application/cea-608";
                        } else {
                            i11 = Integer.parseInt(strB3.substring(7));
                            str3 = "application/cea-708";
                        }
                        int i15 = i11;
                        String str5 = str3;
                        if (arrayList4 == null) {
                            arrayList4 = new ArrayList();
                        }
                        arrayList4.add(new o(strB, null, str5, null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, i5, strA2, i15, Long.MAX_VALUE, null, null, null));
                        break;
                    case "AUDIO":
                        o oVar2 = new o(strB, "application/x-mpegURL", null, null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, i5, strA2, -1, Long.MAX_VALUE, null, null, null);
                        if (strA != null) {
                            arrayList2.add(new a(strA, oVar2));
                            break;
                        } else {
                            oVar = oVar2;
                            break;
                        }
                }
            } else if (str2.startsWith("#EXT-X-STREAM-INF")) {
                int i16 = Integer.parseInt(b(str2, f29325b));
                String strA3 = a(str2, f29324a);
                if (strA3 != null) {
                    i16 = Integer.parseInt(strA3);
                }
                int i17 = i16;
                String strA4 = a(str2, f29326c);
                String strA5 = a(str2, f29327d);
                zContains |= str2.contains("CLOSED-CAPTIONS=NONE");
                if (strA5 != null) {
                    String[] strArrSplit = strA5.split("x");
                    int i18 = Integer.parseInt(strArrSplit[0]);
                    int i19 = Integer.parseInt(strArrSplit[1]);
                    if (i18 <= 0 || i19 <= 0) {
                        i12 = -1;
                        i13 = -1;
                    } else {
                        i13 = i19;
                        i12 = i18;
                    }
                    if (fVar.a()) {
                        str4 = fVar.f29323c;
                        fVar.f29323c = null;
                    } else {
                        str4 = null;
                    }
                    if (hashSet.add(str4)) {
                        arrayList.add(new a(str4, new o(Integer.toString(arrayList.size()), "application/x-mpegURL", null, strA4, i17, -1, i12, i13, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, null, -1, Long.MAX_VALUE, null, null, null)));
                    }
                }
            }
        }
        if (zContains) {
            arrayList4 = Collections.EMPTY_LIST;
        }
        return new b(str, arrayList, arrayList2, arrayList3, oVar, arrayList4);
    }

    public static String b(String str, Pattern pattern) throws r {
        Matcher matcher = pattern.matcher(str);
        if (matcher.find() && matcher.groupCount() == 1) {
            return matcher.group(1);
        }
        throw new r("Couldn't match " + pattern.pattern() + " in " + str);
    }

    public static String a(String str, Pattern pattern) {
        Matcher matcher = pattern.matcher(str);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }
}
