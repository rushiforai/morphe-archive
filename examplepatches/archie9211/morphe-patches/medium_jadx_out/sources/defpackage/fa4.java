package defpackage;

import android.util.Patterns;
import java.io.File;
import java.io.FileInputStream;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class fa4 implements q14, ndf, c8, g70, a21, hb2, v0d, iwa, pg4, qu2, nn6, k9f, lre, thg {
    public static Map c;
    public static Map d;
    public static Map e;
    public static JSONObject f;
    public static boolean g;
    public static gg5 l;
    public static final fa4 r;
    public static final fa4 s;
    public static fa4 t;
    public final /* synthetic */ int a;
    public static final fa4 b = new fa4(0);
    public static final fa4 h = new fa4(1);
    public static final fa4 i = new fa4(2);
    public static final fa4 j = new fa4(3);
    public static final fa4 k = new fa4(4);
    public static final fa4 m = new fa4(5);
    public static final fa4 n = new fa4(6);
    public static final fa4 o = new fa4(7);
    public static final fa4 p = new fa4(8);
    public static final fa4 q = new fa4(9);

    static {
        int i2 = 10;
        r = new fa4(i2);
        s = new fa4(i2);
    }

    public /* synthetic */ fa4(int i2) {
        this.a = i2;
    }

    public static final void B(File file) {
        if (ec2.a.contains(fa4.class)) {
            return;
        }
        try {
            try {
                f = new JSONObject();
                FileInputStream fileInputStream = new FileInputStream(file);
                byte[] bArr = new byte[fileInputStream.available()];
                fileInputStream.read(bArr);
                fileInputStream.close();
                f = new JSONObject(new String(bArr, wk1.a));
                c = ei7.Q(new f09("ENGLISH", "1"), new f09("GERMAN", "2"), new f09("SPANISH", "3"), new f09("JAPANESE", "4"));
                d = ei7.Q(new f09("VIEW_CONTENT", "0"), new f09("SEARCH", "1"), new f09("ADD_TO_CART", "2"), new f09("ADD_TO_WISHLIST", "3"), new f09("INITIATE_CHECKOUT", "4"), new f09("ADD_PAYMENT_INFO", "5"), new f09("PURCHASE", "6"), new f09("LEAD", "7"), new f09("COMPLETE_REGISTRATION", "8"));
                e = ei7.Q(new f09("BUTTON_TEXT", "1"), new f09("PAGE_TITLE", "2"), new f09("RESOLVED_DOCUMENT_LINK", "3"), new f09("BUTTON_ID", "4"));
                g = true;
            } catch (Throwable th) {
                ec2.a(fa4.class, th);
            }
        } catch (Exception unused) {
        }
    }

    public static String C(sw5 sw5Var, cfc cfcVar) {
        sw5Var.getClass();
        cfcVar.getClass();
        StringBuilder sb = new StringBuilder(b09.y(sw5Var.getId(), "-", K(cfcVar)));
        Double focusPercentX = sw5Var.getFocusPercentX();
        if (focusPercentX != null) {
            sb.append("-" + focusPercentX.doubleValue());
        }
        Double focusPercentY = sw5Var.getFocusPercentY();
        if (focusPercentY != null) {
            sb.append("-" + focusPercentY.doubleValue());
        }
        return sb.toString();
    }

    public static String D(String str, cfc cfcVar) {
        str.getClass();
        cfcVar.getClass();
        return ev6.x(str, "-", K(cfcVar));
    }

    public static String K(cfc cfcVar) {
        xe3 xe3Var = cfcVar.a;
        int i2 = xe3Var instanceof ue3 ? ((ue3) xe3Var).a : 0;
        xe3 xe3Var2 = cfcVar.b;
        return i2 + "-" + (xe3Var2 instanceof ue3 ? ((ue3) xe3Var2).a : 0);
    }

    public static final snf N(long j2, Object obj) {
        snf snfVar = (snf) ipf.e(j2, obj);
        if (((fmf) snfVar).a) {
            return snfVar;
        }
        int size = snfVar.size();
        snf snfVarN = snfVar.n(size == 0 ? 10 : size + size);
        ipf.f(j2, obj, snfVarN);
        return snfVarN;
    }

    public static final float[] u(String str, JSONObject jSONObject) {
        String lowerCase;
        JSONObject jSONObject2;
        String strOptString;
        JSONArray jSONArray;
        fa4 fa4Var;
        JSONObject jSONObjectX;
        if (!ec2.a.contains(fa4.class)) {
            try {
                if (g) {
                    float[] fArr = new float[30];
                    for (int i2 = 0; i2 < 30; i2++) {
                        fArr[i2] = 0.0f;
                    }
                    try {
                        lowerCase = str.toLowerCase();
                        lowerCase.getClass();
                        jSONObject2 = new JSONObject(jSONObject.optJSONObject("view").toString());
                        strOptString = jSONObject.optString("screenname");
                        jSONArray = new JSONArray();
                        fa4Var = b;
                        fa4Var.H(jSONObject2, jSONArray);
                        fa4Var.L(fArr, fa4Var.G(jSONObject2));
                        jSONObjectX = fa4Var.x(jSONObject2);
                    } catch (JSONException unused) {
                    }
                    if (jSONObjectX != null) {
                        strOptString.getClass();
                        String string = jSONObject2.toString();
                        string.getClass();
                        fa4Var.L(fArr, fa4Var.F(jSONObjectX, jSONArray, strOptString, string, lowerCase));
                        return fArr;
                    }
                }
            } catch (Throwable th) {
                ec2.a(fa4.class, th);
                return null;
            }
        }
        return null;
    }

    public static final String y(String str, String str2, String str3) {
        if (ec2.a.contains(fa4.class)) {
            return null;
        }
        try {
            str.getClass();
            String lowerCase = (str3 + " | " + str2 + ", " + str).toLowerCase();
            lowerCase.getClass();
            return lowerCase;
        } catch (Throwable th) {
            ec2.a(fa4.class, th);
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0099, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00d4, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0109, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x013f, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0174, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01aa, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x01dd, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0212, code lost:
    
        if (r9 == r14) goto L81;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object A(defpackage.g01 r10, defpackage.nhc r11, android.content.res.Resources r12, defpackage.cs1 r13, defpackage.n92 r14) {
        /*
            Method dump skipped, instruction units count: 578
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fa4.A(g01, nhc, android.content.res.Resources, cs1, n92):java.lang.Object");
    }

    public boolean E(String[] strArr, String[] strArr2) {
        if (!ec2.a.contains(this)) {
            try {
                for (String str : strArr) {
                    for (String str2 : strArr2) {
                        if (muc.Q(str2, str, false)) {
                            return true;
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return false;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x012d  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0165  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public float[] F(org.json.JSONObject r19, org.json.JSONArray r20, java.lang.String r21, java.lang.String r22, java.lang.String r23) {
        /*
            Method dump skipped, instruction units count: 367
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fa4.F(org.json.JSONObject, org.json.JSONArray, java.lang.String, java.lang.String, java.lang.String):float[]");
    }

    public float[] G(JSONObject jSONObject) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            float[] fArr = new float[30];
            for (int i2 = 0; i2 < 30; i2++) {
                fArr[i2] = 0.0f;
            }
            String strOptString = jSONObject.optString("text");
            strOptString.getClass();
            String lowerCase = strOptString.toLowerCase();
            lowerCase.getClass();
            String strOptString2 = jSONObject.optString("hint");
            strOptString2.getClass();
            String lowerCase2 = strOptString2.toLowerCase();
            lowerCase2.getClass();
            String strOptString3 = jSONObject.optString("classname");
            strOptString3.getClass();
            String lowerCase3 = strOptString3.toLowerCase();
            lowerCase3.getClass();
            int iOptInt = jSONObject.optInt("inputtype", -1);
            String[] strArr = {lowerCase, lowerCase2};
            if (E(new String[]{"$", "amount", "price", "total"}, strArr)) {
                fArr[0] = fArr[0] + 1.0f;
            }
            if (E(new String[]{"password", "pwd"}, strArr)) {
                fArr[1] = fArr[1] + 1.0f;
            }
            if (E(new String[]{"tel", "phone"}, strArr)) {
                fArr[2] = fArr[2] + 1.0f;
            }
            if (E(new String[]{"search"}, strArr)) {
                fArr[4] = fArr[4] + 1.0f;
            }
            if (iOptInt >= 0) {
                fArr[5] = fArr[5] + 1.0f;
            }
            if (iOptInt == 2 || iOptInt == 3) {
                fArr[6] = fArr[6] + 1.0f;
            }
            if (iOptInt == 32 || Patterns.EMAIL_ADDRESS.matcher(lowerCase).matches()) {
                fArr[7] = fArr[7] + 1.0f;
            }
            if (muc.Q(lowerCase3, "checkbox", false)) {
                fArr[8] = fArr[8] + 1.0f;
            }
            if (E(new String[]{"complete", "confirm", "done", "submit"}, new String[]{lowerCase})) {
                fArr[10] = fArr[10] + 1.0f;
            }
            if (muc.Q(lowerCase3, "radio", false) && muc.Q(lowerCase3, "button", false)) {
                fArr[12] = fArr[12] + 1.0f;
            }
            try {
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childviews");
                int length = jSONArrayOptJSONArray.length();
                for (int i3 = 0; i3 < length; i3++) {
                    JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i3);
                    jSONObject2.getClass();
                    L(fArr, G(jSONObject2));
                }
            } catch (JSONException unused) {
            }
            return fArr;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public boolean H(JSONObject jSONObject, JSONArray jSONArray) {
        boolean z;
        if (!ec2.a.contains(this)) {
            try {
                if (jSONObject.optBoolean("is_interacted")) {
                    return true;
                }
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childviews");
                int length = jSONArrayOptJSONArray.length();
                int i2 = 0;
                while (true) {
                    if (i2 >= length) {
                        z = false;
                        break;
                    }
                    if (jSONArrayOptJSONArray.getJSONObject(i2).optBoolean("is_interacted")) {
                        z = true;
                        break;
                    }
                    i2++;
                }
                boolean z2 = z;
                JSONArray jSONArray2 = new JSONArray();
                if (z) {
                    int length2 = jSONArrayOptJSONArray.length();
                    for (int i3 = 0; i3 < length2; i3++) {
                        jSONArray.put(jSONArrayOptJSONArray.getJSONObject(i3));
                    }
                    return z2;
                }
                int length3 = jSONArrayOptJSONArray.length();
                for (int i4 = 0; i4 < length3; i4++) {
                    JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i4);
                    jSONObject2.getClass();
                    if (H(jSONObject2, jSONArray)) {
                        jSONArray2.put(jSONObject2);
                        z2 = true;
                    }
                }
                jSONObject.put("childviews", jSONArray2);
                return z2;
            } catch (JSONException unused) {
            } catch (Throwable th) {
                ec2.a(this, th);
            }
        }
        return false;
    }

    public boolean I(String str, String str2) {
        if (ec2.a.contains(this)) {
            return false;
        }
        try {
            return Pattern.compile(str).matcher(str2).find();
        } catch (Throwable th) {
            ec2.a(this, th);
            return false;
        }
    }

    public boolean J(String str, String str2, String str3) {
        JSONObject jSONObjectOptJSONObject;
        JSONObject jSONObjectOptJSONObject2;
        if (!ec2.a.contains(this)) {
            try {
                JSONObject jSONObject = f;
                String strOptString = null;
                if (jSONObject == null) {
                    g76.g0("rules");
                    throw null;
                }
                JSONObject jSONObjectOptJSONObject3 = jSONObject.optJSONObject("rulesForLanguage");
                if (jSONObjectOptJSONObject3 != null) {
                    Map map = c;
                    if (map == null) {
                        g76.g0("languageInfo");
                        throw null;
                    }
                    JSONObject jSONObjectOptJSONObject4 = jSONObjectOptJSONObject3.optJSONObject((String) map.get("ENGLISH"));
                    if (jSONObjectOptJSONObject4 != null && (jSONObjectOptJSONObject = jSONObjectOptJSONObject4.optJSONObject("rulesForEvent")) != null) {
                        Map map2 = d;
                        if (map2 == null) {
                            g76.g0("eventInfo");
                            throw null;
                        }
                        JSONObject jSONObjectOptJSONObject5 = jSONObjectOptJSONObject.optJSONObject((String) map2.get(str));
                        if (jSONObjectOptJSONObject5 != null && (jSONObjectOptJSONObject2 = jSONObjectOptJSONObject5.optJSONObject("positiveRules")) != null) {
                            Map map3 = e;
                            if (map3 == null) {
                                g76.g0("textTypeInfo");
                                throw null;
                            }
                            strOptString = jSONObjectOptJSONObject2.optString((String) map3.get(str2));
                        }
                    }
                }
                if (strOptString != null) {
                    return I(strOptString, str3);
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return false;
            }
        }
        return false;
    }

    public void L(float[] fArr, float[] fArr2) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            int length = fArr.length;
            for (int i2 = 0; i2 < length; i2++) {
                fArr[i2] = fArr[i2] + fArr2[i2];
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public void M(JSONObject jSONObject, StringBuilder sb, StringBuilder sb2) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            String strOptString = jSONObject.optString("text", "");
            strOptString.getClass();
            String lowerCase = strOptString.toLowerCase();
            lowerCase.getClass();
            String strOptString2 = jSONObject.optString("hint", "");
            strOptString2.getClass();
            String lowerCase2 = strOptString2.toLowerCase();
            lowerCase2.getClass();
            if (lowerCase.length() > 0) {
                sb.append(lowerCase);
                sb.append(" ");
            }
            if (lowerCase2.length() > 0) {
                sb2.append(lowerCase2);
                sb2.append(" ");
            }
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childviews");
            if (jSONArrayOptJSONArray == null) {
                return;
            }
            int length = jSONArrayOptJSONArray.length();
            for (int i2 = 0; i2 < length; i2++) {
                try {
                    JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i2);
                    jSONObject2.getClass();
                    M(jSONObject2, sb, sb2);
                } catch (JSONException unused) {
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    @Override // defpackage.a21
    public byte[] a(byte[] bArr, int i2, int i3) {
        byte[] bArr2 = new byte[i3];
        System.arraycopy(bArr, i2, bArr2, 0, i3);
        return bArr2;
    }

    @Override // defpackage.jre
    public boolean b() {
        return false;
    }

    @Override // defpackage.pg4
    public void c() {
    }

    @Override // defpackage.pg4
    public String d() {
        return null;
    }

    @Override // defpackage.nn6
    public boolean e(zvd zvdVar, zvd zvdVar2) {
        return zvdVar.equals(zvdVar2);
    }

    @Override // defpackage.g70, defpackage.j70
    public /* synthetic */ float f() {
        return 0.0f;
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        String strQ = fd6Var.q();
        strQ.getClass();
        return strQ;
    }

    @Override // defpackage.q14
    public void g(y28 y28Var, ArrayList arrayList) {
        throw new IllegalStateException("Incomplete hierarchy for class " + y28Var.getName() + ", unresolved classes " + arrayList);
    }

    @Override // defpackage.iwa
    public mn6 getType() {
        throw new IllegalStateException("This method should not be called");
    }

    @Override // defpackage.q14
    public void h(f41 f41Var) {
        throw new IllegalStateException("Cannot infer visibility for " + f41Var);
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) throws GeneralSecurityException {
        ntg ntgVar;
        x3g x3gVar = (x3g) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey");
        hsgVarT.h(b4g.b(x3gVar).b());
        d1g d1gVar = x3gVar.a;
        if (d1g.n == d1gVar) {
            ntgVar = ntg.TINK;
        } else {
            if (d1g.o != d1gVar) {
                throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
            }
            ntgVar = ntg.RAW;
        }
        hsgVarT.e(ntgVar);
        return lig.p0((isg) hsgVarT.b());
    }

    @Override // defpackage.jre
    public dx j(long j2, dx dxVar, dx dxVar2, dx dxVar3) {
        return dxVar3;
    }

    @Override // defpackage.qu2
    public m6e k(vu2 vu2Var, List list, byte[] bArr, yp0 yp0Var) {
        vu2Var.getClass();
        list.getClass();
        return k6e.d;
    }

    @Override // defpackage.lre
    public int m() {
        return 0;
    }

    @Override // defpackage.pg4
    public void n(long j2, String str) {
    }

    public void o(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        float f3;
        r28 r28Var2;
        p65 p65Var;
        long j3;
        r28 r28Var3;
        float f4;
        long j4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(509241770);
        int i3 = i2 | 150;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                long jB = uu1.b(0.12f, ((uu1) p65Var2.j(d82.a)).a);
                r28Var3 = o28.b;
                f4 = 1.0f;
                j4 = jB;
            } else {
                p65Var2.S();
                f4 = f2;
                j4 = j2;
                r28Var3 = r28Var;
            }
            p65Var2.q();
            f49.f(f4, 6, j4, p65Var2, r28Var3);
            long j5 = j4;
            f3 = f4;
            p65Var = p65Var2;
            r28Var2 = r28Var3;
            j3 = j5;
        } else {
            p65Var2.S();
            f3 = f2;
            r28Var2 = r28Var;
            p65Var = p65Var2;
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new k7d(this, r28Var2, f3, j3, i2, 1);
        }
    }

    public void p(float f2, int i2, int i3, long j2, x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(98420724);
        int i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if ((i2 & 48) == 0) {
            i4 |= ((i3 & 2) == 0 && p65Var.c(f2)) ? 32 : 16;
        }
        int i5 = i4 | (((i3 & 4) == 0 && p65Var.e(j2)) ? 256 : 128);
        if (p65Var.P(i5 & 1, (i5 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                if ((i3 & 2) != 0) {
                    f2 = 2.0f;
                }
                if ((i3 & 4) != 0) {
                    j2 = ((uu1) p65Var.j(d82.a)).a;
                }
            } else {
                p65Var.S();
            }
            p65Var.q();
            dy0.a(flb.a0(jfc.e(jfc.d(r28Var, 1.0f), f2), j2, rv8.r), p65Var, 0);
        } else {
            p65Var.S();
        }
        float f3 = f2;
        long j3 = j2;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ar7(this, r28Var, f3, j3, i2, i3);
        }
    }

    @Override // defpackage.lre
    public int q() {
        return 0;
    }

    @Override // defpackage.jre
    public dx r(long j2, dx dxVar, dx dxVar2, dx dxVar3) {
        return j2 < 0 ? dxVar : dxVar2;
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return dxVar3;
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return 0L;
    }

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        String str = (String) obj;
        yl2Var.getClass();
        str.getClass();
        ae6Var.E(str);
    }

    public String toString() {
        switch (this.a) {
            case 12:
                return "Arrangement#Start";
            case 13:
            default:
                return super.toString();
            case 14:
                return "CompositionErrorContext";
        }
    }

    public synchronized m50 v() {
        xe4 xe4VarB = af4.b(f94.b());
        if (xe4VarB == null) {
            return m50.l.B();
        }
        return xe4VarB.e;
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        int i3 = 0;
        if (ip6Var == ip6.Ltr) {
            int length = iArr.length;
            int i4 = 0;
            int i5 = 0;
            while (i3 < length) {
                int i6 = iArr[i3];
                iArr2[i4] = i5;
                i5 += i6;
                i3++;
                i4++;
            }
            return;
        }
        int length2 = iArr.length;
        int i7 = 0;
        while (i3 < length2) {
            i7 += iArr[i3];
            i3++;
        }
        int i8 = i2 - i7;
        int length3 = iArr.length;
        while (true) {
            length3--;
            if (-1 >= length3) {
                return;
            }
            int i9 = iArr[length3];
            iArr2[length3] = i8;
            i8 += i9;
        }
    }

    public JSONObject x(JSONObject jSONObject) {
        if (!ec2.a.contains(this)) {
            try {
                if (jSONObject.optBoolean("is_interacted")) {
                    return jSONObject;
                }
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("childviews");
                if (jSONArrayOptJSONArray != null) {
                    int length = jSONArrayOptJSONArray.length();
                    for (int i2 = 0; i2 < length; i2++) {
                        JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i2);
                        jSONObject2.getClass();
                        JSONObject jSONObjectX = x(jSONObject2);
                        if (jSONObjectX != null) {
                            return jSONObjectX;
                        }
                    }
                }
            } catch (JSONException unused) {
            } catch (Throwable th) {
                ec2.a(this, th);
            }
        }
        return null;
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) {
        return vp7.x(Boolean.TRUE);
    }

    /* JADX WARN: Removed duplicated region for block: B:321:0x05ea  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:401:0x00ab A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:451:0x0655 A[SYNTHETIC] */
    @Override // defpackage.k9f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.sr0 l(java.lang.String r26, defpackage.xm0 r27, java.util.EnumMap r28) throws com.google.zxing.WriterException {
        /*
            Method dump skipped, instruction units count: 1932
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fa4.l(java.lang.String, xm0, java.util.EnumMap):sr0");
    }
}
