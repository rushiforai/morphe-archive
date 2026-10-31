package se;

import b.c0;
import com.google.android.exoplayer2.metadata.id3.ApicFrame;
import com.google.android.exoplayer2.metadata.id3.CommentFrame;
import com.google.android.exoplayer2.metadata.id3.Id3Frame;
import com.google.android.exoplayer2.metadata.id3.TextInformationFrame;
import com.google.android.gms.internal.measurement.k2;

/* loaded from: classes3.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f87293a = {"Blues", "Classic Rock", "Country", "Dance", "Disco", "Funk", "Grunge", "Hip-Hop", "Jazz", "Metal", "New Age", "Oldies", "Other", "Pop", "R&B", "Rap", "Reggae", "Rock", "Techno", "Industrial", "Alternative", "Ska", "Death Metal", "Pranks", "Soundtrack", "Euro-Techno", "Ambient", "Trip-Hop", "Vocal", "Jazz+Funk", "Fusion", "Trance", "Classical", "Instrumental", "Acid", "House", "Game", "Sound Clip", "Gospel", "Noise", "AlternRock", "Bass", "Soul", "Punk", "Space", "Meditative", "Instrumental Pop", "Instrumental Rock", "Ethnic", "Gothic", "Darkwave", "Techno-Industrial", "Electronic", "Pop-Folk", "Eurodance", "Dream", "Southern Rock", "Comedy", "Cult", "Gangsta", "Top 40", "Christian Rap", "Pop/Funk", "Jungle", "Native American", "Cabaret", "New Wave", "Psychadelic", "Rave", "Showtunes", "Trailer", "Lo-Fi", "Tribal", "Acid Punk", "Acid Jazz", "Polka", "Retro", "Musical", "Rock & Roll", "Hard Rock", "Folk", "Folk-Rock", "National Folk", "Swing", "Fast Fusion", "Bebob", "Latin", "Revival", "Celtic", "Bluegrass", "Avantgarde", "Gothic Rock", "Progressive Rock", "Psychedelic Rock", "Symphonic Rock", "Slow Rock", "Big Band", "Chorus", "Easy Listening", "Acoustic", "Humour", "Speech", "Chanson", "Opera", "Chamber Music", "Sonata", "Symphony", "Booty Bass", "Primus", "Porn Groove", "Satire", "Slow Jam", "Club", "Tango", "Samba", "Folklore", "Ballad", "Power Ballad", "Rhythmic Soul", "Freestyle", "Duet", "Punk Rock", "Drum Solo", "A capella", "Euro-House", "Dance Hall", "Goa", "Drum & Bass", "Club-House", "Hardcore", "Terror", "Indie", "BritPop", "Afro-Punk", "Polsk Punk", "Beat", "Christian Gangsta Rap", "Heavy Metal", "Black Metal", "Crossover", "Contemporary Christian", "Christian Rock", "Merengue", "Salsa", "Thrash Metal", "Anime", "Jpop", "Synthpop", "Abstract", "Art Rock", "Baroque", "Bhangra", "Big beat", "Breakbeat", "Chillout", "Downtempo", "Dub", "EBM", "Eclectic", "Electro", "Electroclash", "Emo", "Experimental", "Garage", "Global", "IDM", "Illbient", "Industro-Goth", "Jam Band", "Krautrock", "Leftfield", "Lounge", "Math Rock", "New Romantic", "Nu-Breakz", "Post-Punk", "Post-Rock", "Psytrance", "Shoegaze", "Space Rock", "Trop Rock", "World Music", "Neoclassical", "Audiobook", "Audio theatre", "Neue Deutsche Welle", "Podcast", "Indie-Rock", "G-Funk", "Dubstep", "Garage Rock", "Psybient"};

    public static CommentFrame a(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        int iA = aVar.A();
        if (aVar.A() == 1684108385) {
            aVar.Z(8);
            String strJ = aVar.J(iA - 16);
            return new CommentFrame("und", strJ, strJ);
        }
        wf.a.D("MetadataUtil", "Failed to parse comment attribute: " + ie.a.c(i5));
        return null;
    }

    public static ApicFrame b(com.google.android.gms.internal.consent_sdk.a aVar) {
        int iA = aVar.A();
        if (aVar.A() != 1684108385) {
            wf.a.D("MetadataUtil", "Failed to parse cover art attribute");
            return null;
        }
        int iA2 = aVar.A() & 16777215;
        String str = iA2 == 13 ? "image/jpeg" : iA2 == 14 ? "image/png" : null;
        if (str == null) {
            k2.t(iA2, "Unrecognized cover art flags: ", "MetadataUtil");
            return null;
        }
        aVar.Z(4);
        int i5 = iA - 16;
        byte[] bArr = new byte[i5];
        aVar.z(0, i5, bArr);
        return new ApicFrame(str, null, 3, bArr);
    }

    public static TextInformationFrame c(int i5, com.google.android.gms.internal.consent_sdk.a aVar, String str) {
        int iA = aVar.A();
        if (aVar.A() == 1684108385 && iA >= 22) {
            aVar.Z(10);
            int iS = aVar.S();
            if (iS > 0) {
                String strH = c0.h(iS, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                int iS2 = aVar.S();
                if (iS2 > 0) {
                    strH = strH + "/" + iS2;
                }
                return new TextInformationFrame(str, null, strH);
            }
        }
        wf.a.D("MetadataUtil", "Failed to parse index/count attribute: " + ie.a.c(i5));
        return null;
    }

    public static TextInformationFrame d(int i5, com.google.android.gms.internal.consent_sdk.a aVar, String str) {
        int iA = aVar.A();
        if (aVar.A() == 1684108385) {
            aVar.Z(8);
            return new TextInformationFrame(str, null, aVar.J(iA - 16));
        }
        wf.a.D("MetadataUtil", "Failed to parse text attribute: " + ie.a.c(i5));
        return null;
    }

    public static Id3Frame e(int i5, String str, com.google.android.gms.internal.consent_sdk.a aVar, boolean z11, boolean z12) {
        int iF = f(aVar);
        if (z12) {
            iF = Math.min(1, iF);
        }
        if (iF >= 0) {
            return z11 ? new TextInformationFrame(str, null, Integer.toString(iF)) : new CommentFrame("und", str, Integer.toString(iF));
        }
        wf.a.D("MetadataUtil", "Failed to parse uint8 attribute: " + ie.a.c(i5));
        return null;
    }

    public static int f(com.google.android.gms.internal.consent_sdk.a aVar) {
        aVar.Z(4);
        if (aVar.A() == 1684108385) {
            aVar.Z(8);
            return aVar.N();
        }
        wf.a.D("MetadataUtil", "Failed to parse uint8 attribute value");
        return -1;
    }
}
