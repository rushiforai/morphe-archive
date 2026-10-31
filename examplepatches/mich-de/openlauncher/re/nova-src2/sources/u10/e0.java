package u10;

import android.net.Uri;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public abstract class e0 {

    @NotNull
    public static final d0 Companion = new d0();

    /* renamed from: b, reason: collision with root package name */
    public static final Object f90372b = LazyKt.b(LazyThreadSafetyMode.f71680b, new h50.q(27));

    /* renamed from: a, reason: collision with root package name */
    public final String f90373a;

    public abstract String a();

    public abstract Uri b();

    public abstract Function0 c();

    public e0(String str) {
        this.f90373a = str;
    }
}
