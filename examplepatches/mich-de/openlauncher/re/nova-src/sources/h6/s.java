package h6;

import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class s {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ s[] $VALUES;

    @NotNull
    public static final q Companion;
    public static final s ON_ANY;
    public static final s ON_CREATE;
    public static final s ON_DESTROY;
    public static final s ON_PAUSE;
    public static final s ON_RESUME;
    public static final s ON_START;
    public static final s ON_STOP;

    static {
        s sVar = new s("ON_CREATE", 0);
        ON_CREATE = sVar;
        s sVar2 = new s("ON_START", 1);
        ON_START = sVar2;
        s sVar3 = new s("ON_RESUME", 2);
        ON_RESUME = sVar3;
        s sVar4 = new s("ON_PAUSE", 3);
        ON_PAUSE = sVar4;
        s sVar5 = new s("ON_STOP", 4);
        ON_STOP = sVar5;
        s sVar6 = new s("ON_DESTROY", 5);
        ON_DESTROY = sVar6;
        s sVar7 = new s("ON_ANY", 6);
        ON_ANY = sVar7;
        s[] sVarArr = {sVar, sVar2, sVar3, sVar4, sVar5, sVar6, sVar7};
        $VALUES = sVarArr;
        $ENTRIES = EnumEntriesKt.a(sVarArr);
        Companion = new q();
    }

    public static s valueOf(String str) {
        return (s) Enum.valueOf(s.class, str);
    }

    public static s[] values() {
        return (s[]) $VALUES.clone();
    }

    public final t a() {
        switch (r.f59425a[ordinal()]) {
            case 1:
            case 2:
                return t.f59442c;
            case 3:
            case 4:
                return t.f59443d;
            case 5:
                return t.f59444e;
            case 6:
                return t.f59440a;
            case 7:
                throw new IllegalArgumentException(this + " has no target state");
            default:
                throw new NoWhenBranchMatchedException();
        }
    }
}
