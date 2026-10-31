package e1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public static final q f51365a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ q[] f51366b;

    static {
        q qVar = new q("EditableText", 0);
        f51365a = qVar;
        q[] qVarArr = {qVar, new q("StaticText", 1)};
        f51366b = qVarArr;
        EnumEntriesKt.a(qVarArr);
    }

    public static q valueOf(String str) {
        return (q) Enum.valueOf(q.class, str);
    }

    public static q[] values() {
        return (q[]) f51366b.clone();
    }
}
