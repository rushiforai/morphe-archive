.class public Ltvk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lssl;
.implements Luom;
.implements Lmf1;
.implements Lann;
.implements Lcrn;
.implements Lcom/google/android/gms/tasks/SuccessContinuation;
.implements Lloo;
.implements Lcom/google/android/gms/internal/mlkit_vision_barcode/zzwo;
.implements Ljrp;
.implements Lph;
.implements Ljtp;
.implements Levp;


# instance fields
.field public final a:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Ltvk;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 41
    iput-object p1, p0, Ltvk;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkpo;Lc9p;)V
    .registers 3

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltvk;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ll7n;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Lng;->a:Lng;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ltvk;->a:Ljava/lang/Object;

    new-instance v0, Lm7n;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lm7n;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Ll7n;->a:Lo7n;

    iget-boolean p1, p0, Lo7n;->d:Z

    if-eqz p1, :cond_1c

    invoke-static {v0}, Lo7n;->a(Ljava/lang/AutoCloseable;)V

    return-void

    :cond_1c
    iget-object p1, p0, Lo7n;->a:Lurj;

    monitor-enter p1

    :try_start_1f
    iget-object p0, p0, Lo7n;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_24
    .catchall {:try_start_1f .. :try_end_24} :catchall_26

    monitor-exit p1

    return-void

    :catchall_26
    move-exception p0

    monitor-exit p1

    throw p0
.end method

.method public static i(Lto9;)V
    .registers 2

    const-string v0, "CREATE TABLE IF NOT EXISTS `Dependency` (`work_spec_id` TEXT NOT NULL, `prerequisite_id` TEXT NOT NULL, PRIMARY KEY(`work_spec_id`, `prerequisite_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE , FOREIGN KEY(`prerequisite_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE INDEX IF NOT EXISTS `index_Dependency_work_spec_id` ON `Dependency` (`work_spec_id`)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE INDEX IF NOT EXISTS `index_Dependency_prerequisite_id` ON `Dependency` (`prerequisite_id`)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS `WorkSpec` (`id` TEXT NOT NULL, `state` INTEGER NOT NULL, `worker_class_name` TEXT NOT NULL, `input_merger_class_name` TEXT NOT NULL, `input` BLOB NOT NULL, `output` BLOB NOT NULL, `initial_delay` INTEGER NOT NULL, `interval_duration` INTEGER NOT NULL, `flex_duration` INTEGER NOT NULL, `run_attempt_count` INTEGER NOT NULL, `backoff_policy` INTEGER NOT NULL, `backoff_delay_duration` INTEGER NOT NULL, `last_enqueue_time` INTEGER NOT NULL DEFAULT -1, `minimum_retention_duration` INTEGER NOT NULL, `schedule_requested_at` INTEGER NOT NULL, `run_in_foreground` INTEGER NOT NULL, `out_of_quota_policy` INTEGER NOT NULL, `period_count` INTEGER NOT NULL DEFAULT 0, `generation` INTEGER NOT NULL DEFAULT 0, `next_schedule_time_override` INTEGER NOT NULL DEFAULT 9223372036854775807, `next_schedule_time_override_generation` INTEGER NOT NULL DEFAULT 0, `stop_reason` INTEGER NOT NULL DEFAULT -256, `trace_tag` TEXT, `required_network_type` INTEGER NOT NULL, `required_network_request` BLOB NOT NULL DEFAULT x\'\', `requires_charging` INTEGER NOT NULL, `requires_device_idle` INTEGER NOT NULL, `requires_battery_not_low` INTEGER NOT NULL, `requires_storage_not_low` INTEGER NOT NULL, `trigger_content_update_delay` INTEGER NOT NULL, `trigger_max_content_delay` INTEGER NOT NULL, `content_uri_triggers` BLOB NOT NULL, PRIMARY KEY(`id`))"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE INDEX IF NOT EXISTS `index_WorkSpec_schedule_requested_at` ON `WorkSpec` (`schedule_requested_at`)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE INDEX IF NOT EXISTS `index_WorkSpec_last_enqueue_time` ON `WorkSpec` (`last_enqueue_time`)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS `WorkTag` (`tag` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`tag`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE INDEX IF NOT EXISTS `index_WorkTag_work_spec_id` ON `WorkTag` (`work_spec_id`)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS `SystemIdInfo` (`work_spec_id` TEXT NOT NULL, `generation` INTEGER NOT NULL DEFAULT 0, `system_id` INTEGER NOT NULL, PRIMARY KEY(`work_spec_id`, `generation`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS `WorkName` (`name` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`name`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE INDEX IF NOT EXISTS `index_WorkName_work_spec_id` ON `WorkName` (`work_spec_id`)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS `WorkProgress` (`work_spec_id` TEXT NOT NULL, `progress` BLOB NOT NULL, PRIMARY KEY(`work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS `Preference` (`key` TEXT NOT NULL, `long_value` INTEGER, PRIMARY KEY(`key`))"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string v0, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, \'86254750241babac4b8d52996a675549\')"

    invoke-virtual {p0, v0}, Lto9;->n(Ljava/lang/String;)V

    return-void
.end method

.method public static o(Lto9;)Lei2;
    .registers 24

    move-object/from16 v0, p0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    new-instance v3, Ltal;

    const/4 v9, 0x0

    const/4 v7, 0x1

    const-string v4, "work_spec_id"

    const-string v5, "TEXT"

    const/4 v6, 0x1

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v9}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v4, "work_spec_id"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Ltal;

    const/4 v11, 0x0

    const/4 v9, 0x1

    const-string v6, "prerequisite_id"

    const-string v7, "TEXT"

    const/4 v8, 0x2

    const/4 v10, 0x1

    invoke-direct/range {v5 .. v11}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "prerequisite_id"

    invoke-static {v1, v3, v5, v2}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v5

    new-instance v6, Lual;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const-string v12, "id"

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const-string v7, "WorkSpec"

    const-string v8, "CASCADE"

    const-string v9, "CASCADE"

    invoke-direct/range {v6 .. v11}, Lual;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v5, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v13, Lual;

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v17

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    const-string v14, "WorkSpec"

    const-string v15, "CASCADE"

    const-string v16, "CASCADE"

    invoke-direct/range {v13 .. v18}, Lual;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v5, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(I)V

    new-instance v7, Lval;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const-string v9, "ASC"

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const-string v11, "index_Dependency_work_spec_id"

    const/4 v13, 0x0

    invoke-direct {v7, v11, v8, v10, v13}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v7, Lval;

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const-string v10, "index_Dependency_prerequisite_id"

    invoke-direct {v7, v10, v3, v8, v13}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v3, Lwal;

    const-string v7, "Dependency"

    invoke-direct {v3, v7, v1, v5, v6}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v7}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v1

    invoke-virtual {v3, v1}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v6, "\n Found:\n"

    if-nez v5, :cond_c6

    new-instance v0, Lei2;

    const-string v2, "Dependency(androidx.work.impl.model.Dependency).\n Expected:\n"

    invoke-static {v2, v3, v6, v1}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v13, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0

    :cond_c6
    new-instance v1, Ljava/util/HashMap;

    const/16 v3, 0x20

    invoke-direct {v1, v3}, Ljava/util/HashMap;-><init>(I)V

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x1

    const-string v15, "id"

    const-string v16, "TEXT"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    invoke-virtual {v1, v12, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "state"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "state"

    invoke-virtual {v1, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v22, 0x0

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "worker_class_name"

    const-string v18, "TEXT"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v3, v16

    const-string v5, "worker_class_name"

    invoke-virtual {v1, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "input_merger_class_name"

    const-string v16, "TEXT"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "input_merger_class_name"

    invoke-virtual {v1, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "input"

    const-string v17, "BLOB"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "input"

    invoke-virtual {v1, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "output"

    const-string v18, "BLOB"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v3, v16

    const-string v5, "output"

    invoke-virtual {v1, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "initial_delay"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "initial_delay"

    invoke-virtual {v1, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "interval_duration"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "interval_duration"

    invoke-virtual {v1, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "flex_duration"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v3, v16

    const-string v5, "flex_duration"

    invoke-virtual {v1, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "run_attempt_count"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "run_attempt_count"

    invoke-virtual {v1, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "backoff_policy"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "backoff_policy"

    invoke-virtual {v1, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "backoff_delay_duration"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v3, v16

    const-string v5, "backoff_delay_duration"

    invoke-virtual {v1, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const-string v20, "-1"

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "last_enqueue_time"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "last_enqueue_time"

    invoke-virtual {v1, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "minimum_retention_duration"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v5, "minimum_retention_duration"

    invoke-virtual {v1, v5, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "schedule_requested_at"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v5, v16

    const-string v7, "schedule_requested_at"

    invoke-virtual {v1, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "run_in_foreground"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v5, "run_in_foreground"

    invoke-virtual {v1, v5, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "out_of_quota_policy"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v5, "out_of_quota_policy"

    invoke-virtual {v1, v5, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const-string v22, "0"

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "period_count"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v5, v16

    const-string v8, "period_count"

    invoke-virtual {v1, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const-string v20, "0"

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "generation"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v5, "generation"

    invoke-virtual {v1, v5, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const-string v21, "9223372036854775807"

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "next_schedule_time_override"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "next_schedule_time_override"

    invoke-virtual {v1, v8, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const-string v22, "0"

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "next_schedule_time_override_generation"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v8, v16

    const-string v10, "next_schedule_time_override_generation"

    invoke-virtual {v1, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const-string v20, "-256"

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "stop_reason"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "stop_reason"

    invoke-virtual {v1, v8, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x0

    const/16 v18, 0x0

    const-string v16, "trace_tag"

    const-string v17, "TEXT"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "trace_tag"

    invoke-virtual {v1, v8, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v22, 0x0

    const/16 v20, 0x1

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "required_network_type"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v8, v16

    const-string v10, "required_network_type"

    invoke-virtual {v1, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const-string v20, "x\'\'"

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "required_network_request"

    const-string v16, "BLOB"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "required_network_request"

    invoke-virtual {v1, v8, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "requires_charging"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "requires_charging"

    invoke-virtual {v1, v8, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "requires_device_idle"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v8, v16

    const-string v10, "requires_device_idle"

    invoke-virtual {v1, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "requires_battery_not_low"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "requires_battery_not_low"

    invoke-virtual {v1, v8, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "requires_storage_not_low"

    const-string v17, "INTEGER"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "requires_storage_not_low"

    invoke-virtual {v1, v8, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v21, 0x1

    const/16 v19, 0x0

    const-string v17, "trigger_content_update_delay"

    const-string v18, "INTEGER"

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v8, v16

    const-string v10, "trigger_content_update_delay"

    invoke-virtual {v1, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v17, 0x0

    const-string v15, "trigger_max_content_delay"

    const-string v16, "INTEGER"

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "trigger_max_content_delay"

    invoke-virtual {v1, v8, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const/16 v20, 0x1

    const/16 v18, 0x0

    const-string v16, "content_uri_triggers"

    const-string v17, "BLOB"

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v8, "content_uri_triggers"

    invoke-static {v1, v8, v15, v13}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v8

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10, v2}, Ljava/util/HashSet;-><init>(I)V

    new-instance v11, Lval;

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    const-string v15, "index_WorkSpec_schedule_requested_at"

    invoke-direct {v11, v15, v7, v14, v13}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v10, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v7, Lval;

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const-string v14, "index_WorkSpec_last_enqueue_time"

    invoke-direct {v7, v14, v3, v11, v13}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v10, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v3, Lwal;

    const-string v7, "WorkSpec"

    invoke-direct {v3, v7, v1, v8, v10}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v7}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v1

    invoke-virtual {v3, v1}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3c2

    new-instance v0, Lei2;

    const-string v2, "WorkSpec(androidx.work.impl.model.WorkSpec).\n Expected:\n"

    invoke-static {v2, v3, v6, v1}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v13, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0

    :cond_3c2
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const-string v15, "tag"

    const-string v16, "TEXT"

    const/16 v17, 0x1

    const/16 v19, 0x1

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v3, "tag"

    invoke-virtual {v1, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const-string v16, "work_spec_id"

    const-string v17, "TEXT"

    const/16 v18, 0x2

    const/16 v20, 0x1

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const/4 v3, 0x1

    invoke-static {v1, v4, v15, v3}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v7

    new-instance v14, Lual;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    const-string v15, "WorkSpec"

    const-string v16, "CASCADE"

    const-string v17, "CASCADE"

    invoke-direct/range {v14 .. v19}, Lual;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v7, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8, v3}, Ljava/util/HashSet;-><init>(I)V

    new-instance v10, Lval;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    const-string v15, "index_WorkTag_work_spec_id"

    invoke-direct {v10, v15, v11, v14, v13}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v8, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v10, Lwal;

    const-string v11, "WorkTag"

    invoke-direct {v10, v11, v1, v7, v8}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v11}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v1

    invoke-virtual {v10, v1}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_44b

    new-instance v0, Lei2;

    const-string v2, "WorkTag(androidx.work.impl.model.WorkTag).\n Expected:\n"

    invoke-static {v2, v10, v6, v1}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v13, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0

    :cond_44b
    new-instance v1, Ljava/util/HashMap;

    const/4 v7, 0x3

    invoke-direct {v1, v7}, Ljava/util/HashMap;-><init>(I)V

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const-string v15, "work_spec_id"

    const-string v16, "TEXT"

    const/16 v17, 0x1

    const/16 v19, 0x1

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    invoke-virtual {v1, v4, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const-string v21, "0"

    const-string v16, "generation"

    const-string v17, "INTEGER"

    const/16 v18, 0x2

    const/16 v20, 0x1

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    invoke-virtual {v1, v5, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Ltal;

    const/16 v22, 0x0

    const-string v17, "system_id"

    const-string v18, "INTEGER"

    const/16 v19, 0x0

    const/16 v21, 0x1

    invoke-direct/range {v16 .. v22}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    move-object/from16 v5, v16

    const-string v7, "system_id"

    invoke-static {v1, v7, v5, v3}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v5

    new-instance v14, Lual;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    const-string v15, "WorkSpec"

    const-string v16, "CASCADE"

    const-string v17, "CASCADE"

    invoke-direct/range {v14 .. v19}, Lual;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v5, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7, v13}, Ljava/util/HashSet;-><init>(I)V

    new-instance v8, Lwal;

    const-string v10, "SystemIdInfo"

    invoke-direct {v8, v10, v1, v5, v7}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v10}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v1

    invoke-virtual {v8, v1}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4ce

    new-instance v0, Lei2;

    const-string v2, "SystemIdInfo(androidx.work.impl.model.SystemIdInfo).\n Expected:\n"

    invoke-static {v2, v8, v6, v1}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v13, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0

    :cond_4ce
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const-string v15, "name"

    const-string v16, "TEXT"

    const/16 v17, 0x1

    const/16 v19, 0x1

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v5, "name"

    invoke-virtual {v1, v5, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const-string v16, "work_spec_id"

    const-string v17, "TEXT"

    const/16 v18, 0x2

    const/16 v20, 0x1

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    invoke-static {v1, v4, v15, v3}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v5

    new-instance v14, Lual;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    const-string v15, "WorkSpec"

    const-string v16, "CASCADE"

    const-string v17, "CASCADE"

    invoke-direct/range {v14 .. v19}, Lual;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v5, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7, v3}, Ljava/util/HashSet;-><init>(I)V

    new-instance v8, Lval;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const-string v11, "index_WorkName_work_spec_id"

    invoke-direct {v8, v11, v10, v9, v13}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v8, Lwal;

    const-string v9, "WorkName"

    invoke-direct {v8, v9, v1, v5, v7}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v9}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v1

    invoke-virtual {v8, v1}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_556

    new-instance v0, Lei2;

    const-string v2, "WorkName(androidx.work.impl.model.WorkName).\n Expected:\n"

    invoke-static {v2, v8, v6, v1}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v13, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0

    :cond_556
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const-string v15, "work_spec_id"

    const-string v16, "TEXT"

    const/16 v17, 0x1

    const/16 v19, 0x1

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    invoke-virtual {v1, v4, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const-string v16, "progress"

    const-string v17, "BLOB"

    const/16 v18, 0x0

    const/16 v20, 0x1

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v5, "progress"

    invoke-static {v1, v5, v15, v3}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v5

    new-instance v14, Lual;

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    const-string v15, "WorkSpec"

    const-string v16, "CASCADE"

    const-string v17, "CASCADE"

    invoke-direct/range {v14 .. v19}, Lual;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v5, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4, v13}, Ljava/util/HashSet;-><init>(I)V

    new-instance v7, Lwal;

    const-string v8, "WorkProgress"

    invoke-direct {v7, v8, v1, v5, v4}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v8}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v1

    invoke-virtual {v7, v1}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5c4

    new-instance v0, Lei2;

    const-string v2, "WorkProgress(androidx.work.impl.model.WorkProgress).\n Expected:\n"

    invoke-static {v2, v7, v6, v1}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v13, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0

    :cond_5c4
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    new-instance v14, Ltal;

    const/16 v20, 0x0

    const/16 v18, 0x1

    const-string v15, "key"

    const-string v16, "TEXT"

    const/16 v17, 0x1

    const/16 v19, 0x1

    invoke-direct/range {v14 .. v20}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v2, "key"

    invoke-virtual {v1, v2, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Ltal;

    const/16 v21, 0x0

    const-string v16, "long_value"

    const-string v17, "INTEGER"

    const/16 v18, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v15 .. v21}, Ltal;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)V

    const-string v2, "long_value"

    invoke-static {v1, v2, v15, v13}, Lz1m;->o(Ljava/util/HashMap;Ljava/lang/String;Ltal;I)Ljava/util/HashSet;

    move-result-object v2

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4, v13}, Ljava/util/HashSet;-><init>(I)V

    new-instance v5, Lwal;

    const-string v7, "Preference"

    invoke-direct {v5, v7, v1, v2, v4}, Lwal;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/AbstractSet;Ljava/util/AbstractSet;)V

    invoke-static {v0, v7}, Lwal;->a(Lto9;Ljava/lang/String;)Lwal;

    move-result-object v0

    invoke-virtual {v5, v0}, Lwal;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_616

    new-instance v1, Lei2;

    const-string v2, "Preference(androidx.work.impl.model.Preference).\n Expected:\n"

    invoke-static {v2, v5, v6, v0}, Lz1m;->k(Ljava/lang/String;Lwal;Ljava/lang/String;Lwal;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v13, v0}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v1

    :cond_616
    new-instance v0, Lei2;

    const/4 v1, 0x0

    invoke-direct {v0, v3, v1}, Lei2;-><init>(ZLjava/lang/String;)V

    return-object v0
.end method

.method public static r(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .registers 3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unsupported type: "

    invoke-static {v1, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Llxo;

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lwm;

    if-eqz p0, :cond_d

    invoke-interface {p0}, Lwm;->g()V

    :cond_d
    return-void
.end method

.method public final b()Landroid/view/ViewGroup;
    .registers 1

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Llqn;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    return-object p0
.end method

.method public final c(Lotp;Ljava/io/File;Z)V
    .registers 4

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lwjj;

    iget-object p1, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashSet;

    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    if-nez p3, :cond_15

    iget-object p0, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_15
    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lm59;

    iget-object v0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v0, Lqln;

    invoke-virtual {v0}, Lqln;->b()Lqjn;

    move-result-object v0

    invoke-virtual {p0, v0}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lm59;

    iget-object v0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v0, Lqln;

    invoke-virtual {v0}, Lqln;->b()Lqjn;

    move-result-object v0

    invoke-virtual {p0, v0}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final f(Lbzo;I)Z
    .registers 6

    new-instance v0, Lwgo;

    invoke-direct {v0, p1}, Lwgo;-><init>(Lbzo;)V

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    const/4 v1, 0x1

    if-nez p1, :cond_42

    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    move-result p1

    const/16 v2, 0x64

    if-lt p1, v2, :cond_3a

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_22
    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwgo;

    iget-object v2, v2, Lwgo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_22

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_22

    :cond_3a
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :goto_3e
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :cond_42
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/2addr v2, p2

    if-nez v2, :cond_53

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    or-int/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_3e

    :cond_53
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Llqn;

    iget-object v0, p0, Llqn;->K:Lsba;

    if-nez v0, :cond_17

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_17

    iget-object p0, p0, Llqn;->E:Lzv0;

    if-nez p0, :cond_13

    const/4 p0, 0x0

    :cond_13
    iget-boolean p0, p0, Lzv0;->d:Z

    if-eqz p0, :cond_19

    :cond_17
    const/4 p0, 0x0

    return p0

    :cond_19
    const/4 p0, 0x1

    return p0
.end method

.method public final get(I)Ln89;
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Ln89;

    return-object p0
.end method

.method public final h()Ljava/nio/channels/FileChannel;
    .registers 5

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getStatSize()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_18

    new-instance v0, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {v0, p0}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p0

    return-object p0

    :cond_18
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Not a file: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j()Lrn9;
    .registers 4

    new-instance v0, Lrn9;

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Llqn;

    iget-object p0, p0, Llqn;->u:Lorm;

    const/16 v1, 0x12

    sget-object v2, Lmf0;->i:Lmf0;

    invoke-direct {v0, p0, v2, v1}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 6

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;

    check-cast p1, Loh;

    iget-object v0, p1, Loh;->b:Landroid/content/Intent;

    const-string v1, "ProxyBillingActivityV2"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzi(Landroid/content/Intent;Ljava/lang/String;)Lmf3;

    move-result-object v2

    iget v2, v2, Lmf3;->a:I

    iget-object v3, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->g:Landroid/os/ResultReceiver;

    if-eqz v3, :cond_1f

    if-nez v0, :cond_18

    const/4 v0, 0x0

    goto :goto_1c

    :cond_18
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_1c
    invoke-virtual {v3, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    :cond_1f
    iget p1, p1, Loh;->a:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_26

    if-eqz v2, :cond_3f

    :cond_26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Alternative billing only dialog finished with resultCode "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " and billing\'s responseCode: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3f
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final l()Lhuh;
    .registers 1

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lwci;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p0, p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    return-object p0
.end method

.method public final m(Lsba;Llrn;)V
    .registers 3

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Llqn;

    invoke-virtual {p0, p1, p2}, Llqn;->L0(Lsba;Lkz3;)V

    return-void
.end method

.method public final n(ZZ)V
    .registers 6

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lg4l;

    const/4 v0, 0x0

    iput-object v0, p0, Lg4l;->l:Lbz0;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lg4l;->k:Z

    if-eqz p1, :cond_f

    sget-object v1, La4l;->a:La4l;

    goto :goto_11

    :cond_f
    sget-object v1, La4l;->c:La4l;

    :goto_11
    iget-object v2, p0, Lg4l;->i:Lpde;

    invoke-static {v2, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lg4l;->c:Lc4l;

    iget-object p0, p0, Lc4l;->c:Loji;

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lnw3;

    invoke-virtual {p0}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    if-eqz p1, :cond_29

    sget-object p1, Lvb0;->b:Lvb0;

    goto :goto_30

    :cond_29
    if-eqz p2, :cond_2e

    sget-object p1, Lvb0;->c:Lvb0;

    goto :goto_30

    :cond_2e
    sget-object p1, Lvb0;->d:Lvb0;

    :goto_30
    check-cast p0, Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-nez p2, :cond_37

    return-void

    :cond_37
    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, p2, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p2, Ld5f;

    invoke-direct {p2, p1, v0}, Ld5f;-><init>(Lvb0;B)V

    invoke-virtual {v2, p2}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Llxo;

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lwm;

    if-eqz p0, :cond_d

    invoke-interface {p0}, Lwm;->onAdClicked()V

    :cond_d
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lusl;

    iget-object p0, p0, Lusl;->b:Lsp1;

    const/4 v0, 0x0

    iget-object p0, p0, Lsp1;->a:Landroid/view/Window$Callback;

    invoke-interface {p0, v0, p1}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final p(Ljava/lang/String;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast v0, Lw9m;

    const-string v1, "("

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_a0

    const/16 v1, 0x5b

    const/4 v3, 0x6

    invoke-static {p1, v1, v2, v3}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;CII)I

    move-result v1

    const-string v3, "Failed requirement."

    const/4 v4, 0x1

    if-ltz v1, :cond_47

    const/16 v5, 0x5d

    const/4 v6, 0x4

    invoke-static {p1, v5, v1, v6}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v5

    const/4 v6, 0x0

    if-le v5, v1, :cond_43

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ltvk;->p(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    add-int/2addr v1, v4

    invoke-virtual {p1, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3e

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_3e
    invoke-interface {v0, v6, p0}, Lw9m;->q(Ljava/lang/Integer;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_43
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    return-object v6

    :cond_47
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    move v1, v2

    :goto_4c
    if-ge v1, p0, :cond_5d

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x30

    if-gt v6, v5, :cond_5a

    const/16 v6, 0x3a

    if-lt v5, v6, :cond_5e

    :cond_5a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4c

    :cond_5d
    const/4 v1, -0x1

    :cond_5e
    if-gez v1, :cond_6c

    invoke-interface {v0, p1}, Lw9m;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_67

    return-object p0

    :cond_67
    invoke-static {p1}, Ltvk;->r(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_6c
    :try_start_6c
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_74
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6c .. :try_end_74} :catch_94

    if-gt v4, p0, :cond_8e

    const/16 v4, 0x101

    if-ge p0, v4, :cond_8e

    if-ltz v1, :cond_81

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_82

    :cond_81
    move-object v1, p1

    :goto_82
    invoke-interface {v0, p0, v1}, Lw9m;->e(ILjava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_89

    return-object p0

    :cond_89
    invoke-static {p1}, Ltvk;->r(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_8e
    :try_start_8e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_94
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8e .. :try_end_94} :catch_94

    :catch_94
    invoke-interface {v0, p1}, Lw9m;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_9b

    return-object p0

    :cond_9b
    invoke-static {p1}, Ltvk;->r(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_a0
    invoke-static {p1}, Ltvk;->r(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method public q()V
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setForceDarkBehavior(I)V

    return-void
.end method

.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .registers 4

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lkpo;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    new-instance p1, Lcqo;

    iget-object p0, p0, Lkpo;->b:Leqo;

    invoke-direct {p1, p0, v0, v1}, Lcqo;-><init>(Leqo;J)V

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final u(Lbnn;)V
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lm59;

    iget-object p1, p1, Lbnn;->a:Lqjn;

    invoke-virtual {p0, p1}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final z(Lcnn;)V
    .registers 2

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lm59;

    iget-object p1, p1, Lcnn;->a:Lqjn;

    invoke-virtual {p0, p1}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final zza()Lcom/google/android/gms/internal/mlkit_vision_barcode/zzwe;
    .registers 3

    .line 111
    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;-><init>()V

    invoke-static {}, Lzpp;->c()Z

    move-result v1

    if-eqz v1, :cond_e

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzra;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzra;

    goto :goto_10

    .line 112
    :cond_e
    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzra;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzra;

    .line 113
    :goto_10
    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrb;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;->zze(Lcom/google/android/gms/internal/mlkit_vision_barcode/zzra;)Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;

    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrs;

    invoke-direct {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrs;-><init>()V

    .line 114
    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrs;->zzb(Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrb;)Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrs;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrs;->zzc()Lcom/google/android/gms/internal/mlkit_vision_barcode/zzru;

    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;->zzh(Lcom/google/android/gms/internal/mlkit_vision_barcode/zzru;)Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;

    .line 116
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzws;->zzf(Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrd;)Lcom/google/android/gms/internal/mlkit_vision_barcode/zzwe;

    move-result-object p0

    return-object p0
.end method

.method public final zza()Ljava/lang/Object;
    .registers 1

    .line 108
    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lh61;

    .line 109
    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    .line 110
    invoke-static {p0}, Lcvp;->b(Landroid/content/Context;)Lcvp;

    move-result-object p0

    return-object p0
.end method

.method public final zza()V
    .registers 8

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Ltop;

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v1

    move-object v3, v2

    :goto_8
    iget-object v4, p0, Ltop;->a:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v5

    if-ge v0, v5, :cond_33

    invoke-interface {v4, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "module"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    invoke-interface {v4, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    :cond_20
    invoke-interface {v4, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "errorCode"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_30

    invoke-interface {v4, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_33
    if-eqz v2, :cond_64

    if-eqz v3, :cond_64

    iget-object p0, p0, Ltop;->b:Lwci;

    sget-object v0, Ljop;->c:Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_5a

    iget-object p0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_54

    invoke-interface {p0, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4c
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_4c

    return-void

    :cond_54
    const-string p0, "Property \"splitInstallErrorCodeByModule\" has not been set"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_5a
    const-string p0, " is unknown error."

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_64
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v0, "\'split-install-error\' element does not contain \'module\'/\'errorCode\' attributes."

    invoke-direct {p0, v0, v4, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw p0
.end method
