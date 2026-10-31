package x7;

import androidx.work.impl.WorkDatabase_Impl;

/* loaded from: classes2.dex */
public final class k extends androidx.room.f {
    public k(WorkDatabase_Impl workDatabase_Impl) {
        super(workDatabase_Impl);
    }

    @Override // androidx.room.f
    public final void bind(d7.g gVar, Object obj) {
        j jVar = (j) obj;
        String str = jVar.f95143a;
        if (str == null) {
            gVar.bindNull(1);
        } else {
            gVar.bindString(1, str);
        }
        gVar.bindString(2, jVar.f95144b);
    }

    @Override // androidx.room.v
    public final String createQuery() {
        return "INSERT OR IGNORE INTO `WorkName` (`name`,`work_spec_id`) VALUES (?,?)";
    }
}
