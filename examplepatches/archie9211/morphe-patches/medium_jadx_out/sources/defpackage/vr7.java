package defpackage;

import android.content.SharedPreferences;
import com.medium.android.core.models.CurrentUserEntity;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vr7 extends p2 {
    public final x38 i;
    public final w5d j;
    public final bo4 k;
    public final bo4 l;

    public vr7(SharedPreferences sharedPreferences, fh5 fh5Var, sb2 sb2Var, x38 x38Var) {
        super(sharedPreferences, fh5Var, sb2Var);
        this.i = x38Var;
        this.j = new w5d(new em4(23, this));
        this.k = K(ek6.RESUBSCRIBE_BANNER_CLOSE_AT, 0L);
        this.l = K(ek6.LAST_FOLLOWED_VIEWED_AT, 0L);
    }

    public final void O(r92 r92Var) {
        if (r92Var != null) {
            x(ek6.CONTINUE_READING_DATA, r92Var);
        } else {
            e(ek6.CONTINUE_READING_DATA);
        }
    }

    public final void P(CurrentUserEntity currentUserEntity) {
        if (currentUserEntity == null) {
            e(ek6.CURRENT_USER);
        } else {
            C(ek6.CURRENT_USER, ((jb6) this.j.getValue()).d(currentUserEntity));
        }
    }

    public final void Q(Set set) {
        if (set.isEmpty()) {
            e(ek6.CURRENT_USER_DISMISSABLE_FLAGS);
        } else {
            p2.F(this, ek6.CURRENT_USER_DISMISSABLE_FLAGS, set, false, 4, null);
        }
    }
}
