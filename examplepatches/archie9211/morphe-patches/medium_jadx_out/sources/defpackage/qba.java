package defpackage;

import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qba {
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static rba a(String str) {
        String lowerCase = str.toLowerCase(Locale.ROOT);
        lowerCase.getClass();
        switch (lowerCase.hashCode()) {
            case -1109880953:
                if (lowerCase.equals("latest")) {
                    return rba.LATEST;
                }
                return null;
            case -809579181:
                if (lowerCase.equals("earliest")) {
                    return rba.EARLIEST;
                }
                return null;
            case -427602442:
                if (!lowerCase.equals("mostpopular")) {
                    return null;
                }
                break;
            case -393940263:
                if (!lowerCase.equals("popular")) {
                    return null;
                }
                break;
            case -320414065:
                if (!lowerCase.equals("most-popular")) {
                    return null;
                }
                break;
            default:
                return null;
        }
        return rba.MOST_POPULAR;
    }
}
