package ui;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ c[] f91282b;

    /* renamed from: a, reason: collision with root package name */
    public final int f91283a;

    static {
        c[] cVarArr = {new c("RIGHT", 0, 1), new c("LEFT", 1, 2), new c("UP", 2, 4), new c("DOWN", 3, 8)};
        f91282b = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public c(String str, int i5, int i11) {
        this.f91283a = i11;
    }

    public static c[] values() {
        return (c[]) f91282b.clone();
    }

    public final int a() {
        return this.f91283a;
    }
}
