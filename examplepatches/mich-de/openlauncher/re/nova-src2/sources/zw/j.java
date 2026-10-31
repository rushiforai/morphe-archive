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
public final class j {

    @NotNull
    public static final i Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f98797a;

    /* renamed from: b, reason: collision with root package name */
    public static final j f98798b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ j[] f98799c;

    static {
        j jVar = new j("DARK", 0);
        j jVar2 = new j("LIGHT", 1);
        f98798b = jVar2;
        j[] jVarArr = {jVar, jVar2, new j("CONTRAST", 2)};
        f98799c = jVarArr;
        EnumEntriesKt.a(jVarArr);
        Companion = new i();
        f98797a = LazyKt.b(LazyThreadSafetyMode.f71680b, new ww.e(23));
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f98799c.clone();
    }
}
