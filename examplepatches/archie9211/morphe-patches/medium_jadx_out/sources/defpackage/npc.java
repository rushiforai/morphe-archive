package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class npc {
    public static final npc BOTTOM;
    public static final npc END;
    public static final npc LEFT;
    public static final npc RIGHT;
    public static final npc START;
    public static final npc TOP;
    public static final /* synthetic */ npc[] a;

    static {
        npc npcVar = new npc("LEFT", 0);
        LEFT = npcVar;
        npc npcVar2 = new npc("RIGHT", 1);
        RIGHT = npcVar2;
        npc npcVar3 = new npc("START", 2);
        START = npcVar3;
        npc npcVar4 = new npc("END", 3);
        END = npcVar4;
        npc npcVar5 = new npc("TOP", 4);
        TOP = npcVar5;
        npc npcVar6 = new npc("BOTTOM", 5);
        BOTTOM = npcVar6;
        a = new npc[]{npcVar, npcVar2, npcVar3, npcVar4, npcVar5, npcVar6};
    }

    public static npc valueOf(String str) {
        return (npc) Enum.valueOf(npc.class, str);
    }

    public static npc[] values() {
        return (npc[]) a.clone();
    }
}
