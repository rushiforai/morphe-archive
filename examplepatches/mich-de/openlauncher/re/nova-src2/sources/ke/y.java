package ke;

import android.util.Base64;
import com.google.android.exoplayer2.ParserException;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.flac.PictureFrame;
import com.google.android.exoplayer2.metadata.vorbis.VorbisComment;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class y {
    public static Metadata a(List list) {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < list.size(); i5++) {
            String str = (String) list.get(i5);
            int i11 = wf.v.f94376a;
            String[] strArrSplit = str.split("=", 2);
            if (strArrSplit.length != 2) {
                wf.a.D("VorbisUtil", "Failed to parse Vorbis comment: ".concat(str));
            } else if (strArrSplit[0].equals("METADATA_BLOCK_PICTURE")) {
                try {
                    arrayList.add(PictureFrame.a(new com.google.android.gms.internal.consent_sdk.a(Base64.decode(strArrSplit[1], 0))));
                } catch (RuntimeException e3) {
                    wf.a.E("VorbisUtil", "Failed to parse vorbis picture", e3);
                }
            } else {
                arrayList.add(new VorbisComment(strArrSplit[0], strArrSplit[1]));
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        return new Metadata(arrayList);
    }

    public static je.f b(com.google.android.gms.internal.consent_sdk.a aVar, boolean z11, boolean z12) throws ParserException {
        if (z11) {
            c(3, aVar, false);
        }
        aVar.L((int) aVar.E(), vk.e.f92809c);
        long jE = aVar.E();
        String[] strArr = new String[(int) jE];
        for (int i5 = 0; i5 < jE; i5++) {
            strArr[i5] = aVar.L((int) aVar.E(), vk.e.f92809c);
        }
        if (z12 && (aVar.N() & 1) == 0) {
            throw ParserException.a("framing bit expected to be set", null);
        }
        return new je.f(strArr, 8);
    }

    public static boolean c(int i5, com.google.android.gms.internal.consent_sdk.a aVar, boolean z11) throws ParserException {
        if (aVar.g() < 7) {
            if (z11) {
                return false;
            }
            throw ParserException.a("too short header: " + aVar.g(), null);
        }
        if (aVar.N() != i5) {
            if (z11) {
                return false;
            }
            throw ParserException.a("expected header type " + Integer.toHexString(i5), null);
        }
        if (aVar.N() == 118 && aVar.N() == 111 && aVar.N() == 114 && aVar.N() == 98 && aVar.N() == 105 && aVar.N() == 115) {
            return true;
        }
        if (z11) {
            return false;
        }
        throw ParserException.a("expected characters 'vorbis'", null);
    }
}
