package defpackage;

import android.util.SparseArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum pqa {
    DEFAULT(0),
    UNMETERED_ONLY(1),
    UNMETERED_OR_DAILY(2),
    FAST_IF_RADIO_AWAKE(3),
    NEVER(4),
    UNRECOGNIZED(-1);

    public final int a;

    static {
        pqa pqaVar = DEFAULT;
        pqa pqaVar2 = UNMETERED_ONLY;
        pqa pqaVar3 = UNMETERED_OR_DAILY;
        pqa pqaVar4 = FAST_IF_RADIO_AWAKE;
        pqa pqaVar5 = NEVER;
        pqa pqaVar6 = UNRECOGNIZED;
        SparseArray sparseArray = new SparseArray();
        sparseArray.put(0, pqaVar);
        sparseArray.put(1, pqaVar2);
        sparseArray.put(2, pqaVar3);
        sparseArray.put(3, pqaVar4);
        sparseArray.put(4, pqaVar5);
        sparseArray.put(-1, pqaVar6);
    }

    pqa(int i) {
        this.a = i;
    }

    public static pqa forNumber(int i) {
        if (i == 0) {
            return DEFAULT;
        }
        if (i == 1) {
            return UNMETERED_ONLY;
        }
        if (i == 2) {
            return UNMETERED_OR_DAILY;
        }
        if (i == 3) {
            return FAST_IF_RADIO_AWAKE;
        }
        if (i != 4) {
            return null;
        }
        return NEVER;
    }

    public final int getNumber() {
        return this.a;
    }
}
