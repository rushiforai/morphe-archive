package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qtd {
    public static final qtd ALREADY_SELECTED;
    public static final qtd CANCELLED;
    public static final qtd REREGISTER;
    public static final qtd SUCCESSFUL;
    public static final /* synthetic */ qtd[] a;
    public static final /* synthetic */ i04 b;

    static {
        qtd qtdVar = new qtd("SUCCESSFUL", 0);
        SUCCESSFUL = qtdVar;
        qtd qtdVar2 = new qtd("REREGISTER", 1);
        REREGISTER = qtdVar2;
        qtd qtdVar3 = new qtd("CANCELLED", 2);
        CANCELLED = qtdVar3;
        qtd qtdVar4 = new qtd("ALREADY_SELECTED", 3);
        ALREADY_SELECTED = qtdVar4;
        qtd[] qtdVarArr = {qtdVar, qtdVar2, qtdVar3, qtdVar4};
        a = qtdVarArr;
        b = new i04(qtdVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static qtd valueOf(String str) {
        return (qtd) Enum.valueOf(qtd.class, str);
    }

    public static qtd[] values() {
        return (qtd[]) a.clone();
    }
}
