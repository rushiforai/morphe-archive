package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qn7 extends p2 {
    public static final pn7 i = new pn7();

    public final void O(Set set) {
        if (set != null) {
            p2.F(this, ek6.LOCAL_VARIANTS, set, false, 4, null);
        } else {
            e(ek6.LOCAL_VARIANTS);
        }
    }

    public final void P(String str) {
        if (str != null) {
            C(ek6.STAGE_BRANCH, str);
        } else {
            e(ek6.STAGE_BRANCH);
        }
    }
}
