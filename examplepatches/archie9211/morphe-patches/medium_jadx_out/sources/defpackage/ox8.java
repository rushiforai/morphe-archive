package defpackage;

import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ox8 extends co6 implements x45 {
    public static final ox8 b;
    public static final ox8 c;
    public static final ox8 d;
    public static final ox8 e;
    public static final ox8 f;
    public static final ox8 g;
    public static final ox8 h;
    public static final ox8 i;
    public static final ox8 j;
    public static final ox8 k;
    public static final ox8 l;
    public static final ox8 m;
    public static final ox8 n;
    public final /* synthetic */ int a;

    static {
        int i2 = 1;
        b = new ox8(i2, 0);
        c = new ox8(i2, 1);
        d = new ox8(i2, 2);
        e = new ox8(i2, 3);
        f = new ox8(i2, 4);
        g = new ox8(i2, 5);
        h = new ox8(i2, 6);
        i = new ox8(i2, 7);
        j = new ox8(i2, 8);
        k = new ox8(i2, 9);
        l = new ox8(i2, 10);
        m = new ox8(i2, 11);
        n = new ox8(i2, 12);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ox8(int i2, Object obj) {
        super(1);
        this.a = i2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                aq6 aq6Var = (aq6) obj;
                if (aq6Var.H()) {
                    aq6.V(aq6Var, false, 7);
                }
                return c1eVar;
            case 1:
                aq6 aq6Var2 = (aq6) obj;
                if (aq6Var2.H()) {
                    aq6Var2.F();
                }
                return c1eVar;
            case 2:
                return c1eVar;
            case 3:
                dd9 dd9Var = (dd9) obj;
                if (dd9Var.isAttachedToWindow()) {
                    dd9Var.q();
                }
                return c1eVar;
            case 4:
                return c1eVar;
            case 5:
                return Integer.valueOf(((mrb) obj).b);
            case 6:
                return Integer.valueOf(((mrb) obj).c.b());
            case 7:
                return String.format(Locale.US, "%02x", Arrays.copyOf(new Object[]{Byte.valueOf(((Number) obj).byteValue())}, 1));
            case 8:
                return c1eVar;
            case 9:
                int i3 = ((qy5) obj).a;
                return c1eVar;
            case 10:
                return c1eVar;
            case 11:
                int i4 = ((qy5) obj).a;
                return c1eVar;
            case 12:
                StackTraceElement stackTraceElement = (StackTraceElement) obj;
                stackTraceElement.getClass();
                return "at " + stackTraceElement;
            case 13:
                String str = (String) obj;
                str.getClass();
                int iY = muc.Y(str, ':', 0, 6);
                if (iY > 0 ? bv2.c.contains(str.substring(0, iY)) : false) {
                    return null;
                }
                return str;
            case 14:
                return new s46((((long) ((int) (((s46) obj).a >> 32))) << 32) | (4294967295L & ((long) 0)));
            case 15:
                return new s46((((long) ((int) (((s46) obj).a >> 32))) << 32) | (4294967295L & ((long) 0)));
            case 16:
                ((rr5) obj).getClass();
                return Boolean.TRUE;
            default:
                return c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ox8(int i2, int i3) {
        super(i2);
        this.a = i3;
    }
}
