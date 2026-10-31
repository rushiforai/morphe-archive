package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import android.util.Log;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final int f29578a = z.a("nam");

    /* renamed from: b, reason: collision with root package name */
    public static final int f29579b = z.a("trk");

    /* renamed from: c, reason: collision with root package name */
    public static final int f29580c = z.a("cmt");

    /* renamed from: d, reason: collision with root package name */
    public static final int f29581d = z.a("day");

    /* renamed from: e, reason: collision with root package name */
    public static final int f29582e = z.a("ART");

    /* renamed from: f, reason: collision with root package name */
    public static final int f29583f = z.a("too");

    /* renamed from: g, reason: collision with root package name */
    public static final int f29584g = z.a("alb");

    /* renamed from: h, reason: collision with root package name */
    public static final int f29585h = z.a("com");

    /* renamed from: i, reason: collision with root package name */
    public static final int f29586i = z.a("wrt");

    /* renamed from: j, reason: collision with root package name */
    public static final int f29587j = z.a("lyr");

    /* renamed from: k, reason: collision with root package name */
    public static final int f29588k = z.a("gen");

    /* renamed from: l, reason: collision with root package name */
    public static final int f29589l = z.a("covr");

    /* renamed from: m, reason: collision with root package name */
    public static final int f29590m = z.a("gnre");
    public static final int n = z.a("grp");
    public static final int o = z.a("disk");

    /* renamed from: p, reason: collision with root package name */
    public static final int f29591p = z.a("trkn");

    /* renamed from: q, reason: collision with root package name */
    public static final int f29592q = z.a("tmpo");

    /* renamed from: r, reason: collision with root package name */
    public static final int f29593r = z.a("cpil");

    /* renamed from: s, reason: collision with root package name */
    public static final int f29594s = z.a("aART");

    /* renamed from: t, reason: collision with root package name */
    public static final int f29595t = z.a("sonm");

    /* renamed from: u, reason: collision with root package name */
    public static final int f29596u = z.a("soal");

    /* renamed from: v, reason: collision with root package name */
    public static final int f29597v = z.a("soar");

    /* renamed from: w, reason: collision with root package name */
    public static final int f29598w = z.a("soaa");

    /* renamed from: x, reason: collision with root package name */
    public static final int f29599x = z.a("soco");

    /* renamed from: y, reason: collision with root package name */
    public static final int f29600y = z.a("rtng");

    /* renamed from: z, reason: collision with root package name */
    public static final int f29601z = z.a("pgap");
    public static final int A = z.a("sosn");
    public static final int B = z.a("tvsh");
    public static final int C = z.a("----");
    public static final String[] D = {"Blues", "Classic Rock", "Country", "Dance", "Disco", "Funk", "Grunge", "Hip-Hop", "Jazz", "Metal", "New Age", "Oldies", "Other", "Pop", "R&B", "Rap", "Reggae", "Rock", "Techno", "Industrial", "Alternative", "Ska", "Death Metal", "Pranks", "Soundtrack", "Euro-Techno", "Ambient", "Trip-Hop", "Vocal", "Jazz+Funk", "Fusion", "Trance", "Classical", "Instrumental", "Acid", "House", "Game", "Sound Clip", "Gospel", "Noise", "AlternRock", "Bass", "Soul", "Punk", "Space", "Meditative", "Instrumental Pop", "Instrumental Rock", "Ethnic", "Gothic", "Darkwave", "Techno-Industrial", "Electronic", "Pop-Folk", "Eurodance", "Dream", "Southern Rock", "Comedy", "Cult", "Gangsta", "Top 40", "Christian Rap", "Pop/Funk", "Jungle", "Native American", "Cabaret", "New Wave", "Psychadelic", "Rave", "Showtunes", "Trailer", "Lo-Fi", "Tribal", "Acid Punk", "Acid Jazz", "Polka", "Retro", "Musical", "Rock & Roll", "Hard Rock", "Folk", "Folk-Rock", "National Folk", "Swing", "Fast Fusion", "Bebob", "Latin", "Revival", "Celtic", "Bluegrass", "Avantgarde", "Gothic Rock", "Progressive Rock", "Psychedelic Rock", "Symphonic Rock", "Slow Rock", "Big Band", "Chorus", "Easy Listening", "Acoustic", "Humour", "Speech", "Chanson", "Opera", "Chamber Music", "Sonata", "Symphony", "Booty Bass", "Primus", "Porn Groove", "Satire", "Slow Jam", "Club", "Tango", "Samba", "Folklore", "Ballad", "Power Ballad", "Rhythmic Soul", "Freestyle", "Duet", "Punk Rock", "Drum Solo", "A capella", "Euro-House", "Dance Hall", "Goa", "Drum & Bass", "Club-House", "Hardcore", "Terror", "Indie", "BritPop", "Negerpunk", "Polsk Punk", "Beat", "Christian Gangsta Rap", "Heavy Metal", "Black Metal", "Crossover", "Contemporary Christian", "Christian Rock", "Merengue", "Salsa", "Thrash Metal", "Anime", "Jpop", "Synthpop"};

    public static com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o a(int i5, String str, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, boolean z11, boolean z12) {
        int iMin;
        nVar.e(nVar.f30462b + 4);
        if (nVar.b() == c.F0) {
            nVar.e(nVar.f30462b + 8);
            iMin = nVar.j();
        } else {
            Log.w("MetadataUtil", "Failed to parse uint8 attribute value");
            iMin = -1;
        }
        if (z12) {
            iMin = Math.min(1, iMin);
        }
        if (iMin >= 0) {
            return z11 ? new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.s(str, null, Integer.toString(iMin)) : new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j("und", str, Integer.toString(iMin));
        }
        Log.w("MetadataUtil", "Failed to parse uint8 attribute: " + c.a(i5));
        return null;
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j b(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        String strA = null;
        String strA2 = null;
        int i11 = -1;
        int i12 = -1;
        while (true) {
            int i13 = nVar.f30462b;
            if (i13 >= i5) {
                break;
            }
            int iB = nVar.b();
            int iB2 = nVar.b();
            nVar.e(nVar.f30462b + 4);
            if (iB2 == c.D0) {
                strA = nVar.a(iB - 12);
            } else if (iB2 == c.E0) {
                strA2 = nVar.a(iB - 12);
            } else {
                if (iB2 == c.F0) {
                    i11 = i13;
                    i12 = iB;
                }
                nVar.e(nVar.f30462b + (iB - 12));
            }
        }
        if (!"com.apple.iTunes".equals(strA) || !"iTunSMPB".equals(strA2) || i11 == -1) {
            return null;
        }
        nVar.e(i11);
        nVar.e(nVar.f30462b + 16);
        return new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j("und", strA2, nVar.a(i12 - 16));
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int iB = nVar.b();
        if (nVar.b() == c.F0) {
            nVar.e(nVar.f30462b + 8);
            String strA = nVar.a(iB - 16);
            return new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j("und", strA, strA);
        }
        Log.w("MetadataUtil", "Failed to parse comment attribute: " + c.a(i5));
        return null;
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.s b(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, String str) {
        int iB = nVar.b();
        if (nVar.b() == c.F0) {
            nVar.e(nVar.f30462b + 8);
            return new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.s(str, null, nVar.a(iB - 16));
        }
        Log.w("MetadataUtil", "Failed to parse text attribute: " + c.a(i5));
        return null;
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.s a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, String str) {
        int iB = nVar.b();
        if (nVar.b() == c.F0 && iB >= 22) {
            nVar.e(nVar.f30462b + 10);
            int iO = nVar.o();
            if (iO > 0) {
                String strA = com.fyber.inneractive.sdk.player.exoplayer2.m.a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, iO);
                int iO2 = nVar.o();
                if (iO2 > 0) {
                    strA = strA + "/" + iO2;
                }
                return new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.s(str, null, strA);
            }
        }
        Log.w("MetadataUtil", "Failed to parse index/count attribute: " + c.a(i5));
        return null;
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.b a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        String str;
        int iB = nVar.b();
        if (nVar.b() == c.F0) {
            int iB2 = nVar.b() & 16777215;
            if (iB2 == 13) {
                str = "image/jpeg";
            } else {
                str = iB2 == 14 ? "image/png" : null;
            }
            if (str == null) {
                Log.w("MetadataUtil", "Unrecognized cover art flags: " + iB2);
                return null;
            }
            nVar.e(nVar.f30462b + 4);
            int i5 = iB - 16;
            byte[] bArr = new byte[i5];
            nVar.a(bArr, 0, i5);
            return new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.b(str, null, 3, bArr);
        }
        Log.w("MetadataUtil", "Failed to parse cover art attribute");
        return null;
    }
}
