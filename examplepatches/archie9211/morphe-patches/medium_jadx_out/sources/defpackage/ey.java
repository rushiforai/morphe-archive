package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ey {
    public static final ey Clickable;
    public static final ey Link;
    public static final ey Paragraph;
    public static final ey Span;
    public static final ey String;
    public static final ey Url;
    public static final ey VerbatimTts;
    public static final /* synthetic */ ey[] a;
    public static final /* synthetic */ i04 b;

    static {
        ey eyVar = new ey("Paragraph", 0);
        Paragraph = eyVar;
        ey eyVar2 = new ey("Span", 1);
        Span = eyVar2;
        ey eyVar3 = new ey("VerbatimTts", 2);
        VerbatimTts = eyVar3;
        ey eyVar4 = new ey("Url", 3);
        Url = eyVar4;
        ey eyVar5 = new ey("Link", 4);
        Link = eyVar5;
        ey eyVar6 = new ey("Clickable", 5);
        Clickable = eyVar6;
        ey eyVar7 = new ey("String", 6);
        String = eyVar7;
        ey[] eyVarArr = {eyVar, eyVar2, eyVar3, eyVar4, eyVar5, eyVar6, eyVar7};
        a = eyVarArr;
        b = new i04(eyVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ey valueOf(String str) {
        return (ey) Enum.valueOf(ey.class, str);
    }

    public static ey[] values() {
        return (ey[]) a.clone();
    }
}
