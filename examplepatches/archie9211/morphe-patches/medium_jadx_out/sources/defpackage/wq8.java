package defpackage;

import android.text.Editable;
import java.util.ArrayList;
import java.util.Map;
import pushnotifications.SY.eoLmc;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class wq8 {
    public static final lq8 Companion;
    public static final wq8 DIGIT;
    public static final wq8 DOUBLE_QUOTE;
    public static final wq8 EMDASH;
    public static final wq8 GREATER_THAN;
    public static final wq8 HYPHEN;
    public static final wq8 LEFT_PARENTHESIS;
    public static final wq8 PERIOD;
    public static final wq8 RIGHT_PARENTHESIS;
    public static final wq8 SINGLE_QUOTE;
    public static final wq8 SPACE;
    public static final Map b;
    public static final /* synthetic */ wq8[] c;
    public static final /* synthetic */ i04 d;
    public final char[] a;

    public wq8(String str, int i, char[] cArr, gy2 gy2Var) {
        this.a = cArr;
    }

    public static g04 getEntries() {
        return d;
    }

    public static wq8 valueOf(String str) {
        return (wq8) Enum.valueOf(wq8.class, str);
    }

    public static wq8[] values() {
        return (wq8[]) c.clone();
    }

    public abstract void onCharacterAdded(Editable editable, int i);

    static {
        gi7.a.getClass();
        qq8 qq8Var = new qq8("HYPHEN", 0, fi7.g, null);
        HYPHEN = qq8Var;
        sq8 sq8Var = new sq8("PERIOD", 1, fi7.h, null);
        PERIOD = sq8Var;
        vq8 vq8Var = new vq8("SPACE", 2, fi7.i, null);
        SPACE = vq8Var;
        uq8 uq8Var = new uq8("SINGLE_QUOTE", 3, fi7.j, null);
        SINGLE_QUOTE = uq8Var;
        nq8 nq8Var = new nq8("DOUBLE_QUOTE", 4, fi7.k, null);
        DOUBLE_QUOTE = nq8Var;
        rq8 rq8Var = new rq8("LEFT_PARENTHESIS", 5, fi7.l, null);
        LEFT_PARENTHESIS = rq8Var;
        tq8 tq8Var = new tq8(eoLmc.pqHuFetdgjpLXc, 6, fi7.m, null);
        RIGHT_PARENTHESIS = tq8Var;
        pq8 pq8Var = new pq8("GREATER_THAN", 7, fi7.n, null);
        GREATER_THAN = pq8Var;
        mq8 mq8Var = new mq8("DIGIT", 8, fi7.c, null);
        DIGIT = mq8Var;
        oq8 oq8Var = new oq8("EMDASH", 9, fi7.o, null);
        EMDASH = oq8Var;
        wq8[] wq8VarArr = {qq8Var, sq8Var, vq8Var, uq8Var, nq8Var, rq8Var, tq8Var, pq8Var, mq8Var, oq8Var};
        c = wq8VarArr;
        d = new i04(wq8VarArr);
        Companion = new lq8();
        g04<wq8> entries = getEntries();
        ArrayList arrayList = new ArrayList();
        for (wq8 wq8Var : entries) {
            char[] cArr = wq8Var.a;
            ArrayList arrayList2 = new ArrayList(cArr.length);
            for (char c2 : cArr) {
                arrayList2.add(new f09(Character.valueOf(c2), wq8Var));
            }
            bu1.n0(arrayList2, arrayList);
        }
        b = ei7.V(arrayList);
    }
}
