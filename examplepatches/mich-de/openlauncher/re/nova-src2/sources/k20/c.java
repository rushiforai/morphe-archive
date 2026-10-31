package k20;

import a80.e;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.TrafficStats;
import android.net.Uri;
import b90.j;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import e10.h2;
import i20.g;
import java.util.ArrayList;
import java.util.UUID;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.Strs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONObject;
import r70.l;
import s80.d;
import t70.y0;
import wh.f;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.m0;
import x80.p0;

/* loaded from: classes4.dex */
public final class c extends g implements d {

    /* renamed from: e, reason: collision with root package name */
    public final e0 f70886e;

    /* renamed from: f, reason: collision with root package name */
    public final Context f70887f;

    public c(e0 e0Var, Context context, String str, h2 h2Var) {
        super(e0Var, str, h2Var, "DiscordApiIntegration");
        this.f70886e = e0Var;
        this.f70887f = context;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00ad A[Catch: all -> 0x00c7, TRY_ENTER, TryCatch #2 {all -> 0x00c7, blocks: (B:26:0x00a1, B:29:0x00ad, B:31:0x00ba, B:33:0x00c0, B:36:0x00cb, B:43:0x0115, B:45:0x0120, B:47:0x0130, B:49:0x013c, B:50:0x0147, B:53:0x0159, B:55:0x015f, B:72:0x021e, B:58:0x016d, B:61:0x0177, B:64:0x0181, B:66:0x0189, B:71:0x01d4, B:69:0x01b4, B:73:0x0222, B:48:0x0135, B:22:0x005d), top: B:82:0x005d }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(c cVar, i20.d dVar, ContinuationImpl continuationImpl) {
        a aVar;
        Ref.LongRef longRef;
        Ref.LongRef longRef2;
        Object objAwait;
        ArrayList arrayList;
        boolean zC;
        Integer numValueOf;
        String string;
        String string2;
        String str;
        String string3;
        String strString;
        c cVar2 = cVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f70881y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f70881y = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(cVar2, continuationImpl);
            }
        }
        Object obj = aVar.f70879w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f70881y;
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                longRef2 = (Ref.LongRef) aVar.f70876t;
                try {
                    ResultKt.b(obj);
                    return new i20.a(longRef2.f71862a, null, null, true);
                } catch (Throwable unused) {
                    return new i20.a(longRef2.f71862a, null, null, true);
                }
            }
            ArrayList arrayList2 = aVar.f70878v;
            Ref.LongRef longRef3 = aVar.f70877u;
            c cVar3 = (c) aVar.f70876t;
            try {
                ResultKt.b(obj);
                objAwait = obj;
                longRef = longRef3;
                arrayList = arrayList2;
                cVar2 = cVar3;
                m0 m0Var = (m0) objAwait;
                zC = m0Var.c();
                p0 p0Var = m0Var.f95559g;
                if (zC) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("DiscordApiIntegration");
                    int i12 = m0Var.f95556d;
                    String str2 = m0Var.f95555c;
                    String strG1 = (p0Var == null || (strString = p0Var.string()) == null) ? null : l.G1(100, strString);
                    bVar.n("Failed API request: '" + i12 + " " + str2 + " [" + strG1 + "]' from " + m0Var.f95553a.f95509a, new Object[0]);
                    aVar.f70876t = longRef;
                    aVar.f70877u = null;
                    aVar.f70878v = null;
                    aVar.f70881y = 2;
                    if (cVar2.g(m0Var) != coroutineSingletons) {
                        longRef2 = longRef;
                        return new i20.a(longRef2.f71862a, null, null, true);
                    }
                    return coroutineSingletons;
                }
                if (p0Var == null) {
                    return new i20.a(longRef.f71862a, null, null, true);
                }
                String strString2 = p0Var.string();
                longRef.f71862a += p0Var.contentLength() >= 0 ? p0Var.contentLength() : strString2.length() * 2;
                JSONArray jSONArray = new JSONArray(strString2);
                cVar2.getClass();
                try {
                    numValueOf = Integer.valueOf(cVar2.f70887f.getPackageManager().getApplicationInfo(Pkgs.DISCORD, 0).icon);
                } catch (PackageManager.NameNotFoundException unused2) {
                    numValueOf = null;
                }
                int length = jSONArray.length();
                for (int i13 = 0; i13 < length; i13++) {
                    JSONObject jSONObject = jSONArray.getJSONObject(i13);
                    String string4 = jSONObject.getString("id");
                    if (string4 != null && (string = jSONObject.getString(PendingUpgradeStore.KEY_NAME)) != null && (string2 = jSONObject.getString("icon")) != null) {
                        if (!string2.equals(AbstractJsonLexerKt.NULL)) {
                            string3 = Uri.parse("https://cdn.discordapp.com/icons/" + string4 + "/" + string2 + ".jpg?size=128").toString();
                        } else if (numValueOf != null) {
                            string3 = Uri.parse("android.resource://com.discord/" + numValueOf.intValue()).toString();
                        } else {
                            str = null;
                            String intentUri = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse("https://discord.com/channels/" + string4)).setPackage(Pkgs.DISCORD));
                            Intrinsics.d(intentUri);
                            arrayList.add(new ExternalLink("guild/" + string4, string, null, str, intentUri, null, null, 228));
                        }
                        str = string3;
                        String intentUri2 = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse("https://discord.com/channels/" + string4)).setPackage(Pkgs.DISCORD));
                        Intrinsics.d(intentUri2);
                        arrayList.add(new ExternalLink("guild/" + string4, string, null, str, intentUri2, null, null, 228));
                    }
                }
                return new i20.a(longRef.f71862a, null, arrayList, false);
            } catch (Throwable unused3) {
                longRef2 = longRef3;
                return new i20.a(longRef2.f71862a, null, null, true);
            }
        }
        ResultKt.b(obj);
        longRef = new Ref.LongRef();
        try {
            g0 g0Var = new g0();
            g0Var.k("https://discord.com/api/v10/users/@me/guilds");
            g0Var.a("Authorization", "Bearer " + dVar.f61200a);
            h0 h0VarB = g0Var.b();
            ArrayList arrayList3 = new ArrayList();
            TrafficStats.setThreadStatsTag(-887223418);
            j jVarC = cVar2.f70886e.c(h0VarB);
            aVar.f70876t = cVar2;
            aVar.f70877u = longRef;
            aVar.f70878v = arrayList3;
            aVar.f70881y = 1;
            objAwait = UtilsKt.await(jVarC, aVar);
            if (objAwait == coroutineSingletons) {
                return coroutineSingletons;
            }
            arrayList = arrayList3;
            m0 m0Var2 = (m0) objAwait;
            zC = m0Var2.c();
            p0 p0Var2 = m0Var2.f95559g;
            if (zC) {
            }
        } catch (Throwable unused4) {
            longRef2 = longRef;
            return new i20.a(longRef2.f71862a, null, null, true);
        }
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        DefaultOAuthRequest defaultOAuthRequest = new DefaultOAuthRequest("1137012749642256395", "https://sesame.ninja/app/auth/branch_exchange.php", "https://discord.com/api/oauth2/authorize?response_type=code", UUID.randomUUID().toString(), new String[]{"guilds"});
        int i5 = LoginOauthActivity.f46279c;
        return f.H(activity, defaultOAuthRequest);
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132017477);
    }

    @Override // s80.c
    public final String d() {
        return Pkgs.DISCORD;
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new h6.c(this, (Continuation) null, 26), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        b bVar;
        c cVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i11 = bVar.f70885w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                bVar.f70885w = i11 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, (ContinuationImpl) continuation);
            }
        }
        b bVar2 = bVar;
        Object objJ = bVar2.f70883u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = bVar2.f70885w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                int i13 = LoginOauthActivity.f46279c;
                String strN = f.N(i5, intent);
                if (strN != null && strN.length() != 0) {
                    bVar2.f70882t = this;
                    bVar2.f70885w = 1;
                    objJ = j(null, strN, Pkgs.DISCORD, "https://sesame.ninja/app/auth/branch_exchange.php", "https://sesame.ninja/app/auth/branch_exchange.php", bVar2);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    cVar = this;
                }
                mc0.b bVar3 = mc0.d.f76206a;
                bVar3.r("DiscordApiIntegration");
                bVar3.n("ERROR: Discord authorization request got response code='" + strN + "'", new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cVar = bVar2.f70882t;
            ResultKt.b(objJ);
            i20.d dVar = (i20.d) objJ;
            if (dVar == null) {
                return Boolean.FALSE;
            }
            cVar.k(dVar);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar4 = mc0.d.f76206a;
            bVar4.r("DiscordApiIntegration");
            bVar4.f(th2, "DiscordApiIntegration", new Object[0]);
            return Boolean.FALSE;
        }
    }
}
