package g2;

import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class w implements v {

    /* renamed from: a, reason: collision with root package name */
    public static final w f56904a;

    /* renamed from: b, reason: collision with root package name */
    public static final w f56905b;

    /* renamed from: c, reason: collision with root package name */
    public static final w f56906c;

    /* renamed from: d, reason: collision with root package name */
    public static final w f56907d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ w[] f56908e;

    static {
        w wVar = new w("Active", 0);
        f56904a = wVar;
        w wVar2 = new w("ActiveParent", 1);
        f56905b = wVar2;
        w wVar3 = new w("Captured", 2);
        f56906c = wVar3;
        w wVar4 = new w("Inactive", 3);
        f56907d = wVar4;
        w[] wVarArr = {wVar, wVar2, wVar3, wVar4};
        f56908e = wVarArr;
        EnumEntriesKt.a(wVarArr);
    }

    public static w valueOf(String str) {
        return (w) Enum.valueOf(w.class, str);
    }

    public static w[] values() {
        return (w[]) f56908e.clone();
    }

    public final boolean a() {
        int iOrdinal = ordinal();
        if (iOrdinal == 0 || iOrdinal == 1 || iOrdinal == 2) {
            return true;
        }
        if (iOrdinal == 3) {
            return false;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final boolean b() {
        int iOrdinal = ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                return false;
            }
            if (iOrdinal != 2) {
                if (iOrdinal == 3) {
                    return false;
                }
                throw new NoWhenBranchMatchedException();
            }
        }
        return true;
    }
}
