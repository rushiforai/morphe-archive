package c3;

import android.os.Looper;
import android.view.Choreographer;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class u0 extends Lambda implements Function0 {
    public static final u0 A;
    public static final u0 B;
    public static final u0 C;
    public static final u0 D;
    public static final u0 E;
    public static final u0 F;
    public static final u0 G;
    public static final u0 H;
    public static final u0 I;
    public static final u0 J;
    public static final u0 K;
    public static final u0 L;
    public static final u0 M;
    public static final u0 N;

    /* renamed from: k, reason: collision with root package name */
    public static final u0 f19428k;

    /* renamed from: l, reason: collision with root package name */
    public static final u0 f19429l;

    /* renamed from: m, reason: collision with root package name */
    public static final u0 f19430m;
    public static final u0 n;
    public static final u0 o;

    /* renamed from: p, reason: collision with root package name */
    public static final u0 f19431p;

    /* renamed from: q, reason: collision with root package name */
    public static final u0 f19432q;

    /* renamed from: r, reason: collision with root package name */
    public static final u0 f19433r;

    /* renamed from: s, reason: collision with root package name */
    public static final u0 f19434s;

    /* renamed from: t, reason: collision with root package name */
    public static final u0 f19435t;

    /* renamed from: u, reason: collision with root package name */
    public static final u0 f19436u;

    /* renamed from: v, reason: collision with root package name */
    public static final u0 f19437v;

    /* renamed from: w, reason: collision with root package name */
    public static final u0 f19438w;

    /* renamed from: x, reason: collision with root package name */
    public static final u0 f19439x;

    /* renamed from: y, reason: collision with root package name */
    public static final u0 f19440y;

    /* renamed from: z, reason: collision with root package name */
    public static final u0 f19441z;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19442j;

    static {
        int i5 = 0;
        f19428k = new u0(i5, 0);
        f19429l = new u0(i5, 1);
        f19430m = new u0(i5, 2);
        n = new u0(i5, 3);
        o = new u0(i5, 4);
        f19431p = new u0(i5, 5);
        f19432q = new u0(i5, 6);
        f19433r = new u0(i5, 7);
        f19434s = new u0(i5, 8);
        f19435t = new u0(i5, 9);
        f19436u = new u0(i5, 10);
        f19437v = new u0(i5, 11);
        f19438w = new u0(i5, 12);
        f19439x = new u0(i5, 13);
        f19440y = new u0(i5, 14);
        f19441z = new u0(i5, 15);
        A = new u0(i5, 16);
        B = new u0(i5, 17);
        C = new u0(i5, 18);
        D = new u0(i5, 19);
        E = new u0(i5, 20);
        F = new u0(i5, 21);
        G = new u0(i5, 22);
        H = new u0(i5, 23);
        I = new u0(i5, 24);
        J = new u0(i5, 25);
        K = new u0(i5, 26);
        L = new u0(i5, 27);
        M = new u0(i5, 28);
        N = new u0(i5, 29);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u0(int i5, int i11) {
        super(i5);
        this.f19442j = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Choreographer choreographer;
        switch (this.f19442j) {
            case 0:
                AndroidCompositionLocals_androidKt.b("LocalConfiguration");
                throw null;
            case 1:
                AndroidCompositionLocals_androidKt.b("LocalContext");
                throw null;
            case 2:
                AndroidCompositionLocals_androidKt.b("LocalImageVectorCache");
                throw null;
            case 3:
                AndroidCompositionLocals_androidKt.b("LocalResourceIdCache");
                throw null;
            case 4:
                AndroidCompositionLocals_androidKt.b("LocalView");
                throw null;
            case 5:
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    choreographer = Choreographer.getInstance();
                } else {
                    a80.e eVar = t70.y0.f88884a;
                    choreographer = (Choreographer) t70.m0.u(y70.o.f96819a, new b.x1(5));
                }
                g1 g1Var = new g1(choreographer, w20.e.g(Looper.getMainLooper()));
                return g1Var.plus(g1Var.f19297l);
            case 6:
            case 7:
                return null;
            case 8:
                z1.b("LocalAutofillManager");
                throw null;
            case 9:
                z1.b("LocalAutofillTree");
                throw null;
            case 10:
                z1.b("LocalClipboard");
                throw null;
            case 11:
                z1.b("LocalClipboardManager");
                throw null;
            case 12:
                return Boolean.TRUE;
            case 13:
                z1.b("LocalDensity");
                throw null;
            case 14:
                z1.b("LocalFocusManager");
                throw null;
            case 15:
                z1.b("LocalFontFamilyResolver");
                throw null;
            case 16:
                z1.b("LocalFontLoader");
                throw null;
            case 17:
                z1.b("LocalGraphicsContext");
                throw null;
            case 18:
                z1.b("LocalHapticFeedback");
                throw null;
            case 19:
                z1.b("LocalInputManager");
                throw null;
            case 20:
                z1.b("LocalLayoutDirection");
                throw null;
            case 21:
                return null;
            case 22:
                return Boolean.FALSE;
            case 23:
            case 24:
                return null;
            case 25:
                z1.b("LocalTextToolbar");
                throw null;
            case 26:
                z1.b("LocalUriHandler");
                throw null;
            case 27:
                z1.b("LocalViewConfiguration");
                throw null;
            case 28:
                z1.b("LocalWindowInfo");
                throw null;
            default:
                return Boolean.FALSE;
        }
    }
}
