package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dne {
    public static final bne Companion;
    public static final dne LARGE;
    public static final dne LARGER;
    public static final dne LARGEST;
    public static final dne NORMAL;
    public static final dne SMALL;
    public static final dne SMALLER;
    public static final dne SMALLEST;
    public static final /* synthetic */ dne[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static dne valueOf(String str) {
        return (dne) Enum.valueOf(dne.class, str);
    }

    public static dne[] values() {
        return (dne[]) a.clone();
    }

    public final dne getLarger() {
        switch (cne.a[ordinal()]) {
            case 1:
                return SMALLER;
            case 2:
                return SMALL;
            case 3:
                return NORMAL;
            case 4:
                return LARGE;
            case 5:
                return LARGER;
            case 6:
                return LARGEST;
            case 7:
                return null;
            default:
                ygf.a();
                return null;
        }
    }

    public final dne getSmaller() {
        switch (cne.a[ordinal()]) {
            case 1:
                return null;
            case 2:
                return SMALLEST;
            case 3:
                return SMALLER;
            case 4:
                return SMALL;
            case 5:
                return NORMAL;
            case 6:
                return LARGE;
            case 7:
                return LARGER;
            default:
                ygf.a();
                return null;
        }
    }

    static {
        dne dneVar = new dne("SMALLEST", 0);
        SMALLEST = dneVar;
        dne dneVar2 = new dne(ziYqbdHrAXvj.EsyqSDAPosGa, 1);
        SMALLER = dneVar2;
        dne dneVar3 = new dne("SMALL", 2);
        SMALL = dneVar3;
        dne dneVar4 = new dne("NORMAL", 3);
        NORMAL = dneVar4;
        dne dneVar5 = new dne("LARGE", 4);
        LARGE = dneVar5;
        dne dneVar6 = new dne("LARGER", 5);
        LARGER = dneVar6;
        dne dneVar7 = new dne("LARGEST", 6);
        LARGEST = dneVar7;
        dne[] dneVarArr = {dneVar, dneVar2, dneVar3, dneVar4, dneVar5, dneVar6, dneVar7};
        a = dneVarArr;
        b = new i04(dneVarArr);
        Companion = new bne();
    }
}
