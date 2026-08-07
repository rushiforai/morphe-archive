.class public final Ll/b0s0;
.super Ll/rjt0;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation


# instance fields
.field public final synthetic a:Ll/opr0;


# direct methods
.method public constructor <init>(Ll/opr0;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-direct {p0, p2, p3, p1, v0}, Ll/rjt0;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/opr0;->M(Ll/opr0;)Ll/xiy0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/32 v1, 0x36ee80

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/xiy0;->b(J)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :try_start_0
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    iget-object v0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 22
    .line 23
    invoke-static {v0}, Ll/opr0;->M(Ll/opr0;)Ll/xiy0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/xiy0;->c()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "Opening the database failed, dropping and recreating it"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "google_app_measurement.db"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_0

    .line 62
    .line 63
    iget-object v0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v2, "Failed to delete corrupted db file"

    .line 74
    .line 75
    invoke-virtual {v0, v2, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    :try_start_1
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 83
    .line 84
    invoke-static {v1}, Ll/opr0;->M(Ll/opr0;)Ll/xiy0;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ll/xiy0;->a()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 89
    .line 90
    .line 91
    return-object v0

    .line 92
    :catch_1
    move-exception v0

    .line 93
    iget-object p0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string v1, "Failed to open freshly created database"

    .line 104
    .line 105
    invoke-virtual {p0, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    throw v0

    .line 109
    :cond_1
    new-instance p0, Landroid/database/sqlite/SQLiteException;

    .line 110
    .line 111
    const-string v0, "Database open failed"

    .line 112
    .line 113
    invoke-direct {p0, v0}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    throw p0
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Ll/r3s0;->b(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    return-void
.end method

.method public final onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v5, "app_id,name,lifetime_count,current_bundle_count,last_fire_timestamp"

    .line 8
    .line 9
    invoke-static {}, Ll/opr0;->m0()[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    const-string v3, "events"

    .line 14
    .line 15
    const-string v4, "CREATE TABLE IF NOT EXISTS events ( app_id TEXT NOT NULL, name TEXT NOT NULL, lifetime_count INTEGER NOT NULL, current_bundle_count INTEGER NOT NULL, last_fire_timestamp INTEGER NOT NULL, PRIMARY KEY (app_id, name)) ;"

    .line 16
    .line 17
    move-object v2, p1

    .line 18
    invoke-static/range {v1 .. v6}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    move-object v8, v2

    .line 22
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    const-string v11, "app_id,name,lifetime_count,current_bundle_count,last_fire_timestamp,last_bundled_timestamp,last_bundled_day,last_sampled_complex_event_id,last_sampling_rate,last_exempt_from_sampling,current_session_count"

    .line 29
    .line 30
    const/4 v12, 0x0

    .line 31
    const-string v9, "events_snapshot"

    .line 32
    .line 33
    const-string v10, "CREATE TABLE IF NOT EXISTS events_snapshot ( app_id TEXT NOT NULL, name TEXT NOT NULL, lifetime_count INTEGER NOT NULL, current_bundle_count INTEGER NOT NULL, last_fire_timestamp INTEGER NOT NULL, last_bundled_timestamp INTEGER, last_bundled_day INTEGER, last_sampled_complex_event_id INTEGER, last_sampling_rate INTEGER, last_exempt_from_sampling INTEGER, current_session_count INTEGER, PRIMARY KEY (app_id, name)) ;"

    .line 34
    .line 35
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    const-string v11, "app_id,origin,name,value,active,trigger_event_name,trigger_timeout,creation_timestamp,timed_out_event,triggered_event,triggered_timestamp,time_to_live,expired_event"

    .line 45
    .line 46
    const-string v9, "conditional_properties"

    .line 47
    .line 48
    const-string v10, "CREATE TABLE IF NOT EXISTS conditional_properties ( app_id TEXT NOT NULL, origin TEXT NOT NULL, name TEXT NOT NULL, value BLOB NOT NULL, creation_timestamp INTEGER NOT NULL, active INTEGER NOT NULL, trigger_event_name TEXT, trigger_timeout INTEGER NOT NULL, timed_out_event BLOB,triggered_event BLOB, triggered_timestamp INTEGER NOT NULL, time_to_live INTEGER NOT NULL, expired_event BLOB, PRIMARY KEY (app_id, name)) ;"

    .line 49
    .line 50
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const-string v11, "app_id,name,set_timestamp,value"

    .line 60
    .line 61
    invoke-static {}, Ll/opr0;->s0()[Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v12

    .line 65
    const-string v9, "user_attributes"

    .line 66
    .line 67
    const-string v10, "CREATE TABLE IF NOT EXISTS user_attributes ( app_id TEXT NOT NULL, name TEXT NOT NULL, set_timestamp INTEGER NOT NULL, value BLOB NOT NULL, PRIMARY KEY (app_id, name)) ;"

    .line 68
    .line 69
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    const-string v11, "app_id,app_instance_id,gmp_app_id,resettable_device_id_hash,last_bundle_index,last_bundle_end_timestamp"

    .line 79
    .line 80
    invoke-static {}, Ll/opr0;->k0()[Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v12

    .line 84
    const-string v9, "apps"

    .line 85
    .line 86
    const-string v10, "CREATE TABLE IF NOT EXISTS apps ( app_id TEXT NOT NULL, app_instance_id TEXT, gmp_app_id TEXT, resettable_device_id_hash TEXT, last_bundle_index INTEGER NOT NULL, last_bundle_end_timestamp INTEGER NOT NULL, PRIMARY KEY (app_id)) ;"

    .line 87
    .line 88
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    const-string v11, "app_id,bundle_end_timestamp,data"

    .line 98
    .line 99
    invoke-static {}, Ll/opr0;->p0()[Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v12

    .line 103
    const-string v9, "queue"

    .line 104
    .line 105
    const-string v10, "CREATE TABLE IF NOT EXISTS queue ( app_id TEXT NOT NULL, bundle_end_timestamp INTEGER NOT NULL, data BLOB NOT NULL);"

    .line 106
    .line 107
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 111
    .line 112
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 113
    .line 114
    .line 115
    move-result-object v7

    .line 116
    const-string v11, "app_id,metadata_fingerprint,metadata"

    .line 117
    .line 118
    const/4 v12, 0x0

    .line 119
    const-string v9, "raw_events_metadata"

    .line 120
    .line 121
    const-string v10, "CREATE TABLE IF NOT EXISTS raw_events_metadata ( app_id TEXT NOT NULL, metadata_fingerprint INTEGER NOT NULL, metadata BLOB NOT NULL, PRIMARY KEY (app_id, metadata_fingerprint));"

    .line 122
    .line 123
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 127
    .line 128
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    const-string v11, "app_id,name,timestamp,metadata_fingerprint,data"

    .line 133
    .line 134
    invoke-static {}, Ll/opr0;->q0()[Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v12

    .line 138
    const-string v9, "raw_events"

    .line 139
    .line 140
    const-string v10, "CREATE TABLE IF NOT EXISTS raw_events ( app_id TEXT NOT NULL, name TEXT NOT NULL, timestamp INTEGER NOT NULL, metadata_fingerprint INTEGER NOT NULL, data BLOB NOT NULL);"

    .line 141
    .line 142
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 146
    .line 147
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    const-string v11, "app_id,audience_id,filter_id,event_name,data"

    .line 152
    .line 153
    invoke-static {}, Ll/opr0;->n0()[Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v12

    .line 157
    const-string v9, "event_filters"

    .line 158
    .line 159
    const-string v10, "CREATE TABLE IF NOT EXISTS event_filters ( app_id TEXT NOT NULL, audience_id INTEGER NOT NULL, filter_id INTEGER NOT NULL, event_name TEXT NOT NULL, data BLOB NOT NULL, PRIMARY KEY (app_id, event_name, audience_id, filter_id));"

    .line 160
    .line 161
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 167
    .line 168
    .line 169
    move-result-object v7

    .line 170
    const-string v11, "app_id,audience_id,filter_id,property_name,data"

    .line 171
    .line 172
    invoke-static {}, Ll/opr0;->o0()[Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v12

    .line 176
    const-string v9, "property_filters"

    .line 177
    .line 178
    const-string v10, "CREATE TABLE IF NOT EXISTS property_filters ( app_id TEXT NOT NULL, audience_id INTEGER NOT NULL, filter_id INTEGER NOT NULL, property_name TEXT NOT NULL, data BLOB NOT NULL, PRIMARY KEY (app_id, property_name, audience_id, filter_id));"

    .line 179
    .line 180
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 184
    .line 185
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    const-string v11, "app_id,audience_id,current_results"

    .line 190
    .line 191
    const/4 v12, 0x0

    .line 192
    const-string v9, "audience_filter_values"

    .line 193
    .line 194
    const-string v10, "CREATE TABLE IF NOT EXISTS audience_filter_values ( app_id TEXT NOT NULL, audience_id INTEGER NOT NULL, current_results BLOB, PRIMARY KEY (app_id, audience_id));"

    .line 195
    .line 196
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 200
    .line 201
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    const-string v11, "app_id,first_open_count"

    .line 206
    .line 207
    invoke-static {}, Ll/opr0;->j0()[Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v12

    .line 211
    const-string v9, "app2"

    .line 212
    .line 213
    const-string v10, "CREATE TABLE IF NOT EXISTS app2 ( app_id TEXT NOT NULL, first_open_count INTEGER NOT NULL, PRIMARY KEY (app_id));"

    .line 214
    .line 215
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 219
    .line 220
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 221
    .line 222
    .line 223
    move-result-object v7

    .line 224
    const-string v11, "app_id,event_id,children_to_process,main_event"

    .line 225
    .line 226
    const/4 v12, 0x0

    .line 227
    const-string v9, "main_event_params"

    .line 228
    .line 229
    const-string v10, "CREATE TABLE IF NOT EXISTS main_event_params ( app_id TEXT NOT NULL, event_id TEXT NOT NULL, children_to_process INTEGER NOT NULL, main_event BLOB NOT NULL, PRIMARY KEY (app_id));"

    .line 230
    .line 231
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 235
    .line 236
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 237
    .line 238
    .line 239
    move-result-object v7

    .line 240
    const-string v11, "app_id,parameters"

    .line 241
    .line 242
    const-string v9, "default_event_params"

    .line 243
    .line 244
    const-string v10, "CREATE TABLE IF NOT EXISTS default_event_params ( app_id TEXT NOT NULL, parameters BLOB NOT NULL, PRIMARY KEY (app_id));"

    .line 245
    .line 246
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 250
    .line 251
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    const-string v11, "app_id,consent_state"

    .line 256
    .line 257
    invoke-static {}, Ll/opr0;->l0()[Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v12

    .line 261
    const-string v9, "consent_settings"

    .line 262
    .line 263
    const-string v10, "CREATE TABLE IF NOT EXISTS consent_settings ( app_id TEXT NOT NULL, consent_state TEXT NOT NULL, PRIMARY KEY (app_id));"

    .line 264
    .line 265
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    invoke-static {}, Ll/spy0;->a()Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-eqz p1, :cond_0

    .line 273
    .line 274
    iget-object p1, p0, Ll/b0s0;->a:Ll/opr0;

    .line 275
    .line 276
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 277
    .line 278
    .line 279
    move-result-object v7

    .line 280
    const-string v11, "app_id,trigger_uri,source,timestamp_millis"

    .line 281
    .line 282
    invoke-static {}, Ll/opr0;->r0()[Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v12

    .line 286
    const-string v9, "trigger_uris"

    .line 287
    .line 288
    const-string v10, "CREATE TABLE IF NOT EXISTS trigger_uris ( app_id TEXT NOT NULL, trigger_uri TEXT NOT NULL, timestamp_millis INTEGER NOT NULL, source INTEGER NOT NULL);"

    .line 289
    .line 290
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    :cond_0
    iget-object p0, p0, Ll/b0s0;->a:Ll/opr0;

    .line 294
    .line 295
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 296
    .line 297
    .line 298
    move-result-object v7

    .line 299
    const-string v11, "app_id,upload_uri,upload_headers,upload_type,measurement_batch,retry_count,creation_timestamp"

    .line 300
    .line 301
    const/4 v12, 0x0

    .line 302
    const-string v9, "upload_queue"

    .line 303
    .line 304
    const-string v10, "CREATE TABLE IF NOT EXISTS upload_queue ( app_id TEXT NOT NULL, upload_uri TEXT NOT NULL, upload_headers TEXT NOT NULL, upload_type INTEGER NOT NULL, measurement_batch BLOB NOT NULL, retry_count INTEGER NOT NULL, creation_timestamp INTEGER NOT NULL );"

    .line 305
    .line 306
    invoke-static/range {v7 .. v12}, Ll/r3s0;->c(Ll/d6x0;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    return-void
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    return-void
.end method
