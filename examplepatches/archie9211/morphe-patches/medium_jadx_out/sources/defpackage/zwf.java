package defpackage;

import android.text.TextUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zwf implements jx3, vnf {
    public static final zwf c;
    public static final zwf d;
    public static final zwf e;
    public static final zwf f;
    public static final zwf g;
    public static final zwf h;
    public static final zwf i;
    public static final zwf j;
    public static final zwf k;
    public static final zwf l;
    public static final zwf m;
    public static final zwf n;
    public static final zwf o;
    public static final zwf p;
    public static final zwf q;
    public static final zwf r;
    public static final zwf s;
    public final /* synthetic */ int a;
    public String b;

    static {
        int i2 = 0;
        c = new zwf("ENABLED", i2);
        d = new zwf("DISABLED", i2);
        e = new zwf("DESTROYED", i2);
        int i3 = 1;
        f = new zwf("ASSUME_AES_GCM", i3);
        g = new zwf("ASSUME_XCHACHA20POLY1305", i3);
        h = new zwf("ASSUME_CHACHA20POLY1305", i3);
        i = new zwf("ASSUME_AES_CTR_HMAC", i3);
        j = new zwf("ASSUME_AES_EAX", i3);
        k = new zwf("ASSUME_AES_GCM_SIV", i3);
        int i4 = 2;
        l = new zwf("TINK", i4);
        m = new zwf("CRUNCHY", i4);
        n = new zwf("LEGACY", i4);
        o = new zwf("NO_PREFIX", i4);
        int i5 = 3;
        p = new zwf("TINK", i5);
        q = new zwf("CRUNCHY", i5);
        r = new zwf("LEGACY", i5);
        s = new zwf("NO_PREFIX", i5);
    }

    public /* synthetic */ zwf(String str, int i2) {
        this.a = i2;
        this.b = str;
    }

    @Override // defpackage.jx3
    public boolean i(CharSequence charSequence, int i2, int i3, byd bydVar) {
        if (!TextUtils.equals(charSequence.subSequence(i2, i3), this.b)) {
            return true;
        }
        bydVar.c = (bydVar.c & 3) | 4;
        return false;
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return this.b;
            case 1:
                return this.b;
            case 2:
                return this.b;
            case 3:
                return this.b;
            default:
                return super.toString();
        }
    }

    @Override // defpackage.vnf
    public String zza() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("idToken", this.b);
        return jSONObject.toString();
    }

    @Override // defpackage.jx3
    public Object d() {
        return this;
    }
}
