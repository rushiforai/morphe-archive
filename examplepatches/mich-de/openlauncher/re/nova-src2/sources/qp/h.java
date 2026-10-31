package qp;

import androidx.room.o;
import androidx.room.v;

/* loaded from: classes.dex */
public final class h extends v {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f84306b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h(o oVar, int i5) {
        super(oVar);
        this.f84306b = i5;
    }

    @Override // androidx.room.v
    public final String createQuery() {
        switch (this.f84306b) {
            case 0:
                return "DELETE FROM DailyStats WHERE date < Date(?, '-7 days')";
            case 1:
                return "DELETE FROM DailyStats WHERE submitted = 'UNSUBMITTED'";
            case 2:
                return "DELETE FROM SystemIdInfo where work_spec_id=? AND generation=?";
            case 3:
                return "DELETE FROM SystemIdInfo where work_spec_id=?";
            case 4:
                return "DELETE from WorkProgress where work_spec_id=?";
            case 5:
                return "DELETE FROM WorkProgress";
            case 6:
                return "UPDATE workspec SET run_attempt_count=0 WHERE id=?";
            case 7:
                return "UPDATE workspec SET next_schedule_time_override=? WHERE id=?";
            case 8:
                return "UPDATE workspec SET next_schedule_time_override=9223372036854775807 WHERE (id=? AND next_schedule_time_override_generation=?)";
            case 9:
                return "UPDATE workspec SET schedule_requested_at=? WHERE id=?";
            case 10:
                return "DELETE FROM workspec WHERE id=?";
            case 11:
                return "UPDATE workspec SET state=? WHERE id=?";
            case 12:
                return "UPDATE workspec SET stop_reason = CASE WHEN state=1 THEN 1 ELSE -256 END, state=5 WHERE id=?";
            case 13:
                return "UPDATE workspec SET period_count=period_count+1 WHERE id=?";
            case 14:
                return "UPDATE workspec SET output=? WHERE id=?";
            case 15:
                return "UPDATE workspec SET last_enqueue_time=? WHERE id=?";
            case 16:
                return "UPDATE workspec SET run_attempt_count=run_attempt_count+1 WHERE id=?";
            default:
                return "DELETE FROM worktag WHERE work_spec_id=?";
        }
    }
}
