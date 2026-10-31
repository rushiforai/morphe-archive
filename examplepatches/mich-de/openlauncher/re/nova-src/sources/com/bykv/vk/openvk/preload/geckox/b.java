package com.bykv.vk.openvk.preload.geckox;

import android.content.Context;
import android.text.TextUtils;
import com.bykv.vk.openvk.preload.geckox.net.INetWork;
import com.bykv.vk.openvk.preload.geckox.statistic.IStatisticMonitor;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class b {

    /* renamed from: r, reason: collision with root package name */
    private static IThreadPoolCallback f22007r;

    /* renamed from: s, reason: collision with root package name */
    private static ThreadPoolExecutor f22008s;

    /* renamed from: a, reason: collision with root package name */
    private final Context f22009a;

    /* renamed from: b, reason: collision with root package name */
    private final com.bykv.vk.openvk.preload.geckox.a.a.c f22010b;

    /* renamed from: c, reason: collision with root package name */
    private final IStatisticMonitor f22011c;

    /* renamed from: d, reason: collision with root package name */
    private final INetWork f22012d;

    /* renamed from: e, reason: collision with root package name */
    private final List<String> f22013e;

    /* renamed from: f, reason: collision with root package name */
    private final List<String> f22014f;

    /* renamed from: g, reason: collision with root package name */
    private final com.bykv.vk.openvk.preload.geckox.a.a.a f22015g;

    /* renamed from: h, reason: collision with root package name */
    private final Long f22016h;

    /* renamed from: i, reason: collision with root package name */
    private final String f22017i;

    /* renamed from: j, reason: collision with root package name */
    private final String f22018j;

    /* renamed from: k, reason: collision with root package name */
    private final String f22019k;

    /* renamed from: l, reason: collision with root package name */
    private final String f22020l;

    /* renamed from: m, reason: collision with root package name */
    private final String f22021m;
    private final File n;
    private final boolean o;

    /* renamed from: p, reason: collision with root package name */
    private final long f22022p;

    /* renamed from: q, reason: collision with root package name */
    private JSONObject f22023q;

    /* loaded from: classes2.dex */
    public static class a {

        /* renamed from: a, reason: collision with root package name */
        private INetWork f22024a;

        /* renamed from: b, reason: collision with root package name */
        private List<String> f22025b;

        /* renamed from: c, reason: collision with root package name */
        private List<String> f22026c;

        /* renamed from: d, reason: collision with root package name */
        private Context f22027d;

        /* renamed from: e, reason: collision with root package name */
        private com.bykv.vk.openvk.preload.geckox.a.a.c f22028e;

        /* renamed from: f, reason: collision with root package name */
        private IStatisticMonitor f22029f;

        /* renamed from: g, reason: collision with root package name */
        private boolean f22030g = true;

        /* renamed from: h, reason: collision with root package name */
        private com.bykv.vk.openvk.preload.geckox.a.a.a f22031h;

        /* renamed from: i, reason: collision with root package name */
        private Long f22032i;

        /* renamed from: j, reason: collision with root package name */
        private String f22033j;

        /* renamed from: k, reason: collision with root package name */
        private String f22034k;

        /* renamed from: l, reason: collision with root package name */
        private String f22035l;

        /* renamed from: m, reason: collision with root package name */
        private File f22036m;
        private String n;
        private String o;

        /* renamed from: p, reason: collision with root package name */
        private long f22037p;

        public a(Context context) {
            this.f22027d = context.getApplicationContext();
        }

        public final a a(String... strArr) {
            this.f22026c = Arrays.asList(strArr);
            return this;
        }

        public final a b(String... strArr) {
            this.f22025b = Arrays.asList(strArr);
            return this;
        }

        public final a c(String str) {
            this.f22035l = str;
            return this;
        }

        public final a a(INetWork iNetWork) {
            this.f22024a = iNetWork;
            return this;
        }

        public final a b() {
            this.f22032i = 38L;
            return this;
        }

        public final a a(long j11) {
            this.f22037p = j11;
            return this;
        }

        public final a b(String str) {
            this.f22034k = str;
            return this;
        }

        public final a a(IStatisticMonitor iStatisticMonitor) {
            this.f22029f = iStatisticMonitor;
            return this;
        }

        public final a a() {
            this.f22030g = false;
            return this;
        }

        public final a a(com.bykv.vk.openvk.preload.geckox.a.a.a aVar) {
            this.f22031h = aVar;
            return this;
        }

        public final a a(String str) {
            this.f22033j = str;
            return this;
        }

        public final a a(File file) {
            this.f22036m = file;
            return this;
        }
    }

    public /* synthetic */ b(a aVar, byte b11) {
        this(aVar);
    }

    public static Executor g() {
        return t();
    }

    public static Executor h() {
        return t();
    }

    public static ExecutorService t() {
        IThreadPoolCallback iThreadPoolCallback = f22007r;
        ExecutorService threadPool = iThreadPoolCallback != null ? iThreadPoolCallback.getThreadPool() : null;
        if (threadPool != null) {
            return threadPool;
        }
        if (f22008s == null) {
            synchronized (b.class) {
                try {
                    if (f22008s == null) {
                        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(2, 2, 20L, TimeUnit.SECONDS, new LinkedBlockingQueue());
                        f22008s = threadPoolExecutor;
                        threadPoolExecutor.allowCoreThreadTimeOut(true);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f22008s;
    }

    public final Context a() {
        return this.f22009a;
    }

    public final com.bykv.vk.openvk.preload.geckox.a.a.a b() {
        return this.f22015g;
    }

    public final boolean c() {
        return this.o;
    }

    public final List<String> d() {
        return this.f22014f;
    }

    public final List<String> e() {
        return this.f22013e;
    }

    public final JSONObject f() {
        return this.f22023q;
    }

    public final INetWork i() {
        return this.f22012d;
    }

    public final String j() {
        return this.f22019k;
    }

    public final long k() {
        return this.f22016h.longValue();
    }

    public final String l() {
        return this.f22021m;
    }

    public final String m() {
        return this.f22020l;
    }

    public final File n() {
        return this.n;
    }

    public final String o() {
        return this.f22017i;
    }

    public final com.bykv.vk.openvk.preload.geckox.a.a.c p() {
        return this.f22010b;
    }

    public final IStatisticMonitor q() {
        return this.f22011c;
    }

    public final String r() {
        return this.f22018j;
    }

    public final long s() {
        return this.f22022p;
    }

    private b(a aVar) {
        Context context = aVar.f22027d;
        this.f22009a = context;
        if (context == null) {
            throw new IllegalArgumentException("context == null");
        }
        List<String> list = aVar.f22025b;
        this.f22013e = list;
        this.f22014f = aVar.f22026c;
        this.f22010b = aVar.f22028e;
        this.f22015g = aVar.f22031h;
        Long l9 = aVar.f22032i;
        this.f22016h = l9;
        if (TextUtils.isEmpty(aVar.f22033j)) {
            this.f22017i = com.bykv.vk.openvk.preload.geckox.utils.a.a(context);
        } else {
            this.f22017i = aVar.f22033j;
        }
        String str = aVar.f22034k;
        this.f22018j = str;
        this.f22020l = aVar.n;
        this.f22021m = aVar.o;
        this.f22022p = aVar.f22037p;
        if (aVar.f22036m == null) {
            this.n = new File(context.getFilesDir(), "gecko_offline_res_x");
        } else {
            this.n = aVar.f22036m;
        }
        String str2 = aVar.f22035l;
        this.f22019k = str2;
        if (TextUtils.isEmpty(str2)) {
            throw new IllegalArgumentException("host == null");
        }
        if (list == null || list.isEmpty()) {
            throw new IllegalArgumentException("access key empty");
        }
        if (l9 == null) {
            throw new IllegalArgumentException("appId == null");
        }
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("deviceId key empty");
        }
        this.f22012d = aVar.f22024a;
        this.f22011c = aVar.f22029f;
        this.o = aVar.f22030g;
    }

    public final void a(JSONObject jSONObject) {
        this.f22023q = jSONObject;
    }

    public static void a(IThreadPoolCallback iThreadPoolCallback) {
        f22007r = iThreadPoolCallback;
    }
}
