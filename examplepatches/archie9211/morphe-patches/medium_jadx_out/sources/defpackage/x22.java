package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x22 extends co6 implements m45 {
    public static final x22 A;
    public static final x22 B;
    public static final x22 C;
    public static final x22 D;
    public static final x22 E;
    public static final x22 b;
    public static final x22 c;
    public static final x22 d;
    public static final x22 e;
    public static final x22 f;
    public static final x22 g;
    public static final x22 h;
    public static final x22 i;
    public static final x22 j;
    public static final x22 k;
    public static final x22 l;
    public static final x22 m;
    public static final x22 n;
    public static final x22 o;
    public static final x22 p;
    public static final x22 q;
    public static final x22 r;
    public static final x22 s;
    public static final x22 t;
    public static final x22 u;
    public static final x22 v;
    public static final x22 w;
    public static final x22 x;
    public static final x22 y;
    public static final x22 z;
    public final /* synthetic */ int a;

    static {
        int i2 = 0;
        b = new x22(i2, 0);
        c = new x22(i2, 1);
        d = new x22(i2, 2);
        e = new x22(i2, 3);
        f = new x22(i2, 4);
        g = new x22(i2, 5);
        h = new x22(i2, 6);
        i = new x22(i2, 7);
        j = new x22(i2, 8);
        k = new x22(i2, 9);
        l = new x22(i2, 10);
        m = new x22(i2, 11);
        n = new x22(i2, 12);
        o = new x22(i2, 13);
        p = new x22(i2, 14);
        q = new x22(i2, 15);
        r = new x22(i2, 16);
        s = new x22(i2, 17);
        t = new x22(i2, 18);
        u = new x22(i2, 19);
        v = new x22(i2, 20);
        w = new x22(i2, 21);
        x = new x22(i2, 22);
        y = new x22(i2, 23);
        z = new x22(i2, 24);
        A = new x22(i2, 25);
        B = new x22(i2, 26);
        C = new x22(i2, 27);
        D = new x22(i2, 28);
        E = new x22(i2, 29);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x22(int i2, int i3) {
        super(i2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                z22.b("LocalClipboard");
                throw null;
            case 1:
                z22.b("LocalClipboardManager");
                throw null;
            case 2:
                return Boolean.TRUE;
            case 3:
                z22.b("LocalDensity");
                throw null;
            case 4:
                z22.b("LocalFocusManager");
                throw null;
            case 5:
                z22.b("LocalFontFamilyResolver");
                throw null;
            case 6:
                z22.b("LocalFontLoader");
                throw null;
            case 7:
                z22.b("LocalGraphicsContext");
                throw null;
            case 8:
                z22.b("LocalHapticFeedback");
                throw null;
            case 9:
                z22.b("LocalInputManager");
                throw null;
            case 10:
                z22.b("LocalLayoutDirection");
                throw null;
            case 11:
                return null;
            case 12:
                z22.b("LocalProvidableLocaleList");
                throw null;
            case 13:
                return Boolean.FALSE;
            case 14:
            case 15:
                return null;
            case 16:
                z22.b("LocalTextToolbar");
                throw null;
            case 17:
                z22.b("LocalUriHandler");
                throw null;
            case 18:
                z22.b("LocalViewConfiguration");
                throw null;
            case 19:
                z22.b("LocalWindowInfo");
                throw null;
            case 20:
                return c1eVar;
            case 21:
                return "Unable to read your application's version name";
            case 22:
                return "Unable to launch a synchronize local time with an NTP server.";
            case 23:
                return "Build ID is not found in the application assets. If you are using obfuscation, please use Datadog Gradle Plugin 1.13.0 or above to be able to de-obfuscate stacktraces.";
            case 24:
                return "Failed to read Build ID information, de-obfuscation may not work properly.";
            case 25:
                return "Datadog SDK was initialized in a secondary process: although data will still be captured, nothing will be uploaded from this process. Make sure to also initialize the SDK from the main process of your application.";
            case 26:
                return c1eVar;
            case 27:
                return "Thread was unable to set its own interrupted state";
            case 28:
                return "Trying to shut down Kronos when it is already not running";
            default:
                return "Ignoring provided User-Agent header, because it is reserved.";
        }
    }
}
