package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import com.android.billingclient.api.BillingClient;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qz5 {
    public static final qz5 a = new qz5();
    public static final HashMap b = new HashMap();
    public static final HashMap c = new HashMap();
    public static final String d = f94.a().getPackageName();
    public static final SharedPreferences e = f94.a().getSharedPreferences("com.facebook.internal.SKU_DETAILS", 0);
    public static final SharedPreferences f = f94.a().getSharedPreferences("com.facebook.internal.PURCHASE", 0);

    public static final ArrayList f(Context context, Object obj) {
        if (ec2.a.contains(qz5.class)) {
            return null;
        }
        try {
            qz5 qz5Var = a;
            return qz5Var.a(qz5Var.e(context, obj, BillingClient.ProductType.INAPP));
        } catch (Throwable th) {
            ec2.a(qz5.class, th);
            return null;
        }
    }

    public final ArrayList a(ArrayList arrayList) {
        SharedPreferences sharedPreferences = f;
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            ArrayList arrayList2 = new ArrayList();
            SharedPreferences.Editor editorEdit = sharedPreferences.edit();
            long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                String str = (String) it2.next();
                try {
                    JSONObject jSONObject = new JSONObject(str);
                    String string = jSONObject.getString("productId");
                    long j = jSONObject.getLong("purchaseTime");
                    String string2 = jSONObject.getString("purchaseToken");
                    if (jCurrentTimeMillis - (j / 1000) <= 86400 && !g76.L(sharedPreferences.getString(string, ""), string2)) {
                        editorEdit.putString(string, string2);
                        arrayList2.add(str);
                    }
                } catch (JSONException unused) {
                }
            }
            editorEdit.apply();
            return arrayList2;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final Class b(Context context, String str) {
        Class<?> clsLoadClass;
        HashMap map = c;
        Set set = ec2.a;
        if (set.contains(this)) {
            return null;
        }
        try {
            Class cls = (Class) map.get(str);
            if (cls != null) {
                return cls;
            }
            if (set.contains(xz5.class)) {
                clsLoadClass = null;
            } else {
                try {
                    clsLoadClass = context.getClassLoader().loadClass(str);
                } catch (ClassNotFoundException unused) {
                    clsLoadClass = null;
                } catch (Throwable th) {
                    ec2.a(xz5.class, th);
                    clsLoadClass = null;
                }
            }
            if (clsLoadClass != null) {
                map.put(str, clsLoadClass);
            }
            return clsLoadClass;
        } catch (Throwable th2) {
            ec2.a(this, th2);
            return null;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0089  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.reflect.Method c(java.lang.Class r12, java.lang.String r13) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qz5.c(java.lang.Class, java.lang.String):java.lang.reflect.Method");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0062  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.ArrayList d(android.content.Context r22, java.lang.Object r23) {
        /*
            r21 = this;
            r1 = r21
            java.lang.String r0 = "inapp"
            java.util.Set r2 = defpackage.ec2.a
            boolean r2 = r2.contains(r1)
            r7 = 0
            if (r2 == 0) goto Le
            return r7
        Le:
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch: java.lang.Throwable -> L98
            r8.<init>()     // Catch: java.lang.Throwable -> L98
            r2 = r22
            r5 = r23
            boolean r3 = r1.i(r2, r5, r0)     // Catch: java.lang.Throwable -> L98
            if (r3 == 0) goto Lbc
            r9 = 0
            r3 = r7
            r10 = r9
            r11 = r10
        L21:
            r4 = 6
            java.lang.Integer r4 = java.lang.Integer.valueOf(r4)     // Catch: java.lang.Throwable -> L98
            android.os.Bundle r6 = new android.os.Bundle     // Catch: java.lang.Throwable -> L98
            r6.<init>()     // Catch: java.lang.Throwable -> L98
            r12 = 5
            java.lang.Object[] r12 = new java.lang.Object[r12]     // Catch: java.lang.Throwable -> L98
            r12[r9] = r4     // Catch: java.lang.Throwable -> L98
            java.lang.String r4 = defpackage.qz5.d     // Catch: java.lang.Throwable -> L98
            r13 = 1
            r12[r13] = r4     // Catch: java.lang.Throwable -> L98
            r4 = 2
            r12[r4] = r0     // Catch: java.lang.Throwable -> L98
            r4 = 3
            r12[r4] = r3     // Catch: java.lang.Throwable -> L98
            r3 = 4
            r12[r3] = r6     // Catch: java.lang.Throwable -> L98
            java.lang.String r3 = "com.android.vending.billing.IInAppBillingService"
            java.lang.String r4 = "getPurchaseHistory"
            r6 = r12
            java.lang.Object r3 = r1.h(r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L98
            if (r3 == 0) goto L62
            long r4 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L98
            r14 = 1000(0x3e8, double:4.94E-321)
            long r4 = r4 / r14
            android.os.Bundle r3 = (android.os.Bundle) r3     // Catch: java.lang.Throwable -> L98
            java.lang.String r2 = "RESPONSE_CODE"
            int r2 = r3.getInt(r2)     // Catch: java.lang.Throwable -> L98
            if (r2 != 0) goto L62
            java.lang.String r2 = "INAPP_PURCHASE_DATA_LIST"
            java.util.ArrayList r2 = r3.getStringArrayList(r2)     // Catch: java.lang.Throwable -> L98
            if (r2 != 0) goto L65
        L62:
            r16 = r7
            goto La9
        L65:
            java.util.Iterator r2 = r2.iterator()     // Catch: java.lang.Throwable -> L98
        L69:
            boolean r6 = r2.hasNext()     // Catch: java.lang.Throwable -> L98
            if (r6 == 0) goto L9f
            java.lang.Object r6 = r2.next()     // Catch: java.lang.Throwable -> L98
            java.lang.String r6 = (java.lang.String) r6     // Catch: java.lang.Throwable -> L98
            org.json.JSONObject r12 = new org.json.JSONObject     // Catch: java.lang.Throwable -> L98 org.json.JSONException -> L9c
            r12.<init>(r6)     // Catch: java.lang.Throwable -> L98 org.json.JSONException -> L9c
            r16 = r7
            java.lang.String r7 = "purchaseTime"
            long r17 = r12.getLong(r7)     // Catch: org.json.JSONException -> L93 java.lang.Throwable -> L96
            long r17 = r17 / r14
            long r17 = r4 - r17
            r19 = 1200(0x4b0, double:5.93E-321)
            int r7 = (r17 > r19 ? 1 : (r17 == r19 ? 0 : -1))
            if (r7 <= 0) goto L8e
            r11 = r13
            goto La1
        L8e:
            r8.add(r6)     // Catch: org.json.JSONException -> L93 java.lang.Throwable -> L96
            int r10 = r10 + 1
        L93:
            r7 = r16
            goto L69
        L96:
            r0 = move-exception
            goto Lbd
        L98:
            r0 = move-exception
            r16 = r7
            goto Lbd
        L9c:
            r16 = r7
            goto L93
        L9f:
            r16 = r7
        La1:
            java.lang.String r2 = "INAPP_CONTINUATION_TOKEN"
            java.lang.String r2 = r3.getString(r2)     // Catch: java.lang.Throwable -> L96
            r3 = r2
            goto Lab
        La9:
            r3 = r16
        Lab:
            r2 = 30
            if (r10 >= r2) goto Lbc
            if (r3 == 0) goto Lbc
            if (r11 == 0) goto Lb4
            goto Lbc
        Lb4:
            r2 = r22
            r5 = r23
            r7 = r16
            goto L21
        Lbc:
            return r8
        Lbd:
            defpackage.ec2.a(r1, r0)
            return r16
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qz5.d(android.content.Context, java.lang.Object):java.util.ArrayList");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.ArrayList e(android.content.Context r11, java.lang.Object r12, java.lang.String r13) {
        /*
            r10 = this;
            java.util.Set r0 = defpackage.ec2.a
            boolean r0 = r0.contains(r10)
            r7 = 0
            if (r0 == 0) goto La
            return r7
        La:
            java.util.ArrayList r0 = new java.util.ArrayList     // Catch: java.lang.Throwable -> L5d
            r0.<init>()     // Catch: java.lang.Throwable -> L5d
            if (r12 != 0) goto L12
            goto L66
        L12:
            boolean r2 = r10.i(r11, r12, r13)     // Catch: java.lang.Throwable -> L5d
            if (r2 == 0) goto L66
            r8 = 0
            r2 = r7
            r9 = r8
        L1b:
            r3 = 3
            java.lang.Integer r4 = java.lang.Integer.valueOf(r3)     // Catch: java.lang.Throwable -> L5d
            r5 = 4
            java.lang.Object[] r6 = new java.lang.Object[r5]     // Catch: java.lang.Throwable -> L5d
            r6[r8] = r4     // Catch: java.lang.Throwable -> L5d
            java.lang.String r4 = defpackage.qz5.d     // Catch: java.lang.Throwable -> L5d
            r5 = 1
            r6[r5] = r4     // Catch: java.lang.Throwable -> L5d
            r4 = 2
            r6[r4] = r13     // Catch: java.lang.Throwable -> L5d
            r6[r3] = r2     // Catch: java.lang.Throwable -> L5d
            java.lang.String r3 = "com.android.vending.billing.IInAppBillingService"
            java.lang.String r4 = "getPurchases"
            r1 = r10
            r2 = r11
            r5 = r12
            java.lang.Object r3 = r1.h(r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L5d
            if (r3 == 0) goto L5f
            android.os.Bundle r3 = (android.os.Bundle) r3     // Catch: java.lang.Throwable -> L5d
            java.lang.String r2 = "RESPONSE_CODE"
            int r2 = r3.getInt(r2)     // Catch: java.lang.Throwable -> L5d
            if (r2 != 0) goto L5f
            java.lang.String r2 = "INAPP_PURCHASE_DATA_LIST"
            java.util.ArrayList r2 = r3.getStringArrayList(r2)     // Catch: java.lang.Throwable -> L5d
            if (r2 == 0) goto L66
            int r4 = r2.size()     // Catch: java.lang.Throwable -> L5d
            int r9 = r9 + r4
            r0.addAll(r2)     // Catch: java.lang.Throwable -> L5d
            java.lang.String r2 = "INAPP_CONTINUATION_TOKEN"
            java.lang.String r2 = r3.getString(r2)     // Catch: java.lang.Throwable -> L5d
            goto L60
        L5d:
            r0 = move-exception
            goto L67
        L5f:
            r2 = r7
        L60:
            r3 = 30
            if (r9 >= r3) goto L66
            if (r2 != 0) goto L1b
        L66:
            return r0
        L67:
            defpackage.ec2.a(r10, r0)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qz5.e(android.content.Context, java.lang.Object, java.lang.String):java.util.ArrayList");
    }

    public final Object h(Context context, String str, String str2, Object obj, Object[] objArr) {
        Method methodC;
        if (!ec2.a.contains(this)) {
            try {
                Class clsB = b(context, str);
                if (clsB != null && (methodC = c(clsB, str2)) != null) {
                    return xz5.a0(clsB, obj, methodC, Arrays.copyOf(objArr, objArr.length));
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final boolean i(Context context, Object obj, String str) {
        qz5 qz5Var;
        if (!ec2.a.contains(this) && obj != null) {
            try {
                qz5Var = this;
                try {
                    Object objH = qz5Var.h(context, "com.android.vending.billing.IInAppBillingService", "isBillingSupported", obj, new Object[]{3, d, str});
                    if (objH != null) {
                        if (((Integer) objH).intValue() == 0) {
                            return true;
                        }
                    }
                } catch (Throwable th) {
                    th = th;
                    ec2.a(qz5Var, th);
                    return false;
                }
            } catch (Throwable th2) {
                th = th2;
                qz5Var = this;
            }
        }
        return false;
    }

    public final LinkedHashMap j(ArrayList arrayList) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                String str = (String) it2.next();
                String string = e.getString(str, null);
                if (string != null) {
                    List listP0 = muc.p0(string, new String[]{";"}, 2, 2);
                    if (jCurrentTimeMillis - Long.parseLong((String) listP0.get(0)) < 43200) {
                        str.getClass();
                        linkedHashMap.put(str, listP0.get(1));
                    }
                }
            }
            return linkedHashMap;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final void k(LinkedHashMap linkedHashMap) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
            SharedPreferences.Editor editorEdit = e.edit();
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                editorEdit.putString((String) entry.getKey(), jCurrentTimeMillis + ';' + ((String) entry.getValue()));
            }
            editorEdit.apply();
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final LinkedHashMap g(Context context, ArrayList arrayList, Object obj, boolean z) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            if (obj != null && !arrayList.isEmpty()) {
                Bundle bundle = new Bundle();
                bundle.putStringArrayList("ITEM_ID_LIST", arrayList);
                Object objH = h(context, "com.android.vending.billing.IInAppBillingService", ziYqbdHrAXvj.QkTksSyJsfj, obj, new Object[]{3, d, z ? BillingClient.ProductType.SUBS : BillingClient.ProductType.INAPP, bundle});
                if (objH != null) {
                    Bundle bundle2 = (Bundle) objH;
                    if (bundle2.getInt("RESPONSE_CODE") == 0) {
                        ArrayList<String> stringArrayList = bundle2.getStringArrayList("DETAILS_LIST");
                        if (stringArrayList != null && arrayList.size() == stringArrayList.size()) {
                            int size = arrayList.size();
                            for (int i = 0; i < size; i++) {
                                Object obj2 = arrayList.get(i);
                                obj2.getClass();
                                String str = stringArrayList.get(i);
                                str.getClass();
                                linkedHashMap.put(obj2, str);
                            }
                        }
                        k(linkedHashMap);
                    }
                }
            }
            return linkedHashMap;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }
}
