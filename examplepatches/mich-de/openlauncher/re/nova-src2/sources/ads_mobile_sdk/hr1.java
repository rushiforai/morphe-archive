package ads_mobile_sdk;

import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import b.e6;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.w;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.nio.charset.Charset;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.p2;

/* loaded from: classes.dex */
public final class hr1 implements b.i2 {

    /* renamed from: d, reason: collision with root package name */
    public static final long f4488d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f4489e;

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f4490a;

    /* renamed from: b, reason: collision with root package name */
    public final b.y3 f4491b;

    /* renamed from: c, reason: collision with root package name */
    public final e6 f4492c;

    static {
        Duration.Companion companion = Duration.f72038b;
        DurationUnit durationUnit = DurationUnit.f72046e;
        f4488d = DurationKt.g(60, durationUnit);
        f4489e = Duration.q(DurationKt.g(1, DurationUnit.f72048g), durationUnit);
    }

    public hr1(jr0 flags, b.y3 userAgentProvider, e6 httpClient) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(httpClient, "httpClient");
        this.f4490a = flags;
        this.f4491b = userAgentProvider;
        this.f4492c = httpClient;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x00a3, code lost:
    
        if (r13 == r3) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, WebResourceRequest webResourceRequest, ContinuationImpl continuationImpl) {
        fr1 fr1Var;
        String strA;
        x11 x11Var;
        String str;
        hr1 hr1Var;
        if (continuationImpl instanceof fr1) {
            fr1Var = (fr1) continuationImpl;
            int i5 = fr1Var.f3487f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fr1Var.f3487f = i5 - Integer.MIN_VALUE;
            } else {
                fr1Var = new fr1(this, continuationImpl);
            }
        }
        Object objA = fr1Var.f3485d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fr1Var.f3487f;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objA);
            Uri url = webResourceRequest.getUrl();
            if (url == null || (strA = a(url, tx0Var)) == null) {
                return null;
            }
            x11Var = new x11();
            x11Var.b(strA);
            x11Var.a("Cache-Control", "max-stale=" + f4489e);
            str = "User-Agent";
            b.y3 y3Var = this.f4491b;
            fr1Var.f3482a = this;
            fr1Var.f3483b = x11Var;
            fr1Var.f3484c = "User-Agent";
            fr1Var.f3487f = 1;
            objA = y3Var.a(fr1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            hr1Var = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
                String str2 = (String) objA;
                if (str2 != null) {
                    Charset charsetForName = Charset.forName("UTF-8");
                    Intrinsics.f(charsetForName, "forName(...)");
                    byte[] bytes = str2.getBytes(charsetForName);
                    Intrinsics.f(bytes, "getBytes(...)");
                    return new WebResourceResponse("application/javascript", "UTF-8", new ByteArrayInputStream(bytes));
                }
                return null;
            }
            str = fr1Var.f3484c;
            x11Var = fr1Var.f3483b;
            hr1Var = fr1Var.f3482a;
            ResultKt.b(objA);
        }
        x11Var.a(str, (String) objA);
        x11Var.b();
        y11 y11VarA = x11Var.a();
        long j11 = f4488d;
        b00.e eVar = new b00.e(hr1Var, y11VarA, continuation, 5);
        fr1Var.f3482a = null;
        fr1Var.f3483b = null;
        fr1Var.f3484c = null;
        fr1Var.f3487f = 2;
        objA = p2.c(j11, eVar, fr1Var);
    }

    public final String a(Uri uri, tx0 tx0Var) {
        u uVar = u.a$7;
        String path = uri.getPath();
        if (path == null || !r70.j.B0(new File(path).getName(), w.f39244k, true)) {
            return null;
        }
        boolean z11 = tx0Var.n.get();
        jr0 jr0Var = this.f4490a;
        if (z11) {
            jr0Var.getClass();
            return (String) jr0Var.a("gad:mraid:url_expanded_banner", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/production/mraid/v3/mraid_app_expanded_banner.js", uVar);
        }
        if (tx0Var.e().f3488a == es3.f2967d) {
            jr0Var.getClass();
            return (String) jr0Var.a("gad:mraid:url_interstitial", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/production/mraid/v3/mraid_app_interstitial.js", uVar);
        }
        jr0Var.getClass();
        return (String) jr0Var.a("gad:mraid:url_banner", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/production/mraid/v3/mraid_app_banner.js", uVar);
    }
}
