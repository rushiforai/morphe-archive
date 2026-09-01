package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u73 extends qb8 {
    public final /* synthetic */ int y;

    public /* synthetic */ u73(int i) {
        this.y = i;
    }

    @Override // defpackage.qb8
    public final String D() {
        switch (this.y) {
            case 0:
                return "INSERT OR IGNORE INTO `Dependency` (`work_spec_id`,`prerequisite_id`) VALUES (?,?)";
            case 1:
                return "INSERT OR REPLACE INTO `lists_catalog_download_state` (`id`,`downloaded_item_count`,`total_item_count`,`downloading`,`downloading_post_id`) VALUES (?,?,?,?,?)";
            case 2:
                return "INSERT OR REPLACE INTO `Preference` (`key`,`long_value`) VALUES (?,?)";
            case 3:
                return "INSERT OR REPLACE INTO `SystemIdInfo` (`work_spec_id`,`generation`,`system_id`) VALUES (?,?,?)";
            case 4:
                return "INSERT OR IGNORE INTO `WorkName` (`name`,`work_spec_id`) VALUES (?,?)";
            case 5:
                return "INSERT OR REPLACE INTO `WorkProgress` (`work_spec_id`,`progress`) VALUES (?,?)";
            case 6:
                return "INSERT OR IGNORE INTO `WorkSpec` (`id`,`state`,`worker_class_name`,`input_merger_class_name`,`input`,`output`,`initial_delay`,`interval_duration`,`flex_duration`,`run_attempt_count`,`backoff_policy`,`backoff_delay_duration`,`last_enqueue_time`,`minimum_retention_duration`,`schedule_requested_at`,`run_in_foreground`,`out_of_quota_policy`,`period_count`,`generation`,`next_schedule_time_override`,`next_schedule_time_override_generation`,`stop_reason`,`trace_tag`,`backoff_on_system_interruptions`,`required_network_type`,`required_network_request`,`requires_charging`,`requires_device_idle`,`requires_battery_not_low`,`requires_storage_not_low`,`trigger_content_update_delay`,`trigger_max_content_delay`,`content_uri_triggers`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            default:
                return "INSERT OR IGNORE INTO `WorkTag` (`tag`,`work_spec_id`) VALUES (?,?)";
        }
    }

    @Override // defpackage.qb8
    public final void z(gnb gnbVar, Object obj) {
        int i;
        int i2 = 1;
        switch (this.y) {
            case 0:
                r73 r73Var = (r73) obj;
                gnbVar.getClass();
                r73Var.getClass();
                gnbVar.M(1, r73Var.a);
                gnbVar.M(2, r73Var.b);
                break;
            case 1:
                p37 p37Var = (p37) obj;
                gnbVar.getClass();
                p37Var.getClass();
                gnbVar.M(1, p37Var.a);
                gnbVar.c(2, p37Var.b);
                gnbVar.c(3, p37Var.c);
                gnbVar.c(4, p37Var.d ? 1L : 0L);
                String str = p37Var.e;
                if (str != null) {
                    gnbVar.M(5, str);
                } else {
                    gnbVar.g(5);
                }
                break;
            case 2:
                jy9 jy9Var = (jy9) obj;
                gnbVar.getClass();
                jy9Var.getClass();
                gnbVar.M(1, jy9Var.a);
                gnbVar.c(2, jy9Var.b.longValue());
                break;
            case 3:
                p6d p6dVar = (p6d) obj;
                gnbVar.getClass();
                p6dVar.getClass();
                gnbVar.M(1, p6dVar.a);
                gnbVar.c(2, p6dVar.b);
                gnbVar.c(3, p6dVar.c);
                break;
            case 4:
                r7f r7fVar = (r7f) obj;
                gnbVar.getClass();
                r7fVar.getClass();
                gnbVar.M(1, r7fVar.a);
                gnbVar.M(2, r7fVar.b);
                break;
            case 5:
                t7f t7fVar = (t7f) obj;
                gnbVar.getClass();
                t7fVar.getClass();
                gnbVar.M(1, t7fVar.a);
                dt2 dt2Var = dt2.b;
                gnbVar.d(2, ht2.E0(t7fVar.b));
                break;
            case 6:
                c8f c8fVar = (c8f) obj;
                gnbVar.getClass();
                c8fVar.getClass();
                gnbVar.M(1, c8fVar.a);
                gnbVar.c(2, en7.R(c8fVar.b));
                gnbVar.M(3, c8fVar.c);
                gnbVar.M(4, c8fVar.d);
                dt2 dt2Var2 = dt2.b;
                gnbVar.d(5, ht2.E0(c8fVar.e));
                gnbVar.d(6, ht2.E0(c8fVar.f));
                gnbVar.c(7, c8fVar.g);
                gnbVar.c(8, c8fVar.h);
                gnbVar.c(9, c8fVar.i);
                gnbVar.c(10, c8fVar.k);
                tm0 tm0Var = c8fVar.l;
                tm0Var.getClass();
                int i3 = j8f.b[tm0Var.ordinal()];
                if (i3 == 1) {
                    i = 0;
                } else if (i3 != 2) {
                    ygf.a();
                } else {
                    i = 1;
                }
                gnbVar.c(11, i);
                gnbVar.c(12, c8fVar.m);
                gnbVar.c(13, c8fVar.n);
                gnbVar.c(14, c8fVar.o);
                gnbVar.c(15, c8fVar.p);
                gnbVar.c(16, c8fVar.q ? 1L : 0L);
                lw8 lw8Var = c8fVar.r;
                lw8Var.getClass();
                int i4 = j8f.d[lw8Var.ordinal()];
                if (i4 == 1) {
                    i2 = 0;
                } else if (i4 != 2) {
                    ygf.a();
                }
                gnbVar.c(17, i2);
                gnbVar.c(18, c8fVar.s);
                gnbVar.c(19, c8fVar.t);
                gnbVar.c(20, c8fVar.u);
                gnbVar.c(21, c8fVar.v);
                gnbVar.c(22, c8fVar.w);
                String str2 = c8fVar.x;
                if (str2 == null) {
                    gnbVar.g(23);
                } else {
                    gnbVar.M(23, str2);
                }
                Boolean bool = c8fVar.y;
                if ((bool != null ? Integer.valueOf(bool.booleanValue() ? 1 : 0) : null) == null) {
                    gnbVar.g(24);
                } else {
                    gnbVar.c(24, r7.intValue());
                }
                e72 e72Var = c8fVar.j;
                gnbVar.c(25, en7.L(e72Var.a));
                gnbVar.d(26, en7.w(e72Var.b));
                gnbVar.c(27, e72Var.c ? 1L : 0L);
                gnbVar.c(28, e72Var.d ? 1L : 0L);
                gnbVar.c(29, e72Var.e ? 1L : 0L);
                gnbVar.c(30, e72Var.f ? 1L : 0L);
                gnbVar.c(31, e72Var.g);
                gnbVar.c(32, e72Var.h);
                gnbVar.d(33, en7.Q(e72Var.i));
                break;
            default:
                h8f h8fVar = (h8f) obj;
                gnbVar.getClass();
                h8fVar.getClass();
                gnbVar.M(1, h8fVar.a);
                gnbVar.M(2, h8fVar.b);
                break;
        }
    }
}
