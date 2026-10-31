package es;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public static final q f53002a;

    /* renamed from: b, reason: collision with root package name */
    public static final q f53003b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ q[] f53004c;

    static {
        q qVar = new q("Card", 0);
        f53002a = qVar;
        q qVar2 = new q("BankAccount", 1);
        f53003b = qVar2;
        q[] qVarArr = {qVar, qVar2};
        f53004c = qVarArr;
        EnumEntriesKt.a(qVarArr);
    }

    public static q valueOf(String str) {
        return (q) Enum.valueOf(q.class, str);
    }

    public static q[] values() {
        return (q[]) f53004c.clone();
    }
}
