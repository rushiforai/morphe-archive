package pm;

import android.util.Base64;
import android.util.Log;
import dm.d;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import ul.g;
import ul.i;
import v70.o;
import y5.f;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    public static final f f82672c = o.m("|S||P|");

    /* renamed from: d, reason: collision with root package name */
    public static final f f82673d = o.m("|S|id");

    /* renamed from: e, reason: collision with root package name */
    public static final String[] f82674e = {"*", "FCM", "GCM", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b};

    /* renamed from: a, reason: collision with root package name */
    public final d f82675a;

    /* renamed from: b, reason: collision with root package name */
    public final String f82676b;

    /* JADX WARN: Removed duplicated region for block: B:12:0x003c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public c(g gVar) {
        gVar.a();
        this.f82675a = new d(gVar.f91320a, "com.google.android.gms.appid");
        gVar.a();
        i iVar = gVar.f91322c;
        String str = iVar.f91339e;
        if (str == null) {
            gVar.a();
            str = iVar.f91336b;
            if (str.startsWith("1:") || str.startsWith("2:")) {
                String[] strArrSplit = str.split(":");
                if (strArrSplit.length != 4) {
                    str = null;
                } else {
                    str = strArrSplit[1];
                    if (str.isEmpty()) {
                    }
                }
            }
        }
        this.f82676b = str;
    }

    public final String a() throws InvalidKeySpecException {
        PublicKey publicKeyGeneratePublic;
        d dVar = this.f82675a;
        String str = (String) dVar.c(f82673d, null);
        if (str != null) {
            return str;
        }
        String str2 = (String) dVar.c(f82672c, null);
        if (str2 == null) {
            return null;
        }
        try {
            publicKeyGeneratePublic = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(Base64.decode(str2, 8)));
        } catch (IllegalArgumentException | NoSuchAlgorithmException | InvalidKeySpecException e3) {
            Log.w("ContentValues", "Invalid key stored " + e3);
            publicKeyGeneratePublic = null;
        }
        if (publicKeyGeneratePublic == null) {
            return null;
        }
        try {
            byte[] bArrDigest = MessageDigest.getInstance("SHA1").digest(publicKeyGeneratePublic.getEncoded());
            bArrDigest[0] = (byte) (((bArrDigest[0] & 15) + 112) & 255);
            return Base64.encodeToString(bArrDigest, 0, 8, 11);
        } catch (NoSuchAlgorithmException unused) {
            Log.w("ContentValues", "Unexpected error, device missing required algorithms");
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x003b, code lost:
    
        if (r4.startsWith("{") == false) goto L13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0048, code lost:
    
        return new org.json.JSONObject(r4).getString("token");
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0049, code lost:
    
        return r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x004d, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String b() {
        String[] strArr = f82674e;
        int length = strArr.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            String str = (String) this.f82675a.c(o.m("|T|" + this.f82676b + "|" + strArr[i5]), null);
            if (str != null && !str.isEmpty()) {
                break;
            }
            i5++;
        }
    }
}
