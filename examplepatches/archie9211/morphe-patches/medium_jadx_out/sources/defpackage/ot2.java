package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.google.android.material.internal.It.KLTXZbnQvj;
import java.util.TimeZone;
import java.util.concurrent.Executors;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ot2 extends co6 implements m45 {
    public static final ot2 A;
    public static final ot2 B;
    public static final ot2 C;
    public static final ot2 D;
    public static final ot2 E;
    public static final ot2 b;
    public static final ot2 c;
    public static final ot2 d;
    public static final ot2 e;
    public static final ot2 f;
    public static final ot2 g;
    public static final ot2 h;
    public static final ot2 i;
    public static final ot2 j;
    public static final ot2 k;
    public static final ot2 l;
    public static final ot2 m;
    public static final ot2 n;
    public static final ot2 o;
    public static final ot2 p;
    public static final ot2 q;
    public static final ot2 r;
    public static final ot2 s;
    public static final ot2 t;
    public static final ot2 u;
    public static final ot2 v;
    public static final ot2 w;
    public static final ot2 x;
    public static final ot2 y;
    public static final ot2 z;
    public final /* synthetic */ int a;

    static {
        int i2 = 0;
        b = new ot2(i2, 0);
        c = new ot2(i2, 1);
        d = new ot2(i2, 2);
        e = new ot2(i2, 3);
        f = new ot2(i2, 4);
        g = new ot2(i2, 5);
        h = new ot2(i2, 6);
        i = new ot2(i2, 7);
        j = new ot2(i2, 8);
        k = new ot2(i2, 9);
        l = new ot2(i2, 10);
        m = new ot2(i2, 11);
        n = new ot2(i2, 12);
        o = new ot2(i2, 13);
        p = new ot2(i2, 14);
        q = new ot2(i2, 15);
        r = new ot2(i2, 16);
        s = new ot2(i2, 17);
        t = new ot2(i2, 18);
        u = new ot2(i2, 19);
        v = new ot2(i2, 20);
        w = new ot2(i2, 21);
        x = new ot2(i2, 22);
        y = new ot2(i2, 23);
        z = new ot2(i2, 24);
        A = new ot2(i2, 25);
        B = new ot2(i2, 26);
        C = new ot2(i2, 27);
        D = new ot2(i2, 28);
        E = new ot2(i2, 29);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ot2(int i2, int i3) {
        super(i2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        switch (this.a) {
            case 0:
                return "Unable to create the request, probably due to bad data format. The batch will be dropped.";
            case 1:
            case 2:
                return "Unable to execute the request; we will retry later.";
            case 3:
                return "The Datadog library has already been initialized.";
            case 4:
                return "Cannot create SDK instance ID, stopping SDK initialization.";
            case 5:
                return "Unable to remove shutdown hook, Runtime is already shutting down";
            case 6:
                return "Security Manager denied removing shutdown hook ";
            case 7:
                return "Unable to add shutdown hook, Runtime is already shutting down";
            case 8:
                return "Shutdown hook was rejected";
            case 9:
                return KLTXZbnQvj.nWkCqaenJxa;
            case 10:
                return "Failed to get all threads dump";
            case 11:
                return kSWQKWZ.GuMepwfE;
            case 12:
                return "Datadog SDK is in an unexpected state due to an ongoing crash. Some events could be lost.";
            case 13:
                return "Requested to write log, but Logs feature is not registered.";
            case 14:
                return "Requested to forward error log to RUM, but RUM feature is not registered.";
            case 15:
                return "Error while trying to read the NDK crash directory";
            case 16:
                return "RUM feature is not registered, won't report NDK crash info as RUM error.";
            case 17:
                String property = System.getProperty("os.arch");
                return property == null ? "unknown" : property;
            case 18:
                return Integer.valueOf(Runtime.getRuntime().availableProcessors());
            case 19:
                return TimeZone.getDefault().getID();
            case 20:
                return Boolean.TRUE;
            case 21:
                return "No batch file available";
            case 22:
                return Boolean.FALSE;
            case 23:
                return Executors.newCachedThreadPool();
            case 24:
                return "Unable to gzip request body";
            case 25:
                return Boolean.FALSE;
            case 26:
                return "KronosClock.getCurrentTimeMs failed with an exception";
            case 27:
                return new aq6(3);
            case 28:
                return "You're trying to create a Logger instance, but the SDK was not yet initialized. This Logger will not be able to send any messages. Please initialize the Datadog SDK first before creating a new Logger instance.";
            default:
                return "Logs feature received a Span log event where one or more mandatory (loggerName, message, timestamp, attributes) fields are either missing or have wrong type.";
        }
    }
}
