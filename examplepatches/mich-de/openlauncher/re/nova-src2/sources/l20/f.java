package l20;

import ai.r2;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.TrafficStats;
import android.webkit.MimeTypeMap;
import b90.j;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import e10.h2;
import i20.g;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kw.s3;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONObject;
import r70.k;
import r70.l;
import t70.y0;
import x80.a0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.i0;
import x80.j0;
import x80.k0;
import x80.m0;
import x80.p0;
import x80.z;

/* loaded from: classes4.dex */
public final class f extends g implements s80.d {

    /* renamed from: e, reason: collision with root package name */
    public final e0 f74628e;

    /* renamed from: f, reason: collision with root package name */
    public final Context f74629f;

    public f(e0 e0Var, Context context, String str, h2 h2Var) {
        super(e0Var, str, h2Var, "DropboxApiIntegration");
        this.f74628e = e0Var;
        this.f74629f = context;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0086 A[Catch: all -> 0x003e, TryCatch #1 {all -> 0x003e, blocks: (B:13:0x0039, B:40:0x015d, B:42:0x0167, B:44:0x016d, B:46:0x0175, B:47:0x01a3, B:20:0x0063, B:34:0x013b, B:36:0x0143, B:48:0x01a4, B:50:0x01ab, B:52:0x01bb, B:55:0x01ca, B:58:0x01d3, B:61:0x01dc, B:62:0x01e3, B:64:0x01e9, B:24:0x0080, B:26:0x0086, B:27:0x00b2, B:29:0x00b8, B:30:0x00c7, B:23:0x006b), top: B:85:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0143 A[Catch: all -> 0x003e, TryCatch #1 {all -> 0x003e, blocks: (B:13:0x0039, B:40:0x015d, B:42:0x0167, B:44:0x016d, B:46:0x0175, B:47:0x01a3, B:20:0x0063, B:34:0x013b, B:36:0x0143, B:48:0x01a4, B:50:0x01ab, B:52:0x01bb, B:55:0x01ca, B:58:0x01d3, B:61:0x01dc, B:62:0x01e3, B:64:0x01e9, B:24:0x0080, B:26:0x0086, B:27:0x00b2, B:29:0x00b8, B:30:0x00c7, B:23:0x006b), top: B:85:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x01a4 A[Catch: all -> 0x003e, TryCatch #1 {all -> 0x003e, blocks: (B:13:0x0039, B:40:0x015d, B:42:0x0167, B:44:0x016d, B:46:0x0175, B:47:0x01a3, B:20:0x0063, B:34:0x013b, B:36:0x0143, B:48:0x01a4, B:50:0x01ab, B:52:0x01bb, B:55:0x01ca, B:58:0x01d3, B:61:0x01dc, B:62:0x01e3, B:64:0x01e9, B:24:0x0080, B:26:0x0086, B:27:0x00b2, B:29:0x00b8, B:30:0x00c7, B:23:0x006b), top: B:85:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0244 A[Catch: all -> 0x01fe, TRY_LEAVE, TryCatch #0 {all -> 0x01fe, blocks: (B:76:0x0222, B:66:0x01ef, B:73:0x0204, B:75:0x0208, B:77:0x022b, B:80:0x0244, B:78:0x023a, B:79:0x0243), top: B:84:0x01ef }] */
    /* JADX WARN: Type inference failed for: r10v16 */
    /* JADX WARN: Type inference failed for: r10v19 */
    /* JADX WARN: Type inference failed for: r10v3, types: [java.util.ArrayList, java.util.Collection, java.util.Iterator, java.util.List, x80.h0] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x0137 -> B:34:0x013b). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(f fVar, List list, i20.d dVar, ContinuationImpl continuationImpl) {
        a aVar;
        f fVar2;
        String str;
        Iterator it;
        Collection collection;
        i20.d dVar2;
        JSONObject jSONObjectOptJSONObject;
        String strOptStringNull;
        Object next;
        m0 m0Var;
        h0 h0Var;
        String strString;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.C;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.C = i5 - Integer.MIN_VALUE;
                fVar2 = fVar;
            } else {
                fVar2 = fVar;
                aVar = new a(fVar2, continuationImpl);
            }
        }
        Object obj = aVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.C;
        int i12 = 1;
        String str2 = null;
        str2 = null;
        ?? r102 = 0;
        String str3 = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                ArrayList arrayListN0 = b70.g.N0(list, 100);
                ArrayList arrayList = new ArrayList();
                it = arrayListN0.iterator();
                collection = arrayList;
                dVar2 = dVar;
                if (it.hasNext()) {
                }
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    m0Var = (m0) aVar.f74602u;
                    h0Var = (h0) aVar.f74601t;
                    ResultKt.b(obj);
                    int i13 = m0Var.f95556d;
                    String str4 = m0Var.f95555c;
                    p0 p0Var = m0Var.f95559g;
                    throw new IllegalStateException("Fetching dropbox files failed, code=" + i13 + ", message=" + str4 + " [" + ((p0Var != null || (strString = p0Var.string()) == null) ? str2 : l.G1(100, strString)) + "]' from " + h0Var.f95509a);
                }
                h0 h0Var2 = aVar.f74607z;
                ArrayList arrayList2 = aVar.f74606y;
                List list2 = aVar.f74605x;
                it = aVar.f74604w;
                collection = aVar.f74603v;
                i20.d dVar3 = (i20.d) aVar.f74602u;
                f fVar3 = (f) aVar.f74601t;
                ResultKt.b(obj);
                m0 m0Var2 = (m0) obj;
                if (!m0Var2.c()) {
                    p0 p0Var2 = m0Var2.f95559g;
                    if (p0Var2 == null) {
                        throw new IllegalStateException("Fetching dropbox files returned no body");
                    }
                    JSONArray jSONArray = new JSONArray(p0Var2.string());
                    int length = jSONArray.length();
                    int i14 = 0;
                    String str5 = r102;
                    while (i14 < length) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i14);
                        String strOptStringNull2 = UtilsKt.optStringNull(jSONObject, "file");
                        if (strOptStringNull2 == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject("result")) == null || (strOptStringNull = UtilsKt.optStringNull(jSONObjectOptJSONObject, "preview_url")) == null) {
                            str = str5;
                        } else {
                            Iterator it2 = list2.iterator();
                            String str6 = str5;
                            while (true) {
                                if (!it2.hasNext()) {
                                    str = str6;
                                    next = str;
                                    break;
                                }
                                next = it2.next();
                                str = str6;
                                try {
                                    if (Intrinsics.b(((u80.a) next).f90676a, strOptStringNull2)) {
                                        break;
                                    }
                                    str6 = str;
                                } catch (Throwable th2) {
                                    th = th2;
                                    mc0.b bVar = mc0.d.f76206a;
                                    bVar.r("DropboxApiIntegration");
                                    bVar.f(th, "Failed fetching files preview urls", new Object[0]);
                                    return str;
                                }
                            }
                            u80.a aVar2 = (u80.a) next;
                            if (aVar2 != null) {
                                arrayList2.add(new u80.a(aVar2.f90676a, aVar2.f90677b, aVar2.f90678c, strOptStringNull, aVar2.f90680e));
                            }
                        }
                        i14++;
                        str5 = str;
                    }
                    b70.d.z0(arrayList2, collection);
                    dVar2 = dVar3;
                    fVar2 = fVar3;
                    str3 = str5;
                    i12 = 1;
                    if (it.hasNext()) {
                        return (List) collection;
                    }
                    list2 = (List) it.next();
                    arrayList2 = new ArrayList();
                    j0 j0Var = k0.Companion;
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("actions", new JSONArray());
                    JSONArray jSONArray2 = new JSONArray();
                    Iterator it3 = list2.iterator();
                    while (it3.hasNext()) {
                        jSONArray2.put(((u80.a) it3.next()).f90676a);
                    }
                    Unit unit = Unit.f71706a;
                    jSONObject2.put("files", jSONArray2);
                    String string = jSONObject2.toString();
                    Pattern pattern = a0.f95396e;
                    a0 a0VarA = z.a("application/json");
                    j0Var.getClass();
                    i0 i0VarA = j0.a(string, a0VarA);
                    g0 g0Var = new g0();
                    g0Var.k("https://api.dropboxapi.com/2/sharing/get_file_metadata/batch");
                    g0Var.h(i0VarA);
                    g0Var.a("Authorization", "Bearer " + dVar2.f61200a);
                    g0Var.a("Content-Type", "application/json");
                    h0 h0VarB = g0Var.b();
                    TrafficStats.setThreadStatsTag(-61081898);
                    j jVarC = fVar2.f74628e.c(h0VarB);
                    aVar.f74601t = fVar2;
                    aVar.f74602u = dVar2;
                    aVar.f74603v = collection;
                    aVar.f74604w = it;
                    aVar.f74605x = list2;
                    aVar.f74606y = arrayList2;
                    aVar.f74607z = h0VarB;
                    aVar.C = i12;
                    Object objAwait = UtilsKt.await(jVarC, aVar);
                    if (objAwait == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    dVar3 = dVar2;
                    fVar3 = fVar2;
                    h0Var2 = h0VarB;
                    obj = objAwait;
                    r102 = str3;
                    m0 m0Var22 = (m0) obj;
                    if (!m0Var22.c()) {
                        aVar.f74601t = h0Var2;
                        aVar.f74602u = m0Var22;
                        aVar.f74603v = r102;
                        aVar.f74604w = r102;
                        aVar.f74605x = r102;
                        aVar.f74606y = r102;
                        aVar.f74607z = r102;
                        aVar.C = 2;
                        if (fVar3.g(m0Var22) != coroutineSingletons) {
                            m0Var = m0Var22;
                            h0Var = h0Var2;
                            str2 = r102;
                            int i132 = m0Var.f95556d;
                            String str42 = m0Var.f95555c;
                            p0 p0Var3 = m0Var.f95559g;
                            if (p0Var3 != null) {
                            }
                            throw new IllegalStateException("Fetching dropbox files failed, code=" + i132 + ", message=" + str42 + " [" + ((p0Var3 != null || (strString = p0Var3.string()) == null) ? str2 : l.G1(100, strString)) + "]' from " + h0Var.f95509a);
                        }
                        return coroutineSingletons;
                    }
                }
            }
        } catch (Throwable th3) {
            th = th3;
            str = str2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object m(f fVar, u80.b bVar, i20.c cVar, ContinuationImpl continuationImpl) {
        b bVar2;
        u80.b bVar3;
        h0 h0Var;
        m0 m0Var;
        String strString;
        fVar.getClass();
        if (continuationImpl instanceof b) {
            bVar2 = (b) continuationImpl;
            int i5 = bVar2.f74613y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar2.f74613y = i5 - Integer.MIN_VALUE;
            } else {
                bVar2 = new b(fVar, continuationImpl);
            }
        }
        Object objAwait = bVar2.f74611w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f74613y;
        try {
            if (i11 == 0) {
                ResultKt.b(objAwait);
                j0 j0Var = k0.Companion;
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("actions", new JSONArray());
                jSONObject.put("shared_folder_id", bVar.f90686f);
                String string = jSONObject.toString();
                Pattern pattern = a0.f95396e;
                a0 a0VarA = z.a("application/json");
                j0Var.getClass();
                i0 i0VarA = j0.a(string, a0VarA);
                g0 g0Var = new g0();
                g0Var.k("https://api.dropboxapi.com/2/sharing/get_folder_metadata");
                g0Var.h(i0VarA);
                g0Var.a("Authorization", "Bearer " + cVar.f61200a);
                g0Var.a("Content-Type", "application/json");
                h0 h0VarB = g0Var.b();
                TrafficStats.setThreadStatsTag(-61081898);
                j jVarC = fVar.f74628e.c(h0VarB);
                bVar2.f74608t = fVar;
                bVar2.f74609u = bVar;
                bVar2.f74610v = h0VarB;
                bVar2.f74613y = 1;
                objAwait = UtilsKt.await(jVarC, bVar2);
                if (objAwait == coroutineSingletons) {
                    return coroutineSingletons;
                }
                bVar3 = bVar;
                h0Var = h0VarB;
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    m0Var = (m0) bVar2.f74609u;
                    h0Var = (h0) bVar2.f74608t;
                    ResultKt.b(objAwait);
                    int i12 = m0Var.f95556d;
                    String str = m0Var.f95555c;
                    p0 p0Var = m0Var.f95559g;
                    throw new IllegalStateException("Fetching dropbox files failed, code=" + i12 + ", message=" + str + " [" + ((p0Var != null || (strString = p0Var.string()) == null) ? null : l.G1(100, strString)) + "]' from " + h0Var.f95509a);
                }
                h0 h0Var2 = bVar2.f74610v;
                u80.b bVar4 = (u80.b) bVar2.f74609u;
                f fVar2 = (f) bVar2.f74608t;
                ResultKt.b(objAwait);
                h0Var = h0Var2;
                fVar = fVar2;
                bVar3 = bVar4;
            }
            m0 m0Var2 = (m0) objAwait;
            if (m0Var2.c()) {
                p0 p0Var2 = m0Var2.f95559g;
                if (p0Var2 != null) {
                    return new u80.b(bVar3.f90681a, bVar3.f90682b, bVar3.f90683c, UtilsKt.optStringNull(new JSONObject(p0Var2.string()), "preview_url"), bVar3.f90685e, bVar3.f90686f);
                }
                throw new IllegalStateException("Fetching dropbox files returned no body");
            }
            bVar2.f74608t = h0Var;
            bVar2.f74609u = m0Var2;
            bVar2.f74610v = null;
            bVar2.f74613y = 2;
            if (fVar.g(m0Var2) != coroutineSingletons) {
                m0Var = m0Var2;
                int i122 = m0Var.f95556d;
                String str2 = m0Var.f95555c;
                p0 p0Var3 = m0Var.f95559g;
                if (p0Var3 != null) {
                }
                throw new IllegalStateException("Fetching dropbox files failed, code=" + i122 + ", message=" + str2 + " [" + ((p0Var3 != null || (strString = p0Var3.string()) == null) ? null : l.G1(100, strString)) + "]' from " + h0Var.f95509a);
            }
            return coroutineSingletons;
        } catch (Throwable th2) {
            mc0.b bVar5 = mc0.d.f76206a;
            bVar5.r("DropboxApiIntegration");
            bVar5.f(th2, "Failed fetching folder preview url", new Object[0]);
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x037a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0090 A[Catch: all -> 0x0040, TRY_LEAVE, TryCatch #0 {all -> 0x0040, blocks: (B:13:0x003b, B:45:0x019f, B:47:0x01a9, B:49:0x01af, B:51:0x01b7, B:52:0x01e5, B:20:0x0061, B:39:0x017c, B:41:0x0184, B:53:0x01e6, B:55:0x01ed, B:57:0x0203, B:82:0x02ed, B:61:0x021b, B:64:0x0226, B:67:0x022f, B:71:0x0240, B:73:0x024e, B:77:0x0266, B:80:0x0284, B:81:0x02b7, B:83:0x02fb, B:86:0x030f, B:98:0x034c, B:24:0x008c, B:26:0x0090, B:30:0x00ad, B:35:0x011d, B:31:0x00f8, B:34:0x0102, B:101:0x0361, B:102:0x0379, B:87:0x0317, B:89:0x031e, B:90:0x0328, B:92:0x0330, B:94:0x033f, B:99:0x0359, B:100:0x0360, B:23:0x0069), top: B:106:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0184 A[Catch: all -> 0x0040, TryCatch #0 {all -> 0x0040, blocks: (B:13:0x003b, B:45:0x019f, B:47:0x01a9, B:49:0x01af, B:51:0x01b7, B:52:0x01e5, B:20:0x0061, B:39:0x017c, B:41:0x0184, B:53:0x01e6, B:55:0x01ed, B:57:0x0203, B:82:0x02ed, B:61:0x021b, B:64:0x0226, B:67:0x022f, B:71:0x0240, B:73:0x024e, B:77:0x0266, B:80:0x0284, B:81:0x02b7, B:83:0x02fb, B:86:0x030f, B:98:0x034c, B:24:0x008c, B:26:0x0090, B:30:0x00ad, B:35:0x011d, B:31:0x00f8, B:34:0x0102, B:101:0x0361, B:102:0x0379, B:87:0x0317, B:89:0x031e, B:90:0x0328, B:92:0x0330, B:94:0x033f, B:99:0x0359, B:100:0x0360, B:23:0x0069), top: B:106:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x01b6  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x01e6 A[Catch: all -> 0x0040, TryCatch #0 {all -> 0x0040, blocks: (B:13:0x003b, B:45:0x019f, B:47:0x01a9, B:49:0x01af, B:51:0x01b7, B:52:0x01e5, B:20:0x0061, B:39:0x017c, B:41:0x0184, B:53:0x01e6, B:55:0x01ed, B:57:0x0203, B:82:0x02ed, B:61:0x021b, B:64:0x0226, B:67:0x022f, B:71:0x0240, B:73:0x024e, B:77:0x0266, B:80:0x0284, B:81:0x02b7, B:83:0x02fb, B:86:0x030f, B:98:0x034c, B:24:0x008c, B:26:0x0090, B:30:0x00ad, B:35:0x011d, B:31:0x00f8, B:34:0x0102, B:101:0x0361, B:102:0x0379, B:87:0x0317, B:89:0x031e, B:90:0x0328, B:92:0x0330, B:94:0x033f, B:99:0x0359, B:100:0x0360, B:23:0x0069), top: B:106:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r9v24, types: [i20.d] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x0174 -> B:39:0x017c). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object n(f fVar, i20.c cVar, ContinuationImpl continuationImpl) {
        c cVar2;
        f fVar2;
        List list;
        Ref.IntRef intRef;
        List list2;
        Ref.ObjectRef objectRef;
        i20.c cVar3;
        Object obj;
        List list3;
        i0 i0VarA;
        boolean z11;
        d dVar;
        d dVar2;
        c cVar4;
        String strOptStringNull;
        CoroutineSingletons coroutineSingletons;
        String str;
        String mimeTypeFromExtension;
        i20.c cVar5;
        int i5;
        h0 h0Var;
        m0 m0Var;
        String strString;
        if (continuationImpl instanceof c) {
            cVar2 = (c) continuationImpl;
            int i11 = cVar2.C;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                cVar2.C = i11 - Integer.MIN_VALUE;
                fVar2 = fVar;
            } else {
                fVar2 = fVar;
                cVar2 = new c(fVar2, continuationImpl);
            }
        }
        Object obj2 = cVar2.A;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i12 = cVar2.C;
        try {
            if (i12 == 0) {
                ResultKt.b(obj2);
                ArrayList arrayList = new ArrayList();
                Ref.IntRef intRef2 = new Ref.IntRef();
                ArrayList arrayList2 = new ArrayList();
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                objectRef2.f71863a = new d("https://api.dropboxapi.com/2/files/list_folder", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
                list = arrayList;
                intRef = intRef2;
                list2 = arrayList2;
                objectRef = objectRef2;
                cVar3 = cVar;
                obj = objectRef.f71863a;
                if (obj != null) {
                }
            } else {
                if (i12 != 1) {
                    if (i12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    m0Var = (m0) cVar2.f74615u;
                    h0Var = (h0) cVar2.f74614t;
                    ResultKt.b(obj2);
                    int i13 = m0Var.f95556d;
                    String str2 = m0Var.f95555c;
                    p0 p0Var = m0Var.f95559g;
                    throw new IllegalStateException("Fetching dropbox files failed, code=" + i13 + ", message=" + str2 + " [" + ((p0Var != null || (strString = p0Var.string()) == null) ? null : l.G1(100, strString)) + "]' from " + h0Var.f95509a);
                }
                h0 h0Var2 = cVar2.f74620z;
                objectRef = cVar2.f74619y;
                list2 = cVar2.f74618x;
                intRef = cVar2.f74617w;
                list = cVar2.f74616v;
                ?? r92 = (i20.d) cVar2.f74615u;
                f fVar3 = (f) cVar2.f74614t;
                ResultKt.b(obj2);
                i20.c cVar6 = r92;
                m0 m0Var2 = (m0) obj2;
                if (!m0Var2.c()) {
                    p0 p0Var2 = m0Var2.f95559g;
                    if (p0Var2 == null) {
                        throw new IllegalStateException("Fetching dropbox files returned no body");
                    }
                    JSONObject jSONObject = new JSONObject(p0Var2.string());
                    JSONArray jSONArray = jSONObject.getJSONArray("entries");
                    int length = jSONArray.length();
                    int i14 = 0;
                    i20.c cVar7 = cVar6;
                    while (i14 < length) {
                        JSONObject jSONObject2 = jSONArray.getJSONObject(i14);
                        JSONArray jSONArray2 = jSONArray;
                        String strOptStringNull2 = UtilsKt.optStringNull(jSONObject2, PendingUpgradeStore.KEY_NAME);
                        if (strOptStringNull2 == null) {
                            cVar4 = cVar2;
                        } else {
                            cVar4 = cVar2;
                            String strOptStringNull3 = UtilsKt.optStringNull(jSONObject2, "id");
                            if (strOptStringNull3 != null && (strOptStringNull = UtilsKt.optStringNull(jSONObject2, "path_display")) != null) {
                                coroutineSingletons = coroutineSingletons2;
                                String strO1 = k.o1(strOptStringNull2, ".", strOptStringNull2);
                                if (strO1.length() == 0) {
                                    strO1 = null;
                                }
                                if (strO1 != null) {
                                    str = strOptStringNull2;
                                    mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(strO1);
                                } else {
                                    str = strOptStringNull2;
                                    mimeTypeFromExtension = null;
                                }
                                String str3 = mimeTypeFromExtension;
                                if (Intrinsics.b(jSONObject2.getString(".tag"), "folder")) {
                                    cVar5 = cVar7;
                                    i5 = i14;
                                    list2.add(new Pair(new Integer(intRef.f71861a + 1), strOptStringNull));
                                    String strOptStringNull4 = UtilsKt.optStringNull(jSONObject2, "shared_folder_id");
                                    if (strOptStringNull4 != null) {
                                        String packageName = fVar3.f74629f.getPackageName();
                                        v80.b.Companion.getClass();
                                        list.add(new u80.b(strOptStringNull3, str, strOptStringNull, null, "android.resource://" + packageName + "/" + v80.a.a(str3), strOptStringNull4));
                                    }
                                } else {
                                    cVar5 = cVar7;
                                    i5 = i14;
                                    String packageName2 = fVar3.f74629f.getPackageName();
                                    v80.b.Companion.getClass();
                                    list.add(new u80.a(strOptStringNull3, str, strOptStringNull, null, "android.resource://" + packageName2 + "/" + v80.a.a(str3)));
                                }
                                i14 = i5 + 1;
                                jSONArray = jSONArray2;
                                cVar2 = cVar4;
                                coroutineSingletons2 = coroutineSingletons;
                                cVar7 = cVar5;
                            }
                        }
                        coroutineSingletons = coroutineSingletons2;
                        cVar5 = cVar7;
                        i5 = i14;
                        i14 = i5 + 1;
                        jSONArray = jSONArray2;
                        cVar2 = cVar4;
                        coroutineSingletons2 = coroutineSingletons;
                        cVar7 = cVar5;
                    }
                    c cVar8 = cVar2;
                    CoroutineSingletons coroutineSingletons3 = coroutineSingletons2;
                    i20.c cVar9 = cVar7;
                    boolean z12 = jSONObject.getBoolean("has_more");
                    String strOptStringNull5 = UtilsKt.optStringNull(jSONObject, "cursor");
                    if (!z12 || strOptStringNull5 == null) {
                        z11 = true;
                        if (list2.size() > 1) {
                            b70.c.y0(list2, new r2(17));
                        }
                        Pair pair = (Pair) b70.d.G0(list2);
                        if (pair != null) {
                            int iIntValue = ((Number) pair.f71683a).intValue();
                            String str4 = (String) pair.f71684b;
                            if (iIntValue <= 3) {
                                intRef.f71861a = iIntValue;
                                dVar2 = new d("https://api.dropboxapi.com/2/files/list_folder", str4, null);
                            } else {
                                dVar2 = null;
                            }
                            dVar = dVar2;
                        } else {
                            dVar = null;
                        }
                    } else {
                        dVar = new d("https://api.dropboxapi.com/2/files/list_folder/continue", null, strOptStringNull5);
                        z11 = true;
                    }
                    objectRef.f71863a = dVar;
                    fVar2 = fVar3;
                    coroutineSingletons2 = coroutineSingletons3;
                    cVar3 = cVar9;
                    cVar2 = cVar8;
                    obj = objectRef.f71863a;
                    if (obj != null) {
                        return list;
                    }
                    String str5 = ((d) obj).f74621a;
                    String str6 = ((d) obj).f74622b;
                    String str7 = ((d) obj).f74623c;
                    if (!((d) obj).f74621a.equals("https://api.dropboxapi.com/2/files/list_folder") || str6 == null) {
                        list3 = list2;
                        if (!str5.equals("https://api.dropboxapi.com/2/files/list_folder/continue") || str7 == null) {
                            throw new IllegalStateException("Incorrect fetch data " + objectRef.f71863a);
                        }
                        j0 j0Var = k0.Companion;
                        JSONObject jSONObject3 = new JSONObject();
                        jSONObject3.put("cursor", str7);
                        String string = jSONObject3.toString();
                        Pattern pattern = a0.f95396e;
                        a0 a0VarA = z.a("application/json");
                        j0Var.getClass();
                        i0VarA = j0.a(string, a0VarA);
                    } else {
                        j0 j0Var2 = k0.Companion;
                        JSONObject jSONObject4 = new JSONObject();
                        list3 = list2;
                        jSONObject4.put("include_deleted", false);
                        jSONObject4.put("include_has_explicit_shared_members", false);
                        jSONObject4.put("include_media_info", false);
                        jSONObject4.put("include_mounted_folders", true);
                        jSONObject4.put("include_non_downloadable_files", false);
                        jSONObject4.put("path", str6);
                        jSONObject4.put("limit", 100);
                        jSONObject4.put("recursive", false);
                        String string2 = jSONObject4.toString();
                        Pattern pattern2 = a0.f95396e;
                        a0 a0VarA2 = z.a("application/json");
                        j0Var2.getClass();
                        i0VarA = j0.a(string2, a0VarA2);
                    }
                    g0 g0Var = new g0();
                    g0Var.k(str5);
                    g0Var.h(i0VarA);
                    g0Var.a("Authorization", "Bearer " + cVar3.f61200a);
                    g0Var.a("Content-Type", "application/json");
                    h0 h0VarB = g0Var.b();
                    TrafficStats.setThreadStatsTag(-61081898);
                    j jVarC = fVar2.f74628e.c(h0VarB);
                    cVar2.f74614t = fVar2;
                    cVar2.f74615u = cVar3;
                    cVar2.f74616v = list;
                    cVar2.f74617w = intRef;
                    cVar2.f74618x = list3;
                    cVar2.f74619y = objectRef;
                    cVar2.f74620z = h0VarB;
                    cVar2.C = 1;
                    Object objAwait = UtilsKt.await(jVarC, cVar2);
                    if (objAwait == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                    cVar6 = cVar3;
                    obj2 = objAwait;
                    fVar3 = fVar2;
                    h0Var2 = h0VarB;
                    list2 = list3;
                    m0 m0Var22 = (m0) obj2;
                    if (!m0Var22.c()) {
                        cVar2.f74614t = h0Var2;
                        cVar2.f74615u = m0Var22;
                        cVar2.f74616v = null;
                        cVar2.f74617w = null;
                        cVar2.f74618x = null;
                        cVar2.f74619y = null;
                        cVar2.f74620z = null;
                        cVar2.C = 2;
                        if (fVar3.g(m0Var22) != coroutineSingletons2) {
                            h0Var = h0Var2;
                            m0Var = m0Var22;
                            int i132 = m0Var.f95556d;
                            String str22 = m0Var.f95555c;
                            p0 p0Var3 = m0Var.f95559g;
                            if (p0Var3 != null) {
                            }
                            throw new IllegalStateException("Fetching dropbox files failed, code=" + i132 + ", message=" + str22 + " [" + ((p0Var3 != null || (strString = p0Var3.string()) == null) ? null : l.G1(100, strString)) + "]' from " + h0Var.f95509a);
                        }
                        return coroutineSingletons2;
                    }
                }
            }
        } catch (Throwable th2) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("DropboxApiIntegration");
            bVar.f(th2, "Failed fetching Files and Folders", new Object[0]);
            return null;
        }
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        DefaultOAuthRequest defaultOAuthRequest = new DefaultOAuthRequest("si0vmlkzr6pg1at", "https://sesame.ninja/app/auth/branch_exchange.php", "https://www.dropbox.com/oauth2/authorize?client_id=si0vmlkzr6pg1at&redirect_uri=https://sesame.ninja/app/auth/branch_exchange.php&response_type=code&token_access_type=offline", UUID.randomUUID().toString(), new String[0]);
        int i5 = LoginOauthActivity.f46279c;
        return wh.f.H(activity, defaultOAuthRequest);
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132017479);
    }

    @Override // s80.c
    public final String d() {
        return Pkgs.DROPBOX;
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new s3(this, null, 5), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        e eVar;
        f fVar;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i11 = eVar.f74627w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                eVar.f74627w = i11 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, (ContinuationImpl) continuation);
            }
        }
        e eVar2 = eVar;
        Object objJ = eVar2.f74625u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = eVar2.f74627w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                int i13 = LoginOauthActivity.f46279c;
                String strN = wh.f.N(i5, intent);
                if (strN != null && strN.length() != 0) {
                    eVar2.f74624t = this;
                    eVar2.f74627w = 1;
                    objJ = j(null, strN, Pkgs.DROPBOX, "https://sesame.ninja/app/auth/branch_exchange.php", "https://sesame.ninja/app/auth/branch_exchange.php", eVar2);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    fVar = this;
                }
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("DropboxApiIntegration");
                bVar.n("ERROR: Dropbox authorization request got response code='" + strN + "'", new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fVar = eVar2.f74624t;
            ResultKt.b(objJ);
            i20.d dVar = (i20.d) objJ;
            if (dVar == null) {
                return Boolean.FALSE;
            }
            fVar.k(dVar);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("DropboxApiIntegration");
            bVar2.f(th2, "DropboxApiIntegration", new Object[0]);
            return Boolean.FALSE;
        }
    }
}
