package u40;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public static final u f90635a;

    /* renamed from: b, reason: collision with root package name */
    public static final u f90636b;

    /* renamed from: c, reason: collision with root package name */
    public static final u f90637c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ u[] f90638d;

    static {
        u uVar = new u("RECENCY", 0);
        f90635a = uVar;
        u uVar2 = new u("PLAIN_REQUENCY", 1);
        f90636b = uVar2;
        u uVar3 = new u("GHOST_REQUENCY", 2);
        f90637c = uVar3;
        f90638d = new u[]{uVar, uVar2, uVar3};
    }

    public static u valueOf(String str) {
        return (u) Enum.valueOf(u.class, str);
    }

    public static u[] values() {
        return (u[]) f90638d.clone();
    }
}
