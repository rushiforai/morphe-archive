package defpackage;

import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import com.google.android.recaptcha.internal.zzaek;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class wz7 implements hb2, dz1, fa9, ux0, o92, k9f, r44, e68, oi3, h08, m7c, qkg, yfg {
    public static final wz7 b = new wz7(0);
    public static final wz7 c = new wz7(1);
    public static final /* synthetic */ wz7 d = new wz7(2);
    public static final wz7 e = new wz7(3);
    public static final /* synthetic */ wz7 f = new wz7(5);
    public static final wz7 g = new wz7(6);
    public static final wz7 h = new wz7(7);
    public static final wz7 i = new wz7(8);
    public static final /* synthetic */ wz7 j = new wz7(9);
    public static final /* synthetic */ wz7 k = new wz7(26);
    public final /* synthetic */ int a;

    public wz7(ir irVar) {
        this.a = 24;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:25:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00bf  */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r4v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.u i(defpackage.hec r19, defpackage.s2 r20, int r21, defpackage.yvd r22, boolean r23, boolean r24) {
        /*
            Method dump skipped, instruction units count: 649
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz7.i(hec, s2, int, yvd, boolean, boolean):u");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x005f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.ad k(defpackage.o3e r10, defpackage.s2 r11, int r12, boolean r13) {
        /*
            boolean r0 = defpackage.kyd.a0(r10)
            r1 = 7
            r2 = 0
            if (r0 == 0) goto Lf
            ad r10 = new ad
            r11 = 1
            r10.<init>(r11, r1, r2)
            return r10
        Lf:
            boolean r0 = r10 instanceof defpackage.zm4
            if (r0 == 0) goto L78
            boolean r7 = r10 instanceof defpackage.wsa
            r0 = r10
            zm4 r0 = (defpackage.zm4) r0
            hec r9 = r0.c
            hec r3 = r0.b
            yvd r6 = defpackage.yvd.FLEXIBLE_LOWER
            r4 = r11
            r5 = r12
            r8 = r13
            u r11 = i(r3, r4, r5, r6, r7, r8)
            r12 = r3
            hec r3 = r0.c
            yvd r6 = defpackage.yvd.FLEXIBLE_UPPER
            u r13 = i(r3, r4, r5, r6, r7, r8)
            java.lang.Object r0 = r13.c
            hec r0 = (defpackage.hec) r0
            java.lang.Object r3 = r11.c
            hec r3 = (defpackage.hec) r3
            if (r3 != 0) goto L3b
            if (r0 != 0) goto L3b
            goto L70
        L3b:
            boolean r2 = r11.b
            if (r2 != 0) goto L5f
            boolean r13 = r13.b
            if (r13 == 0) goto L44
            goto L5f
        L44:
            if (r7 == 0) goto L53
            wsa r2 = new wsa
            if (r3 != 0) goto L4b
            r3 = r12
        L4b:
            if (r0 != 0) goto L4e
            goto L4f
        L4e:
            r9 = r0
        L4f:
            r2.<init>(r3, r9)
            goto L70
        L53:
            if (r3 != 0) goto L56
            r3 = r12
        L56:
            if (r0 != 0) goto L59
            goto L5a
        L59:
            r9 = r0
        L5a:
            o3e r2 = defpackage.pwd.K(r3, r9)
            goto L70
        L5f:
            if (r0 == 0) goto L69
            if (r3 != 0) goto L64
            r3 = r0
        L64:
            o3e r3 = defpackage.pwd.K(r3, r0)
            goto L6c
        L69:
            r3.getClass()
        L6c:
            o3e r2 = defpackage.qk7.B(r10, r3)
        L70:
            ad r10 = new ad
            int r11 = r11.a
            r10.<init>(r11, r1, r2)
            return r10
        L78:
            r4 = r11
            r5 = r12
            r8 = r13
            boolean r11 = r10 instanceof defpackage.hec
            if (r11 == 0) goto L9d
            r3 = r10
            hec r3 = (defpackage.hec) r3
            yvd r6 = defpackage.yvd.INFLEXIBLE
            r7 = 0
            u r11 = i(r3, r4, r5, r6, r7, r8)
            ad r12 = new ad
            boolean r13 = r11.b
            java.lang.Object r0 = r11.c
            hec r0 = (defpackage.hec) r0
            if (r13 == 0) goto L97
            o3e r0 = defpackage.qk7.B(r10, r0)
        L97:
            int r10 = r11.a
            r12.<init>(r10, r1, r0)
            return r12
        L9d:
            defpackage.ygf.a()
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz7.k(o3e, s2, int, boolean):ad");
    }

    public static final ArrayList m(View view) {
        if (ec2.a.contains(wz7.class)) {
            return null;
        }
        try {
            ArrayList arrayList = new ArrayList();
            ViewGroup viewGroupI = gue.i(view);
            if (viewGroupI != null) {
                for (View view2 : gue.b(viewGroupI)) {
                    if (view != view2) {
                        arrayList.addAll(b.o(view2));
                    }
                }
            }
            return arrayList;
        } catch (Throwable th) {
            ec2.a(wz7.class, th);
            return null;
        }
    }

    public static final ArrayList n(View view) {
        List listQ;
        if (ec2.a.contains(wz7.class)) {
            return null;
        }
        try {
            ArrayList<String> arrayList = new ArrayList();
            arrayList.add(gue.h(view));
            Object tag = view.getTag();
            if (tag != null) {
                arrayList.add(tag.toString());
            }
            CharSequence contentDescription = view.getContentDescription();
            if (contentDescription != null) {
                arrayList.add(contentDescription.toString());
            }
            try {
                if (view.getId() != -1) {
                    String resourceName = view.getResources().getResourceName(view.getId());
                    resourceName.getClass();
                    Pattern patternCompile = Pattern.compile("/");
                    patternCompile.getClass();
                    muc.m0(0);
                    Matcher matcher = patternCompile.matcher(resourceName);
                    if (matcher.find()) {
                        ArrayList arrayList2 = new ArrayList(10);
                        int iEnd = 0;
                        do {
                            arrayList2.add(resourceName.subSequence(iEnd, matcher.start()).toString());
                            iEnd = matcher.end();
                        } while (matcher.find());
                        arrayList2.add(resourceName.subSequence(iEnd, resourceName.length()).toString());
                        listQ = arrayList2;
                    } else {
                        listQ = d46.Q(resourceName.toString());
                    }
                    String[] strArr = (String[]) listQ.toArray(new String[0]);
                    if (strArr.length == 2) {
                        arrayList.add(strArr[1]);
                    }
                }
            } catch (Resources.NotFoundException unused) {
            }
            ArrayList arrayList3 = new ArrayList();
            for (String str : arrayList) {
                if (str.length() > 0 && str.length() <= 100) {
                    String lowerCase = str.toLowerCase();
                    lowerCase.getClass();
                    arrayList3.add(lowerCase);
                }
            }
            return arrayList3;
        } catch (Throwable th) {
            ec2.a(wz7.class, th);
            return null;
        }
    }

    public static final boolean r(ArrayList arrayList, ArrayList arrayList2) {
        if (!ec2.a.contains(wz7.class)) {
            try {
                arrayList.getClass();
                arrayList2.getClass();
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    String str = (String) it2.next();
                    wz7 wz7Var = b;
                    if (!ec2.a.contains(wz7Var)) {
                        try {
                            Iterator it3 = arrayList2.iterator();
                            while (it3.hasNext()) {
                                if (muc.Q(str, (String) it3.next(), false)) {
                                    return true;
                                }
                            }
                        } catch (Throwable th) {
                            ec2.a(wz7Var, th);
                        }
                    }
                }
            } catch (Throwable th2) {
                ec2.a(wz7.class, th2);
                return false;
            }
        }
        return false;
    }

    public static LinkedHashMap s(LinkedHashMap linkedHashMap, f66 f66Var) {
        f66 f66Var2;
        f66Var.getClass();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            try {
                linkedHashMap2.put(entry.getKey(), t(entry.getValue()));
                f66Var2 = f66Var;
            } catch (Exception e2) {
                f66Var2 = f66Var;
                f49.L(f66Var2, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), new av2(entry, 1), e2, 48);
            }
            f66Var = f66Var2;
        }
        return linkedHashMap2;
    }

    public static dc6 t(Object obj) {
        boolean zL = g76.L(obj, s42.g);
        pc6 pc6Var = pc6.a;
        if (zL || obj == null || obj.equals(pc6Var)) {
            return pc6Var;
        }
        if (obj instanceof Boolean) {
            return new zc6((Boolean) obj);
        }
        if (obj instanceof Integer) {
            return new zc6((Number) obj);
        }
        if (obj instanceof Long) {
            return new zc6((Number) obj);
        }
        if (obj instanceof Float) {
            return new zc6((Number) obj);
        }
        if (obj instanceof Double) {
            return new zc6((Number) obj);
        }
        if (obj instanceof String) {
            return new zc6((String) obj);
        }
        if (obj instanceof Date) {
            return new zc6(Long.valueOf(((Date) obj).getTime()));
        }
        if (obj instanceof pb6) {
            return (dc6) obj;
        }
        if (obj instanceof Iterable) {
            pb6 pb6Var = new pb6();
            Iterator it2 = ((Iterable) obj).iterator();
            while (it2.hasNext()) {
                pb6Var.p(t(it2.next()));
            }
            return pb6Var;
        }
        if (obj instanceof Map) {
            uc6 uc6Var = new uc6();
            for (Map.Entry entry : ((Map) obj).entrySet()) {
                uc6Var.p(String.valueOf(entry.getKey()), t(entry.getValue()));
            }
            return uc6Var;
        }
        if (obj instanceof uc6) {
            return (dc6) obj;
        }
        if (obj instanceof zc6) {
            return (dc6) obj;
        }
        if (obj instanceof JSONObject) {
            JSONObject jSONObject = (JSONObject) obj;
            uc6 uc6Var2 = new uc6();
            Iterator<String> itKeys = jSONObject.keys();
            itKeys.getClass();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                uc6Var2.p(next, t(jSONObject.get(next)));
            }
            return uc6Var2;
        }
        if (!(obj instanceof JSONArray)) {
            return new zc6(obj.toString());
        }
        JSONArray jSONArray = (JSONArray) obj;
        pb6 pb6Var2 = new pb6();
        int length = jSONArray.length();
        for (int i2 = 0; i2 < length; i2++) {
            pb6Var2.p(t(jSONArray.get(i2)));
        }
        return pb6Var2;
    }

    @Override // defpackage.m7c
    public bo4 a(uxc uxcVar) {
        return new u50(7, k7c.START);
    }

    @Override // defpackage.oi3
    public List b(String str) throws UnknownHostException {
        str.getClass();
        try {
            InetAddress[] allByName = InetAddress.getAllByName(str);
            allByName.getClass();
            return k80.Q0(allByName);
        } catch (NullPointerException e2) {
            UnknownHostException unknownHostException = new UnknownHostException("Broken system behaviour for dns lookup of ".concat(str));
            unknownHostException.initCause(e2);
            throw unknownHostException;
        }
    }

    @Override // defpackage.h08
    public void c(File file, rp0 rp0Var) {
        file.getClass();
    }

    @Override // defpackage.h08
    public void d(File file, kp7 kp7Var, int i2) {
        file.getClass();
    }

    @Override // defpackage.fa9
    public boolean e(y28 y28Var, ga3 ga3Var) {
        y28Var.getClass();
        return true;
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        Object objO = iq1Var.o(new rqa(yy6.class, Executor.class));
        objO.getClass();
        return bgf.y((Executor) objO);
    }

    @Override // defpackage.ux0
    public long g(int i2, ym0 ym0Var) {
        return ((qjd) ym0Var.e).j(i2);
    }

    public String h(int i2, Method method) {
        return "parameter #" + (i2 + 1);
    }

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = ilf.a;
        String str = (String) ingVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.RsaSsaPssPublicKey")) {
            ay0.e("Wrong type URL in call to RsaSsaPssProtoSerialization.parsePublicKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i2 = gmf.a;
            crg crgVarZ = crg.z(pmfVar, anf.a);
            if (crgVarZ.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            BigInteger bigInteger = new BigInteger(1, crgVarZ.x().E());
            int iBitLength = bigInteger.bitLength();
            BigInteger bigInteger2 = qug.g;
            nug nugVar = new nug();
            pif pifVar = ilf.g;
            nugVar.c = (oug) pifVar.f(crgVarZ.w().v());
            nugVar.d = (oug) pifVar.f(crgVarZ.w().w());
            nugVar.b = new BigInteger(1, crgVarZ.y().E());
            nugVar.a(iBitLength);
            nugVar.b(crgVarZ.w().x());
            nugVar.f = ilf.b((e1g) ingVar.e);
            qug qugVarC = nugVar.c();
            tag tagVar = new tag();
            tagVar.a = qugVarC;
            tagVar.b = bigInteger;
            tagVar.c = (Integer) ingVar.f;
            return tagVar.l();
        } catch (zzaek | IllegalArgumentException unused) {
            ygf.l("Parsing RsaSsaPssPublicKey failed");
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0084  */
    @Override // defpackage.k9f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.sr0 l(java.lang.String r19, defpackage.xm0 r20, java.util.EnumMap r21) {
        /*
            Method dump skipped, instruction units count: 1132
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz7.l(java.lang.String, xm0, java.util.EnumMap):sr0");
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        r1g r1gVar = (r1g) gr7Var;
        f6g.c(r1gVar.h);
        zmg zmgVarW = ang.w();
        byte[] bArrB = ((qvg) r1gVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        zmgVarW.c();
        ang.v((ang) zmgVarW.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.AesGcmKey", ((ang) zmgVarW.b()).b(), zrg.SYMMETRIC, f6g.b(r1gVar.h.d), r1gVar.k);
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) throws IOException {
        if (jrgVar.k()) {
            return (Bundle) jrgVar.i();
        }
        if (Log.isLoggable("Rpc", 3)) {
            Log.d("Rpc", "Error making request: ".concat(String.valueOf(jrgVar.h())));
        }
        throw new IOException("SERVICE_NOT_AVAILABLE", jrgVar.h());
    }

    public ArrayList o(View view) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            ArrayList arrayList = new ArrayList();
            if (view instanceof EditText) {
                return arrayList;
            }
            if (view instanceof TextView) {
                String string = ((TextView) view).getText().toString();
                if (string.length() > 0 && string.length() < 100) {
                    String lowerCase = string.toLowerCase();
                    lowerCase.getClass();
                    arrayList.add(lowerCase);
                    return arrayList;
                }
            } else {
                Iterator it2 = gue.b(view).iterator();
                while (it2.hasNext()) {
                    arrayList.addAll(o((View) it2.next()));
                }
            }
            return arrayList;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public Object p(Class cls, Object obj, Method method, Object[] objArr) {
        throw new AssertionError();
    }

    public boolean q(Method method) {
        return false;
    }

    public String toString() {
        switch (this.a) {
            case 23:
                return "SharingStarted.Eagerly";
            default:
                return super.toString();
        }
    }

    public /* synthetic */ wz7(int i2) {
        this.a = i2;
    }
}
