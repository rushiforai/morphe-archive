package x7;

import androidx.room.v;
import androidx.work.impl.WorkDatabase_Impl;

/* loaded from: classes2.dex */
public final class r extends v {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f95192b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r(WorkDatabase_Impl workDatabase_Impl, int i5) {
        super(workDatabase_Impl);
        this.f95192b = i5;
    }

    @Override // androidx.room.v
    public final String createQuery() {
        switch (this.f95192b) {
            case 0:
                return "UPDATE workspec SET schedule_requested_at=-1 WHERE state NOT IN (2, 3, 5)";
            case 1:
                return "DELETE FROM workspec WHERE state IN (2, 3, 5) AND (SELECT COUNT(*)=0 FROM dependency WHERE     prerequisite_id=id AND     work_spec_id NOT IN         (SELECT id FROM workspec WHERE state IN (2, 3, 5)))";
            case 2:
                return "UPDATE workspec SET generation=generation+1 WHERE id=?";
            default:
                return "UPDATE workspec SET stop_reason=? WHERE id=?";
        }
    }
}
