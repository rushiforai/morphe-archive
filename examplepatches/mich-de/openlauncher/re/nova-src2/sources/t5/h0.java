package t5;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashSet;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class h0 implements j1 {

    /* renamed from: d, reason: collision with root package name */
    public static final LinkedHashSet f88595d = new LinkedHashSet();

    /* renamed from: e, reason: collision with root package name */
    public static final Object f88596e = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final c1 f88597a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f88598b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f88599c;

    public h0(c1 c1Var, Function1 function1, Function0 function0) {
        this.f88597a = c1Var;
        this.f88598b = function1;
        this.f88599c = function0;
    }

    @Override // t5.j1
    public final k1 a() throws IOException {
        File canonicalFile = ((File) this.f88599c.invoke()).getCanonicalFile();
        synchronized (f88596e) {
            String path = canonicalFile.getAbsolutePath();
            LinkedHashSet linkedHashSet = f88595d;
            if (linkedHashSet.contains(path)) {
                throw new IllegalStateException(("There are multiple DataStores active for the same file: " + path + ". You should either maintain your DataStore as a singleton or confirm that there is no two DataStore's active on the same file (by confirming that the scope is cancelled).").toString());
            }
            Intrinsics.f(path, "path");
            linkedHashSet.add(path);
        }
        return new k0(canonicalFile, this.f88597a, (p0) this.f88598b.invoke(canonicalFile), new c3.c1(canonicalFile, 22));
    }

    public /* synthetic */ h0(c1 c1Var, Function0 function0) {
        this(c1Var, g0.f88589j, function0);
    }
}
