package n20;

import ai.r2;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.TrafficStats;
import android.net.Uri;
import b.c0;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import e10.h2;
import i20.g;
import java.io.Closeable;
import java.util.ArrayList;
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
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kw.p2;
import l1.g4;
import l10.z;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.Strs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONObject;
import r70.j;
import r70.l;
import t70.y0;
import wh.f;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.m0;
import x80.p0;

/* loaded from: classes4.dex */
public final class e extends g implements s80.d {

    /* renamed from: h, reason: collision with root package name */
    public static final Pattern f77735h = Pattern.compile(".*\\.sharepoint-df\\.com|.*\\.sharepoint\\.com");

    /* renamed from: i, reason: collision with root package name */
    public static final Pattern f77736i = Pattern.compile("^/:[xpwtvbfiu]:/[res]");

    /* renamed from: e, reason: collision with root package name */
    public final e0 f77737e;

    /* renamed from: f, reason: collision with root package name */
    public final Context f77738f;

    /* renamed from: g, reason: collision with root package name */
    public final List f77739g;

    public e(e0 e0Var, Context context, String str, h2 h2Var) {
        super(e0Var, str, h2Var, "OneDriveApiIntegration");
        this.f77737e = e0Var;
        this.f77738f = context;
        this.f77739g = ul.b.P(new b(new p2(22), new p2(23), new p2(24), new z(this, 6), new p2(25), new p2(26), new p2(27), new p2(28)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:113:0x0307, B:116:0x0319], limit reached: 155 */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0341 A[Catch: all -> 0x0153, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x0153, blocks: (B:40:0x014e, B:46:0x0162, B:57:0x01a8, B:21:0x0085, B:23:0x0089, B:131:0x0341), top: B:136:0x0085 }] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0089 A[Catch: all -> 0x0153, TRY_LEAVE, TryCatch #0 {all -> 0x0153, blocks: (B:40:0x014e, B:46:0x0162, B:57:0x01a8, B:21:0x0085, B:23:0x0089, B:131:0x0341), top: B:136:0x0085 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00f5 A[Catch: all -> 0x010d, TRY_ENTER, TryCatch #6 {all -> 0x010d, blocks: (B:31:0x00f5, B:33:0x0100, B:35:0x0106, B:39:0x0114, B:45:0x0159, B:51:0x017c, B:56:0x019f), top: B:148:0x017c }] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r10v5, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r11v4, types: [java.util.List] */
    /* JADX WARN: Unreachable blocks removed: 1, instructions: 1 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x00e3 -> B:149:0x00e7). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(e eVar, b bVar, i20.d dVar, ContinuationImpl continuationImpl) {
        d dVar2;
        e eVar2;
        Ref.LongRef longRef;
        Ref.ObjectRef objectRef;
        Ref.IntRef intRef;
        ArrayList arrayList;
        Ref.LongRef longRef2;
        ArrayList arrayList2;
        d dVar3;
        b bVar2;
        i20.d dVar4;
        Ref.LongRef longRef3;
        Closeable closeable;
        Throwable th2;
        long jContentLength;
        Object obj;
        d dVar5;
        d dVar6;
        int i5;
        JSONObject jSONObject;
        String string;
        String string2;
        String str;
        String strString;
        if (continuationImpl instanceof d) {
            dVar2 = (d) continuationImpl;
            int i11 = dVar2.E;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                dVar2.E = i11 - Integer.MIN_VALUE;
                eVar2 = eVar;
            } else {
                eVar2 = eVar;
                dVar2 = new d(eVar2, continuationImpl);
            }
        }
        Object obj2 = dVar2.C;
        Object aVar = CoroutineSingletons.f71806a;
        int i12 = dVar2.E;
        try {
            if (i12 == 0) {
                ResultKt.b(obj2);
                Ref.LongRef longRef4 = new Ref.LongRef();
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                objectRef = new Ref.ObjectRef();
                bVar.getClass();
                objectRef.f71863a = "https://graph.microsoft.com/v1.0/me/drive/root/children";
                intRef = new Ref.IntRef();
                arrayList = arrayList4;
                longRef2 = longRef4;
                arrayList2 = arrayList3;
                dVar3 = dVar2;
                bVar2 = bVar;
                dVar4 = dVar;
                if (objectRef.f71863a == null) {
                }
                return aVar;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0 h0Var = dVar2.B;
            Ref.IntRef intRef2 = dVar2.A;
            objectRef = dVar2.f77734z;
            List list = dVar2.f77733y;
            List list2 = dVar2.f77732x;
            Ref.LongRef longRef5 = dVar2.f77731w;
            i20.d dVar7 = dVar2.f77730v;
            b bVar3 = dVar2.f77729u;
            e eVar3 = dVar2.f77728t;
            ResultKt.b(obj2);
            dVar3 = dVar2;
            dVar4 = dVar7;
            longRef2 = longRef5;
            arrayList2 = list2;
            arrayList = list;
            intRef = intRef2;
            try {
                try {
                    m0 m0Var = (m0) closeable;
                    boolean zC = m0Var.c();
                    p0 p0Var = m0Var.f95559g;
                    if (!zC) {
                        if (p0Var == null) {
                            aVar = new a(null, true, longRef2.f71862a);
                            CloseableKt.a(closeable, null);
                        } else {
                            String strString2 = p0Var.string();
                            i20.d dVar8 = dVar4;
                            long j11 = longRef2.f71862a;
                            if (p0Var.contentLength() >= 0) {
                                try {
                                    jContentLength = p0Var.contentLength();
                                    obj = aVar;
                                } catch (Throwable th3) {
                                    th2 = th3;
                                    longRef3 = longRef2;
                                    try {
                                        throw th2;
                                    } catch (Throwable th4) {
                                        CloseableKt.a(closeable, th2);
                                        throw th4;
                                    }
                                }
                            } else {
                                obj = aVar;
                                jContentLength = strString2.length() * 2;
                            }
                            longRef2.f71862a = j11 + jContentLength;
                            JSONObject jSONObject2 = new JSONObject(strString2);
                            p2 p2Var = bVar3.f77716a;
                            JSONArray jSONArray = jSONObject2.getJSONArray("value");
                            if (jSONArray == null) {
                                aVar = new a(null, true, longRef2.f71862a);
                                CloseableKt.a(closeable, null);
                            } else {
                                try {
                                    try {
                                        int length = jSONArray.length();
                                        int i13 = 0;
                                        while (i13 < length) {
                                            try {
                                                jSONObject = jSONArray.getJSONObject(i13);
                                                string = jSONObject.getString(PendingUpgradeStore.KEY_NAME);
                                            } catch (Throwable th5) {
                                                th = th5;
                                                dVar6 = dVar3;
                                                i5 = length;
                                            }
                                            if (string == null) {
                                                dVar6 = dVar3;
                                                i5 = length;
                                            } else {
                                                dVar6 = dVar3;
                                                i5 = length;
                                                try {
                                                    if (!j.I0(string, ".", false) && (string2 = jSONObject.getString("webUrl")) != null) {
                                                        String str2 = (String) bVar3.f77719d.invoke(jSONObject);
                                                        Strs strs = Strs.INSTANCE;
                                                        Uri uriBuild = Uri.parse(string2);
                                                        longRef3 = longRef2;
                                                        try {
                                                            if (f77735h.matcher(String.valueOf(uriBuild.getAuthority())).matches() && !f77736i.matcher(String.valueOf(uriBuild.getPath())).matches()) {
                                                                Uri.Builder builderEncodedPath = uriBuild.buildUpon().encodedPath("/:x:/r");
                                                                for (Iterator it = uriBuild.getPathSegments().iterator(); it.hasNext(); it = it) {
                                                                    builderEncodedPath.appendPath((String) it.next());
                                                                }
                                                                uriBuild = builderEncodedPath.build();
                                                            }
                                                            String intentUri = strs.toIntentUri(new Intent("android.intent.action.VIEW", uriBuild));
                                                            Intrinsics.d(intentUri);
                                                            ExternalLink externalLink = new ExternalLink(string2, string, null, str2, intentUri, null, null, 228);
                                                            if (((Boolean) bVar3.f77720e.invoke(jSONObject)).booleanValue() && ((Boolean) bVar3.f77721f.invoke(jSONObject)).booleanValue() && (str = (String) bVar3.f77722g.invoke(jSONObject)) != null) {
                                                                arrayList.add(new Pair(new Integer(intRef.f71861a + 1), str));
                                                            }
                                                            arrayList2.add(externalLink);
                                                        } catch (Throwable th6) {
                                                            th = th6;
                                                            try {
                                                                mc0.b bVar4 = mc0.d.f76206a;
                                                                bVar4.r("OneDriveApiIntegration");
                                                                bVar4.f(th, "Failed parsing item " + jSONArray.get(i13), new Object[0]);
                                                                i13++;
                                                                dVar3 = dVar6;
                                                                length = i5;
                                                                longRef2 = longRef3;
                                                            } catch (Throwable th7) {
                                                                th = th7;
                                                                th2 = th;
                                                                throw th2;
                                                            }
                                                        }
                                                    }
                                                } catch (Throwable th8) {
                                                    th = th8;
                                                    longRef3 = longRef2;
                                                    mc0.b bVar42 = mc0.d.f76206a;
                                                    bVar42.r("OneDriveApiIntegration");
                                                    bVar42.f(th, "Failed parsing item " + jSONArray.get(i13), new Object[0]);
                                                    i13++;
                                                    dVar3 = dVar6;
                                                    length = i5;
                                                    longRef2 = longRef3;
                                                }
                                                i13++;
                                                dVar3 = dVar6;
                                                length = i5;
                                                longRef2 = longRef3;
                                            }
                                            longRef3 = longRef2;
                                            i13++;
                                            dVar3 = dVar6;
                                            length = i5;
                                            longRef2 = longRef3;
                                        }
                                        dVar5 = dVar3;
                                        longRef3 = longRef2;
                                        String str3 = (String) bVar3.f77723h.invoke(jSONObject2);
                                        if (str3 == null) {
                                            if (arrayList.size() > 1) {
                                                b70.c.y0(arrayList, new r2(25));
                                            }
                                            Pair pair = (Pair) b70.d.G0(arrayList);
                                            if (pair != null) {
                                                int iIntValue = ((Number) pair.f71683a).intValue();
                                                str3 = (String) pair.f71684b;
                                                if (iIntValue <= 2) {
                                                    intRef.f71861a = iIntValue;
                                                }
                                            }
                                            str3 = null;
                                        }
                                        objectRef.f71863a = str3;
                                        Unit unit = Unit.f71706a;
                                        CloseableKt.a(closeable, null);
                                        if (objectRef.f71863a == null) {
                                            g0 g0Var = new g0();
                                            g0Var.d();
                                            g0Var.k((String) objectRef.f71863a);
                                            g0Var.a("Authorization", "Bearer " + dVar4.f61200a);
                                            h0 h0VarB = g0Var.b();
                                            TrafficStats.setThreadStatsTag(2136968030);
                                            b90.j jVarC = eVar2.f77737e.c(h0VarB);
                                            dVar3.f77728t = eVar2;
                                            dVar3.f77729u = bVar2;
                                            dVar3.f77730v = dVar4;
                                            dVar3.f77731w = longRef2;
                                            dVar3.f77732x = arrayList2;
                                            dVar3.f77733y = arrayList;
                                            dVar3.f77734z = objectRef;
                                            dVar3.A = intRef;
                                            dVar3.B = h0VarB;
                                            dVar3.E = 1;
                                            Object objAwait = UtilsKt.await(jVarC, dVar3);
                                            if (objAwait != aVar) {
                                                bVar3 = bVar2;
                                                eVar3 = eVar2;
                                                h0Var = h0VarB;
                                                obj2 = objAwait;
                                                closeable = (Closeable) obj2;
                                                m0 m0Var2 = (m0) closeable;
                                                boolean zC2 = m0Var2.c();
                                                p0 p0Var2 = m0Var2.f95559g;
                                                if (!zC2) {
                                                    mc0.b bVar5 = mc0.d.f76206a;
                                                    bVar5.r("OneDriveApiIntegration");
                                                    int i14 = m0Var2.f95556d;
                                                    String str4 = m0Var2.f95555c;
                                                    String strG1 = (p0Var2 == null || (strString = p0Var2.string()) == null) ? null : l.G1(100, strString);
                                                    bVar5.n("Failed API request: '" + i14 + " " + str4 + " [" + strG1 + "]' from " + h0Var.f95509a, new Object[0]);
                                                    aVar = new a(null, true, longRef2.f71862a);
                                                    CloseableKt.a(closeable, null);
                                                }
                                            }
                                        } else {
                                            mc0.b bVar6 = mc0.d.f76206a;
                                            bVar6.r("OneDriveApiIntegration");
                                            bVar6.b("Finished API requests to " + objectRef.f71863a + ": got " + arrayList2.size() + " ingest packets at " + longRef2.f71862a + " bytes", new Object[0]);
                                            aVar = new a(arrayList2, false, longRef2.f71862a);
                                        }
                                    } catch (Throwable th9) {
                                        th = th9;
                                        longRef = longRef2;
                                        mc0.b bVar7 = mc0.d.f76206a;
                                        bVar7.r("OneDriveApiIntegration");
                                        bVar7.n(c0.k("Error pulling OneDrive: ", th.getMessage()), new Object[0]);
                                        return new a(null, true, longRef.f71862a);
                                    }
                                    dVar4 = dVar8;
                                    dVar3 = dVar5;
                                    bVar2 = bVar3;
                                    eVar2 = eVar3;
                                    aVar = obj;
                                    longRef2 = longRef3;
                                } catch (Throwable th10) {
                                    th = th10;
                                    longRef = longRef3;
                                    mc0.b bVar72 = mc0.d.f76206a;
                                    bVar72.r("OneDriveApiIntegration");
                                    bVar72.n(c0.k("Error pulling OneDrive: ", th.getMessage()), new Object[0]);
                                    return new a(null, true, longRef.f71862a);
                                }
                            }
                        }
                    }
                    return aVar;
                } catch (Throwable th11) {
                    th = th11;
                    longRef3 = longRef2;
                }
                closeable = (Closeable) obj2;
            } catch (Throwable th12) {
                th = th12;
                longRef3 = longRef2;
            }
        } catch (Throwable th13) {
            th = th13;
        }
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        int i5 = LoginOauthActivity.f46279c;
        return f.H(activity, new DefaultOAuthRequest("5e8bb2d3-9bf3-463f-876d-628364f94641", "disco://nova.branch.search/callback/oauth2", "https://login.microsoftonline.com/common/oauth2/v2.0/authorize?response_type=code", UUID.randomUUID().toString(), new String[]{"Files.Read.All", "offline_access"}));
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132017487);
    }

    @Override // s80.c
    public final String d() {
        return Pkgs.MICROSOFT_ONEDRIVE;
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new g4(this, null, 12), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        c cVar;
        e eVar;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i11 = cVar.f77727w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                cVar.f77727w = i11 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, (ContinuationImpl) continuation);
            }
        }
        c cVar2 = cVar;
        Object objJ = cVar2.f77725u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = cVar2.f77727w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                int i13 = LoginOauthActivity.f46279c;
                String strN = f.N(i5, intent);
                if (strN != null && strN.length() != 0) {
                    cVar2.f77724t = this;
                    cVar2.f77727w = 1;
                    objJ = j(null, strN, Pkgs.MICROSOFT_ONEDRIVE, "disco://nova.branch.search/callback/oauth2", "https://sesame.ninja/app/auth/branch_exchange.php", cVar2);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    eVar = this;
                }
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("OneDriveApiIntegration");
                bVar.n("ERROR: OneDrive authorization request got response code='" + strN + "'", new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            eVar = cVar2.f77724t;
            ResultKt.b(objJ);
            i20.d dVar = (i20.d) objJ;
            if (dVar == null) {
                return Boolean.FALSE;
            }
            eVar.k(dVar);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("OneDriveApiIntegration");
            bVar2.e(th2);
            return Boolean.FALSE;
        }
    }
}
