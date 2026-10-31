package kotlin;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.Serializable;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\b\u0087@\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\u00060\u0002j\u0002`\u0003:\u0002\u0004\u0005\u0088\u0001\u0006\u0092\u0001\u0004\u0018\u00010\u0007¨\u0006\b"}, d2 = {"Lkotlin/Result;", "T", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", k.O, "Failure", "value", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JvmInline
/* loaded from: classes.dex */
public final class Result<T> implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f71687b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Object f71688a;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/Result$Companion;", b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/Result$Failure;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Failure implements Serializable {

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f71689a;

        public Failure(Throwable exception) {
            Intrinsics.g(exception, "exception");
            this.f71689a = exception;
        }

        public final boolean equals(Object obj) {
            if (obj instanceof Failure) {
                return Intrinsics.b(this.f71689a, ((Failure) obj).f71689a);
            }
            return false;
        }

        public final int hashCode() {
            return this.f71689a.hashCode();
        }

        public final String toString() {
            return "Failure(" + this.f71689a + ')';
        }
    }

    static {
        new Companion(0);
    }

    public /* synthetic */ Result(Object obj) {
        this.f71688a = obj;
    }

    public static final Throwable a(Object obj) {
        if (obj instanceof Failure) {
            return ((Failure) obj).f71689a;
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof Result) {
            return Intrinsics.b(this.f71688a, ((Result) obj).f71688a);
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.f71688a;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        Object obj = this.f71688a;
        if (obj instanceof Failure) {
            return ((Failure) obj).toString();
        }
        return "Success(" + obj + ')';
    }
}
