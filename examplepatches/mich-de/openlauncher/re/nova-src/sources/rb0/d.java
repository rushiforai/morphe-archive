package rb0;

import b.u4;
import java.io.PrintStream;

/* loaded from: classes5.dex */
public abstract class d implements ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public static final int f85780a;

    static {
        int i5 = c.f85779b ? 16 : 128;
        String property = System.getProperty("rx.ring-buffer.size");
        if (property != null) {
            try {
                i5 = Integer.parseInt(property);
            } catch (NumberFormatException e3) {
                PrintStream printStream = System.err;
                StringBuilder sbK = u4.k("Failed to set 'rx.buffer.size' with value ", property, " => ");
                sbK.append(e3.getMessage());
                printStream.println(sbK.toString());
            }
        }
        f85780a = i5;
    }
}
