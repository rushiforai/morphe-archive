package zw;

import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public final class f {

    @NotNull
    public static final e Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f98791a;

    /* renamed from: b, reason: collision with root package name */
    public static final f f98792b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ f[] f98793c;

    static {
        f fVar = new f("PORTRAIT", 0);
        f98792b = fVar;
        f[] fVarArr = {fVar, new f("LANDSCAPE", 1)};
        f98793c = fVarArr;
        EnumEntriesKt.a(fVarArr);
        Companion = new e();
        f98791a = LazyKt.b(LazyThreadSafetyMode.f71680b, new ww.e(21));
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f98793c.clone();
    }
}
