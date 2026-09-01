package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;
import java.util.Set;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qvc {
    public static final qvc ACCEPTED;
    public static final qvc CHANGES_MADE;
    public static final qvc CHANGES_REQUESTED;
    public static final pvc Companion;
    public static final qvc IN_REVIEW;
    public static final qvc OPEN;
    public static final qvc TRIAGE;
    public static final Set a;
    public static final /* synthetic */ qvc[] b;
    public static final /* synthetic */ i04 c;

    public static g04 getEntries() {
        return c;
    }

    public static qvc valueOf(String str) {
        return (qvc) Enum.valueOf(qvc.class, str);
    }

    public static qvc[] values() {
        return (qvc[]) b.clone();
    }

    static {
        qvc qvcVar = new qvc("ACCEPTED", 0);
        ACCEPTED = qvcVar;
        qvc qvcVar2 = new qvc("CHANGES_MADE", 1);
        CHANGES_MADE = qvcVar2;
        qvc qvcVar3 = new qvc("CHANGES_REQUESTED", 2);
        CHANGES_REQUESTED = qvcVar3;
        qvc qvcVar4 = new qvc("IN_REVIEW", 3);
        IN_REVIEW = qvcVar4;
        qvc qvcVar5 = new qvc(ezwlgQm.EFNoiMaGatWfd, 4);
        OPEN = qvcVar5;
        qvc qvcVar6 = new qvc("TRIAGE", 5);
        TRIAGE = qvcVar6;
        qvc[] qvcVarArr = {qvcVar, qvcVar2, qvcVar3, qvcVar4, qvcVar5, qvcVar6};
        b = qvcVarArr;
        c = new i04(qvcVarArr);
        Companion = new pvc();
        a = k80.S0(new qvc[]{qvcVar2, qvcVar3, qvcVar4, qvcVar5, qvcVar6});
    }
}
