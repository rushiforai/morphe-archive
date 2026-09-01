package defpackage;

import com.medium.android.donkey.main.Wv.MaAxRJinch;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class opc {
    public static final opc ALIGN_HORIZONTALLY;
    public static final opc ALIGN_VERTICALLY;
    public static final opc BARRIER;
    public static final opc COLUMN;
    public static final opc FLOW;
    public static final opc GRID;
    public static final opc HORIZONTAL_CHAIN;
    public static final opc HORIZONTAL_FLOW;
    public static final opc LAYER;
    public static final opc ROW;
    public static final opc VERTICAL_CHAIN;
    public static final opc VERTICAL_FLOW;
    public static final /* synthetic */ opc[] a;

    public static opc valueOf(String str) {
        return (opc) Enum.valueOf(opc.class, str);
    }

    public static opc[] values() {
        return (opc[]) a.clone();
    }

    static {
        opc opcVar = new opc("HORIZONTAL_CHAIN", 0);
        HORIZONTAL_CHAIN = opcVar;
        opc opcVar2 = new opc("VERTICAL_CHAIN", 1);
        VERTICAL_CHAIN = opcVar2;
        opc opcVar3 = new opc(MaAxRJinch.qpzdes, 2);
        ALIGN_HORIZONTALLY = opcVar3;
        opc opcVar4 = new opc("ALIGN_VERTICALLY", 3);
        ALIGN_VERTICALLY = opcVar4;
        opc opcVar5 = new opc("BARRIER", 4);
        BARRIER = opcVar5;
        opc opcVar6 = new opc("LAYER", 5);
        LAYER = opcVar6;
        opc opcVar7 = new opc("HORIZONTAL_FLOW", 6);
        HORIZONTAL_FLOW = opcVar7;
        opc opcVar8 = new opc("VERTICAL_FLOW", 7);
        VERTICAL_FLOW = opcVar8;
        opc opcVar9 = new opc("GRID", 8);
        GRID = opcVar9;
        opc opcVar10 = new opc("ROW", 9);
        ROW = opcVar10;
        opc opcVar11 = new opc("COLUMN", 10);
        COLUMN = opcVar11;
        opc opcVar12 = new opc("FLOW", 11);
        FLOW = opcVar12;
        a = new opc[]{opcVar, opcVar2, opcVar3, opcVar4, opcVar5, opcVar6, opcVar7, opcVar8, opcVar9, opcVar10, opcVar11, opcVar12};
    }
}
