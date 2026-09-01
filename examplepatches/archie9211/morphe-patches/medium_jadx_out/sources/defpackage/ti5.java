package defpackage;

import android.util.Log;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ti5 {
    public static final String a = aj2.class.getSimpleName();
    public static final MessageDigest b;

    static {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            String str = a;
            if (Log.isLoggable(str, 3)) {
                Log.d(str, "Error while instantiating messageDigest", e);
            }
            messageDigest = null;
        }
        b = messageDigest;
    }
}
