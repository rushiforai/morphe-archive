package x7;

import b.c0;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes.dex */
public final class b extends androidx.room.f {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f95124b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(androidx.room.o oVar) {
        super(oVar);
        this.f95124b = 1;
    }

    @Override // androidx.room.f
    public final void bind(d7.g gVar, Object obj) throws Throwable {
        int i5;
        switch (this.f95124b) {
            case 0:
                a aVar = (a) obj;
                if (aVar.b() == null) {
                    gVar.bindNull(1);
                } else {
                    gVar.bindString(1, aVar.b());
                }
                if (aVar.a() == null) {
                    gVar.bindNull(2);
                    return;
                } else {
                    gVar.bindString(2, aVar.a());
                    return;
                }
            case 1:
                d dVar = (d) obj;
                gVar.bindString(1, dVar.f95128a);
                gVar.bindLong(2, dVar.f95129b.longValue());
                return;
            case 2:
                String str = ((g) obj).f95133a;
                if (str == null) {
                    gVar.bindNull(1);
                } else {
                    gVar.bindString(1, str);
                }
                gVar.bindLong(2, r12.f95134b);
                gVar.bindLong(3, r12.f95135c);
                return;
            case 3:
                m mVar = (m) obj;
                if (mVar.b() == null) {
                    gVar.bindNull(1);
                } else {
                    gVar.bindString(1, mVar.b());
                }
                byte[] bArrC = o7.g.c(mVar.a());
                if (bArrC == null) {
                    gVar.bindNull(2);
                    return;
                } else {
                    gVar.bindBlob(2, bArrC);
                    return;
                }
            case 4:
                q qVar = (q) obj;
                String str2 = qVar.f95171a;
                int i11 = 1;
                if (str2 == null) {
                    gVar.bindNull(1);
                } else {
                    gVar.bindString(1, str2);
                }
                gVar.bindLong(2, w20.e.s(qVar.f95172b));
                String str3 = qVar.f95173c;
                if (str3 == null) {
                    gVar.bindNull(3);
                } else {
                    gVar.bindString(3, str3);
                }
                String str4 = qVar.f95174d;
                if (str4 == null) {
                    gVar.bindNull(4);
                } else {
                    gVar.bindString(4, str4);
                }
                byte[] bArrC2 = o7.g.c(qVar.f95175e);
                if (bArrC2 == null) {
                    gVar.bindNull(5);
                } else {
                    gVar.bindBlob(5, bArrC2);
                }
                byte[] bArrC3 = o7.g.c(qVar.f95176f);
                if (bArrC3 == null) {
                    gVar.bindNull(6);
                } else {
                    gVar.bindBlob(6, bArrC3);
                }
                gVar.bindLong(7, qVar.f95177g);
                gVar.bindLong(8, qVar.f95178h);
                gVar.bindLong(9, qVar.f95179i);
                gVar.bindLong(10, qVar.f95181k);
                int i12 = qVar.f95182l;
                fq.c.o(i12, "backoffPolicy");
                int iF = c0.F(i12);
                if (iF == 0) {
                    i5 = 0;
                } else {
                    if (iF != 1) {
                        throw new NoWhenBranchMatchedException();
                    }
                    i5 = 1;
                }
                gVar.bindLong(11, i5);
                gVar.bindLong(12, qVar.f95183m);
                gVar.bindLong(13, qVar.n);
                gVar.bindLong(14, qVar.o);
                gVar.bindLong(15, qVar.f95184p);
                gVar.bindLong(16, qVar.f95185q ? 1L : 0L);
                int i13 = qVar.f95186r;
                fq.c.o(i13, "policy");
                int iF2 = c0.F(i13);
                if (iF2 == 0) {
                    i11 = 0;
                } else if (iF2 != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                gVar.bindLong(17, i11);
                gVar.bindLong(18, qVar.f95187s);
                gVar.bindLong(19, qVar.f95188t);
                gVar.bindLong(20, qVar.f95189u);
                gVar.bindLong(21, qVar.f95190v);
                gVar.bindLong(22, qVar.f95191w);
                o7.f fVar = qVar.f95180j;
                if (fVar != null) {
                    gVar.bindLong(23, w20.e.p(fVar.f79653a));
                    gVar.bindLong(24, fVar.f79654b ? 1L : 0L);
                    gVar.bindLong(25, fVar.f79655c ? 1L : 0L);
                    gVar.bindLong(26, fVar.f79656d ? 1L : 0L);
                    gVar.bindLong(27, fVar.f79657e ? 1L : 0L);
                    gVar.bindLong(28, fVar.f79658f);
                    gVar.bindLong(29, fVar.f79659g);
                    gVar.bindBlob(30, w20.e.q(fVar.f79660h));
                    return;
                }
                gVar.bindNull(23);
                gVar.bindNull(24);
                gVar.bindNull(25);
                gVar.bindNull(26);
                gVar.bindNull(27);
                gVar.bindNull(28);
                gVar.bindNull(29);
                gVar.bindNull(30);
                return;
            default:
                t tVar = (t) obj;
                String str5 = tVar.f95206a;
                if (str5 == null) {
                    gVar.bindNull(1);
                } else {
                    gVar.bindString(1, str5);
                }
                String str6 = tVar.f95207b;
                if (str6 == null) {
                    gVar.bindNull(2);
                    return;
                } else {
                    gVar.bindString(2, str6);
                    return;
                }
        }
    }

    @Override // androidx.room.v
    public final String createQuery() {
        switch (this.f95124b) {
            case 0:
                return "INSERT OR IGNORE INTO `Dependency` (`work_spec_id`,`prerequisite_id`) VALUES (?,?)";
            case 1:
                return "INSERT OR REPLACE INTO `Preference` (`key`,`long_value`) VALUES (?,?)";
            case 2:
                return "INSERT OR REPLACE INTO `SystemIdInfo` (`work_spec_id`,`generation`,`system_id`) VALUES (?,?,?)";
            case 3:
                return "INSERT OR REPLACE INTO `WorkProgress` (`work_spec_id`,`progress`) VALUES (?,?)";
            case 4:
                return "INSERT OR IGNORE INTO `WorkSpec` (`id`,`state`,`worker_class_name`,`input_merger_class_name`,`input`,`output`,`initial_delay`,`interval_duration`,`flex_duration`,`run_attempt_count`,`backoff_policy`,`backoff_delay_duration`,`last_enqueue_time`,`minimum_retention_duration`,`schedule_requested_at`,`run_in_foreground`,`out_of_quota_policy`,`period_count`,`generation`,`next_schedule_time_override`,`next_schedule_time_override_generation`,`stop_reason`,`required_network_type`,`requires_charging`,`requires_device_idle`,`requires_battery_not_low`,`requires_storage_not_low`,`trigger_content_update_delay`,`trigger_max_content_delay`,`content_uri_triggers`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            default:
                return "INSERT OR IGNORE INTO `WorkTag` (`tag`,`work_spec_id`) VALUES (?,?)";
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(androidx.room.o oVar, int i5) {
        super(oVar);
        this.f95124b = i5;
    }
}
