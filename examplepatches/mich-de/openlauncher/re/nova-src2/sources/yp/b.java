package yp;

import android.app.Activity;
import com.spotify.sdk.android.auth.AuthorizationRequest;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f97398b = {".debug", ".canary", ".partners", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b};

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f97399c = {"25a9b2d2745c098361edaa3b87936dc29a28e7f1", "80abdd17dcc4cb3a33815d354355bf87c9378624", "88df4d670ed5e01fc7b3eff13b63258628ff5a00", "d834ae340d1e854c5f4092722f9788216d9221e5", "1cbedd9e7345f64649bad2b493a20d9eea955352", "4b3d76a2de89033ea830f476a1f815692938e33b"};

    /* renamed from: d, reason: collision with root package name */
    public static final char[] f97400d = "0123456789abcdef".toCharArray();

    /* renamed from: a, reason: collision with root package name */
    public final Activity f97401a;

    public b(Activity activity, AuthorizationRequest authorizationRequest) {
        this.f97401a = activity;
    }

    public static String a(byte[] bArr) {
        char[] cArr = new char[bArr.length * 2];
        for (int i5 = 0; i5 < bArr.length; i5++) {
            byte b11 = bArr[i5];
            int i11 = i5 * 2;
            char[] cArr2 = f97400d;
            cArr[i11] = cArr2[(b11 & 255) >>> 4];
            cArr[i11 + 1] = cArr2[b11 & 15];
        }
        return new String(cArr);
    }
}
