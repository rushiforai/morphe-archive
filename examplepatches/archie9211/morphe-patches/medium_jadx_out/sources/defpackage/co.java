package defpackage;

import android.os.Looper;
import android.view.Choreographer;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class co extends co6 implements m45 {
    public static final co A;
    public static final co B;
    public static final co C;
    public static final co D;
    public static final co E;
    public static final co b;
    public static final co c;
    public static final co d;
    public static final co e;
    public static final co f;
    public static final co g;
    public static final co h;
    public static final co i;
    public static final co j;
    public static final co k;
    public static final co l;
    public static final co m;
    public static final co n;
    public static final co o;
    public static final co p;
    public static final co q;
    public static final co r;
    public static final co s;
    public static final co t;
    public static final co u;
    public static final co v;
    public static final co w;
    public static final co x;
    public static final co y;
    public static final co z;
    public final /* synthetic */ int a;

    static {
        int i2 = 0;
        b = new co(i2, 0);
        c = new co(i2, 1);
        d = new co(i2, 2);
        e = new co(i2, 3);
        f = new co(i2, 4);
        g = new co(i2, 5);
        h = new co(i2, 6);
        i = new co(i2, 7);
        j = new co(i2, 8);
        k = new co(i2, 9);
        l = new co(i2, 10);
        m = new co(i2, 11);
        n = new co(i2, 12);
        o = new co(i2, 13);
        p = new co(i2, 14);
        q = new co(i2, 15);
        r = new co(i2, 16);
        s = new co(i2, 17);
        t = new co(i2, 18);
        u = new co(i2, 19);
        v = new co(i2, 20);
        w = new co(i2, 21);
        x = new co(i2, 22);
        y = new co(i2, 23);
        z = new co(i2, 24);
        A = new co(i2, 25);
        B = new co(i2, 26);
        C = new co(i2, 27);
        D = new co(i2, 28);
        E = new co(i2, 29);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ co(int i2, int i3) {
        super(i2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        Choreographer choreographer;
        int i2 = this.a;
        int i3 = 0;
        int i4 = 2;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        switch (i2) {
            case 0:
                eo.a("LocalConfiguration");
                throw null;
            case 1:
                eo.a("LocalContext");
                throw null;
            case 2:
                eo.a("LocalImageVectorCache");
                throw null;
            case 3:
                eo.a("LocalResourceIdCache");
                throw null;
            case 4:
                eo.a("LocalView");
                throw null;
            case 5:
                return UUID.randomUUID();
            case 6:
                return Boolean.FALSE;
            case 7:
                return "DEFAULT_TEST_TAG";
            case 8:
                return UUID.randomUUID();
            case 9:
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    choreographer = Choreographer.getInstance();
                } else {
                    r13 r13Var = xg3.a;
                    choreographer = (Choreographer) g01.U(ff7.a, new at(i4, i3, n92Var));
                }
                dt dtVar = new dt(choreographer, gsa.W(Looper.getMainLooper()));
                return flb.p0(dtVar, dtVar.l);
            case 10:
            case 11:
            case 12:
                return c1eVar;
            case 13:
                return f94.a().getSharedPreferences("com.facebook.sdk.APPLINK_INFO", 0);
            case 14:
                return "[Mobile Metric] Batch Closed";
            case 15:
                return "[Mobile Metric] Batch Deleted";
            case 16:
                return "Error handling system info broadcast intent.";
            case 17:
                return aJzfoQ.HGHHAvOK;
            case 18:
                return "Cannot copy ByteArray, src doesn't have enough data";
            case 19:
            case 20:
            case 21:
                return "We couldn't register a Network Callback, the network information reported will be less accurate.";
            case 22:
            case 23:
            case 24:
                return "We couldn't unregister the Network Callback";
            case 25:
                return new aq6(2);
            case 26:
            case 27:
                return null;
            case 28:
                z22.b("LocalAutofillManager");
                throw null;
            default:
                z22.b("LocalAutofillTree");
                throw null;
        }
    }
}
