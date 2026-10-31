package p7;

import androidx.work.impl.WorkDatabase_Impl;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.novalauncher.novalytics.stats.internal.DailyMetricsDatabase_Impl;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

/* loaded from: classes.dex */
public final class q extends androidx.room.r {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f82367b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ androidx.room.o f82368c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(DailyMetricsDatabase_Impl dailyMetricsDatabase_Impl) {
        super(9);
        this.f82368c = dailyMetricsDatabase_Impl;
    }

    private final void a(d7.a aVar) {
    }

    private final void b(d7.a aVar) {
    }

    @Override // androidx.room.r
    public final void createAllTables(d7.a aVar) {
        switch (this.f82367b) {
            case 0:
                e7.d dVar = (e7.d) aVar;
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `Dependency` (`work_spec_id` TEXT NOT NULL, `prerequisite_id` TEXT NOT NULL, PRIMARY KEY(`work_spec_id`, `prerequisite_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE , FOREIGN KEY(`prerequisite_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                dVar.execSQL("CREATE INDEX IF NOT EXISTS `index_Dependency_work_spec_id` ON `Dependency` (`work_spec_id`)");
                dVar.execSQL("CREATE INDEX IF NOT EXISTS `index_Dependency_prerequisite_id` ON `Dependency` (`prerequisite_id`)");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `WorkSpec` (`id` TEXT NOT NULL, `state` INTEGER NOT NULL, `worker_class_name` TEXT NOT NULL, `input_merger_class_name` TEXT NOT NULL, `input` BLOB NOT NULL, `output` BLOB NOT NULL, `initial_delay` INTEGER NOT NULL, `interval_duration` INTEGER NOT NULL, `flex_duration` INTEGER NOT NULL, `run_attempt_count` INTEGER NOT NULL, `backoff_policy` INTEGER NOT NULL, `backoff_delay_duration` INTEGER NOT NULL, `last_enqueue_time` INTEGER NOT NULL DEFAULT -1, `minimum_retention_duration` INTEGER NOT NULL, `schedule_requested_at` INTEGER NOT NULL, `run_in_foreground` INTEGER NOT NULL, `out_of_quota_policy` INTEGER NOT NULL, `period_count` INTEGER NOT NULL DEFAULT 0, `generation` INTEGER NOT NULL DEFAULT 0, `next_schedule_time_override` INTEGER NOT NULL DEFAULT 9223372036854775807, `next_schedule_time_override_generation` INTEGER NOT NULL DEFAULT 0, `stop_reason` INTEGER NOT NULL DEFAULT -256, `required_network_type` INTEGER NOT NULL, `requires_charging` INTEGER NOT NULL, `requires_device_idle` INTEGER NOT NULL, `requires_battery_not_low` INTEGER NOT NULL, `requires_storage_not_low` INTEGER NOT NULL, `trigger_content_update_delay` INTEGER NOT NULL, `trigger_max_content_delay` INTEGER NOT NULL, `content_uri_triggers` BLOB NOT NULL, PRIMARY KEY(`id`))");
                dVar.execSQL("CREATE INDEX IF NOT EXISTS `index_WorkSpec_schedule_requested_at` ON `WorkSpec` (`schedule_requested_at`)");
                dVar.execSQL("CREATE INDEX IF NOT EXISTS `index_WorkSpec_last_enqueue_time` ON `WorkSpec` (`last_enqueue_time`)");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `WorkTag` (`tag` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`tag`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                dVar.execSQL("CREATE INDEX IF NOT EXISTS `index_WorkTag_work_spec_id` ON `WorkTag` (`work_spec_id`)");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `SystemIdInfo` (`work_spec_id` TEXT NOT NULL, `generation` INTEGER NOT NULL DEFAULT 0, `system_id` INTEGER NOT NULL, PRIMARY KEY(`work_spec_id`, `generation`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `WorkName` (`name` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`name`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                dVar.execSQL("CREATE INDEX IF NOT EXISTS `index_WorkName_work_spec_id` ON `WorkName` (`work_spec_id`)");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `WorkProgress` (`work_spec_id` TEXT NOT NULL, `progress` BLOB NOT NULL, PRIMARY KEY(`work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `Preference` (`key` TEXT NOT NULL, `long_value` INTEGER, PRIMARY KEY(`key`))");
                dVar.execSQL("CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
                dVar.execSQL("INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, '7d73d21f1bd82c9e5268b6dcf9fde2cb')");
                break;
            default:
                e7.d dVar2 = (e7.d) aVar;
                dVar2.execSQL("CREATE TABLE IF NOT EXISTS `DailyStats` (`date` TEXT NOT NULL, `applicationId` TEXT NOT NULL, `applicationVersion` INTEGER NOT NULL, `installationId` TEXT NOT NULL, `androidSdkInt` INTEGER NOT NULL, `deviceBrand` TEXT NOT NULL, `deviceModel` TEXT NOT NULL, `submitted` TEXT NOT NULL, `lastEventTimeMillis` INTEGER NOT NULL, `sessionHadSearch` TEXT NOT NULL, `windowHadSearch` TEXT NOT NULL, `search_sessions` INTEGER NOT NULL, `search_windows` INTEGER NOT NULL, `search_windows_with_click` INTEGER NOT NULL, `search_no_clicks_when_micro_shown` INTEGER NOT NULL, `search_clicks` TEXT NOT NULL, `search_opens` TEXT NOT NULL, `card_update_events` TEXT NOT NULL, `micro_results_enabled` INTEGER NOT NULL, `shortcut_search_enabled` INTEGER NOT NULL, `card_view_enabled` INTEGER NOT NULL, `contacts_enabled` INTEGER NOT NULL, `web_suggestions` TEXT, `search_more_providers` TEXT NOT NULL, `click_records` TEXT NOT NULL, `impression_records` TEXT NOT NULL, `smart_folders_enabled` INTEGER NOT NULL, `smart_folder_types` TEXT NOT NULL, `smart_folders_edits` TEXT NOT NULL, PRIMARY KEY(`date`))");
                dVar2.execSQL("CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
                dVar2.execSQL("INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, '625a3f8ed50b6f009cdd2a1f25c13191')");
                break;
        }
    }

    @Override // androidx.room.r
    public final void dropAllTables(d7.a aVar) {
        switch (this.f82367b) {
            case 0:
                e7.d dVar = (e7.d) aVar;
                dVar.execSQL("DROP TABLE IF EXISTS `Dependency`");
                dVar.execSQL("DROP TABLE IF EXISTS `WorkSpec`");
                dVar.execSQL("DROP TABLE IF EXISTS `WorkTag`");
                dVar.execSQL("DROP TABLE IF EXISTS `SystemIdInfo`");
                dVar.execSQL("DROP TABLE IF EXISTS `WorkName`");
                dVar.execSQL("DROP TABLE IF EXISTS `WorkProgress`");
                dVar.execSQL("DROP TABLE IF EXISTS `Preference`");
                WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f82368c;
                if (((androidx.room.o) workDatabase_Impl).mCallbacks != null) {
                    int size = ((androidx.room.o) workDatabase_Impl).mCallbacks.size();
                    for (int i5 = 0; i5 < size; i5++) {
                        ((b) ((androidx.room.o) workDatabase_Impl).mCallbacks.get(i5)).getClass();
                    }
                    break;
                }
                break;
            default:
                ((e7.d) aVar).execSQL("DROP TABLE IF EXISTS `DailyStats`");
                DailyMetricsDatabase_Impl dailyMetricsDatabase_Impl = (DailyMetricsDatabase_Impl) this.f82368c;
                if (((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks != null) {
                    int size2 = ((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks.size();
                    for (int i11 = 0; i11 < size2; i11++) {
                        ((b) ((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks.get(i11)).getClass();
                    }
                    break;
                }
                break;
        }
    }

    @Override // androidx.room.r
    public final void onCreate(d7.a aVar) {
        switch (this.f82367b) {
            case 0:
                WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f82368c;
                if (((androidx.room.o) workDatabase_Impl).mCallbacks != null) {
                    int size = ((androidx.room.o) workDatabase_Impl).mCallbacks.size();
                    for (int i5 = 0; i5 < size; i5++) {
                        ((b) ((androidx.room.o) workDatabase_Impl).mCallbacks.get(i5)).getClass();
                    }
                    break;
                }
                break;
            default:
                DailyMetricsDatabase_Impl dailyMetricsDatabase_Impl = (DailyMetricsDatabase_Impl) this.f82368c;
                if (((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks != null) {
                    int size2 = ((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks.size();
                    for (int i11 = 0; i11 < size2; i11++) {
                        ((b) ((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks.get(i11)).getClass();
                    }
                    break;
                }
                break;
        }
    }

    @Override // androidx.room.r
    public final void onOpen(d7.a aVar) {
        switch (this.f82367b) {
            case 0:
                WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f82368c;
                e7.d dVar = (e7.d) aVar;
                ((androidx.room.o) workDatabase_Impl).mDatabase = dVar;
                dVar.execSQL("PRAGMA foreign_keys = ON");
                workDatabase_Impl.internalInitInvalidationTracker(aVar);
                if (((androidx.room.o) workDatabase_Impl).mCallbacks != null) {
                    int size = ((androidx.room.o) workDatabase_Impl).mCallbacks.size();
                    for (int i5 = 0; i5 < size; i5++) {
                        ((b) ((androidx.room.o) workDatabase_Impl).mCallbacks.get(i5)).a(aVar);
                    }
                    break;
                }
                break;
            default:
                DailyMetricsDatabase_Impl dailyMetricsDatabase_Impl = (DailyMetricsDatabase_Impl) this.f82368c;
                ((androidx.room.o) dailyMetricsDatabase_Impl).mDatabase = (e7.d) aVar;
                dailyMetricsDatabase_Impl.internalInitInvalidationTracker(aVar);
                if (((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks != null) {
                    int size2 = ((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks.size();
                    for (int i11 = 0; i11 < size2; i11++) {
                        ((b) ((androidx.room.o) dailyMetricsDatabase_Impl).mCallbacks.get(i11)).a(aVar);
                    }
                    break;
                }
                break;
        }
    }

    @Override // androidx.room.r
    public final void onPostMigrate(d7.a aVar) {
        int i5 = this.f82367b;
    }

    @Override // androidx.room.r
    public final void onPreMigrate(d7.a aVar) throws IOException {
        switch (this.f82367b) {
            case 0:
                vm.d.d(aVar);
                break;
            default:
                vm.d.d(aVar);
                break;
        }
    }

    @Override // androidx.room.r
    public final androidx.room.s onValidateSchema(d7.a aVar) throws IOException {
        switch (this.f82367b) {
            case 0:
                HashMap map = new HashMap(2);
                map.put("work_spec_id", new z6.a(1, 1, "work_spec_id", "TEXT", null, true));
                map.put("prerequisite_id", new z6.a(2, 1, "prerequisite_id", "TEXT", null, true));
                HashSet hashSet = new HashSet(2);
                hashSet.add(new z6.b("WorkSpec", "CASCADE", Arrays.asList("work_spec_id"), "CASCADE", Arrays.asList("id")));
                hashSet.add(new z6.b("WorkSpec", "CASCADE", Arrays.asList("prerequisite_id"), "CASCADE", Arrays.asList("id")));
                HashSet hashSet2 = new HashSet(2);
                hashSet2.add(new z6.d("index_Dependency_work_spec_id", false, Arrays.asList("work_spec_id"), Arrays.asList("ASC")));
                hashSet2.add(new z6.d("index_Dependency_prerequisite_id", false, Arrays.asList("prerequisite_id"), Arrays.asList("ASC")));
                z6.e eVar = new z6.e("Dependency", map, hashSet, hashSet2);
                z6.e eVarA = z6.e.a(aVar, "Dependency");
                if (!eVar.equals(eVarA)) {
                    break;
                } else {
                    HashMap map2 = new HashMap(30);
                    map2.put("id", new z6.a(1, 1, "id", "TEXT", null, true));
                    map2.put("state", new z6.a(0, 1, "state", "INTEGER", null, true));
                    map2.put("worker_class_name", new z6.a(0, 1, "worker_class_name", "TEXT", null, true));
                    map2.put("input_merger_class_name", new z6.a(0, 1, "input_merger_class_name", "TEXT", null, true));
                    map2.put("input", new z6.a(0, 1, "input", "BLOB", null, true));
                    map2.put("output", new z6.a(0, 1, "output", "BLOB", null, true));
                    map2.put("initial_delay", new z6.a(0, 1, "initial_delay", "INTEGER", null, true));
                    map2.put("interval_duration", new z6.a(0, 1, "interval_duration", "INTEGER", null, true));
                    map2.put("flex_duration", new z6.a(0, 1, "flex_duration", "INTEGER", null, true));
                    map2.put("run_attempt_count", new z6.a(0, 1, "run_attempt_count", "INTEGER", null, true));
                    map2.put("backoff_policy", new z6.a(0, 1, "backoff_policy", "INTEGER", null, true));
                    map2.put("backoff_delay_duration", new z6.a(0, 1, "backoff_delay_duration", "INTEGER", null, true));
                    map2.put("last_enqueue_time", new z6.a(0, 1, "last_enqueue_time", "INTEGER", "-1", true));
                    map2.put("minimum_retention_duration", new z6.a(0, 1, "minimum_retention_duration", "INTEGER", null, true));
                    map2.put("schedule_requested_at", new z6.a(0, 1, "schedule_requested_at", "INTEGER", null, true));
                    map2.put("run_in_foreground", new z6.a(0, 1, "run_in_foreground", "INTEGER", null, true));
                    map2.put("out_of_quota_policy", new z6.a(0, 1, "out_of_quota_policy", "INTEGER", null, true));
                    map2.put("period_count", new z6.a(0, 1, "period_count", "INTEGER", "0", true));
                    map2.put("generation", new z6.a(0, 1, "generation", "INTEGER", "0", true));
                    map2.put("next_schedule_time_override", new z6.a(0, 1, "next_schedule_time_override", "INTEGER", "9223372036854775807", true));
                    map2.put("next_schedule_time_override_generation", new z6.a(0, 1, "next_schedule_time_override_generation", "INTEGER", "0", true));
                    map2.put("stop_reason", new z6.a(0, 1, "stop_reason", "INTEGER", "-256", true));
                    map2.put("required_network_type", new z6.a(0, 1, "required_network_type", "INTEGER", null, true));
                    map2.put("requires_charging", new z6.a(0, 1, "requires_charging", "INTEGER", null, true));
                    map2.put("requires_device_idle", new z6.a(0, 1, "requires_device_idle", "INTEGER", null, true));
                    map2.put("requires_battery_not_low", new z6.a(0, 1, "requires_battery_not_low", "INTEGER", null, true));
                    map2.put("requires_storage_not_low", new z6.a(0, 1, "requires_storage_not_low", "INTEGER", null, true));
                    map2.put("trigger_content_update_delay", new z6.a(0, 1, "trigger_content_update_delay", "INTEGER", null, true));
                    map2.put("trigger_max_content_delay", new z6.a(0, 1, "trigger_max_content_delay", "INTEGER", null, true));
                    map2.put("content_uri_triggers", new z6.a(0, 1, "content_uri_triggers", "BLOB", null, true));
                    HashSet hashSet3 = new HashSet(0);
                    HashSet hashSet4 = new HashSet(2);
                    hashSet4.add(new z6.d("index_WorkSpec_schedule_requested_at", false, Arrays.asList("schedule_requested_at"), Arrays.asList("ASC")));
                    hashSet4.add(new z6.d("index_WorkSpec_last_enqueue_time", false, Arrays.asList("last_enqueue_time"), Arrays.asList("ASC")));
                    z6.e eVar2 = new z6.e("WorkSpec", map2, hashSet3, hashSet4);
                    z6.e eVarA2 = z6.e.a(aVar, "WorkSpec");
                    if (!eVar2.equals(eVarA2)) {
                        break;
                    } else {
                        HashMap map3 = new HashMap(2);
                        map3.put("tag", new z6.a(1, 1, "tag", "TEXT", null, true));
                        map3.put("work_spec_id", new z6.a(2, 1, "work_spec_id", "TEXT", null, true));
                        HashSet hashSet5 = new HashSet(1);
                        hashSet5.add(new z6.b("WorkSpec", "CASCADE", Arrays.asList("work_spec_id"), "CASCADE", Arrays.asList("id")));
                        HashSet hashSet6 = new HashSet(1);
                        hashSet6.add(new z6.d("index_WorkTag_work_spec_id", false, Arrays.asList("work_spec_id"), Arrays.asList("ASC")));
                        z6.e eVar3 = new z6.e("WorkTag", map3, hashSet5, hashSet6);
                        z6.e eVarA3 = z6.e.a(aVar, "WorkTag");
                        if (!eVar3.equals(eVarA3)) {
                            break;
                        } else {
                            HashMap map4 = new HashMap(3);
                            map4.put("work_spec_id", new z6.a(1, 1, "work_spec_id", "TEXT", null, true));
                            map4.put("generation", new z6.a(2, 1, "generation", "INTEGER", "0", true));
                            map4.put("system_id", new z6.a(0, 1, "system_id", "INTEGER", null, true));
                            HashSet hashSet7 = new HashSet(1);
                            hashSet7.add(new z6.b("WorkSpec", "CASCADE", Arrays.asList("work_spec_id"), "CASCADE", Arrays.asList("id")));
                            z6.e eVar4 = new z6.e("SystemIdInfo", map4, hashSet7, new HashSet(0));
                            z6.e eVarA4 = z6.e.a(aVar, "SystemIdInfo");
                            if (!eVar4.equals(eVarA4)) {
                                break;
                            } else {
                                HashMap map5 = new HashMap(2);
                                map5.put(PendingUpgradeStore.KEY_NAME, new z6.a(1, 1, PendingUpgradeStore.KEY_NAME, "TEXT", null, true));
                                map5.put("work_spec_id", new z6.a(2, 1, "work_spec_id", "TEXT", null, true));
                                HashSet hashSet8 = new HashSet(1);
                                hashSet8.add(new z6.b("WorkSpec", "CASCADE", Arrays.asList("work_spec_id"), "CASCADE", Arrays.asList("id")));
                                HashSet hashSet9 = new HashSet(1);
                                hashSet9.add(new z6.d("index_WorkName_work_spec_id", false, Arrays.asList("work_spec_id"), Arrays.asList("ASC")));
                                z6.e eVar5 = new z6.e("WorkName", map5, hashSet8, hashSet9);
                                z6.e eVarA5 = z6.e.a(aVar, "WorkName");
                                if (!eVar5.equals(eVarA5)) {
                                    break;
                                } else {
                                    HashMap map6 = new HashMap(2);
                                    map6.put("work_spec_id", new z6.a(1, 1, "work_spec_id", "TEXT", null, true));
                                    map6.put("progress", new z6.a(0, 1, "progress", "BLOB", null, true));
                                    HashSet hashSet10 = new HashSet(1);
                                    hashSet10.add(new z6.b("WorkSpec", "CASCADE", Arrays.asList("work_spec_id"), "CASCADE", Arrays.asList("id")));
                                    z6.e eVar6 = new z6.e("WorkProgress", map6, hashSet10, new HashSet(0));
                                    z6.e eVarA6 = z6.e.a(aVar, "WorkProgress");
                                    if (!eVar6.equals(eVarA6)) {
                                        break;
                                    } else {
                                        HashMap map7 = new HashMap(2);
                                        map7.put(DatabaseConstants.KEY_FIELD, new z6.a(1, 1, DatabaseConstants.KEY_FIELD, "TEXT", null, true));
                                        map7.put("long_value", new z6.a(0, 1, "long_value", "INTEGER", null, false));
                                        z6.e eVar7 = new z6.e("Preference", map7, new HashSet(0), new HashSet(0));
                                        z6.e eVarA7 = z6.e.a(aVar, "Preference");
                                        if (!eVar7.equals(eVarA7)) {
                                            break;
                                        } else {
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            default:
                HashMap map8 = new HashMap(29);
                map8.put("date", new z6.a(1, 1, "date", "TEXT", null, true));
                map8.put("applicationId", new z6.a(0, 1, "applicationId", "TEXT", null, true));
                map8.put("applicationVersion", new z6.a(0, 1, "applicationVersion", "INTEGER", null, true));
                map8.put("installationId", new z6.a(0, 1, "installationId", "TEXT", null, true));
                map8.put("androidSdkInt", new z6.a(0, 1, "androidSdkInt", "INTEGER", null, true));
                map8.put("deviceBrand", new z6.a(0, 1, "deviceBrand", "TEXT", null, true));
                map8.put("deviceModel", new z6.a(0, 1, "deviceModel", "TEXT", null, true));
                map8.put("submitted", new z6.a(0, 1, "submitted", "TEXT", null, true));
                map8.put("lastEventTimeMillis", new z6.a(0, 1, "lastEventTimeMillis", "INTEGER", null, true));
                map8.put("sessionHadSearch", new z6.a(0, 1, "sessionHadSearch", "TEXT", null, true));
                map8.put("windowHadSearch", new z6.a(0, 1, "windowHadSearch", "TEXT", null, true));
                map8.put("search_sessions", new z6.a(0, 1, "search_sessions", "INTEGER", null, true));
                map8.put("search_windows", new z6.a(0, 1, "search_windows", "INTEGER", null, true));
                map8.put("search_windows_with_click", new z6.a(0, 1, "search_windows_with_click", "INTEGER", null, true));
                map8.put("search_no_clicks_when_micro_shown", new z6.a(0, 1, "search_no_clicks_when_micro_shown", "INTEGER", null, true));
                map8.put("search_clicks", new z6.a(0, 1, "search_clicks", "TEXT", null, true));
                map8.put("search_opens", new z6.a(0, 1, "search_opens", "TEXT", null, true));
                map8.put("card_update_events", new z6.a(0, 1, "card_update_events", "TEXT", null, true));
                map8.put("micro_results_enabled", new z6.a(0, 1, "micro_results_enabled", "INTEGER", null, true));
                map8.put("shortcut_search_enabled", new z6.a(0, 1, "shortcut_search_enabled", "INTEGER", null, true));
                map8.put("card_view_enabled", new z6.a(0, 1, "card_view_enabled", "INTEGER", null, true));
                map8.put("contacts_enabled", new z6.a(0, 1, "contacts_enabled", "INTEGER", null, true));
                map8.put("web_suggestions", new z6.a(0, 1, "web_suggestions", "TEXT", null, false));
                map8.put("search_more_providers", new z6.a(0, 1, "search_more_providers", "TEXT", null, true));
                map8.put("click_records", new z6.a(0, 1, "click_records", "TEXT", null, true));
                map8.put("impression_records", new z6.a(0, 1, "impression_records", "TEXT", null, true));
                map8.put("smart_folders_enabled", new z6.a(0, 1, "smart_folders_enabled", "INTEGER", null, true));
                map8.put("smart_folder_types", new z6.a(0, 1, "smart_folder_types", "TEXT", null, true));
                map8.put("smart_folders_edits", new z6.a(0, 1, "smart_folders_edits", "TEXT", null, true));
                z6.e eVar8 = new z6.e("DailyStats", map8, new HashSet(0), new HashSet(0));
                z6.e eVarA8 = z6.e.a(aVar, "DailyStats");
                if (!eVar8.equals(eVarA8)) {
                    break;
                } else {
                    break;
                }
        }
        return new androidx.room.s(true, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(WorkDatabase_Impl workDatabase_Impl) {
        super(20);
        this.f82368c = workDatabase_Impl;
    }
}
