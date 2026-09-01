package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mpc {
    public static final mpc BASELINE_TO_BASELINE;
    public static final mpc BASELINE_TO_BOTTOM;
    public static final mpc BASELINE_TO_TOP;
    public static final mpc BOTTOM_TO_BASELINE;
    public static final mpc BOTTOM_TO_BOTTOM;
    public static final mpc BOTTOM_TO_TOP;
    public static final mpc CENTER_HORIZONTALLY;
    public static final mpc CENTER_VERTICALLY;
    public static final mpc CIRCULAR_CONSTRAINT;
    public static final mpc END_TO_END;
    public static final mpc END_TO_START;
    public static final mpc LEFT_TO_LEFT;
    public static final mpc LEFT_TO_RIGHT;
    public static final mpc RIGHT_TO_LEFT;
    public static final mpc RIGHT_TO_RIGHT;
    public static final mpc START_TO_END;
    public static final mpc START_TO_START;
    public static final mpc TOP_TO_BASELINE;
    public static final mpc TOP_TO_BOTTOM;
    public static final mpc TOP_TO_TOP;
    public static final /* synthetic */ mpc[] a;

    static {
        mpc mpcVar = new mpc("LEFT_TO_LEFT", 0);
        LEFT_TO_LEFT = mpcVar;
        mpc mpcVar2 = new mpc("LEFT_TO_RIGHT", 1);
        LEFT_TO_RIGHT = mpcVar2;
        mpc mpcVar3 = new mpc("RIGHT_TO_LEFT", 2);
        RIGHT_TO_LEFT = mpcVar3;
        mpc mpcVar4 = new mpc("RIGHT_TO_RIGHT", 3);
        RIGHT_TO_RIGHT = mpcVar4;
        mpc mpcVar5 = new mpc("START_TO_START", 4);
        START_TO_START = mpcVar5;
        mpc mpcVar6 = new mpc("START_TO_END", 5);
        START_TO_END = mpcVar6;
        mpc mpcVar7 = new mpc("END_TO_START", 6);
        END_TO_START = mpcVar7;
        mpc mpcVar8 = new mpc("END_TO_END", 7);
        END_TO_END = mpcVar8;
        mpc mpcVar9 = new mpc("TOP_TO_TOP", 8);
        TOP_TO_TOP = mpcVar9;
        mpc mpcVar10 = new mpc("TOP_TO_BOTTOM", 9);
        TOP_TO_BOTTOM = mpcVar10;
        mpc mpcVar11 = new mpc("TOP_TO_BASELINE", 10);
        TOP_TO_BASELINE = mpcVar11;
        mpc mpcVar12 = new mpc("BOTTOM_TO_TOP", 11);
        BOTTOM_TO_TOP = mpcVar12;
        mpc mpcVar13 = new mpc("BOTTOM_TO_BOTTOM", 12);
        BOTTOM_TO_BOTTOM = mpcVar13;
        mpc mpcVar14 = new mpc("BOTTOM_TO_BASELINE", 13);
        BOTTOM_TO_BASELINE = mpcVar14;
        mpc mpcVar15 = new mpc("BASELINE_TO_BASELINE", 14);
        BASELINE_TO_BASELINE = mpcVar15;
        mpc mpcVar16 = new mpc("BASELINE_TO_TOP", 15);
        BASELINE_TO_TOP = mpcVar16;
        mpc mpcVar17 = new mpc("BASELINE_TO_BOTTOM", 16);
        BASELINE_TO_BOTTOM = mpcVar17;
        mpc mpcVar18 = new mpc("CENTER_HORIZONTALLY", 17);
        CENTER_HORIZONTALLY = mpcVar18;
        mpc mpcVar19 = new mpc("CENTER_VERTICALLY", 18);
        CENTER_VERTICALLY = mpcVar19;
        mpc mpcVar20 = new mpc("CIRCULAR_CONSTRAINT", 19);
        CIRCULAR_CONSTRAINT = mpcVar20;
        a = new mpc[]{mpcVar, mpcVar2, mpcVar3, mpcVar4, mpcVar5, mpcVar6, mpcVar7, mpcVar8, mpcVar9, mpcVar10, mpcVar11, mpcVar12, mpcVar13, mpcVar14, mpcVar15, mpcVar16, mpcVar17, mpcVar18, mpcVar19, mpcVar20};
    }

    public static mpc valueOf(String str) {
        return (mpc) Enum.valueOf(mpc.class, str);
    }

    public static mpc[] values() {
        return (mpc[]) a.clone();
    }
}
