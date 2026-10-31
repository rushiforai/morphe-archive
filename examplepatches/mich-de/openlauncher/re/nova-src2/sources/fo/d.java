package fo;

import android.content.Context;
import android.content.IntentFilter;
import c3.m2;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.ai.auth.AiAuthMode;
import com.instabridge.ai.auth.TokenProvider;
import com.instabridge.ai.billing.BillingManager;
import com.instabridge.ai.bubble.BubbleStore;
import com.instabridge.ai.bubble.BubbleUnlockReceiver;
import com.instabridge.ai.chat.data.ConversationApiClient;
import com.instabridge.ai.client.AiClient;
import com.instabridge.ai.context.AiContextManager;
import com.instabridge.ai.context.AppInstallListener;
import com.instabridge.ai.proactive.AiProactiveManager;
import com.instabridge.ai.proactive.NotificationConfig;
import com.instabridge.ai.proactive.ProactiveGenerationConfig;
import com.instabridge.ai.prompts.PersonalizedPromptStore;
import com.instabridge.ai.tools.AiToolsManager;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import e00.j5;
import e00.s0;
import f1.z1;
import h10.k1;
import java.util.Locale;
import kotlin.LazyKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import p7.s;
import r70.k;
import t70.i2;
import t70.k0;
import t70.m0;
import t70.y0;
import tx.h4;
import tx.q3;
import tx.r;
import tx.v0;
import vx.t;
import y70.o;

/* loaded from: classes3.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final y70.d f55463a;

    /* renamed from: b, reason: collision with root package name */
    public static a f55464b;

    /* renamed from: c, reason: collision with root package name */
    public static Context f55465c;

    /* renamed from: d, reason: collision with root package name */
    public static AiAuthManager f55466d;

    /* renamed from: e, reason: collision with root package name */
    public static AiContextManager f55467e;

    /* renamed from: f, reason: collision with root package name */
    public static AiClient f55468f;

    /* renamed from: g, reason: collision with root package name */
    public static ConversationApiClient f55469g;

    /* renamed from: h, reason: collision with root package name */
    public static AiToolsManager f55470h;

    /* renamed from: i, reason: collision with root package name */
    public static BubbleStore f55471i;

    /* renamed from: j, reason: collision with root package name */
    public static PersonalizedPromptStore f55472j;

    /* renamed from: k, reason: collision with root package name */
    public static BillingManager f55473k;

    /* renamed from: l, reason: collision with root package name */
    public static AiProactiveManager f55474l;

    /* renamed from: m, reason: collision with root package name */
    public static r f55475m;
    public static final a70.d n;
    public static t o;

    /* renamed from: p, reason: collision with root package name */
    public static q3 f55476p;

    /* renamed from: q, reason: collision with root package name */
    public static h4 f55477q;

    /* renamed from: r, reason: collision with root package name */
    public static r f55478r;

    /* renamed from: s, reason: collision with root package name */
    public static k1 f55479s;

    /* renamed from: t, reason: collision with root package name */
    public static go.a f55480t;

    /* renamed from: u, reason: collision with root package name */
    public static j5 f55481u;

    /* renamed from: v, reason: collision with root package name */
    public static v0 f55482v;

    /* renamed from: w, reason: collision with root package name */
    public static sx.d f55483w;

    /* renamed from: x, reason: collision with root package name */
    public static SuspendLambda f55484x;

    /* renamed from: y, reason: collision with root package name */
    public static Function0 f55485y;

    /* renamed from: z, reason: collision with root package name */
    public static BubbleUnlockReceiver f55486z;

    static {
        i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        f55463a = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, o.f96819a.f90673f));
        n = LazyKt.a(new z1(8));
        f55480t = go.b.f57749a;
        f55485y = new z1(9);
    }

    public static AiAuthManager a() {
        AiAuthManager aiAuthManager = f55466d;
        if (aiAuthManager != null) {
            return aiAuthManager;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    public static AiClient b() {
        AiClient aiClient = f55468f;
        if (aiClient != null) {
            return aiClient;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    public static a c() {
        a aVar = f55464b;
        if (aVar != null) {
            return aVar;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    public static AiContextManager d() {
        AiContextManager aiContextManager = f55467e;
        if (aiContextManager != null) {
            return aiContextManager;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    public static ConversationApiClient e() {
        ConversationApiClient conversationApiClient = f55469g;
        if (conversationApiClient != null) {
            return conversationApiClient;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    public static AiProactiveManager f() {
        AiProactiveManager aiProactiveManager = f55474l;
        if (aiProactiveManager != null) {
            return aiProactiveManager;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    public static lo.b g() {
        return (lo.b) n.getValue();
    }

    public static AiToolsManager h() {
        AiToolsManager aiToolsManager = f55470h;
        if (aiToolsManager != null) {
            return aiToolsManager;
        }
        throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void i(Context context, s0 s0Var) {
        TokenProvider tokenProvider;
        Continuation continuation;
        BillingManager billingManager;
        Intrinsics.g(context, "context");
        b bVar = new b();
        bVar.f55449a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        bVar.f55450b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        bVar.f55451c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        bVar.f55453e = "INSTA_AI";
        bVar.f55455g = true;
        bVar.f55456h = "AI";
        bVar.f55457i = true;
        bVar.f55458j = "Pro";
        bVar.f55459k = "PRO";
        bVar.f55460l = new ProactiveGenerationConfig(0, 0, 0, 0, 0L, 0L, 0, 0L, false, false, null, 2047, null);
        s0Var.invoke(bVar);
        if (k.U0(bVar.f55449a)) {
            throw new IllegalArgumentException("appId is required");
        }
        if (k.U0(bVar.f55450b)) {
            throw new IllegalArgumentException("baseUrl is required");
        }
        if (k.U0(bVar.f55451c)) {
            throw new IllegalArgumentException("webAppUrl is required");
        }
        AiAuthMode aiAuthMode = bVar.f55452d;
        if (aiAuthMode == null) {
            throw new IllegalArgumentException("Pick an auth mode: set authMode (for example AiAuthMode.Login), tokenProvider, or useAnonymousAuth");
        }
        String string = k.u1("ai-context").toString();
        Locale ROOT = Locale.ROOT;
        Intrinsics.f(ROOT, "ROOT");
        String lowerCase = string.toLowerCase(ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        if (!e.f55487a.f(lowerCase)) {
            throw new IllegalArgumentException("contextProductSurface must use lowercase letters, digits, '.', '_', or '-' and be at most 64 characters");
        }
        String str = bVar.f55449a;
        String str2 = k.x1(bVar.f55450b, '/') + '/';
        String str3 = k.x1(bVar.f55451c, '/') + '/';
        AiAuthMode.External external = aiAuthMode instanceof AiAuthMode.External ? (AiAuthMode.External) aiAuthMode : null;
        if (external != null) {
            tokenProvider = external.getTokenProvider();
            continuation = null;
        } else {
            tokenProvider = null;
            continuation = null;
        }
        Continuation continuation2 = continuation;
        String str4 = bVar.f55453e;
        NotificationConfig notificationConfig = bVar.f55454f;
        boolean z11 = bVar.f55455g;
        String str5 = bVar.f55456h;
        boolean z12 = bVar.f55457i;
        String str6 = bVar.f55458j;
        String str7 = bVar.f55459k;
        ProactiveGenerationConfig proactiveGenerationConfigSanitized = bVar.f55460l.sanitized();
        a aVar = new a(str, str2, str3, tokenProvider, aiAuthMode instanceof AiAuthMode.Anonymous, str4, notificationConfig, z11, str5, z12, str6, str7, proactiveGenerationConfigSanitized, lowerCase, aiAuthMode);
        f55464b = aVar;
        f55465c = context.getApplicationContext();
        f55466d = new AiAuthManager(context, aVar);
        AiAuthManager aiAuthManager = f55466d;
        Intrinsics.d(aiAuthManager);
        f55467e = new AiContextManager(context, aVar, aiAuthManager);
        AiAuthManager aiAuthManager2 = f55466d;
        Intrinsics.d(aiAuthManager2);
        f55468f = new AiClient(aVar, aiAuthManager2);
        AiAuthManager aiAuthManager3 = f55466d;
        Intrinsics.d(aiAuthManager3);
        f55469g = new ConversationApiClient(aVar, aiAuthManager3);
        m2 m2Var = new m2(1, continuation2, 2);
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        f55470h = new AiToolsManager(aVar, m2Var, new SharedPreferencesToolRegistrationStateStore(applicationContext));
        f55471i = new BubbleStore(context);
        f55472j = new PersonalizedPromptStore(context);
        AppInstallListener.INSTANCE.register(context);
        if (z12) {
            Context applicationContext2 = context.getApplicationContext();
            Intrinsics.f(applicationContext2, "getApplicationContext(...)");
            BillingManager billingManager2 = new BillingManager(applicationContext2);
            billingManager2.initialize();
            billingManager = billingManager2;
        } else {
            billingManager = continuation2;
        }
        f55473k = billingManager;
        Context applicationContext3 = context.getApplicationContext();
        Intrinsics.f(applicationContext3, "getApplicationContext(...)");
        AiProactiveManager aiProactiveManager = new AiProactiveManager(applicationContext3, proactiveGenerationConfigSanitized);
        if (notificationConfig != null) {
            aiProactiveManager.setNotificationConfig(notificationConfig);
        }
        f55474l = aiProactiveManager;
    }

    public static boolean j() {
        return f55464b != null;
    }

    public static final boolean k() {
        try {
            return ((Boolean) f55485y.invoke()).booleanValue();
        } catch (Exception unused) {
            return false;
        }
    }

    public static final void l(Context context) {
        Intrinsics.g(context, "context");
        s.c(context).b("bubble_refresh");
        s.c(context).b("bubble_refresh_init");
        s.c(context).b("bubble_refresh_unlock");
        if (f55486z == null) {
            f55486z = new BubbleUnlockReceiver();
            o4.a.c(context.getApplicationContext(), f55486z, new IntentFilter("android.intent.action.USER_PRESENT"), null, 4);
        }
    }
}
