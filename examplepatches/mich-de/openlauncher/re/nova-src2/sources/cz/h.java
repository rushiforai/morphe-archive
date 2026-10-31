package cz;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.view.MotionEvent;
import android.view.ViewConfiguration;

/* loaded from: classes.dex */
public final class h implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final int f48619a;

    /* renamed from: b, reason: collision with root package name */
    public final int f48620b;

    /* renamed from: c, reason: collision with root package name */
    public final int f48621c;

    /* renamed from: d, reason: collision with root package name */
    public final int f48622d;

    /* renamed from: e, reason: collision with root package name */
    public final int f48623e;

    /* renamed from: g, reason: collision with root package name */
    public final j f48625g;

    /* renamed from: h, reason: collision with root package name */
    public final j f48626h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f48627i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f48628j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f48629k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f48630l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f48631m;
    public MotionEvent n;
    public MotionEvent o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f48632p;

    /* renamed from: q, reason: collision with root package name */
    public float f48633q;

    /* renamed from: r, reason: collision with root package name */
    public float f48634r;

    /* renamed from: s, reason: collision with root package name */
    public float f48635s;

    /* renamed from: t, reason: collision with root package name */
    public float f48636t;

    /* renamed from: w, reason: collision with root package name */
    public static final int f48615w = ViewConfiguration.getLongPressTimeout();

    /* renamed from: x, reason: collision with root package name */
    public static final int f48616x = ViewConfiguration.getTapTimeout();

    /* renamed from: y, reason: collision with root package name */
    public static final int f48617y = ViewConfiguration.getDoubleTapTimeout();

    /* renamed from: z, reason: collision with root package name */
    public static int f48618z = 40;
    public static boolean A = false;

    /* renamed from: v, reason: collision with root package name */
    public final g f48638v = new g();

    /* renamed from: f, reason: collision with root package name */
    public final Handler f48624f = new Handler(new v30.f(this));

    /* renamed from: u, reason: collision with root package name */
    public boolean f48637u = true;

    public h(Context context, j jVar) {
        this.f48625g = jVar;
        this.f48626h = jVar;
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        int scaledTouchSlop = viewConfiguration.getScaledTouchSlop();
        int scaledDoubleTapSlop = viewConfiguration.getScaledDoubleTapSlop();
        this.f48622d = viewConfiguration.getScaledMinimumFlingVelocity();
        this.f48623e = viewConfiguration.getScaledMaximumFlingVelocity();
        int i5 = scaledTouchSlop * scaledTouchSlop;
        this.f48619a = i5;
        this.f48620b = i5;
        this.f48621c = scaledDoubleTapSlop * scaledDoubleTapSlop;
        if (A) {
            return;
        }
        if (Settings.Secure.getInt(context.getContentResolver(), "accessibility_display_magnification_enabled", 0) == 1) {
            f48618z = -100;
        }
        A = true;
    }

    public final void a() {
        Handler handler = this.f48624f;
        handler.removeMessages(1);
        handler.removeMessages(2);
        handler.removeMessages(3);
        this.f48638v.b();
        this.f48632p = false;
        this.f48627i = false;
        this.f48630l = false;
        this.f48631m = false;
        this.f48628j = false;
        this.f48629k = false;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        j jVar = this.f48625g;
        if (i5 == 1) {
            jVar.getClass();
            return true;
        }
        if (i5 == 2) {
            this.f48624f.removeMessages(3);
            this.f48628j = false;
            this.f48629k = true;
            jVar.getClass();
            return true;
        }
        if (i5 != 3) {
            throw new RuntimeException("Unknown message " + message);
        }
        j jVar2 = this.f48626h;
        if (jVar2 != null) {
            if (!this.f48627i) {
                jVar2.onSingleTapConfirmed(this.n);
                return true;
            }
            this.f48628j = true;
        }
        return true;
    }
}
