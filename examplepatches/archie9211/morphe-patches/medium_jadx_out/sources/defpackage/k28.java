package defpackage;

import android.os.Bundle;
import android.text.TextUtils;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class k28 {
    public static final k28 a = new k28();
    public static final ConcurrentHashMap b = new ConcurrentHashMap();
    public static final List c = d46.R("other", "fb_mobile_complete_registration", "fb_mobile_add_to_cart", "fb_mobile_purchase", "fb_mobile_initiated_checkout");
    public static final List d = d46.R("none", "address", "health");

    public static final File d(h28 h28Var) {
        if (!ec2.a.contains(k28.class)) {
            try {
                h28Var.getClass();
                i28 i28Var = (i28) b.get(h28Var.toUseCase());
                if (i28Var != null) {
                    return i28Var.f;
                }
            } catch (Throwable th) {
                ec2.a(k28.class, th);
                return null;
            }
        }
        return null;
    }

    public static final String[] f(h28 h28Var, float[][] fArr, String[] strArr) {
        f28 f28Var;
        if (!ec2.a.contains(k28.class)) {
            try {
                h28Var.getClass();
                i28 i28Var = (i28) b.get(h28Var.toUseCase());
                if (i28Var != null && (f28Var = i28Var.g) != null) {
                    float[] fArr2 = i28Var.e;
                    int length = strArr.length;
                    int length2 = fArr[0].length;
                    dd7 dd7Var = new dd7(new int[]{length, length2});
                    for (int i = 0; i < length; i++) {
                        System.arraycopy(fArr[i], 0, dd7Var.c, i * length2, length2);
                    }
                    dd7 dd7VarA = f28Var.a(dd7Var, strArr, h28Var.toKey());
                    if (dd7VarA != null && fArr2 != null && dd7VarA.c.length != 0 && fArr2.length != 0) {
                        int i2 = j28.a[h28Var.ordinal()];
                        k28 k28Var = a;
                        if (i2 == 1) {
                            return k28Var.h(dd7VarA, fArr2);
                        }
                        if (i2 == 2) {
                            return k28Var.g(dd7VarA, fArr2);
                        }
                        throw new NoWhenBranchMatchedException();
                    }
                }
            } catch (Throwable th) {
                ec2.a(k28.class, th);
                return null;
            }
        }
        return null;
    }

    public final void a(JSONObject jSONObject) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                try {
                    i28 i28VarK = qq7.k(jSONObject.getJSONObject(itKeys.next()));
                    if (i28VarK != null) {
                        b.put(i28VarK.a, i28VarK);
                    }
                } catch (JSONException unused) {
                    return;
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0082 A[Catch: all -> 0x008f, TryCatch #2 {all -> 0x008f, blocks: (B:5:0x000a, B:6:0x001d, B:8:0x0023, B:10:0x0042, B:12:0x0052, B:24:0x0082, B:23:0x007e, B:27:0x0091, B:29:0x009d, B:31:0x00ad, B:34:0x00bf, B:36:0x00c5, B:15:0x005b, B:19:0x006d), top: B:42:0x000a, inners: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b() {
        /*
            Method dump skipped, instruction units count: 214
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k28.b():void");
    }

    public final JSONObject c() {
        if (!ec2.a.contains(this)) {
            try {
                Bundle bundle = new Bundle();
                bundle.putString("fields", TextUtils.join(",", new String[]{"use_case", "version_id", "asset_uri", "rules_uri", "thresholds"}));
                String str = ff5.j;
                ff5 ff5VarG0 = xz5.g0(null, "app/model_asset", null);
                ff5VarG0.d = bundle;
                JSONObject jSONObject = ff5VarG0.c().b;
                if (jSONObject != null) {
                    return e(jSONObject);
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final String[] g(dd7 dd7Var, float[] fArr) {
        if (!ec2.a.contains(this)) {
            try {
                int[] iArr = dd7Var.a;
                int i = iArr[0];
                int i2 = iArr[1];
                float[] fArr2 = dd7Var.c;
                if (i2 == fArr.length) {
                    n46 n46VarW = iq7.W(0, i);
                    ArrayList arrayList = new ArrayList(cu1.k0(n46VarW, 10));
                    Iterator it2 = n46VarW.iterator();
                    while (((m46) it2).c) {
                        int iNextInt = ((g46) it2).nextInt();
                        Object obj = "none";
                        int length = fArr.length;
                        int i3 = 0;
                        int i4 = 0;
                        while (i3 < length) {
                            int i5 = i4 + 1;
                            if (fArr2[(iNextInt * i2) + i4] >= fArr[i3]) {
                                obj = d.get(i4);
                            }
                            i3++;
                            i4 = i5;
                        }
                        arrayList.add((String) obj);
                    }
                    return (String[]) arrayList.toArray(new String[0]);
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final String[] h(dd7 dd7Var, float[] fArr) {
        if (!ec2.a.contains(this)) {
            try {
                int[] iArr = dd7Var.a;
                int i = iArr[0];
                int i2 = iArr[1];
                float[] fArr2 = dd7Var.c;
                if (i2 == fArr.length) {
                    n46 n46VarW = iq7.W(0, i);
                    ArrayList arrayList = new ArrayList(cu1.k0(n46VarW, 10));
                    Iterator it2 = n46VarW.iterator();
                    while (((m46) it2).c) {
                        int iNextInt = ((g46) it2).nextInt();
                        Object obj = "other";
                        int length = fArr.length;
                        int i3 = 0;
                        int i4 = 0;
                        while (i3 < length) {
                            int i5 = i4 + 1;
                            if (fArr2[(iNextInt * i2) + i4] >= fArr[i3]) {
                                obj = c.get(i4);
                            }
                            i3++;
                            i4 = i5;
                        }
                        arrayList.add((String) obj);
                    }
                    return (String[]) arrayList.toArray(new String[0]);
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final JSONObject e(JSONObject jSONObject) {
        String str = kSWQKWZ.YzTZLgdvIntWA;
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            JSONObject jSONObject2 = new JSONObject();
            try {
                JSONArray jSONArray = jSONObject.getJSONArray("data");
                int length = jSONArray.length();
                for (int i = 0; i < length; i++) {
                    JSONObject jSONObject3 = jSONArray.getJSONObject(i);
                    JSONObject jSONObject4 = new JSONObject();
                    jSONObject4.put("version_id", jSONObject3.getString("version_id"));
                    jSONObject4.put("use_case", jSONObject3.getString("use_case"));
                    jSONObject4.put(str, jSONObject3.getJSONArray(str));
                    jSONObject4.put("asset_uri", jSONObject3.getString("asset_uri"));
                    if (jSONObject3.has("rules_uri")) {
                        jSONObject4.put("rules_uri", jSONObject3.getString("rules_uri"));
                    }
                    jSONObject2.put(jSONObject3.getString("use_case"), jSONObject4);
                }
                return jSONObject2;
            } catch (JSONException unused) {
                return new JSONObject();
            }
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }
}
