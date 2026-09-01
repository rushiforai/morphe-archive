package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class paf {
    public static final paf DRAFT;
    public static final paf PUBLIC;
    public static final paf SUBMISSIONS;
    public static final paf UNLISTED;
    public static final /* synthetic */ paf[] a;
    public static final /* synthetic */ i04 b;

    static {
        paf pafVar = new paf("DRAFT", 0);
        DRAFT = pafVar;
        paf pafVar2 = new paf("PUBLIC", 1);
        PUBLIC = pafVar2;
        paf pafVar3 = new paf("UNLISTED", 2);
        UNLISTED = pafVar3;
        paf pafVar4 = new paf("SUBMISSIONS", 3);
        SUBMISSIONS = pafVar4;
        paf[] pafVarArr = {pafVar, pafVar2, pafVar3, pafVar4};
        a = pafVarArr;
        b = new i04(pafVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static paf valueOf(String str) {
        return (paf) Enum.valueOf(paf.class, str);
    }

    public static paf[] values() {
        return (paf[]) a.clone();
    }
}
