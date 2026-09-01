package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import androidx.work.impl.WorkDatabase_Impl;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.data.database.MediumDatabase_Impl;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.explore.ui.vAWg.OphtYB;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dp7 extends vw3 {
    public final /* synthetic */ int d = 1;
    public final /* synthetic */ elb e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dp7(WorkDatabase_Impl workDatabase_Impl) {
        super("08b926448d86528e697981ddd30459f7", 24, "149fd8ad55885d3fe3549a37a0163243");
        this.e = workDatabase_Impl;
    }

    @Override // defpackage.vw3
    public final void r(anb anbVar) {
        int i = this.d;
        anbVar.getClass();
    }

    @Override // defpackage.vw3
    public final void s(anb anbVar) {
        int i = this.d;
        elb elbVar = this.e;
        anbVar.getClass();
        switch (i) {
            case 0:
                ((MediumDatabase_Impl) elbVar).n(anbVar);
                break;
            default:
                qk7.q(anbVar, "PRAGMA foreign_keys = ON");
                ((WorkDatabase_Impl) elbVar).n(anbVar);
                break;
        }
    }

    @Override // defpackage.vw3
    public final void t(anb anbVar) {
        int i = this.d;
        anbVar.getClass();
    }

    @Override // defpackage.vw3
    public final void u(anb anbVar) {
        int i = this.d;
        anbVar.getClass();
        switch (i) {
            case 0:
                g01.N(anbVar);
                break;
            default:
                g01.N(anbVar);
                break;
        }
    }

    @Override // defpackage.vw3
    public final void a(anb anbVar) {
        int i = this.d;
        anbVar.getClass();
        switch (i) {
            case 0:
                qk7.q(anbVar, AEVqIoD.aAFpkjwhH);
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_lists_catalog_download_state_downloading_post_id` ON `lists_catalog_download_state` (`downloading_post_id`)");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `offline_catalog` (`id` TEXT NOT NULL, `is_reading_list` INTEGER NOT NULL, `version` TEXT NOT NULL, `post_ids` TEXT NOT NULL, `preview` TEXT NOT NULL, `detail` TEXT NOT NULL, `items` TEXT NOT NULL, PRIMARY KEY(`id`))");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_offline_catalog_is_reading_list` ON `offline_catalog` (`is_reading_list`)");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `offline_post` (`id` TEXT NOT NULL, `latest_published_version` TEXT NOT NULL, `content` TEXT NOT NULL, PRIMARY KEY(`id`))");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
                qk7.q(anbVar, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, '796bc6077e9eac96f6f6db86a4ea65c7')");
                break;
            default:
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `Dependency` (`work_spec_id` TEXT NOT NULL, `prerequisite_id` TEXT NOT NULL, PRIMARY KEY(`work_spec_id`, `prerequisite_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE , FOREIGN KEY(`prerequisite_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_Dependency_work_spec_id` ON `Dependency` (`work_spec_id`)");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_Dependency_prerequisite_id` ON `Dependency` (`prerequisite_id`)");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `WorkSpec` (`id` TEXT NOT NULL, `state` INTEGER NOT NULL, `worker_class_name` TEXT NOT NULL, `input_merger_class_name` TEXT NOT NULL, `input` BLOB NOT NULL, `output` BLOB NOT NULL, `initial_delay` INTEGER NOT NULL, `interval_duration` INTEGER NOT NULL, `flex_duration` INTEGER NOT NULL, `run_attempt_count` INTEGER NOT NULL, `backoff_policy` INTEGER NOT NULL, `backoff_delay_duration` INTEGER NOT NULL, `last_enqueue_time` INTEGER NOT NULL DEFAULT -1, `minimum_retention_duration` INTEGER NOT NULL, `schedule_requested_at` INTEGER NOT NULL, `run_in_foreground` INTEGER NOT NULL, `out_of_quota_policy` INTEGER NOT NULL, `period_count` INTEGER NOT NULL DEFAULT 0, `generation` INTEGER NOT NULL DEFAULT 0, `next_schedule_time_override` INTEGER NOT NULL DEFAULT 9223372036854775807, `next_schedule_time_override_generation` INTEGER NOT NULL DEFAULT 0, `stop_reason` INTEGER NOT NULL DEFAULT -256, `trace_tag` TEXT, `backoff_on_system_interruptions` INTEGER, `required_network_type` INTEGER NOT NULL, `required_network_request` BLOB NOT NULL DEFAULT x'', `requires_charging` INTEGER NOT NULL, `requires_device_idle` INTEGER NOT NULL, `requires_battery_not_low` INTEGER NOT NULL, `requires_storage_not_low` INTEGER NOT NULL, `trigger_content_update_delay` INTEGER NOT NULL, `trigger_max_content_delay` INTEGER NOT NULL, `content_uri_triggers` BLOB NOT NULL, PRIMARY KEY(`id`))");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_WorkSpec_schedule_requested_at` ON `WorkSpec` (`schedule_requested_at`)");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_WorkSpec_last_enqueue_time` ON `WorkSpec` (`last_enqueue_time`)");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `WorkTag` (`tag` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`tag`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_WorkTag_work_spec_id` ON `WorkTag` (`work_spec_id`)");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `SystemIdInfo` (`work_spec_id` TEXT NOT NULL, `generation` INTEGER NOT NULL DEFAULT 0, `system_id` INTEGER NOT NULL, PRIMARY KEY(`work_spec_id`, `generation`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `WorkName` (`name` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`name`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                qk7.q(anbVar, "CREATE INDEX IF NOT EXISTS `index_WorkName_work_spec_id` ON `WorkName` (`work_spec_id`)");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `WorkProgress` (`work_spec_id` TEXT NOT NULL, `progress` BLOB NOT NULL, PRIMARY KEY(`work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS `Preference` (`key` TEXT NOT NULL, `long_value` INTEGER, PRIMARY KEY(`key`))");
                qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
                qk7.q(anbVar, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, '08b926448d86528e697981ddd30459f7')");
                break;
        }
    }

    @Override // defpackage.vw3
    public final void c(anb anbVar) {
        int i = this.d;
        anbVar.getClass();
        switch (i) {
            case 0:
                qk7.q(anbVar, "DROP TABLE IF EXISTS `lists_catalog_download_state`");
                qk7.q(anbVar, uuLAxLN.OzbZiNTtkmyFS);
                qk7.q(anbVar, "DROP TABLE IF EXISTS `offline_post`");
                break;
            default:
                qk7.q(anbVar, "DROP TABLE IF EXISTS `Dependency`");
                qk7.q(anbVar, "DROP TABLE IF EXISTS `WorkSpec`");
                qk7.q(anbVar, "DROP TABLE IF EXISTS `WorkTag`");
                qk7.q(anbVar, "DROP TABLE IF EXISTS `SystemIdInfo`");
                qk7.q(anbVar, "DROP TABLE IF EXISTS `WorkName`");
                qk7.q(anbVar, "DROP TABLE IF EXISTS `WorkProgress`");
                qk7.q(anbVar, "DROP TABLE IF EXISTS `Preference`");
                break;
        }
    }

    @Override // defpackage.vw3
    public final hlb v(anb anbVar) {
        int i = this.d;
        anbVar.getClass();
        switch (i) {
            case 0:
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                linkedHashMap.put("id", new p7d("id", "TEXT", true, 1, null, 1));
                linkedHashMap.put("downloaded_item_count", new p7d("downloaded_item_count", "INTEGER", true, 0, null, 1));
                linkedHashMap.put("total_item_count", new p7d("total_item_count", "INTEGER", true, 0, null, 1));
                linkedHashMap.put("downloading", new p7d("downloading", uuLAxLN.JXSnCKWfCOXot, true, 0, null, 1));
                linkedHashMap.put("downloading_post_id", new p7d("downloading_post_id", "TEXT", false, 0, null, 1));
                LinkedHashSet linkedHashSet = new LinkedHashSet();
                LinkedHashSet linkedHashSet2 = new LinkedHashSet();
                linkedHashSet2.add(new r7d("index_lists_catalog_download_state_downloading_post_id", false, d46.Q("downloading_post_id"), d46.Q("ASC")));
                s7d s7dVar = new s7d("lists_catalog_download_state", linkedHashMap, linkedHashSet, linkedHashSet2);
                s7d s7dVarA = lk7.A(anbVar, "lists_catalog_download_state");
                if (s7dVar.equals(s7dVarA)) {
                    LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                    linkedHashMap2.put("id", new p7d("id", "TEXT", true, 1, null, 1));
                    linkedHashMap2.put("is_reading_list", new p7d("is_reading_list", "INTEGER", true, 0, null, 1));
                    linkedHashMap2.put("version", new p7d("version", "TEXT", true, 0, null, 1));
                    linkedHashMap2.put("post_ids", new p7d("post_ids", "TEXT", true, 0, null, 1));
                    linkedHashMap2.put("preview", new p7d("preview", "TEXT", true, 0, null, 1));
                    linkedHashMap2.put("detail", new p7d("detail", "TEXT", true, 0, null, 1));
                    linkedHashMap2.put("items", new p7d("items", "TEXT", true, 0, null, 1));
                    LinkedHashSet linkedHashSet3 = new LinkedHashSet();
                    LinkedHashSet linkedHashSet4 = new LinkedHashSet();
                    linkedHashSet4.add(new r7d("index_offline_catalog_is_reading_list", false, d46.Q("is_reading_list"), d46.Q("ASC")));
                    s7d s7dVar2 = new s7d("offline_catalog", linkedHashMap2, linkedHashSet3, linkedHashSet4);
                    s7d s7dVarA2 = lk7.A(anbVar, "offline_catalog");
                    if (s7dVar2.equals(s7dVarA2)) {
                        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
                        linkedHashMap3.put("id", new p7d("id", uvlZTF.eeUBmjGdWevutmp, true, 1, null, 1));
                        linkedHashMap3.put("latest_published_version", new p7d("latest_published_version", "TEXT", true, 0, null, 1));
                        linkedHashMap3.put("content", new p7d("content", "TEXT", true, 0, null, 1));
                        s7d s7dVar3 = new s7d("offline_post", linkedHashMap3, new LinkedHashSet(), new LinkedHashSet());
                        s7d s7dVarA3 = lk7.A(anbVar, "offline_post");
                        if (!s7dVar3.equals(s7dVarA3)) {
                        }
                    }
                }
                break;
            default:
                LinkedHashMap linkedHashMap4 = new LinkedHashMap();
                linkedHashMap4.put("work_spec_id", new p7d("work_spec_id", "TEXT", true, 1, null, 1));
                linkedHashMap4.put("prerequisite_id", new p7d("prerequisite_id", "TEXT", true, 2, null, 1));
                LinkedHashSet linkedHashSet5 = new LinkedHashSet();
                linkedHashSet5.add(new q7d("WorkSpec", "CASCADE", "CASCADE", d46.Q("work_spec_id"), d46.Q("id")));
                linkedHashSet5.add(new q7d("WorkSpec", HrUBqHumRuLe.tzSFMy, "CASCADE", d46.Q("prerequisite_id"), d46.Q("id")));
                LinkedHashSet linkedHashSet6 = new LinkedHashSet();
                linkedHashSet6.add(new r7d("index_Dependency_work_spec_id", false, d46.Q("work_spec_id"), d46.Q("ASC")));
                linkedHashSet6.add(new r7d("index_Dependency_prerequisite_id", false, d46.Q("prerequisite_id"), d46.Q("ASC")));
                s7d s7dVar4 = new s7d("Dependency", linkedHashMap4, linkedHashSet5, linkedHashSet6);
                s7d s7dVarA4 = lk7.A(anbVar, "Dependency");
                if (s7dVar4.equals(s7dVarA4)) {
                    LinkedHashMap linkedHashMap5 = new LinkedHashMap();
                    linkedHashMap5.put("id", new p7d("id", "TEXT", true, 1, null, 1));
                    linkedHashMap5.put("state", new p7d("state", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("worker_class_name", new p7d(PdtluglzAX.kpaszbK, "TEXT", true, 0, null, 1));
                    linkedHashMap5.put("input_merger_class_name", new p7d("input_merger_class_name", "TEXT", true, 0, null, 1));
                    linkedHashMap5.put("input", new p7d("input", "BLOB", true, 0, null, 1));
                    linkedHashMap5.put("output", new p7d("output", "BLOB", true, 0, null, 1));
                    linkedHashMap5.put("initial_delay", new p7d("initial_delay", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("interval_duration", new p7d("interval_duration", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("flex_duration", new p7d("flex_duration", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("run_attempt_count", new p7d("run_attempt_count", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("backoff_policy", new p7d("backoff_policy", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("backoff_delay_duration", new p7d("backoff_delay_duration", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("last_enqueue_time", new p7d("last_enqueue_time", "INTEGER", true, 0, "-1", 1));
                    linkedHashMap5.put("minimum_retention_duration", new p7d("minimum_retention_duration", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("schedule_requested_at", new p7d("schedule_requested_at", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("run_in_foreground", new p7d("run_in_foreground", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("out_of_quota_policy", new p7d("out_of_quota_policy", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("period_count", new p7d("period_count", "INTEGER", true, 0, "0", 1));
                    linkedHashMap5.put("generation", new p7d("generation", "INTEGER", true, 0, "0", 1));
                    linkedHashMap5.put("next_schedule_time_override", new p7d("next_schedule_time_override", "INTEGER", true, 0, "9223372036854775807", 1));
                    linkedHashMap5.put("next_schedule_time_override_generation", new p7d("next_schedule_time_override_generation", "INTEGER", true, 0, "0", 1));
                    linkedHashMap5.put("stop_reason", new p7d(DtuT.mHLtaNxKI, "INTEGER", true, 0, "-256", 1));
                    linkedHashMap5.put("trace_tag", new p7d("trace_tag", "TEXT", false, 0, null, 1));
                    linkedHashMap5.put("backoff_on_system_interruptions", new p7d("backoff_on_system_interruptions", "INTEGER", false, 0, null, 1));
                    linkedHashMap5.put("required_network_type", new p7d("required_network_type", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("required_network_request", new p7d("required_network_request", "BLOB", true, 0, "x''", 1));
                    linkedHashMap5.put("requires_charging", new p7d("requires_charging", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("requires_device_idle", new p7d("requires_device_idle", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("requires_battery_not_low", new p7d("requires_battery_not_low", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("requires_storage_not_low", new p7d("requires_storage_not_low", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("trigger_content_update_delay", new p7d("trigger_content_update_delay", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("trigger_max_content_delay", new p7d("trigger_max_content_delay", "INTEGER", true, 0, null, 1));
                    linkedHashMap5.put("content_uri_triggers", new p7d("content_uri_triggers", "BLOB", true, 0, null, 1));
                    LinkedHashSet linkedHashSet7 = new LinkedHashSet();
                    LinkedHashSet linkedHashSet8 = new LinkedHashSet();
                    linkedHashSet8.add(new r7d("index_WorkSpec_schedule_requested_at", false, d46.Q("schedule_requested_at"), d46.Q("ASC")));
                    linkedHashSet8.add(new r7d("index_WorkSpec_last_enqueue_time", false, d46.Q("last_enqueue_time"), d46.Q("ASC")));
                    s7d s7dVar5 = new s7d("WorkSpec", linkedHashMap5, linkedHashSet7, linkedHashSet8);
                    s7d s7dVarA5 = lk7.A(anbVar, "WorkSpec");
                    if (s7dVar5.equals(s7dVarA5)) {
                        LinkedHashMap linkedHashMap6 = new LinkedHashMap();
                        linkedHashMap6.put("tag", new p7d(OphtYB.tGrw, "TEXT", true, 1, null, 1));
                        linkedHashMap6.put("work_spec_id", new p7d("work_spec_id", "TEXT", true, 2, null, 1));
                        LinkedHashSet linkedHashSet9 = new LinkedHashSet();
                        linkedHashSet9.add(new q7d("WorkSpec", "CASCADE", "CASCADE", d46.Q("work_spec_id"), d46.Q("id")));
                        LinkedHashSet linkedHashSet10 = new LinkedHashSet();
                        linkedHashSet10.add(new r7d("index_WorkTag_work_spec_id", false, d46.Q("work_spec_id"), d46.Q("ASC")));
                        s7d s7dVar6 = new s7d("WorkTag", linkedHashMap6, linkedHashSet9, linkedHashSet10);
                        s7d s7dVarA6 = lk7.A(anbVar, "WorkTag");
                        if (s7dVar6.equals(s7dVarA6)) {
                            LinkedHashMap linkedHashMap7 = new LinkedHashMap();
                            linkedHashMap7.put("work_spec_id", new p7d("work_spec_id", "TEXT", true, 1, null, 1));
                            linkedHashMap7.put("generation", new p7d("generation", "INTEGER", true, 2, "0", 1));
                            linkedHashMap7.put("system_id", new p7d("system_id", "INTEGER", true, 0, null, 1));
                            LinkedHashSet linkedHashSet11 = new LinkedHashSet();
                            linkedHashSet11.add(new q7d("WorkSpec", "CASCADE", "CASCADE", d46.Q("work_spec_id"), d46.Q("id")));
                            s7d s7dVar7 = new s7d("SystemIdInfo", linkedHashMap7, linkedHashSet11, new LinkedHashSet());
                            s7d s7dVarA7 = lk7.A(anbVar, "SystemIdInfo");
                            if (s7dVar7.equals(s7dVarA7)) {
                                LinkedHashMap linkedHashMap8 = new LinkedHashMap();
                                linkedHashMap8.put("name", new p7d("name", "TEXT", true, 1, null, 1));
                                linkedHashMap8.put("work_spec_id", new p7d("work_spec_id", "TEXT", true, 2, null, 1));
                                LinkedHashSet linkedHashSet12 = new LinkedHashSet();
                                linkedHashSet12.add(new q7d("WorkSpec", "CASCADE", "CASCADE", d46.Q("work_spec_id"), d46.Q("id")));
                                LinkedHashSet linkedHashSet13 = new LinkedHashSet();
                                linkedHashSet13.add(new r7d("index_WorkName_work_spec_id", false, d46.Q("work_spec_id"), d46.Q("ASC")));
                                s7d s7dVar8 = new s7d("WorkName", linkedHashMap8, linkedHashSet12, linkedHashSet13);
                                s7d s7dVarA8 = lk7.A(anbVar, "WorkName");
                                if (s7dVar8.equals(s7dVarA8)) {
                                    LinkedHashMap linkedHashMap9 = new LinkedHashMap();
                                    linkedHashMap9.put("work_spec_id", new p7d(CspinKvYN.SFyEszfJjZHRy, "TEXT", true, 1, null, 1));
                                    linkedHashMap9.put("progress", new p7d("progress", "BLOB", true, 0, null, 1));
                                    LinkedHashSet linkedHashSet14 = new LinkedHashSet();
                                    linkedHashSet14.add(new q7d("WorkSpec", "CASCADE", "CASCADE", d46.Q("work_spec_id"), d46.Q("id")));
                                    s7d s7dVar9 = new s7d("WorkProgress", linkedHashMap9, linkedHashSet14, new LinkedHashSet());
                                    s7d s7dVarA9 = lk7.A(anbVar, "WorkProgress");
                                    if (s7dVar9.equals(s7dVarA9)) {
                                        LinkedHashMap linkedHashMap10 = new LinkedHashMap();
                                        linkedHashMap10.put("key", new p7d("key", "TEXT", true, 1, null, 1));
                                        linkedHashMap10.put("long_value", new p7d("long_value", "INTEGER", false, 0, null, 1));
                                        s7d s7dVar10 = new s7d("Preference", linkedHashMap10, new LinkedHashSet(), new LinkedHashSet());
                                        s7d s7dVarA10 = lk7.A(anbVar, "Preference");
                                        if (!s7dVar10.equals(s7dVarA10)) {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                break;
        }
        return new hlb(true, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dp7(MediumDatabase_Impl mediumDatabase_Impl) {
        super("796bc6077e9eac96f6f6db86a4ea65c7", 5, "42c11da02ae119e426e35c7dbd88ea91");
        this.e = mediumDatabase_Impl;
    }
}
