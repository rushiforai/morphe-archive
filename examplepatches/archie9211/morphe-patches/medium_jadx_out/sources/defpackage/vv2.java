package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.Bundle;
import android.os.Trace;
import android.util.Base64;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.facebook.FacebookException;
import com.medium.reader.R;
import j$.util.Objects;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class vv2 {
    public static Context h = null;
    public static Bundle i = null;
    public static final d1g k;
    public static final d1g l;
    public static boolean n = true;
    public static final /* synthetic */ int s = 0;
    public static final /* synthetic */ int t = 0;
    public static final mz1 a = new mz1(new e02(22), false, -215737155);
    public static final mz1 b = new mz1(new f02(0), false, -20108262);
    public static final mz1 c = new mz1(new f02(1), false, 707790122);
    public static final mz1 d = new mz1(new f02(2), false, -780500567);
    public static final mz1 e = new mz1(new f02(3), false, 1966308106);
    public static final mz1 f = new mz1(new n02(12), false, 1776308453);
    public static final Object g = new Object();
    public static final uob j = new uob(19);
    public static final Type[] m = new Type[0];
    public static final int[] o = {0, 3, 6, 9, 12, 16, 19, 22, 25, 28};
    public static final int[] p = {0, 2, 3, 5, 6, 0, 1, 3, 4, 6};
    public static final int[] q = {67108863, 33554431};
    public static final int[] r = {26, 25};

    /* JADX WARN: Multi-variable type inference failed */
    static {
        int i2 = 16;
        k = new d1g(i2, "NONE", 0 == true ? 1 : 0);
        l = new d1g(i2, "PENDING", 0 == true ? 1 : 0);
    }

    public static w3 A(Collection collection, Bundle bundle, h4 h4Var, String str) {
        ArrayList arrayListT;
        ArrayList arrayListT2;
        bundle.getClass();
        str.getClass();
        Date dateW = epe.w(bundle, "expires_in", new Date());
        String string = bundle.getString("access_token");
        if (string != null) {
            Date dateW2 = epe.w(bundle, "data_access_expiration_time", new Date(0L));
            String string2 = bundle.getString("granted_scopes");
            if (string2 != null && string2.length() > 0) {
                String[] strArr = (String[]) muc.p0(string2, new String[]{","}, 0, 6).toArray(new String[0]);
                collection = d46.t(Arrays.copyOf(strArr, strArr.length));
            }
            Collection collection2 = collection;
            String string3 = bundle.getString("denied_scopes");
            if (string3 == null || string3.length() <= 0) {
                arrayListT = null;
            } else {
                String[] strArr2 = (String[]) muc.p0(string3, new String[]{","}, 0, 6).toArray(new String[0]);
                arrayListT = d46.t(Arrays.copyOf(strArr2, strArr2.length));
            }
            String string4 = bundle.getString("expired_scopes");
            if (string4 == null || string4.length() <= 0) {
                arrayListT2 = null;
            } else {
                String[] strArr3 = (String[]) muc.p0(string4, new String[]{","}, 0, 6).toArray(new String[0]);
                arrayListT2 = d46.t(Arrays.copyOf(strArr3, strArr3.length));
            }
            if (!epe.J(string)) {
                String string5 = bundle.getString("graph_domain");
                String string6 = bundle.getString("signed_request");
                if (string6 == null || string6.length() == 0) {
                    throw new FacebookException("Authorization response does not contain the signed_request");
                }
                try {
                    String[] strArr4 = (String[]) muc.p0(string6, new String[]{"."}, 0, 6).toArray(new String[0]);
                    if (strArr4.length == 2) {
                        byte[] bArrDecode = Base64.decode(strArr4[1], 0);
                        bArrDecode.getClass();
                        String string7 = new JSONObject(new String(bArrDecode, wk1.a)).getString("user_id");
                        string7.getClass();
                        return new w3(string, str, string7, collection2, arrayListT, arrayListT2, h4Var, dateW, new Date(), dateW2, string5);
                    }
                } catch (UnsupportedEncodingException | JSONException unused) {
                }
                throw new FacebookException("Failed to retrieve user_id from signed_request");
            }
        }
        return null;
    }

    public static ce0 B(String str, Bundle bundle) {
        bundle.getClass();
        String string = bundle.getString("id_token");
        if (string == null || string.length() == 0 || str == null || str.length() == 0) {
            return null;
        }
        try {
            return new ce0(string, str);
        } catch (Exception e2) {
            throw new FacebookException(e2.getMessage(), e2);
        }
    }

    public static void C(ch4 ch4Var, g59 g59Var) {
        if (ch4Var.L(g59Var)) {
            return;
        }
        try {
            ch4Var.U(g59Var, false).close();
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception unused) {
        }
    }

    public static final vj6 D(ih6 ih6Var, List list, boolean z, List list2) {
        co1 co1VarA;
        uvd uvdVar;
        onc oncVar;
        ih6Var.getClass();
        list.getClass();
        list2.getClass();
        jh6 jh6Var = ih6Var instanceof jh6 ? (jh6) ih6Var : null;
        if (jh6Var == null || (co1VarA = jh6Var.a()) == null) {
            StringBuilder sb = new StringBuilder("Cannot create type for an unsupported classifier: ");
            sb.append(ih6Var);
            Class<?> cls = ih6Var.getClass();
            sb.append(" (");
            sb.append(cls);
            sb.append(')');
            throw new zb2(sb.toString());
        }
        zvd zvdVarN = co1VarA.n();
        zvdVarN.getClass();
        List parameters = zvdVarN.getParameters();
        parameters.getClass();
        if (parameters.size() != list.size()) {
            throw new IllegalArgumentException("Class declares " + parameters.size() + " type parameters, but " + list.size() + " were provided.");
        }
        if (list2.isEmpty()) {
            uvd.b.getClass();
            uvdVar = uvd.c;
        } else {
            uvd.b.getClass();
            uvdVar = uvd.c;
        }
        List parameters2 = zvdVarN.getParameters();
        parameters2.getClass();
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        int i2 = 0;
        for (Object obj : list) {
            int i3 = i2 + 1;
            if (i2 < 0) {
                d46.i0();
                throw null;
            }
            ak6 ak6Var = (ak6) obj;
            vj6 vj6Var = (vj6) ak6Var.b;
            mn6 mn6Var = vj6Var != null ? vj6Var.a : null;
            bk6 bk6Var = ak6Var.a;
            int i4 = bk6Var == null ? -1 : kh6.a[bk6Var.ordinal()];
            if (i4 == -1) {
                Object obj2 = parameters2.get(i2);
                obj2.getClass();
                oncVar = new onc((swd) obj2);
            } else if (i4 == 1) {
                pqe pqeVar = pqe.INVARIANT;
                mn6Var.getClass();
                oncVar = new onc(mn6Var, pqeVar);
            } else if (i4 == 2) {
                pqe pqeVar2 = pqe.IN_VARIANCE;
                mn6Var.getClass();
                oncVar = new onc(mn6Var, pqeVar2);
            } else {
                if (i4 != 3) {
                    ygf.a();
                    return null;
                }
                pqe pqeVar3 = pqe.OUT_VARIANCE;
                mn6Var.getClass();
                oncVar = new onc(mn6Var, pqeVar3);
            }
            arrayList.add(oncVar);
            i2 = i3;
        }
        return new vj6(pwd.Y(uvdVar, zvdVarN, arrayList, z), null, false);
    }

    public static final void E(ch4 ch4Var, g59 g59Var) throws IOException {
        try {
            IOException iOException = null;
            for (g59 g59Var2 : ch4Var.N(g59Var)) {
                try {
                    if (ch4Var.Q(g59Var2).c) {
                        E(ch4Var, g59Var2);
                    }
                    ch4Var.D(g59Var2);
                } catch (IOException e2) {
                    if (iOException == null) {
                        iOException = e2;
                    }
                }
            }
            if (iOException != null) {
                throw iOException;
            }
        } catch (FileNotFoundException unused) {
        }
    }

    public static boolean F(Type type, Type type2) {
        if (type == type2) {
            return true;
        }
        if (type instanceof Class) {
            return type.equals(type2);
        }
        if (type instanceof ParameterizedType) {
            if (!(type2 instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType parameterizedType = (ParameterizedType) type;
            ParameterizedType parameterizedType2 = (ParameterizedType) type2;
            Type ownerType = parameterizedType.getOwnerType();
            Type ownerType2 = parameterizedType2.getOwnerType();
            return (ownerType == ownerType2 || (ownerType != null && ownerType.equals(ownerType2))) && parameterizedType.getRawType().equals(parameterizedType2.getRawType()) && Arrays.equals(parameterizedType.getActualTypeArguments(), parameterizedType2.getActualTypeArguments());
        }
        if (type instanceof GenericArrayType) {
            if (type2 instanceof GenericArrayType) {
                return F(((GenericArrayType) type).getGenericComponentType(), ((GenericArrayType) type2).getGenericComponentType());
            }
            return false;
        }
        if (type instanceof WildcardType) {
            if (!(type2 instanceof WildcardType)) {
                return false;
            }
            WildcardType wildcardType = (WildcardType) type;
            WildcardType wildcardType2 = (WildcardType) type2;
            return Arrays.equals(wildcardType.getUpperBounds(), wildcardType2.getUpperBounds()) && Arrays.equals(wildcardType.getLowerBounds(), wildcardType2.getLowerBounds());
        }
        if (!(type instanceof TypeVariable) || !(type2 instanceof TypeVariable)) {
            return false;
        }
        TypeVariable typeVariable = (TypeVariable) type;
        TypeVariable typeVariable2 = (TypeVariable) type2;
        return typeVariable.getGenericDeclaration() == typeVariable2.getGenericDeclaration() && typeVariable.getName().equals(typeVariable2.getName());
    }

    public static Set G() {
        try {
            Object objInvoke = Class.forName("android.text.EmojiConsistency").getMethod("getEmojiConsistencySet", null).invoke(null, null);
            if (objInvoke == null) {
                return Collections.EMPTY_SET;
            }
            Set set = (Set) objInvoke;
            Iterator it2 = set.iterator();
            while (it2.hasNext()) {
                if (!(it2.next() instanceof int[])) {
                    return Collections.EMPTY_SET;
                }
            }
            return set;
        } catch (Throwable unused) {
            return Collections.EMPTY_SET;
        }
    }

    public static Type H(Type type, Class cls, Class cls2) {
        if (cls2 == cls) {
            return type;
        }
        if (cls2.isInterface()) {
            Class<?>[] interfaces = cls.getInterfaces();
            int length = interfaces.length;
            for (int i2 = 0; i2 < length; i2++) {
                Class<?> cls3 = interfaces[i2];
                if (cls3 == cls2) {
                    return cls.getGenericInterfaces()[i2];
                }
                if (cls2.isAssignableFrom(cls3)) {
                    return H(cls.getGenericInterfaces()[i2], interfaces[i2], cls2);
                }
            }
        }
        if (!cls.isInterface()) {
            while (cls != Object.class) {
                Class<?> superclass = cls.getSuperclass();
                if (superclass == cls2) {
                    return cls.getGenericSuperclass();
                }
                if (cls2.isAssignableFrom(superclass)) {
                    return H(cls.getGenericSuperclass(), superclass, cls2);
                }
                cls = superclass;
            }
        }
        return cls2;
    }

    public static final String I(Object obj) {
        return Integer.toHexString(System.identityHashCode(obj));
    }

    public static Bundle J(Context context) {
        Bundle bundle;
        ServiceInfo serviceInfo;
        Bundle bundle2;
        Context applicationContext = context.getApplicationContext();
        synchronized (g) {
            if (applicationContext != h) {
                grb.f("CronetManifest#getMetaData fetching info");
                try {
                    try {
                        serviceInfo = applicationContext.getPackageManager().getServiceInfo(new ComponentName(applicationContext, "android.net.http.MetaDataHolder"), 787072);
                    } finally {
                    }
                } catch (PackageManager.NameNotFoundException | NullPointerException unused) {
                    serviceInfo = null;
                }
                if (serviceInfo == null || (bundle2 = serviceInfo.metaData) == null) {
                    bundle2 = new Bundle();
                }
                i = bundle2;
                h = applicationContext;
                Trace.endSection();
            }
            bundle = i;
        }
        return bundle;
    }

    public static Type K(int i2, ParameterizedType parameterizedType) {
        Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
        if (i2 >= 0 && i2 < actualTypeArguments.length) {
            Type type = actualTypeArguments[i2];
            return type instanceof WildcardType ? ((WildcardType) type).getUpperBounds()[0] : type;
        }
        StringBuilder sbC = ev6.C("Index ", i2, " not in range [0,");
        sbC.append(actualTypeArguments.length);
        sbC.append(") for ");
        sbC.append(parameterizedType);
        throw new IllegalArgumentException(sbC.toString());
    }

    public static Class L(Type type) {
        Objects.requireNonNull(type, "type == null");
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            Type rawType = ((ParameterizedType) type).getRawType();
            if (rawType instanceof Class) {
                return (Class) rawType;
            }
            lg8.r();
            return null;
        }
        if (type instanceof GenericArrayType) {
            return Array.newInstance((Class<?>) L(((GenericArrayType) type).getGenericComponentType()), 0).getClass();
        }
        if (type instanceof TypeVariable) {
            return Object.class;
        }
        if (type instanceof WildcardType) {
            return L(((WildcardType) type).getUpperBounds()[0]);
        }
        StringBuilder sb = new StringBuilder("Expected a Class, ParameterizedType, or GenericArrayType, but <");
        sb.append(type);
        ywb.l(sb, "> is of type ", type.getClass().getName());
        return null;
    }

    public static Type M(Type type, Class cls) {
        if (Map.class.isAssignableFrom(cls)) {
            return W(type, cls, H(type, cls, Map.class));
        }
        lg8.r();
        return null;
    }

    public static boolean N(Type type) {
        if (type instanceof Class) {
            return false;
        }
        if (!(type instanceof ParameterizedType)) {
            if (type instanceof GenericArrayType) {
                return N(((GenericArrayType) type).getGenericComponentType());
            }
            if ((type instanceof TypeVariable) || (type instanceof WildcardType)) {
                return true;
            }
            ywb.j("Expected a Class, ParameterizedType, or GenericArrayType, but <", type, "> is of type ", type == null ? "null" : type.getClass().getName());
            return false;
        }
        for (Type type2 : ((ParameterizedType) type).getActualTypeArguments()) {
            if (N(type2)) {
                return true;
            }
        }
        return false;
    }

    public static final boolean O(String str) {
        str.getClass();
        return str.equals("POST") || str.equals("PATCH") || str.equals("PUT") || str.equals("DELETE") || str.equals("MOVE");
    }

    public static boolean P(Annotation[] annotationArr, Class cls) {
        for (Annotation annotation : annotationArr) {
            if (cls.isInstance(annotation)) {
                return true;
            }
        }
        return false;
    }

    public static final z36 Q(File file) {
        file.getClass();
        z36 z36Var = new z36();
        String name = file.getName();
        name.getClass();
        z36Var.a = name;
        z36Var.b = tuc.N(name, "crash_log_", false) ? x36.CrashReport : tuc.N(name, "shield_log_", false) ? x36.CrashShield : tuc.N(name, "thread_check_log_", false) ? x36.ThreadCheck : tuc.N(name, "analysis_log_", false) ? x36.Analysis : tuc.N(name, "anr_log_", false) ? x36.AnrReport : x36.Unknown;
        JSONObject jSONObjectS0 = xz5.s0(name);
        if (jSONObjectS0 != null) {
            z36Var.g = Long.valueOf(jSONObjectS0.optLong("timestamp", 0L));
            z36Var.d = jSONObjectS0.optString("app_version", null);
            z36Var.e = jSONObjectS0.optString("reason", null);
            z36Var.f = jSONObjectS0.optString("callstack", null);
            z36Var.c = jSONObjectS0.optJSONArray("feature_names");
        }
        return z36Var;
    }

    public static IllegalArgumentException R(Method method, Exception exc, String str, Object... objArr) {
        return new IllegalArgumentException(String.format(str, objArr) + "\n    for method " + method.getDeclaringClass().getSimpleName() + "." + method.getName(), exc);
    }

    public static IllegalArgumentException S(Method method, int i2, String str, Object... objArr) {
        return R(method, null, lv8.r(str, " (", da9.b.h(i2, method), ")"), objArr);
    }

    public static IllegalArgumentException T(Method method, Exception exc, int i2, String str, Object... objArr) {
        return R(method, exc, lv8.r(str, " (", da9.b.h(i2, method), ")"), objArr);
    }

    public static final boolean U(String str) {
        str.getClass();
        return (str.equals("GET") || str.equals("HEAD")) ? false : true;
    }

    public static final String V(String str, Bundle bundle) {
        bundle.getClass();
        String string = bundle.getString(str);
        if (string != null) {
            return string;
        }
        ywb.g(ev6.x("Required '", str, "' is null."));
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.reflect.Type W(java.lang.reflect.Type r8, java.lang.Class r9, java.lang.reflect.Type r10) {
        /*
            Method dump skipped, instruction units count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv2.W(java.lang.reflect.Type, java.lang.Class, java.lang.reflect.Type):java.lang.reflect.Type");
    }

    public static final jz3 X(dsd dsdVar, x45 x45Var, Object obj, x12 x12Var) {
        jz3 jz3Var;
        p65 p65Var = (p65) x12Var;
        p65Var.W(-422486745, dsdVar);
        boolean zG = dsdVar.g();
        b2 b2Var = dsdVar.a;
        if (zG) {
            p65Var.Y(-212166497);
            p65Var.p(false);
            jz3Var = ((Boolean) x45Var.invoke(obj)).booleanValue() ? jz3.Visible : ((Boolean) x45Var.invoke(b2Var.o0())).booleanValue() ? jz3.PostExit : jz3.PreEnter;
        } else {
            p65Var.Y(-211892364);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            if (((Boolean) x45Var.invoke(b2Var.o0())).booleanValue()) {
                l78Var.setValue(Boolean.TRUE);
            }
            jz3Var = ((Boolean) x45Var.invoke(obj)).booleanValue() ? jz3.Visible : ((Boolean) l78Var.getValue()).booleanValue() ? jz3.PostExit : jz3.PreEnter;
            p65Var.p(false);
        }
        p65Var.p(false);
        return jz3Var;
    }

    public static void Y(Throwable th) {
        if (th instanceof VirtualMachineError) {
            throw ((VirtualMachineError) th);
        }
        if (th instanceof ThreadDeath) {
            throw ((ThreadDeath) th);
        }
        if (th instanceof LinkageError) {
            throw ((LinkageError) th);
        }
    }

    public static final String Z(n92 n92Var) {
        Object ajbVar;
        if (n92Var instanceof rg3) {
            return ((rg3) n92Var).toString();
        }
        try {
            ajbVar = n92Var + '@' + I(n92Var);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        if (bjb.b(ajbVar) != null) {
            ajbVar = n92Var.getClass().getName() + '@' + I(n92Var);
        }
        return (String) ajbVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x01ff  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.dsd r31, defpackage.x45 r32, defpackage.r28 r33, defpackage.zz3 r34, defpackage.k54 r35, defpackage.b55 r36, defpackage.mz1 r37, defpackage.x12 r38, int r39) {
        /*
            Method dump skipped, instruction units count: 1390
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv2.a(dsd, x45, r28, zz3, k54, b55, mz1, x12, int):void");
    }

    public static final xe3 a0(int i2) {
        Integer numValueOf = Integer.valueOf(i2);
        if (i2 <= 0) {
            numValueOf = null;
        }
        if (numValueOf == null) {
            return ve3.a;
        }
        int iIntValue = numValueOf.intValue();
        ue3.a(iIntValue);
        return new ue3(iIntValue);
    }

    public static final void b(boolean z, r28 r28Var, zz3 zz3Var, k54 k54Var, String str, mz1 mz1Var, x12 x12Var, int i2) {
        r28 r28Var2;
        zz3 zz3Var2;
        k54 k54Var2;
        String str2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1799879339);
        int i3 = i2 | (p65Var.g(z) ? 32 : 16) | 224640;
        if (p65Var.P(i3 & 1, (599185 & i3) != 599184)) {
            zz3 zz3VarA = sz3.c(null, 3).a(sz3.b(null, 15));
            k54 k54VarA = sz3.d(null, 3).a(sz3.g(null, 15));
            dsd dsdVarT0 = k40.T0(Boolean.valueOf(z), "AnimatedVisibility", p65Var, ((i3 >> 3) & 14) | 48, 0);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = fn.r;
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            o28 o28Var = o28.b;
            e(dsdVarT0, x45Var, o28Var, zz3VarA, k54VarA, mz1Var, p65Var, 224688);
            zz3Var2 = zz3VarA;
            k54Var2 = k54VarA;
            str2 = "AnimatedVisibility";
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            zz3Var2 = zz3Var;
            k54Var2 = k54Var;
            str2 = str;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jw(z, r28Var2, zz3Var2, k54Var2, str2, mz1Var, i2);
        }
    }

    public static final float b0(xe3 xe3Var, m73 m73Var) {
        m73Var.getClass();
        int i2 = xe3Var instanceof ue3 ? ((ue3) xe3Var).a : 0;
        Integer numValueOf = Integer.valueOf(i2);
        if (i2 == 0) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            return m73Var.N(numValueOf.intValue());
        }
        return Float.NaN;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:75:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(boolean r16, defpackage.r28 r17, defpackage.zz3 r18, defpackage.k54 r19, java.lang.String r20, defpackage.mz1 r21, defpackage.x12 r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 309
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv2.c(boolean, r28, zz3, k54, java.lang.String, mz1, x12, int, int):void");
    }

    public static String c0(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }

    public static final void d(boolean z, r28 r28Var, zz3 zz3Var, k54 k54Var, String str, x12 x12Var, int i2) {
        r28 r28Var2;
        String str2;
        mz1 mz1Var = gx1.i;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(234057107);
        int i3 = i2 | (p65Var.g(z) ? 32 : 16) | 196992;
        if (p65Var.P(i3 & 1, (599185 & i3) != 599184)) {
            dsd dsdVarT0 = k40.T0(Boolean.valueOf(z), "AnimatedVisibility", p65Var, ((i3 >> 3) & 14) | 48, 0);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = fn.q;
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            e(dsdVarT0, (x45) objM, o28Var, zz3Var, k54Var, mz1Var, p65Var, 224688);
            str2 = "AnimatedVisibility";
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            str2 = str;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iw(z, r28Var2, zz3Var, k54Var, str2, i2);
        }
    }

    public static LinkedHashMap d0(bv2 bv2Var, Map map, String str, String str2, int i2) {
        int i3;
        int i4;
        f09 f09Var;
        String str3 = (i2 & 2) != 0 ? null : str;
        String str4 = (i2 & 4) != 0 ? null : str2;
        if (str3 != null) {
            int i5 = 0;
            for (int i6 = 0; i6 < str3.length(); i6++) {
                if (str3.charAt(i6) == '.') {
                    i5++;
                }
            }
            i3 = i5 + 1;
        } else {
            i3 = 0;
        }
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : map.entrySet()) {
            if (entry.getKey() == null) {
                f49.K(bv2Var.a, d66.ERROR, e66.USER, new av2(entry, 0), null, false, 56);
                f09Var = null;
            } else {
                entry.getKey();
                String str5 = (String) entry.getKey();
                ArrayList arrayList2 = new ArrayList(str5.length());
                int i7 = 0;
                int i8 = i3;
                while (true) {
                    i4 = 9;
                    if (i7 >= str5.length()) {
                        break;
                    }
                    char cCharAt = str5.charAt(i7);
                    if (cCharAt == '.' && (i8 = i8 + 1) > 9) {
                        cCharAt = '_';
                    }
                    arrayList2.add(Character.valueOf(cCharAt));
                    i7++;
                }
                char[] cArr = new char[arrayList2.size()];
                Iterator it2 = arrayList2.iterator();
                int i9 = 0;
                while (it2.hasNext()) {
                    cArr[i9] = ((Character) it2.next()).charValue();
                    i9++;
                }
                String str6 = new String(cArr);
                if (!str6.equals(entry.getKey())) {
                    f49.K(bv2Var.a, d66.WARN, e66.USER, new cn(entry, i4, str6), null, false, 56);
                }
                f09Var = new f09(str6, entry.getValue());
            }
            if (f09Var != null) {
                arrayList.add(f09Var);
            }
        }
        int size = arrayList.size() - 128;
        if (size > 0) {
            f49.K(bv2Var.a, d66.WARN, e66.USER, new hm0(str4 != null ? ho2.C(size, "Too many attributes were added for [", str4, "], ", " had to be discarded.") : ev6.w("Too many attributes were added, ", size, " had to be discarded."), 10), null, false, 56);
        }
        List listG1 = bu1.g1(arrayList, 128);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ei7.X(listG1, linkedHashMap);
        return linkedHashMap;
    }

    public static final void e(dsd dsdVar, x45 x45Var, r28 r28Var, zz3 zz3Var, k54 k54Var, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        zz3 zz3Var2;
        k54 k54Var2;
        mz1 mz1Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1706321816);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dsdVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            zz3Var2 = zz3Var;
            i3 |= p65Var.f(zz3Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            zz3Var2 = zz3Var;
        }
        if ((i2 & 24576) == 0) {
            k54Var2 = k54Var;
            i3 |= p65Var.f(k54Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            k54Var2 = k54Var;
        }
        if ((i2 & 196608) == 0) {
            mz1Var2 = mz1Var;
            i3 |= p65Var.h(mz1Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            mz1Var2 = mz1Var;
        }
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i3 & 14;
            boolean z = (i4 == 32) | (i5 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new kw(x45Var, dsdVar);
                p65Var.j0(objM);
            }
            r28 r28VarM = dm2.M(r28Var, (c55) objM);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = cu.j;
                p65Var.j0(objM2);
            }
            a(dsdVar, x45Var, r28VarM, zz3Var2, k54Var2, (b55) objM2, mz1Var2, p65Var, 196608 | i5 | i4 | (i3 & 7168) | (57344 & i3) | ((i3 << 6) & 29360128));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fv(dsdVar, x45Var, r28Var, zz3Var, k54Var, mz1Var, i2);
        }
    }

    public static final Bundle e0(String str) {
        Bundle bundle = new Bundle();
        bundle.putString("com.google.android.libraries.identity.googleid.siwg.BUNDLE_KEY_SERVER_CLIENT_ID", str);
        bundle.putString("com.google.android.libraries.identity.googleid.siwg.BUNDLE_KEY_NONCE", null);
        bundle.putString("com.google.android.libraries.identity.googleid.siwg.BUNDLE_KEY_HOSTED_DOMAIN_FILTER", null);
        bundle.putBoolean("com.google.android.libraries.identity.googleid.siwg.BUNDLE_KEY_AUTO_SELECT_ENABLED", true);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_GOOGLE_ID_TOKEN_SUBTYPE", "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_SIWG_CREDENTIAL");
        return bundle;
    }

    public static final void f(x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1093683515);
        int i3 = 22;
        if (p65Var2.P(i2 & 1, i2 != 0)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var2);
                p65Var2.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            w7c w7cVar = w7c.Hidden;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new be7(3);
                p65Var2.j0(objM2);
            }
            v7c v7cVarJ = o7f.J(w7cVar, (x45) objM2, p65Var2, 438, 0);
            mx0 mx0VarI = o7f.I(v7cVarJ, p65Var2, 2);
            mz1 mz1Var = m40.e;
            boolean zH = p65Var2.h(sb2Var) | p65Var2.f(v7cVarJ);
            Object objM3 = p65Var2.M();
            if (zH || objM3 == uobVar) {
                objM3 = new dx0(sb2Var, v7cVarJ, 5);
                p65Var2.j0(objM3);
            }
            p65Var = p65Var2;
            i(mz1Var, o28.b, null, mx0VarI, 0.0f, null, 0L, 0L, 0.0f, (m45) objM3, null, false, null, null, 0L, 0L, pxf.E(1076660085, new g64(sb2Var, i3, v7cVarJ), p65Var2), p65Var, 54, 12582912, 130036);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new p44(i2, 22);
        }
    }

    public static void f0(long[] jArr, long[] jArr2, long[] jArr3) {
        for (int i2 = 0; i2 < 10; i2++) {
            jArr[i2] = jArr2[i2] + jArr3[i2];
        }
    }

    public static final void g(ui9 ui9Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1765020594);
        int i3 = (p65Var.d(R.string.view_list) ? 4 : 2) | i2 | (p65Var.h(ui9Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28Var2 = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), jfc.d(r28Var2, 1.0f), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(r28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            fo7.j(ui9Var, vo7.R(p65Var, R.string.view_list), xn7.M, w2g.F(r28Var2, 24.0f, 24.0f, 24.0f, 32.0f), false, null, p65Var, ((i3 >> 3) & 14) | 3456, 48);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(ui9Var, r28Var2, i2, 24);
        }
    }

    public static void g0(long[] jArr, long[] jArr2, long[] jArr3) {
        for (int i2 = 0; i2 < 10; i2++) {
            jArr[i2] = jArr2[i2] - jArr3[i2];
        }
    }

    public static final void h(Object obj, int i2, du6 du6Var, mz1 mz1Var, x12 x12Var, int i3) {
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(872548579);
        if ((i3 & 6) == 0) {
            i4 = (p65Var.h(obj) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var.d(i2) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.h(du6Var) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i4 |= p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            boolean zF = p65Var.f(obj) | p65Var.f(du6Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new cu6(obj, du6Var);
                p65Var.j0(objM);
            }
            cu6 cu6Var = (cu6) objM;
            cu6Var.c = i2;
            k49 k49Var = cu6Var.g;
            sn3 sn3Var = q99.a;
            cu6 cu6Var2 = (cu6) p65Var.j(sn3Var);
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                if (cu6Var2 != ((cu6) k49Var.getValue())) {
                    k49Var.setValue(cu6Var2);
                    if (cu6Var.d > 0) {
                        cu6 cu6Var3 = cu6Var.e;
                        if (cu6Var3 != null) {
                            cu6Var3.b();
                        }
                        if (cu6Var2 != null) {
                            cu6Var2.a();
                        } else {
                            cu6Var2 = null;
                        }
                        cu6Var.e = cu6Var2;
                    }
                }
                vn7.T(oicVarA, oicVarG, x45VarE);
                boolean zF2 = p65Var.f(cu6Var);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    objM2 = new ff4(18, cu6Var);
                    p65Var.j0(objM2);
                }
                kyd.h(cu6Var, (x45) objM2, p65Var);
                k40.c(sn3Var.a(cu6Var), mz1Var, p65Var, ((i4 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
            } catch (Throwable th) {
                vn7.T(oicVarA, oicVarG, x45VarE);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(obj, i2, du6Var, mz1Var, i3, 5);
        }
    }

    public static void h0(long[] jArr, long[] jArr2) {
        int length = jArr.length;
        if (length != 19) {
            long[] jArr3 = new long[19];
            System.arraycopy(jArr, 0, jArr3, 0, length);
            jArr = jArr3;
        }
        long j2 = jArr[8];
        long j3 = jArr[18];
        long j4 = j2 + (j3 << 4);
        jArr[8] = j4;
        long j5 = j3 + j3 + j4;
        jArr[8] = j5;
        jArr[8] = j5 + j3;
        long j6 = jArr[7];
        long j7 = jArr[17];
        long j8 = j6 + (j7 << 4);
        jArr[7] = j8;
        long j9 = j7 + j7 + j8;
        jArr[7] = j9;
        jArr[7] = j9 + j7;
        long j10 = jArr[6];
        long j11 = jArr[16];
        long j12 = j10 + (j11 << 4);
        jArr[6] = j12;
        long j13 = j11 + j11 + j12;
        jArr[6] = j13;
        jArr[6] = j13 + j11;
        long j14 = jArr[5];
        long j15 = jArr[15];
        long j16 = j14 + (j15 << 4);
        jArr[5] = j16;
        long j17 = j15 + j15 + j16;
        jArr[5] = j17;
        jArr[5] = j17 + j15;
        long j18 = jArr[4];
        long j19 = jArr[14];
        long j20 = j18 + (j19 << 4);
        jArr[4] = j20;
        long j21 = j19 + j19 + j20;
        jArr[4] = j21;
        jArr[4] = j21 + j19;
        long j22 = jArr[3];
        long j23 = jArr[13];
        long j24 = j22 + (j23 << 4);
        jArr[3] = j24;
        long j25 = j23 + j23 + j24;
        jArr[3] = j25;
        jArr[3] = j25 + j23;
        long j26 = jArr[2];
        long j27 = jArr[12];
        long j28 = j26 + (j27 << 4);
        jArr[2] = j28;
        long j29 = j27 + j27 + j28;
        jArr[2] = j29;
        jArr[2] = j29 + j27;
        long j30 = jArr[1];
        long j31 = jArr[11];
        long j32 = j30 + (j31 << 4);
        jArr[1] = j32;
        long j33 = j31 + j31 + j32;
        jArr[1] = j33;
        jArr[1] = j33 + j31;
        long j34 = jArr[0];
        long j35 = jArr[10];
        long j36 = j34 + (j35 << 4);
        jArr[0] = j36;
        long j37 = j35 + j35 + j36;
        jArr[0] = j37;
        jArr[0] = j37 + j35;
        i0(jArr);
        System.arraycopy(jArr, 0, jArr2, 0, 10);
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:79:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void i(final defpackage.mz1 r28, final defpackage.r28 r29, defpackage.r28 r30, final defpackage.mx0 r31, float r32, defpackage.m3c r33, long r34, long r36, float r38, final defpackage.m45 r39, defpackage.b55 r40, boolean r41, defpackage.b55 r42, defpackage.c55 r43, long r44, long r46, final defpackage.mz1 r48, defpackage.x12 r49, final int r50, final int r51, final int r52) {
        /*
            Method dump skipped, instruction units count: 512
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv2.i(mz1, r28, r28, mx0, float, m3c, long, long, float, m45, b55, boolean, b55, c55, long, long, mz1, x12, int, int, int):void");
    }

    public static void i0(long[] jArr) {
        jArr[10] = 0;
        int i2 = 0;
        while (i2 < 10) {
            long j2 = jArr[i2];
            long j3 = j2 / 67108864;
            jArr[i2] = j2 - (j3 << 26);
            int i3 = i2 + 1;
            long j4 = jArr[i3] + j3;
            jArr[i3] = j4;
            long j5 = j4 / 33554432;
            jArr[i3] = j4 - (j5 << 25);
            i2 += 2;
            jArr[i2] = jArr[i2] + j5;
        }
        long j6 = jArr[0];
        long j7 = jArr[10];
        long j8 = j6 + (j7 << 4);
        jArr[0] = j8;
        long j9 = j7 + j7 + j8;
        jArr[0] = j9;
        long j10 = j9 + j7;
        jArr[0] = j10;
        jArr[10] = 0;
        long j11 = j10 / 67108864;
        jArr[0] = j10 - (j11 << 26);
        jArr[1] = jArr[1] + j11;
    }

    public static final xpc j(Object obj) {
        if (obj == null) {
            obj = flb.i;
        }
        return new xpc(obj);
    }

    public static void j0(long[] jArr, long[] jArr2, long[] jArr3) {
        long j2 = jArr2[0];
        long j3 = jArr3[0];
        long j4 = j2 * j3;
        long j5 = jArr3[1];
        long j6 = jArr2[1];
        long j7 = (j6 * j3) + (j2 * j5);
        long j8 = jArr3[2];
        long j9 = jArr2[2];
        long j10 = ((j6 + j6) * j5) + (j2 * j8) + (j9 * j3);
        long j11 = jArr3[3];
        long j12 = jArr2[3];
        long j13 = (j6 * j8) + (j9 * j5) + (j2 * j11) + (j12 * j3);
        long j14 = jArr3[4];
        long j15 = jArr2[4];
        long j16 = (j6 * j11) + (j12 * j5);
        long j17 = j16 + j16 + (j9 * j8) + (j2 * j14) + (j15 * j3);
        long j18 = jArr3[5];
        long j19 = jArr2[5];
        long j20 = (j9 * j11) + (j12 * j8) + (j6 * j14) + (j15 * j5) + (j2 * j18) + (j19 * j3);
        long j21 = jArr3[6];
        long j22 = jArr2[6];
        long j23 = (j12 * j11) + (j6 * j18) + (j19 * j5);
        long j24 = j23 + j23 + (j9 * j14) + (j15 * j8) + (j2 * j21) + (j22 * j3);
        long j25 = jArr3[7];
        long j26 = jArr2[7];
        long j27 = (j12 * j14) + (j15 * j11) + (j9 * j18) + (j19 * j8) + (j6 * j21) + (j22 * j5) + (j2 * j25) + (j26 * j3);
        long j28 = jArr3[8];
        long j29 = jArr2[8];
        long j30 = (j12 * j18) + (j19 * j11) + (j6 * j25) + (j26 * j5);
        long j31 = j30 + j30 + (j15 * j14) + (j9 * j21) + (j22 * j8) + (j2 * j28) + (j29 * j3);
        long j32 = jArr3[9];
        long j33 = jArr2[9];
        long j34 = (j15 * j18) + (j19 * j14) + (j12 * j21) + (j22 * j11) + (j9 * j25) + (j26 * j8) + (j6 * j28) + (j29 * j5) + (j2 * j32) + (j3 * j33);
        long j35 = (j19 * j18) + (j12 * j25) + (j26 * j11) + (j6 * j32) + (j5 * j33);
        long j36 = (j19 * j25) + (j26 * j18) + (j12 * j32) + (j11 * j33);
        long j37 = (j26 * j25) + (j19 * j32) + (j18 * j33);
        long j38 = (j26 * j28) + (j29 * j25) + (j22 * j32) + (j21 * j33);
        long j39 = (j25 * j33) + (j26 * j32);
        h0(new long[]{j4, j7, j10, j13, j17, j20, j24, j27, j31, j34, j35 + j35 + (j15 * j21) + (j22 * j14) + (j9 * j28) + (j29 * j8), (j19 * j21) + (j22 * j18) + (j15 * j25) + (j26 * j14) + (j12 * j28) + (j29 * j11) + (j9 * j32) + (j8 * j33), j36 + j36 + (j22 * j21) + (j15 * j28) + (j29 * j14), (j22 * j25) + (j26 * j21) + (j19 * j28) + (j29 * j18) + (j15 * j32) + (j14 * j33), j37 + j37 + (j22 * j28) + (j29 * j21), j38, j39 + j39 + (j29 * j28), (j28 * j33) + (j29 * j32), (j33 + j33) * j32}, jArr);
    }

    public static final void k(sca scaVar, obe obeVar, qca qcaVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        uob uobVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-761967798);
        int i4 = i2 | (p65Var2.f(scaVar) ? 4 : 2) | (p65Var2.f(obeVar) ? 32 : 16) | (p65Var2.f(qcaVar) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            boolean z = scaVar.c;
            int i5 = i4 & 896;
            boolean z2 = i5 == 256;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                i3 = i5;
                uobVar = uobVar2;
                c9a c9aVar = new c9a(0, qcaVar, qca.class, "refresh", "refresh()V", 0, 4);
                p65Var2.j0(c9aVar);
                objM = c9aVar;
            } else {
                i3 = i5;
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(280899324, new gx4(kv6VarA, scaVar, obeVar, 19), p65Var2), p65Var2, (i4 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            int i6 = i3;
            boolean zF = p65Var.f(kv6VarA) | (i6 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            uob uobVar3 = uobVar;
            if (zF || objM2 == uobVar3) {
                objM2 = new nx9(kv6VarA, qcaVar, n92Var, 7);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            boolean z3 = i6 == 256;
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar3) {
                objM3 = new lo5(qcaVar, n92Var, 22);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 24, r28Var, (Object) scaVar, (Object) obeVar, (Object) qcaVar);
        }
    }

    public static void k0(long[] jArr, long[] jArr2) {
        long j2 = jArr2[0];
        long j3 = j2 * j2;
        long j4 = jArr2[1];
        long j5 = (j2 + j2) * j4;
        long j6 = jArr2[2];
        long j7 = (j2 * j6) + (j4 * j4);
        long j8 = jArr2[3];
        long j9 = (j2 * j8) + (j4 * j6);
        long j10 = jArr2[4];
        long j11 = (j6 * j6) + (j4 * 4 * j8) + ((j2 + j2) * j10);
        long j12 = jArr2[5];
        long j13 = (j6 * j8) + (j4 * j10) + (j2 * j12);
        long j14 = jArr2[6];
        long j15 = (j8 * j8) + (j6 * j10) + (j2 * j14) + ((j4 + j4) * j12);
        long j16 = jArr2[7];
        long j17 = (j8 * j10) + (j6 * j12) + (j4 * j14) + (j2 * j16);
        long j18 = jArr2[8];
        long j19 = (j8 * j12) + (j4 * j16);
        long j20 = j19 + j19 + (j6 * j14) + (j2 * j18);
        long j21 = j20 + j20 + (j10 * j10);
        long j22 = jArr2[9];
        long j23 = (j10 * j12) + (j8 * j14) + (j6 * j16) + (j4 * j18) + (j2 * j22);
        long j24 = (j4 * j22) + (j8 * j16);
        long j25 = j24 + j24 + (j12 * j12) + (j10 * j14) + (j6 * j18);
        long j26 = (j12 * j14) + (j10 * j16) + (j8 * j18) + (j6 * j22);
        long j27 = (j8 * j22) + (j12 * j16);
        long j28 = j27 + j27 + (j10 * j18);
        long j29 = j28 + j28 + (j14 * j14);
        long j30 = (j14 * j16) + (j12 * j18) + (j10 * j22);
        long j31 = (j16 * j16) + (j14 * j18) + ((j12 + j12) * j22);
        long j32 = (j14 * j22) + (j16 * j18);
        h0(new long[]{j3, j5, j7 + j7, j9 + j9, j11, j13 + j13, j15 + j15, j17 + j17, j21, j23 + j23, j25 + j25, j26 + j26, j29, j30 + j30, j31 + j31, j32 + j32, (j16 * 4 * j22) + (j18 * j18), (j18 + j18) * j22, (j22 + j22) * j22}, jArr);
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1014350963);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            gq7.a(iy0.a.a(o28Var, ar0Var), null, vo7.R(p65Var, R.string.publication_editors_empty_state_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 8);
        }
    }

    public static long[] l0(byte[] bArr) {
        long[] jArr = new long[10];
        for (int i2 = 0; i2 < 10; i2++) {
            int i3 = o[i2];
            int i4 = bArr[i3] & 255;
            int i5 = bArr[i3 + 1] & 255;
            long j2 = ((long) i4) | (((long) i5) << 8);
            jArr[i2] = (((j2 | (((long) (bArr[i3 + 2] & 255)) << 16)) | (((long) (bArr[i3 + 3] & 255)) << 24)) >> p[i2]) & ((long) q[i2 & 1]);
        }
        return jArr;
    }

    public static final void m(uca ucaVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(777192668);
        int i3 = (p65Var.f(ucaVar) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(ucaVar.a, null, null, null, null, null, null, null, p65Var, 0, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(ucaVar, r28Var, i2, 24);
        }
    }

    public static byte[] m0(long[] jArr) {
        long j2;
        int[] iArr;
        int i2;
        int[] iArr2;
        long[] jArrCopyOf = Arrays.copyOf(jArr, 10);
        int i3 = 0;
        int i4 = 0;
        while (true) {
            j2 = 19;
            iArr = r;
            if (i4 >= 2) {
                break;
            }
            int i5 = 0;
            while (i5 < 9) {
                long j3 = jArrCopyOf[i5];
                int i6 = iArr[i5 & 1];
                int i7 = -((int) (((j3 >> 31) & j3) >> i6));
                jArrCopyOf[i5] = j3 + ((long) (i7 << i6));
                i5++;
                jArrCopyOf[i5] = jArrCopyOf[i5] - ((long) i7);
            }
            long j4 = jArrCopyOf[9];
            int i8 = -((int) (((j4 >> 31) & j4) >> 25));
            jArrCopyOf[9] = j4 + ((long) (i8 << 25));
            jArrCopyOf[0] = jArrCopyOf[0] - (((long) i8) * 19);
            i4++;
        }
        long j5 = jArrCopyOf[0];
        int i9 = -((int) (((j5 >> 31) & j5) >> 26));
        jArrCopyOf[0] = j5 + ((long) (i9 << 26));
        jArrCopyOf[1] = jArrCopyOf[1] - ((long) i9);
        int i10 = 0;
        while (true) {
            iArr2 = q;
            if (i10 >= 2) {
                break;
            }
            int i11 = i3;
            while (i11 < 9) {
                long j6 = jArrCopyOf[i11];
                int i12 = i11 & 1;
                int i13 = i3;
                long j7 = j6 >> iArr[i12];
                jArrCopyOf[i11] = ((long) iArr2[i12]) & j6;
                i11++;
                jArrCopyOf[i11] = jArrCopyOf[i11] + ((long) ((int) j7));
                i3 = i13;
                i10 = i10;
                j2 = j2;
            }
            i10++;
        }
        int i14 = i3;
        long j8 = jArrCopyOf[9];
        jArrCopyOf[9] = j8 & 33554431;
        jArrCopyOf[i14] = (((long) ((int) (j8 >> 25))) * j2) + jArrCopyOf[i14];
        int i15 = ~((((int) r4) - 67108845) >> 31);
        for (int i16 = 1; i16 < 10; i16++) {
            int i17 = ~(((int) jArrCopyOf[i16]) ^ iArr2[i16 & 1]);
            int i18 = i17 & (i17 << 16);
            int i19 = i18 & (i18 << 8);
            int i20 = i19 & (i19 << 4);
            int i21 = i20 & (i20 << 2);
            i15 &= (i21 & (i21 + i21)) >> 31;
        }
        jArrCopyOf[i14] = jArrCopyOf[i14] - ((long) (67108845 & i15));
        long j9 = 33554431 & i15;
        jArrCopyOf[1] = jArrCopyOf[1] - j9;
        for (i2 = 2; i2 < 10; i2 += 2) {
            jArrCopyOf[i2] = jArrCopyOf[i2] - ((long) (67108863 & i15));
            int i22 = i2 + 1;
            jArrCopyOf[i22] = jArrCopyOf[i22] - j9;
        }
        for (int i23 = i14; i23 < 10; i23++) {
            jArrCopyOf[i23] = jArrCopyOf[i23] << p[i23];
        }
        byte[] bArr = new byte[32];
        for (int i24 = i14; i24 < 10; i24++) {
            int i25 = o[i24];
            long j10 = bArr[i25];
            long j11 = jArrCopyOf[i24];
            bArr[i25] = (byte) (j10 | (j11 & 255));
            bArr[i25 + 1] = (byte) (((long) bArr[r5]) | ((j11 >> 8) & 255));
            bArr[i25 + 2] = (byte) (((long) bArr[r5]) | ((j11 >> 16) & 255));
            bArr[i25 + 3] = (byte) (((long) bArr[r4]) | ((j11 >> 24) & 255));
        }
        return bArr;
    }

    public static final void n(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1606914276);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(m40.V(r28Var, p65Var, i3 & 14), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(282379903);
            for (int i7 = 0; i7 < 10; i7++) {
                imc.b(0, 0L, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 9);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(defpackage.wca r22, defpackage.nhc r23, defpackage.qca r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv2.o(wca, nhc, qca, obe, r28, x12, int, int):void");
    }

    public static final void p(String str, String str2, my6 my6Var, r28 r28Var, dda ddaVar, x12 x12Var, int i2) {
        dda ddaVar2;
        int i3;
        dda ddaVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2137252792);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(my6Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 9);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-57345);
                    ddaVar3 = (dda) to7.z(n1b.a.b(dda.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                ddaVar3 = ddaVar;
            }
            p65Var.q();
            nhc nhcVarF = mk7.F(p65Var);
            l78 l78VarZ = guc.z(ddaVar3.l, p65Var, 0);
            qca qcaVar = new qca(my6Var, ddaVar3);
            gg5 gg5Var = new gg5(ddaVar3, 27, my6Var);
            o((wca) l78VarZ.getValue(), nhcVarF, qcaVar, gg5Var, r28Var, p65Var, (i3 << 3) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH = p65Var.h(ddaVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(gg5Var);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                uk8 uk8Var = new uk8(ddaVar3, nhcVarF, sb2Var, resources, gg5Var, (n92) null, 10);
                p65Var.j0(uk8Var);
                objM3 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            ddaVar2 = ddaVar3;
        } else {
            p65Var.S();
            ddaVar2 = ddaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) my6Var, r28Var, (que) ddaVar2, i2, 12);
        }
    }

    public static final void q(int i2, x12 x12Var, m45 m45Var, r28 r28Var, boolean z) {
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(861929882);
        int i3 = (p65Var.g(z) ? 4 : 2) | i2 | (p65Var.h(m45Var) ? 32 : 16);
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            z2 = z;
            c(z2, r28Var.b(jfc.c), null, null, null, pxf.E(-1383355790, new tn7(yi2.N(p65Var), m45Var), p65Var), p65Var, (i3 & 14) | 196608, 28);
        } else {
            z2 = z;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hs(z2, m45Var, r28Var, i2);
        }
    }

    public static final void r(m45 m45Var, r28 r28Var, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1496930715);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(mz1Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            f49.l(m45Var, bgf.N(new dr5(z46.r), "close"), false, null, null, m40.d, p65Var, (i3 & 14) | 1572864, 60);
            mz1Var.f(xv1.a, p65Var, Integer.valueOf(((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i2, 3, m45Var, r28Var, mz1Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(java.lang.String r19, defpackage.m45 r20, defpackage.r28 r21, java.lang.String r22, java.lang.String r23, defpackage.m45 r24, java.lang.String r25, defpackage.m45 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 304
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv2.s(java.lang.String, m45, r28, java.lang.String, java.lang.String, m45, java.lang.String, m45, x12, int, int):void");
    }

    public static final z36 t(String str, String str2) {
        z36 z36Var = new z36();
        z36Var.b = x36.AnrReport;
        Context contextA = f94.a();
        String str3 = null;
        try {
            PackageInfo packageInfo = contextA.getPackageManager().getPackageInfo(contextA.getPackageName(), 0);
            if (packageInfo != null) {
                str3 = packageInfo.versionName;
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
        z36Var.d = str3;
        z36Var.e = str;
        z36Var.f = str2;
        Long lValueOf = Long.valueOf(System.currentTimeMillis() / 1000);
        z36Var.g = lValueOf;
        StringBuffer stringBuffer = new StringBuffer("anr_log_");
        stringBuffer.append(String.valueOf(lValueOf));
        stringBuffer.append(".json");
        String string = stringBuffer.toString();
        string.getClass();
        z36Var.a = string;
        return z36Var;
    }

    public static final z36 u(Throwable th, x36 x36Var) {
        PackageInfo packageInfo;
        x36Var.getClass();
        z36 z36Var = new z36();
        z36Var.b = x36Var;
        Context contextA = f94.a();
        Throwable th2 = null;
        try {
            packageInfo = contextA.getPackageManager().getPackageInfo(contextA.getPackageName(), 0);
        } catch (PackageManager.NameNotFoundException unused) {
        }
        String str = packageInfo == null ? null : packageInfo.versionName;
        z36Var.d = str;
        z36Var.e = th.getCause() == null ? th.toString() : String.valueOf(th.getCause());
        JSONArray jSONArray = new JSONArray();
        while (th != null && th != th2) {
            StackTraceElement[] stackTrace = th.getStackTrace();
            stackTrace.getClass();
            for (StackTraceElement stackTraceElement : stackTrace) {
                jSONArray.put(stackTraceElement.toString());
            }
            th2 = th;
            th = th.getCause();
        }
        z36Var.f = jSONArray.toString();
        Long lValueOf = Long.valueOf(System.currentTimeMillis() / 1000);
        z36Var.g = lValueOf;
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(x36Var.getLogPrefix());
        stringBuffer.append(String.valueOf(lValueOf));
        stringBuffer.append(".json");
        String string = stringBuffer.toString();
        string.getClass();
        z36Var.a = string;
        return z36Var;
    }

    public static final g83 v(View view) {
        Context context = view.getContext();
        Context baseContext = context;
        while (baseContext instanceof ContextWrapper) {
            if ((baseContext instanceof Activity) || (baseContext instanceof InputMethodService) || (baseContext instanceof Application)) {
                break;
            }
            ContextWrapper contextWrapper = (ContextWrapper) baseContext;
            if (contextWrapper.getBaseContext() == null) {
                break;
            }
            baseContext = contextWrapper.getBaseContext();
        }
        baseContext = null;
        if (baseContext == null) {
            Configuration configuration = context.getResources().getConfiguration();
            q73 q73VarG = k40.g(context);
            long jI = pwd.i(configuration.screenWidthDp, configuration.screenHeightDp);
            long jG = ho2.g(jI, q73VarG);
            return new g83((4294967295L & ((long) ((int) Float.intBitsToFloat((int) (jG & 4294967295L))))) | (((long) ((int) Float.intBitsToFloat((int) (jG >> 32)))) << 32), jI);
        }
        m5f.a.getClass();
        l5f l5fVar = l5f.a;
        n5f n5fVar = l5f.b;
        n5fVar.getClass();
        ContextWrapper contextWrapper2 = (ContextWrapper) baseContext;
        int i2 = Build.VERSION.SDK_INT;
        k5f k5fVarB = (i2 >= 34 ? o73.b : i2 >= 30 ? zx0.b : uob.i).b(contextWrapper2, n5fVar.b);
        long jHeight = (4294967295L & ((long) k5fVarB.a().height())) | (((long) k5fVarB.a().width()) << 32);
        return new g83(jHeight, ho2.e(nk7.C0(jHeight), k40.g(baseContext)));
    }

    public static void w(Type type) {
        if ((type instanceof Class) && ((Class) type).isPrimitive()) {
            lg8.r();
        }
    }

    public static n0c x(n0c n0cVar, tn1 tn1Var, q0b q0bVar, int i2) {
        if ((i2 & 2) != 0) {
            q0bVar = null;
        }
        n0cVar.getClass();
        return new n0c((k96) n0cVar.b, q0bVar != null ? new jl1(n0cVar, tn1Var, q0bVar, 0) : (vwd) n0cVar.c, vx0.d0(yw6.NONE, new a3(n0cVar, tn1Var, false, 3)));
    }

    public static final n0c y(n0c n0cVar, ly lyVar) {
        n0cVar.getClass();
        lyVar.getClass();
        if (lyVar.isEmpty()) {
            return n0cVar;
        }
        return new n0c((k96) n0cVar.b, (vwd) n0cVar.c, vx0.d0(yw6.NONE, new a3(n0cVar, lyVar, false, 4)));
    }

    public static w3 z(Bundle bundle, h4 h4Var, String str) {
        String string;
        bundle.getClass();
        str.getClass();
        Date dateW = epe.w(bundle, "com.facebook.platform.extra.EXPIRES_SECONDS_SINCE_EPOCH", new Date(0L));
        ArrayList<String> stringArrayList = bundle.getStringArrayList("com.facebook.platform.extra.PERMISSIONS");
        String string2 = bundle.getString("com.facebook.platform.extra.ACCESS_TOKEN");
        Date dateW2 = epe.w(bundle, "com.facebook.platform.extra.EXTRA_DATA_ACCESS_EXPIRATION_TIME", new Date(0L));
        if (string2 == null || string2.length() == 0 || (string = bundle.getString("com.facebook.platform.extra.USER_ID")) == null || string.length() == 0) {
            return null;
        }
        return new w3(string2, str, string, stringArrayList, null, null, h4Var, dateW, new Date(), dateW2, bundle.getString("graph_domain"));
    }
}
