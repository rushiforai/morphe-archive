package fc0;

import java.math.MathContext;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ServiceLoader;
import java.util.logging.Logger;

/* loaded from: classes5.dex */
public abstract class i {

    /* renamed from: c, reason: collision with root package name */
    public static ic0.c f54617c;

    /* renamed from: a, reason: collision with root package name */
    public static final Logger f54615a = Logger.getLogger(i.class.getName());

    /* renamed from: b, reason: collision with root package name */
    public static final MathContext f54616b = MathContext.DECIMAL128;

    /* renamed from: d, reason: collision with root package name */
    public static final HashMap f54618d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public static final HashMap f54619e = new HashMap(9);

    public static ic0.c a() {
        if (f54617c == null) {
            Iterator it = ServiceLoader.load(ic0.c.class).iterator();
            while (it.hasNext()) {
                ic0.c cVar = (ic0.c) it.next();
                if ("tech.units.indriya.function.DefaultNumberSystem".equals(cVar.getClass().getName())) {
                    f54617c = cVar;
                }
            }
            throw new IllegalArgumentException("NumberSystem tech.units.indriya.function.DefaultNumberSystem not found");
        }
        return f54617c;
    }
}
