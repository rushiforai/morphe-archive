package y70;

import java.util.Arrays;
import java.util.Collection;
import java.util.ServiceConfigurationError;
import kotlin.sequences.SequencesKt;

/* loaded from: classes5.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final Collection f96791a;

    static {
        try {
            f96791a = SequencesKt.A0(q70.d.m0(Arrays.asList(new u70.b()).iterator()));
        } catch (Throwable th2) {
            throw new ServiceConfigurationError(th2.getMessage(), th2);
        }
    }
}
