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
public final class h {

    @NotNull
    public static final g Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f98794a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f98795b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ h[] f98796c;

    static {
        h hVar = new h("INVISIBLE", 0);
        f98795b = hVar;
        h[] hVarArr = {hVar, new h("NORMAL", 1), new h("COMPACT", 2)};
        f98796c = hVarArr;
        EnumEntriesKt.a(hVarArr);
        Companion = new g();
        f98794a = LazyKt.b(LazyThreadSafetyMode.f71680b, new ww.e(22));
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f98796c.clone();
    }
}
