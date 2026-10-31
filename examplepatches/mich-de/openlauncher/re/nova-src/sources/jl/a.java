package jl;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Logger f69593a = Logger.getLogger(a.class.getName());

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicBoolean f69594b = new AtomicBoolean(false);

    public static boolean a() {
        return f69594b.get();
    }
}
