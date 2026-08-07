.class public final Ll/sjq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/njq0;


# instance fields
.field public final a:Landroidx/room/RoomDatabase;

.field public final b:Ll/u2f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/u2f<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/t2f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t2f<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Landroidx/room/SharedSQLiteStatement;

.field public final e:Landroidx/room/SharedSQLiteStatement;

.field public final f:Landroidx/room/SharedSQLiteStatement;

.field public final g:Landroidx/room/SharedSQLiteStatement;

.field public final h:Landroidx/room/SharedSQLiteStatement;

.field public final i:Landroidx/room/SharedSQLiteStatement;

.field public final j:Landroidx/room/SharedSQLiteStatement;

.field public final k:Landroidx/room/SharedSQLiteStatement;

.field public final l:Landroidx/room/SharedSQLiteStatement;

.field public final m:Landroidx/room/SharedSQLiteStatement;

.field public final n:Landroidx/room/SharedSQLiteStatement;

.field public final o:Landroidx/room/SharedSQLiteStatement;

.field public final p:Landroidx/room/SharedSQLiteStatement;

.field public final q:Landroidx/room/SharedSQLiteStatement;

.field public final r:Landroidx/room/SharedSQLiteStatement;


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1    # Landroidx/room/RoomDatabase;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 5
    .line 6
    new-instance v0, Ll/sjq0$i;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/sjq0$i;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/sjq0;->b:Ll/u2f;

    .line 12
    .line 13
    new-instance v0, Ll/sjq0$k;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/sjq0$k;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/sjq0;->c:Ll/t2f;

    .line 19
    .line 20
    new-instance v0, Ll/sjq0$l;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Ll/sjq0$l;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/sjq0;->d:Landroidx/room/SharedSQLiteStatement;

    .line 26
    .line 27
    new-instance v0, Ll/sjq0$m;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Ll/sjq0$m;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/sjq0;->e:Landroidx/room/SharedSQLiteStatement;

    .line 33
    .line 34
    new-instance v0, Ll/sjq0$n;

    .line 35
    .line 36
    invoke-direct {v0, p0, p1}, Ll/sjq0$n;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/sjq0;->f:Landroidx/room/SharedSQLiteStatement;

    .line 40
    .line 41
    new-instance v0, Ll/sjq0$o;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, Ll/sjq0$o;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/sjq0;->g:Landroidx/room/SharedSQLiteStatement;

    .line 47
    .line 48
    new-instance v0, Ll/sjq0$p;

    .line 49
    .line 50
    invoke-direct {v0, p0, p1}, Ll/sjq0$p;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/sjq0;->h:Landroidx/room/SharedSQLiteStatement;

    .line 54
    .line 55
    new-instance v0, Ll/sjq0$q;

    .line 56
    .line 57
    invoke-direct {v0, p0, p1}, Ll/sjq0$q;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/sjq0;->i:Landroidx/room/SharedSQLiteStatement;

    .line 61
    .line 62
    new-instance v0, Ll/sjq0$r;

    .line 63
    .line 64
    invoke-direct {v0, p0, p1}, Ll/sjq0$r;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/sjq0;->j:Landroidx/room/SharedSQLiteStatement;

    .line 68
    .line 69
    new-instance v0, Ll/sjq0$a;

    .line 70
    .line 71
    invoke-direct {v0, p0, p1}, Ll/sjq0$a;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/sjq0;->k:Landroidx/room/SharedSQLiteStatement;

    .line 75
    .line 76
    new-instance v0, Ll/sjq0$b;

    .line 77
    .line 78
    invoke-direct {v0, p0, p1}, Ll/sjq0$b;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Ll/sjq0;->l:Landroidx/room/SharedSQLiteStatement;

    .line 82
    .line 83
    new-instance v0, Ll/sjq0$c;

    .line 84
    .line 85
    invoke-direct {v0, p0, p1}, Ll/sjq0$c;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Ll/sjq0;->m:Landroidx/room/SharedSQLiteStatement;

    .line 89
    .line 90
    new-instance v0, Ll/sjq0$d;

    .line 91
    .line 92
    invoke-direct {v0, p0, p1}, Ll/sjq0$d;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Ll/sjq0;->n:Landroidx/room/SharedSQLiteStatement;

    .line 96
    .line 97
    new-instance v0, Ll/sjq0$e;

    .line 98
    .line 99
    invoke-direct {v0, p0, p1}, Ll/sjq0$e;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ll/sjq0;->o:Landroidx/room/SharedSQLiteStatement;

    .line 103
    .line 104
    new-instance v0, Ll/sjq0$f;

    .line 105
    .line 106
    invoke-direct {v0, p0, p1}, Ll/sjq0$f;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 107
    .line 108
    .line 109
    iput-object v0, p0, Ll/sjq0;->p:Landroidx/room/SharedSQLiteStatement;

    .line 110
    .line 111
    new-instance v0, Ll/sjq0$g;

    .line 112
    .line 113
    invoke-direct {v0, p0, p1}, Ll/sjq0$g;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Ll/sjq0;->q:Landroidx/room/SharedSQLiteStatement;

    .line 117
    .line 118
    new-instance v0, Ll/sjq0$h;

    .line 119
    .line 120
    invoke-direct {v0, p0, p1}, Ll/sjq0$h;-><init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Ll/sjq0;->r:Landroidx/room/SharedSQLiteStatement;

    .line 124
    .line 125
    return-void
.end method

.method public static synthetic H(Ll/sjq0;Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjq0;->J(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic I(Ll/sjq0;Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjq0;->K(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic L(Ll/sjq0;)Landroidx/room/RoomDatabase;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static M()Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public A()Ll/aui;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/aui<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "SELECT COUNT(*) > 0 FROM workspec WHERE state NOT IN (2, 3, 5) LIMIT 1"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 9
    .line 10
    const-string v3, "workspec"

    .line 11
    .line 12
    filled-new-array {v3}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    new-instance v4, Ll/sjq0$j;

    .line 17
    .line 18
    invoke-direct {v4, p0, v0}, Ll/sjq0$j;-><init>(Ll/sjq0;Ll/zkd0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v2, v1, v3, v4}, Landroidx/room/CoroutinesRoom;->a(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Ll/aui;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public B(I)Ljava/util/List;
    .locals 81
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 ORDER BY last_enqueue_time LIMIT (SELECT MAX(?-COUNT(*), 0) FROM workspec WHERE schedule_requested_at<>-1 AND LENGTH(content_uri_triggers)=0 AND state NOT IN (2, 3, 5))"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    move/from16 v3, p1

    .line 11
    .line 12
    int-to-long v3, v3

    .line 13
    invoke-virtual {v1, v2, v3, v4}, Ll/zkd0;->bindLong(IJ)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 19
    .line 20
    .line 21
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-static {v0, v1, v3, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    :try_start_0
    const-string v0, "id"

    .line 30
    .line 31
    invoke-static {v5, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v6, "state"

    .line 36
    .line 37
    invoke-static {v5, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    const-string v7, "worker_class_name"

    .line 42
    .line 43
    invoke-static {v5, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    const-string v8, "input_merger_class_name"

    .line 48
    .line 49
    invoke-static {v5, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    const-string v9, "input"

    .line 54
    .line 55
    invoke-static {v5, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v9

    .line 59
    const-string v10, "output"

    .line 60
    .line 61
    invoke-static {v5, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    const-string v11, "initial_delay"

    .line 66
    .line 67
    invoke-static {v5, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v11

    .line 71
    const-string v12, "interval_duration"

    .line 72
    .line 73
    invoke-static {v5, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v12

    .line 77
    const-string v13, "flex_duration"

    .line 78
    .line 79
    invoke-static {v5, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v13

    .line 83
    const-string v14, "run_attempt_count"

    .line 84
    .line 85
    invoke-static {v5, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v14

    .line 89
    const-string v15, "backoff_policy"

    .line 90
    .line 91
    invoke-static {v5, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v15

    .line 95
    const-string v2, "backoff_delay_duration"

    .line 96
    .line 97
    invoke-static {v5, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    const-string v3, "last_enqueue_time"

    .line 102
    .line 103
    invoke-static {v5, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    const-string v4, "minimum_retention_duration"

    .line 108
    .line 109
    invoke-static {v5, v4}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 113
    move-object/from16 v16, v1

    .line 114
    .line 115
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 116
    .line 117
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    move/from16 v17, v1

    .line 122
    .line 123
    const-string v1, "run_in_foreground"

    .line 124
    .line 125
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    move/from16 v18, v1

    .line 130
    .line 131
    const-string v1, "out_of_quota_policy"

    .line 132
    .line 133
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    move/from16 v19, v1

    .line 138
    .line 139
    const-string v1, "period_count"

    .line 140
    .line 141
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    move/from16 v20, v1

    .line 146
    .line 147
    const-string v1, "generation"

    .line 148
    .line 149
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    move/from16 v21, v1

    .line 154
    .line 155
    const-string v1, "next_schedule_time_override"

    .line 156
    .line 157
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    move/from16 v22, v1

    .line 162
    .line 163
    const-string v1, "next_schedule_time_override_generation"

    .line 164
    .line 165
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    move/from16 v23, v1

    .line 170
    .line 171
    const-string v1, "stop_reason"

    .line 172
    .line 173
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    move/from16 v24, v1

    .line 178
    .line 179
    const-string v1, "trace_tag"

    .line 180
    .line 181
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    move/from16 v25, v1

    .line 186
    .line 187
    const-string v1, "required_network_type"

    .line 188
    .line 189
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    move/from16 v26, v1

    .line 194
    .line 195
    const-string v1, "required_network_request"

    .line 196
    .line 197
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    move/from16 v27, v1

    .line 202
    .line 203
    const-string v1, "requires_charging"

    .line 204
    .line 205
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    move/from16 v28, v1

    .line 210
    .line 211
    const-string v1, "requires_device_idle"

    .line 212
    .line 213
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    move/from16 v29, v1

    .line 218
    .line 219
    const-string v1, "requires_battery_not_low"

    .line 220
    .line 221
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    move/from16 v30, v1

    .line 226
    .line 227
    const-string v1, "requires_storage_not_low"

    .line 228
    .line 229
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    move/from16 v31, v1

    .line 234
    .line 235
    const-string v1, "trigger_content_update_delay"

    .line 236
    .line 237
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    move/from16 v32, v1

    .line 242
    .line 243
    const-string v1, "trigger_max_content_delay"

    .line 244
    .line 245
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    move/from16 v33, v1

    .line 250
    .line 251
    const-string v1, "content_uri_triggers"

    .line 252
    .line 253
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    move/from16 v34, v1

    .line 258
    .line 259
    new-instance v1, Ljava/util/ArrayList;

    .line 260
    .line 261
    move/from16 v35, v4

    .line 262
    .line 263
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    .line 264
    .line 265
    .line 266
    move-result v4

    .line 267
    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 268
    .line 269
    .line 270
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    if-eqz v4, :cond_6

    .line 275
    .line 276
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v37

    .line 280
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    invoke-static {v4}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 285
    .line 286
    .line 287
    move-result-object v38

    .line 288
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v39

    .line 292
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v40

    .line 296
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 301
    .line 302
    .line 303
    move-result-object v41

    .line 304
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 309
    .line 310
    .line 311
    move-result-object v42

    .line 312
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 313
    .line 314
    .line 315
    move-result-wide v43

    .line 316
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 317
    .line 318
    .line 319
    move-result-wide v45

    .line 320
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 321
    .line 322
    .line 323
    move-result-wide v47

    .line 324
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 325
    .line 326
    .line 327
    move-result v50

    .line 328
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    .line 329
    .line 330
    .line 331
    move-result v4

    .line 332
    invoke-static {v4}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 333
    .line 334
    .line 335
    move-result-object v51

    .line 336
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 337
    .line 338
    .line 339
    move-result-wide v52

    .line 340
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 341
    .line 342
    .line 343
    move-result-wide v54

    .line 344
    move/from16 v4, v35

    .line 345
    .line 346
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 347
    .line 348
    .line 349
    move-result-wide v56

    .line 350
    move/from16 v35, v0

    .line 351
    .line 352
    move/from16 v0, v17

    .line 353
    .line 354
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 355
    .line 356
    .line 357
    move-result-wide v58

    .line 358
    move/from16 v17, v0

    .line 359
    .line 360
    move/from16 v0, v18

    .line 361
    .line 362
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 363
    .line 364
    .line 365
    move-result v18

    .line 366
    if-eqz v18, :cond_0

    .line 367
    .line 368
    const/16 v60, 0x1

    .line 369
    .line 370
    :goto_1
    move/from16 v18, v0

    .line 371
    .line 372
    move/from16 v0, v19

    .line 373
    .line 374
    goto :goto_2

    .line 375
    :cond_0
    const/16 v60, 0x0

    .line 376
    .line 377
    goto :goto_1

    .line 378
    :goto_2
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 379
    .line 380
    .line 381
    move-result v19

    .line 382
    invoke-static/range {v19 .. v19}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 383
    .line 384
    .line 385
    move-result-object v61

    .line 386
    move/from16 v19, v0

    .line 387
    .line 388
    move/from16 v0, v20

    .line 389
    .line 390
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 391
    .line 392
    .line 393
    move-result v62

    .line 394
    move/from16 v20, v0

    .line 395
    .line 396
    move/from16 v0, v21

    .line 397
    .line 398
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 399
    .line 400
    .line 401
    move-result v63

    .line 402
    move/from16 v21, v0

    .line 403
    .line 404
    move/from16 v0, v22

    .line 405
    .line 406
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 407
    .line 408
    .line 409
    move-result-wide v64

    .line 410
    move/from16 v22, v0

    .line 411
    .line 412
    move/from16 v0, v23

    .line 413
    .line 414
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 415
    .line 416
    .line 417
    move-result v66

    .line 418
    move/from16 v23, v0

    .line 419
    .line 420
    move/from16 v0, v24

    .line 421
    .line 422
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 423
    .line 424
    .line 425
    move-result v67

    .line 426
    move/from16 v24, v0

    .line 427
    .line 428
    move/from16 v0, v25

    .line 429
    .line 430
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 431
    .line 432
    .line 433
    move-result v25

    .line 434
    if-eqz v25, :cond_1

    .line 435
    .line 436
    const/16 v68, 0x0

    .line 437
    .line 438
    :goto_3
    move/from16 v25, v0

    .line 439
    .line 440
    move/from16 v0, v26

    .line 441
    .line 442
    goto :goto_4

    .line 443
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v25

    .line 447
    move-object/from16 v68, v25

    .line 448
    .line 449
    goto :goto_3

    .line 450
    :goto_4
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 451
    .line 452
    .line 453
    move-result v26

    .line 454
    invoke-static/range {v26 .. v26}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 455
    .line 456
    .line 457
    move-result-object v71

    .line 458
    move/from16 v26, v0

    .line 459
    .line 460
    move/from16 v0, v27

    .line 461
    .line 462
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 463
    .line 464
    .line 465
    move-result-object v27

    .line 466
    invoke-static/range {v27 .. v27}, Ll/yjq0;->l([B)Ll/al20;

    .line 467
    .line 468
    .line 469
    move-result-object v70

    .line 470
    move/from16 v27, v0

    .line 471
    .line 472
    move/from16 v0, v28

    .line 473
    .line 474
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 475
    .line 476
    .line 477
    move-result v28

    .line 478
    if-eqz v28, :cond_2

    .line 479
    .line 480
    const/16 v72, 0x1

    .line 481
    .line 482
    :goto_5
    move/from16 v28, v0

    .line 483
    .line 484
    move/from16 v0, v29

    .line 485
    .line 486
    goto :goto_6

    .line 487
    :cond_2
    const/16 v72, 0x0

    .line 488
    .line 489
    goto :goto_5

    .line 490
    :goto_6
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 491
    .line 492
    .line 493
    move-result v29

    .line 494
    if-eqz v29, :cond_3

    .line 495
    .line 496
    const/16 v73, 0x1

    .line 497
    .line 498
    :goto_7
    move/from16 v29, v0

    .line 499
    .line 500
    move/from16 v0, v30

    .line 501
    .line 502
    goto :goto_8

    .line 503
    :cond_3
    const/16 v73, 0x0

    .line 504
    .line 505
    goto :goto_7

    .line 506
    :goto_8
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 507
    .line 508
    .line 509
    move-result v30

    .line 510
    if-eqz v30, :cond_4

    .line 511
    .line 512
    const/16 v74, 0x1

    .line 513
    .line 514
    :goto_9
    move/from16 v30, v0

    .line 515
    .line 516
    move/from16 v0, v31

    .line 517
    .line 518
    goto :goto_a

    .line 519
    :cond_4
    const/16 v74, 0x0

    .line 520
    .line 521
    goto :goto_9

    .line 522
    :goto_a
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 523
    .line 524
    .line 525
    move-result v31

    .line 526
    if-eqz v31, :cond_5

    .line 527
    .line 528
    const/16 v75, 0x1

    .line 529
    .line 530
    :goto_b
    move/from16 v31, v0

    .line 531
    .line 532
    move/from16 v0, v32

    .line 533
    .line 534
    goto :goto_c

    .line 535
    :cond_5
    const/16 v75, 0x0

    .line 536
    .line 537
    goto :goto_b

    .line 538
    :goto_c
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 539
    .line 540
    .line 541
    move-result-wide v76

    .line 542
    move/from16 v32, v0

    .line 543
    .line 544
    move/from16 v0, v33

    .line 545
    .line 546
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 547
    .line 548
    .line 549
    move-result-wide v78

    .line 550
    move/from16 v33, v0

    .line 551
    .line 552
    move/from16 v0, v34

    .line 553
    .line 554
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 555
    .line 556
    .line 557
    move-result-object v34

    .line 558
    invoke-static/range {v34 .. v34}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 559
    .line 560
    .line 561
    move-result-object v80

    .line 562
    new-instance v49, Ll/l06;

    .line 563
    .line 564
    move-object/from16 v69, v49

    .line 565
    .line 566
    invoke-direct/range {v69 .. v80}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 567
    .line 568
    .line 569
    move-object/from16 v49, v69

    .line 570
    .line 571
    new-instance v36, Ll/mjq0;

    .line 572
    .line 573
    invoke-direct/range {v36 .. v68}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    .line 574
    .line 575
    .line 576
    move/from16 v34, v0

    .line 577
    .line 578
    move-object/from16 v0, v36

    .line 579
    .line 580
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 581
    .line 582
    .line 583
    move/from16 v0, v35

    .line 584
    .line 585
    move/from16 v35, v4

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :catchall_0
    move-exception v0

    .line 590
    goto :goto_d

    .line 591
    :cond_6
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 592
    .line 593
    .line 594
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 595
    .line 596
    .line 597
    return-object v1

    .line 598
    :catchall_1
    move-exception v0

    .line 599
    move-object/from16 v16, v1

    .line 600
    .line 601
    :goto_d
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 602
    .line 603
    .line 604
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 605
    .line 606
    .line 607
    throw v0
.end method

.method public C(Ljava/lang/String;Landroidx/work/Data;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->h:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {p2}, Landroidx/work/Data;->g(Landroidx/work/Data;)[B

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {v0, v1, p2}, Ll/p7h0;->bindBlob(I[B)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x2

    .line 21
    invoke-interface {v0, p2, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 35
    .line 36
    .line 37
    :try_start_2
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/sjq0;->h:Landroidx/room/SharedSQLiteStatement;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_0

    .line 50
    :catchall_1
    move-exception p1

    .line 51
    :try_start_3
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 54
    .line 55
    .line 56
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    :goto_0
    iget-object p0, p0, Ll/sjq0;->h:Landroidx/room/SharedSQLiteStatement;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public D()Ljava/util/List;
    .locals 81
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE state=1"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 11
    .line 12
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 13
    .line 14
    .line 15
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {v0, v1, v2, v3}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    :try_start_0
    const-string v0, "id"

    .line 23
    .line 24
    invoke-static {v4, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v5, "state"

    .line 29
    .line 30
    invoke-static {v4, v5}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const-string v6, "worker_class_name"

    .line 35
    .line 36
    invoke-static {v4, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const-string v7, "input_merger_class_name"

    .line 41
    .line 42
    invoke-static {v4, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const-string v8, "input"

    .line 47
    .line 48
    invoke-static {v4, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const-string v9, "output"

    .line 53
    .line 54
    invoke-static {v4, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const-string v10, "initial_delay"

    .line 59
    .line 60
    invoke-static {v4, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    const-string v11, "interval_duration"

    .line 65
    .line 66
    invoke-static {v4, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    const-string v12, "flex_duration"

    .line 71
    .line 72
    invoke-static {v4, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v12

    .line 76
    const-string v13, "run_attempt_count"

    .line 77
    .line 78
    invoke-static {v4, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v13

    .line 82
    const-string v14, "backoff_policy"

    .line 83
    .line 84
    invoke-static {v4, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v14

    .line 88
    const-string v15, "backoff_delay_duration"

    .line 89
    .line 90
    invoke-static {v4, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v15

    .line 94
    const-string v2, "last_enqueue_time"

    .line 95
    .line 96
    invoke-static {v4, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const-string v3, "minimum_retention_duration"

    .line 101
    .line 102
    invoke-static {v4, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 106
    move-object/from16 v16, v1

    .line 107
    .line 108
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 109
    .line 110
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    move/from16 v17, v1

    .line 115
    .line 116
    const-string v1, "run_in_foreground"

    .line 117
    .line 118
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    move/from16 v18, v1

    .line 123
    .line 124
    const-string v1, "out_of_quota_policy"

    .line 125
    .line 126
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    move/from16 v19, v1

    .line 131
    .line 132
    const-string v1, "period_count"

    .line 133
    .line 134
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    move/from16 v20, v1

    .line 139
    .line 140
    const-string v1, "generation"

    .line 141
    .line 142
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    move/from16 v21, v1

    .line 147
    .line 148
    const-string v1, "next_schedule_time_override"

    .line 149
    .line 150
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    move/from16 v22, v1

    .line 155
    .line 156
    const-string v1, "next_schedule_time_override_generation"

    .line 157
    .line 158
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    move/from16 v23, v1

    .line 163
    .line 164
    const-string v1, "stop_reason"

    .line 165
    .line 166
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    move/from16 v24, v1

    .line 171
    .line 172
    const-string v1, "trace_tag"

    .line 173
    .line 174
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    move/from16 v25, v1

    .line 179
    .line 180
    const-string v1, "required_network_type"

    .line 181
    .line 182
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    move/from16 v26, v1

    .line 187
    .line 188
    const-string v1, "required_network_request"

    .line 189
    .line 190
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    move/from16 v27, v1

    .line 195
    .line 196
    const-string v1, "requires_charging"

    .line 197
    .line 198
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    move/from16 v28, v1

    .line 203
    .line 204
    const-string v1, "requires_device_idle"

    .line 205
    .line 206
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    move/from16 v29, v1

    .line 211
    .line 212
    const-string v1, "requires_battery_not_low"

    .line 213
    .line 214
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    move/from16 v30, v1

    .line 219
    .line 220
    const-string v1, "requires_storage_not_low"

    .line 221
    .line 222
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    move/from16 v31, v1

    .line 227
    .line 228
    const-string v1, "trigger_content_update_delay"

    .line 229
    .line 230
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    move/from16 v32, v1

    .line 235
    .line 236
    const-string v1, "trigger_max_content_delay"

    .line 237
    .line 238
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    move/from16 v33, v1

    .line 243
    .line 244
    const-string v1, "content_uri_triggers"

    .line 245
    .line 246
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    move/from16 v34, v1

    .line 251
    .line 252
    new-instance v1, Ljava/util/ArrayList;

    .line 253
    .line 254
    move/from16 v35, v3

    .line 255
    .line 256
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 261
    .line 262
    .line 263
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 264
    .line 265
    .line 266
    move-result v3

    .line 267
    if-eqz v3, :cond_6

    .line 268
    .line 269
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v37

    .line 273
    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    invoke-static {v3}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 278
    .line 279
    .line 280
    move-result-object v38

    .line 281
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v39

    .line 285
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v40

    .line 289
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 294
    .line 295
    .line 296
    move-result-object v41

    .line 297
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 302
    .line 303
    .line 304
    move-result-object v42

    .line 305
    invoke-interface {v4, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 306
    .line 307
    .line 308
    move-result-wide v43

    .line 309
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 310
    .line 311
    .line 312
    move-result-wide v45

    .line 313
    invoke-interface {v4, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 314
    .line 315
    .line 316
    move-result-wide v47

    .line 317
    invoke-interface {v4, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 318
    .line 319
    .line 320
    move-result v50

    .line 321
    invoke-interface {v4, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 322
    .line 323
    .line 324
    move-result v3

    .line 325
    invoke-static {v3}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 326
    .line 327
    .line 328
    move-result-object v51

    .line 329
    invoke-interface {v4, v15}, Landroid/database/Cursor;->getLong(I)J

    .line 330
    .line 331
    .line 332
    move-result-wide v52

    .line 333
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 334
    .line 335
    .line 336
    move-result-wide v54

    .line 337
    move/from16 v3, v35

    .line 338
    .line 339
    invoke-interface {v4, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 340
    .line 341
    .line 342
    move-result-wide v56

    .line 343
    move/from16 v35, v0

    .line 344
    .line 345
    move/from16 v0, v17

    .line 346
    .line 347
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 348
    .line 349
    .line 350
    move-result-wide v58

    .line 351
    move/from16 v17, v0

    .line 352
    .line 353
    move/from16 v0, v18

    .line 354
    .line 355
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 356
    .line 357
    .line 358
    move-result v18

    .line 359
    const/16 v36, 0x1

    .line 360
    .line 361
    if-eqz v18, :cond_0

    .line 362
    .line 363
    move/from16 v60, v36

    .line 364
    .line 365
    :goto_1
    move/from16 v18, v0

    .line 366
    .line 367
    move/from16 v0, v19

    .line 368
    .line 369
    goto :goto_2

    .line 370
    :cond_0
    const/16 v60, 0x0

    .line 371
    .line 372
    goto :goto_1

    .line 373
    :goto_2
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 374
    .line 375
    .line 376
    move-result v19

    .line 377
    invoke-static/range {v19 .. v19}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 378
    .line 379
    .line 380
    move-result-object v61

    .line 381
    move/from16 v19, v0

    .line 382
    .line 383
    move/from16 v0, v20

    .line 384
    .line 385
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 386
    .line 387
    .line 388
    move-result v62

    .line 389
    move/from16 v20, v0

    .line 390
    .line 391
    move/from16 v0, v21

    .line 392
    .line 393
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 394
    .line 395
    .line 396
    move-result v63

    .line 397
    move/from16 v21, v0

    .line 398
    .line 399
    move/from16 v0, v22

    .line 400
    .line 401
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 402
    .line 403
    .line 404
    move-result-wide v64

    .line 405
    move/from16 v22, v0

    .line 406
    .line 407
    move/from16 v0, v23

    .line 408
    .line 409
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 410
    .line 411
    .line 412
    move-result v66

    .line 413
    move/from16 v23, v0

    .line 414
    .line 415
    move/from16 v0, v24

    .line 416
    .line 417
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 418
    .line 419
    .line 420
    move-result v67

    .line 421
    move/from16 v24, v0

    .line 422
    .line 423
    move/from16 v0, v25

    .line 424
    .line 425
    invoke-interface {v4, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 426
    .line 427
    .line 428
    move-result v25

    .line 429
    if-eqz v25, :cond_1

    .line 430
    .line 431
    const/16 v68, 0x0

    .line 432
    .line 433
    :goto_3
    move/from16 v25, v0

    .line 434
    .line 435
    move/from16 v0, v26

    .line 436
    .line 437
    goto :goto_4

    .line 438
    :cond_1
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v25

    .line 442
    move-object/from16 v68, v25

    .line 443
    .line 444
    goto :goto_3

    .line 445
    :goto_4
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 446
    .line 447
    .line 448
    move-result v26

    .line 449
    invoke-static/range {v26 .. v26}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 450
    .line 451
    .line 452
    move-result-object v71

    .line 453
    move/from16 v26, v0

    .line 454
    .line 455
    move/from16 v0, v27

    .line 456
    .line 457
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 458
    .line 459
    .line 460
    move-result-object v27

    .line 461
    invoke-static/range {v27 .. v27}, Ll/yjq0;->l([B)Ll/al20;

    .line 462
    .line 463
    .line 464
    move-result-object v70

    .line 465
    move/from16 v27, v0

    .line 466
    .line 467
    move/from16 v0, v28

    .line 468
    .line 469
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 470
    .line 471
    .line 472
    move-result v28

    .line 473
    if-eqz v28, :cond_2

    .line 474
    .line 475
    move/from16 v72, v36

    .line 476
    .line 477
    :goto_5
    move/from16 v28, v0

    .line 478
    .line 479
    move/from16 v0, v29

    .line 480
    .line 481
    goto :goto_6

    .line 482
    :cond_2
    const/16 v72, 0x0

    .line 483
    .line 484
    goto :goto_5

    .line 485
    :goto_6
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 486
    .line 487
    .line 488
    move-result v29

    .line 489
    if-eqz v29, :cond_3

    .line 490
    .line 491
    move/from16 v73, v36

    .line 492
    .line 493
    :goto_7
    move/from16 v29, v0

    .line 494
    .line 495
    move/from16 v0, v30

    .line 496
    .line 497
    goto :goto_8

    .line 498
    :cond_3
    const/16 v73, 0x0

    .line 499
    .line 500
    goto :goto_7

    .line 501
    :goto_8
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 502
    .line 503
    .line 504
    move-result v30

    .line 505
    if-eqz v30, :cond_4

    .line 506
    .line 507
    move/from16 v74, v36

    .line 508
    .line 509
    :goto_9
    move/from16 v30, v0

    .line 510
    .line 511
    move/from16 v0, v31

    .line 512
    .line 513
    goto :goto_a

    .line 514
    :cond_4
    const/16 v74, 0x0

    .line 515
    .line 516
    goto :goto_9

    .line 517
    :goto_a
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 518
    .line 519
    .line 520
    move-result v31

    .line 521
    if-eqz v31, :cond_5

    .line 522
    .line 523
    move/from16 v75, v36

    .line 524
    .line 525
    :goto_b
    move/from16 v31, v0

    .line 526
    .line 527
    move/from16 v0, v32

    .line 528
    .line 529
    goto :goto_c

    .line 530
    :cond_5
    const/16 v75, 0x0

    .line 531
    .line 532
    goto :goto_b

    .line 533
    :goto_c
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 534
    .line 535
    .line 536
    move-result-wide v76

    .line 537
    move/from16 v32, v0

    .line 538
    .line 539
    move/from16 v0, v33

    .line 540
    .line 541
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 542
    .line 543
    .line 544
    move-result-wide v78

    .line 545
    move/from16 v33, v0

    .line 546
    .line 547
    move/from16 v0, v34

    .line 548
    .line 549
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 550
    .line 551
    .line 552
    move-result-object v34

    .line 553
    invoke-static/range {v34 .. v34}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 554
    .line 555
    .line 556
    move-result-object v80

    .line 557
    new-instance v49, Ll/l06;

    .line 558
    .line 559
    move-object/from16 v69, v49

    .line 560
    .line 561
    invoke-direct/range {v69 .. v80}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 562
    .line 563
    .line 564
    move-object/from16 v49, v69

    .line 565
    .line 566
    new-instance v36, Ll/mjq0;

    .line 567
    .line 568
    invoke-direct/range {v36 .. v68}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    .line 569
    .line 570
    .line 571
    move/from16 v34, v0

    .line 572
    .line 573
    move-object/from16 v0, v36

    .line 574
    .line 575
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 576
    .line 577
    .line 578
    move/from16 v0, v35

    .line 579
    .line 580
    move/from16 v35, v3

    .line 581
    .line 582
    goto/16 :goto_0

    .line 583
    .line 584
    :catchall_0
    move-exception v0

    .line 585
    goto :goto_d

    .line 586
    :cond_6
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 587
    .line 588
    .line 589
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 590
    .line 591
    .line 592
    return-object v1

    .line 593
    :catchall_1
    move-exception v0

    .line 594
    move-object/from16 v16, v1

    .line 595
    .line 596
    :goto_d
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 597
    .line 598
    .line 599
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 600
    .line 601
    .line 602
    throw v0
.end method

.method public E(Ljava/lang/String;)Ljava/util/List;
    .locals 43
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/mjq0$c;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v0, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    move-object/from16 v0, p1

    .line 11
    .line 12
    invoke-virtual {v3, v2, v0}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 18
    .line 19
    .line 20
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static {v0, v3, v2, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 29
    .line 30
    .line 31
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v5, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    :cond_0
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    const/4 v7, 0x0

    .line 47
    if-eqz v6, :cond_2

    .line 48
    .line 49
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-nez v8, :cond_1

    .line 58
    .line 59
    new-instance v8, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    goto/16 :goto_7

    .line 70
    .line 71
    :cond_1
    :goto_1
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    if-nez v7, :cond_0

    .line 80
    .line 81
    new-instance v7, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    const/4 v6, -0x1

    .line 91
    invoke-interface {v4, v6}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ll/sjq0;->K(Ljava/util/HashMap;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v5}, Ll/sjq0;->J(Ljava/util/HashMap;)V

    .line 98
    .line 99
    .line 100
    new-instance v6, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 107
    .line 108
    .line 109
    :goto_2
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-eqz v8, :cond_7

    .line 114
    .line 115
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v10

    .line 119
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    invoke-static {v8}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    const/4 v8, 0x2

    .line 128
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    invoke-static {v8}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 133
    .line 134
    .line 135
    move-result-object v12

    .line 136
    const/4 v8, 0x3

    .line 137
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 138
    .line 139
    .line 140
    move-result v20

    .line 141
    const/4 v8, 0x4

    .line 142
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 143
    .line 144
    .line 145
    move-result v27

    .line 146
    const/16 v8, 0xe

    .line 147
    .line 148
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 149
    .line 150
    .line 151
    move-result-wide v13

    .line 152
    const/16 v8, 0xf

    .line 153
    .line 154
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 155
    .line 156
    .line 157
    move-result-wide v15

    .line 158
    const/16 v8, 0x10

    .line 159
    .line 160
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 161
    .line 162
    .line 163
    move-result-wide v17

    .line 164
    const/16 v8, 0x11

    .line 165
    .line 166
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    invoke-static {v8}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 171
    .line 172
    .line 173
    move-result-object v21

    .line 174
    const/16 v8, 0x12

    .line 175
    .line 176
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 177
    .line 178
    .line 179
    move-result-wide v22

    .line 180
    const/16 v8, 0x13

    .line 181
    .line 182
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 183
    .line 184
    .line 185
    move-result-wide v24

    .line 186
    const/16 v8, 0x14

    .line 187
    .line 188
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 189
    .line 190
    .line 191
    move-result v26

    .line 192
    const/16 v8, 0x15

    .line 193
    .line 194
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 195
    .line 196
    .line 197
    move-result-wide v28

    .line 198
    const/16 v8, 0x16

    .line 199
    .line 200
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 201
    .line 202
    .line 203
    move-result v30

    .line 204
    const/4 v8, 0x5

    .line 205
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 206
    .line 207
    .line 208
    move-result v8

    .line 209
    invoke-static {v8}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 210
    .line 211
    .line 212
    move-result-object v33

    .line 213
    const/4 v8, 0x6

    .line 214
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    invoke-static {v8}, Ll/yjq0;->l([B)Ll/al20;

    .line 219
    .line 220
    .line 221
    move-result-object v32

    .line 222
    const/4 v8, 0x7

    .line 223
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    if-eqz v8, :cond_3

    .line 228
    .line 229
    move/from16 v34, v2

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_3
    move/from16 v34, v7

    .line 233
    .line 234
    :goto_3
    const/16 v8, 0x8

    .line 235
    .line 236
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 237
    .line 238
    .line 239
    move-result v8

    .line 240
    if-eqz v8, :cond_4

    .line 241
    .line 242
    move/from16 v35, v2

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_4
    move/from16 v35, v7

    .line 246
    .line 247
    :goto_4
    const/16 v8, 0x9

    .line 248
    .line 249
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 250
    .line 251
    .line 252
    move-result v8

    .line 253
    if-eqz v8, :cond_5

    .line 254
    .line 255
    move/from16 v36, v2

    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_5
    move/from16 v36, v7

    .line 259
    .line 260
    :goto_5
    const/16 v8, 0xa

    .line 261
    .line 262
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 263
    .line 264
    .line 265
    move-result v8

    .line 266
    if-eqz v8, :cond_6

    .line 267
    .line 268
    move/from16 v37, v2

    .line 269
    .line 270
    goto :goto_6

    .line 271
    :cond_6
    move/from16 v37, v7

    .line 272
    .line 273
    :goto_6
    const/16 v8, 0xb

    .line 274
    .line 275
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 276
    .line 277
    .line 278
    move-result-wide v38

    .line 279
    const/16 v8, 0xc

    .line 280
    .line 281
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 282
    .line 283
    .line 284
    move-result-wide v40

    .line 285
    const/16 v8, 0xd

    .line 286
    .line 287
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 288
    .line 289
    .line 290
    move-result-object v8

    .line 291
    invoke-static {v8}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 292
    .line 293
    .line 294
    move-result-object v42

    .line 295
    new-instance v31, Ll/l06;

    .line 296
    .line 297
    invoke-direct/range {v31 .. v42}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 298
    .line 299
    .line 300
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v8

    .line 304
    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v8

    .line 308
    check-cast v8, Ljava/util/ArrayList;

    .line 309
    .line 310
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v9

    .line 314
    invoke-virtual {v5, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v9

    .line 318
    move-object/from16 v32, v9

    .line 319
    .line 320
    check-cast v32, Ljava/util/ArrayList;

    .line 321
    .line 322
    new-instance v9, Ll/mjq0$c;

    .line 323
    .line 324
    move-object/from16 v19, v31

    .line 325
    .line 326
    move-object/from16 v31, v8

    .line 327
    .line 328
    invoke-direct/range {v9 .. v32}, Ll/mjq0$c;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    .line 329
    .line 330
    .line 331
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    goto/16 :goto_2

    .line 335
    .line 336
    :cond_7
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 337
    .line 338
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 339
    .line 340
    .line 341
    :try_start_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v3}, Ll/zkd0;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 345
    .line 346
    .line 347
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 348
    .line 349
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 350
    .line 351
    .line 352
    return-object v6

    .line 353
    :catchall_1
    move-exception v0

    .line 354
    goto :goto_8

    .line 355
    :goto_7
    :try_start_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v3}, Ll/zkd0;->release()V

    .line 359
    .line 360
    .line 361
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 362
    :goto_8
    iget-object v1, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 363
    .line 364
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 365
    .line 366
    .line 367
    throw v0
.end method

.method public F(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->j:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 28
    .line 29
    .line 30
    :try_start_2
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/sjq0;->j:Landroidx/room/SharedSQLiteStatement;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    goto :goto_0

    .line 43
    :catchall_1
    move-exception p1

    .line 44
    :try_start_3
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 47
    .line 48
    .line 49
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    :goto_0
    iget-object p0, p0, Ll/sjq0;->j:Landroidx/room/SharedSQLiteStatement;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public G(Ljava/util/List;)Ljava/util/List;
    .locals 43
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ll/mjq0$c;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {}, Ll/h8g0;->b()Ljava/lang/StringBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v2, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN ("

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-static {v0, v2}, Ll/h8g0;->a(Ljava/lang/StringBuilder;I)V

    .line 17
    .line 18
    .line 19
    const-string v3, ")"

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v3, 0x1

    .line 37
    move v4, v3

    .line 38
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-eqz v5, :cond_0

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    check-cast v5, Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v4, v5}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    add-int/2addr v4, v3

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 58
    .line 59
    .line 60
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 63
    .line 64
    .line 65
    :try_start_0
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    invoke-static {v0, v2, v3, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 69
    .line 70
    .line 71
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 72
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v5, Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 80
    .line 81
    .line 82
    :cond_1
    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    const/4 v7, 0x0

    .line 87
    if-eqz v6, :cond_3

    .line 88
    .line 89
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    if-nez v8, :cond_2

    .line 98
    .line 99
    new-instance v8, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :catchall_0
    move-exception v0

    .line 109
    goto/16 :goto_8

    .line 110
    .line 111
    :cond_2
    :goto_2
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    if-nez v7, :cond_1

    .line 120
    .line 121
    new-instance v7, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_3
    const/4 v6, -0x1

    .line 131
    invoke-interface {v4, v6}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v0}, Ll/sjq0;->K(Ljava/util/HashMap;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v5}, Ll/sjq0;->J(Ljava/util/HashMap;)V

    .line 138
    .line 139
    .line 140
    new-instance v6, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 147
    .line 148
    .line 149
    :goto_3
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 150
    .line 151
    .line 152
    move-result v8

    .line 153
    if-eqz v8, :cond_8

    .line 154
    .line 155
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v10

    .line 159
    invoke-interface {v4, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    invoke-static {v8}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 164
    .line 165
    .line 166
    move-result-object v11

    .line 167
    const/4 v8, 0x2

    .line 168
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    invoke-static {v8}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 173
    .line 174
    .line 175
    move-result-object v12

    .line 176
    const/4 v8, 0x3

    .line 177
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 178
    .line 179
    .line 180
    move-result v20

    .line 181
    const/4 v8, 0x4

    .line 182
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 183
    .line 184
    .line 185
    move-result v27

    .line 186
    const/16 v8, 0xe

    .line 187
    .line 188
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 189
    .line 190
    .line 191
    move-result-wide v13

    .line 192
    const/16 v8, 0xf

    .line 193
    .line 194
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 195
    .line 196
    .line 197
    move-result-wide v15

    .line 198
    const/16 v8, 0x10

    .line 199
    .line 200
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 201
    .line 202
    .line 203
    move-result-wide v17

    .line 204
    const/16 v8, 0x11

    .line 205
    .line 206
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 207
    .line 208
    .line 209
    move-result v8

    .line 210
    invoke-static {v8}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 211
    .line 212
    .line 213
    move-result-object v21

    .line 214
    const/16 v8, 0x12

    .line 215
    .line 216
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 217
    .line 218
    .line 219
    move-result-wide v22

    .line 220
    const/16 v8, 0x13

    .line 221
    .line 222
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 223
    .line 224
    .line 225
    move-result-wide v24

    .line 226
    const/16 v8, 0x14

    .line 227
    .line 228
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 229
    .line 230
    .line 231
    move-result v26

    .line 232
    const/16 v8, 0x15

    .line 233
    .line 234
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 235
    .line 236
    .line 237
    move-result-wide v28

    .line 238
    const/16 v8, 0x16

    .line 239
    .line 240
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 241
    .line 242
    .line 243
    move-result v30

    .line 244
    const/4 v8, 0x5

    .line 245
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 246
    .line 247
    .line 248
    move-result v8

    .line 249
    invoke-static {v8}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 250
    .line 251
    .line 252
    move-result-object v33

    .line 253
    const/4 v8, 0x6

    .line 254
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 255
    .line 256
    .line 257
    move-result-object v8

    .line 258
    invoke-static {v8}, Ll/yjq0;->l([B)Ll/al20;

    .line 259
    .line 260
    .line 261
    move-result-object v32

    .line 262
    const/4 v8, 0x7

    .line 263
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    if-eqz v8, :cond_4

    .line 268
    .line 269
    move/from16 v34, v3

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_4
    move/from16 v34, v7

    .line 273
    .line 274
    :goto_4
    const/16 v8, 0x8

    .line 275
    .line 276
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 277
    .line 278
    .line 279
    move-result v8

    .line 280
    if-eqz v8, :cond_5

    .line 281
    .line 282
    move/from16 v35, v3

    .line 283
    .line 284
    goto :goto_5

    .line 285
    :cond_5
    move/from16 v35, v7

    .line 286
    .line 287
    :goto_5
    const/16 v8, 0x9

    .line 288
    .line 289
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 290
    .line 291
    .line 292
    move-result v8

    .line 293
    if-eqz v8, :cond_6

    .line 294
    .line 295
    move/from16 v36, v3

    .line 296
    .line 297
    goto :goto_6

    .line 298
    :cond_6
    move/from16 v36, v7

    .line 299
    .line 300
    :goto_6
    const/16 v8, 0xa

    .line 301
    .line 302
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 303
    .line 304
    .line 305
    move-result v8

    .line 306
    if-eqz v8, :cond_7

    .line 307
    .line 308
    move/from16 v37, v3

    .line 309
    .line 310
    goto :goto_7

    .line 311
    :cond_7
    move/from16 v37, v7

    .line 312
    .line 313
    :goto_7
    const/16 v8, 0xb

    .line 314
    .line 315
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 316
    .line 317
    .line 318
    move-result-wide v38

    .line 319
    const/16 v8, 0xc

    .line 320
    .line 321
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 322
    .line 323
    .line 324
    move-result-wide v40

    .line 325
    const/16 v8, 0xd

    .line 326
    .line 327
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 328
    .line 329
    .line 330
    move-result-object v8

    .line 331
    invoke-static {v8}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 332
    .line 333
    .line 334
    move-result-object v42

    .line 335
    new-instance v31, Ll/l06;

    .line 336
    .line 337
    invoke-direct/range {v31 .. v42}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 338
    .line 339
    .line 340
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v8

    .line 344
    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v8

    .line 348
    check-cast v8, Ljava/util/ArrayList;

    .line 349
    .line 350
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v9

    .line 354
    invoke-virtual {v5, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v9

    .line 358
    move-object/from16 v32, v9

    .line 359
    .line 360
    check-cast v32, Ljava/util/ArrayList;

    .line 361
    .line 362
    new-instance v9, Ll/mjq0$c;

    .line 363
    .line 364
    move-object/from16 v19, v31

    .line 365
    .line 366
    move-object/from16 v31, v8

    .line 367
    .line 368
    invoke-direct/range {v9 .. v32}, Ll/mjq0$c;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    .line 369
    .line 370
    .line 371
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    goto/16 :goto_3

    .line 375
    .line 376
    :cond_8
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 377
    .line 378
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 379
    .line 380
    .line 381
    :try_start_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v2}, Ll/zkd0;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 385
    .line 386
    .line 387
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 388
    .line 389
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 390
    .line 391
    .line 392
    return-object v6

    .line 393
    :catchall_1
    move-exception v0

    .line 394
    goto :goto_9

    .line 395
    :goto_8
    :try_start_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v2}, Ll/zkd0;->release()V

    .line 399
    .line 400
    .line 401
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 402
    :goto_9
    iget-object v1, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 403
    .line 404
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 405
    .line 406
    .line 407
    throw v0
.end method

.method public final J(Ljava/util/HashMap;)V
    .locals 5
    .param p1    # Ljava/util/HashMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroidx/work/Data;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x3e7

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-le v1, v2, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/rjq0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/rjq0;-><init>(Ll/sjq0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v3, v0}, Ll/pwc0;->a(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Ll/h8g0;->b()Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "SELECT `progress`,`work_spec_id` FROM `WorkProgress` WHERE `work_spec_id` IN ("

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v1, v2}, Ll/h8g0;->a(Ljava/lang/StringBuilder;I)V

    .line 44
    .line 45
    .line 46
    const-string v4, ")"

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    move v2, v3

    .line 64
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v2, v4}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    add-int/2addr v2, v3

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-static {p0, v1, v2, v0}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    :try_start_0
    const-string v0, "work_spec_id"

    .line 90
    .line 91
    invoke-static {p0, v0}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    const/4 v1, -0x1

    .line 96
    if-ne v0, v1, :cond_3

    .line 97
    .line 98
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ljava/util/ArrayList;

    .line 117
    .line 118
    if-eqz v1, :cond_3

    .line 119
    .line 120
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :catchall_0
    move-exception p1

    .line 133
    goto :goto_2

    .line 134
    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 139
    .line 140
    .line 141
    throw p1
.end method

.method public final K(Ljava/util/HashMap;)V
    .locals 5
    .param p1    # Ljava/util/HashMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x3e7

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-le v1, v2, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/qjq0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/qjq0;-><init>(Ll/sjq0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v3, v0}, Ll/pwc0;->a(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Ll/h8g0;->b()Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "SELECT `tag`,`work_spec_id` FROM `WorkTag` WHERE `work_spec_id` IN ("

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v1, v2}, Ll/h8g0;->a(Ljava/lang/StringBuilder;I)V

    .line 44
    .line 45
    .line 46
    const-string v4, ")"

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    move v2, v3

    .line 64
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v2, v4}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    add-int/2addr v2, v3

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-static {p0, v1, v2, v0}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    :try_start_0
    const-string v0, "work_spec_id"

    .line 90
    .line 91
    invoke-static {p0, v0}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    const/4 v1, -0x1

    .line 96
    if-ne v0, v1, :cond_3

    .line 97
    .line 98
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ljava/util/ArrayList;

    .line 117
    .line 118
    if-eqz v1, :cond_3

    .line 119
    .line 120
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :catchall_0
    move-exception p1

    .line 129
    goto :goto_2

    .line 130
    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 135
    .line 136
    .line 137
    throw p1
.end method

.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->p:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :try_start_0
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 23
    .line 24
    .line 25
    :try_start_2
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/sjq0;->p:Landroidx/room/SharedSQLiteStatement;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catchall_0
    move-exception v1

    .line 37
    goto :goto_0

    .line 38
    :catchall_1
    move-exception v1

    .line 39
    :try_start_3
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 42
    .line 43
    .line 44
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 45
    :goto_0
    iget-object p0, p0, Ll/sjq0;->p:Landroidx/room/SharedSQLiteStatement;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 48
    .line 49
    .line 50
    throw v1
.end method

.method public b(Ljava/lang/String;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->r:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    int-to-long v2, p2

    .line 14
    invoke-interface {v0, v1, v2, v3}, Ll/p7h0;->bindLong(IJ)V

    .line 15
    .line 16
    .line 17
    const/4 p2, 0x2

    .line 18
    invoke-interface {v0, p2, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    .line 33
    .line 34
    :try_start_2
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/sjq0;->r:Landroidx/room/SharedSQLiteStatement;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_0

    .line 47
    :catchall_1
    move-exception p1

    .line 48
    :try_start_3
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 49
    .line 50
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 51
    .line 52
    .line 53
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 54
    :goto_0
    iget-object p0, p0, Ll/sjq0;->r:Landroidx/room/SharedSQLiteStatement;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 57
    .line 58
    .line 59
    throw p1
.end method

.method public c(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, v1, p1}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p0, v0, v1, p1}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :try_start_0
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 53
    .line 54
    .line 55
    return-object p1

    .line 56
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public d(Ljava/lang/String;)Landroidx/work/WorkInfo$State;
    .locals 3

    .line 1
    const-string v0, "SELECT state FROM workspec WHERE id=?"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, v1, p1}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p0, v0, p1, v1}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    move-object p1, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    :goto_0
    if-nez p1, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    sget-object v1, Ll/yjq0;->INSTANCE:Ll/yjq0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 56
    .line 57
    .line 58
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    goto :goto_1

    .line 60
    :catchall_0
    move-exception p1

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 66
    .line 67
    .line 68
    return-object v1

    .line 69
    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 73
    .line 74
    .line 75
    throw p1
.end method

.method public delete(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->d:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 27
    .line 28
    .line 29
    :try_start_2
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/sjq0;->d:Landroidx/room/SharedSQLiteStatement;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_0

    .line 42
    :catchall_1
    move-exception p1

    .line 43
    :try_start_3
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 46
    .line 47
    .line 48
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    :goto_0
    iget-object p0, p0, Ll/sjq0;->d:Landroidx/room/SharedSQLiteStatement;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public e(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->f:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 28
    .line 29
    .line 30
    :try_start_2
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/sjq0;->f:Landroidx/room/SharedSQLiteStatement;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    goto :goto_0

    .line 43
    :catchall_1
    move-exception p1

    .line 44
    :try_start_3
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 47
    .line 48
    .line 49
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    :goto_0
    iget-object p0, p0, Ll/sjq0;->f:Landroidx/room/SharedSQLiteStatement;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public f(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM worktag WHERE tag=?)"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, v1, p1}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p0, v0, v1, p1}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :try_start_0
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 53
    .line 54
    .line 55
    return-object p1

    .line 56
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public g(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/Data;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "SELECT output FROM workspec WHERE id IN\n             (SELECT prerequisite_id FROM dependency WHERE work_spec_id=?)"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, v1, p1}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p0, v0, v1, p1}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :try_start_0
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v2}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 57
    .line 58
    .line 59
    return-object p1

    .line 60
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public h(Ljava/lang/String;)Ljava/util/List;
    .locals 43
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/mjq0$c;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v0, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    move-object/from16 v0, p1

    .line 11
    .line 12
    invoke-virtual {v3, v2, v0}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 18
    .line 19
    .line 20
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static {v0, v3, v2, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 29
    .line 30
    .line 31
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v5, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    :cond_0
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    const/4 v7, 0x0

    .line 47
    if-eqz v6, :cond_2

    .line 48
    .line 49
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-nez v8, :cond_1

    .line 58
    .line 59
    new-instance v8, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    goto/16 :goto_7

    .line 70
    .line 71
    :cond_1
    :goto_1
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    if-nez v7, :cond_0

    .line 80
    .line 81
    new-instance v7, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    const/4 v6, -0x1

    .line 91
    invoke-interface {v4, v6}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ll/sjq0;->K(Ljava/util/HashMap;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v5}, Ll/sjq0;->J(Ljava/util/HashMap;)V

    .line 98
    .line 99
    .line 100
    new-instance v6, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 107
    .line 108
    .line 109
    :goto_2
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-eqz v8, :cond_7

    .line 114
    .line 115
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v10

    .line 119
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    invoke-static {v8}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    const/4 v8, 0x2

    .line 128
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    invoke-static {v8}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 133
    .line 134
    .line 135
    move-result-object v12

    .line 136
    const/4 v8, 0x3

    .line 137
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 138
    .line 139
    .line 140
    move-result v20

    .line 141
    const/4 v8, 0x4

    .line 142
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 143
    .line 144
    .line 145
    move-result v27

    .line 146
    const/16 v8, 0xe

    .line 147
    .line 148
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 149
    .line 150
    .line 151
    move-result-wide v13

    .line 152
    const/16 v8, 0xf

    .line 153
    .line 154
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 155
    .line 156
    .line 157
    move-result-wide v15

    .line 158
    const/16 v8, 0x10

    .line 159
    .line 160
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 161
    .line 162
    .line 163
    move-result-wide v17

    .line 164
    const/16 v8, 0x11

    .line 165
    .line 166
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    invoke-static {v8}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 171
    .line 172
    .line 173
    move-result-object v21

    .line 174
    const/16 v8, 0x12

    .line 175
    .line 176
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 177
    .line 178
    .line 179
    move-result-wide v22

    .line 180
    const/16 v8, 0x13

    .line 181
    .line 182
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 183
    .line 184
    .line 185
    move-result-wide v24

    .line 186
    const/16 v8, 0x14

    .line 187
    .line 188
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 189
    .line 190
    .line 191
    move-result v26

    .line 192
    const/16 v8, 0x15

    .line 193
    .line 194
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 195
    .line 196
    .line 197
    move-result-wide v28

    .line 198
    const/16 v8, 0x16

    .line 199
    .line 200
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 201
    .line 202
    .line 203
    move-result v30

    .line 204
    const/4 v8, 0x5

    .line 205
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 206
    .line 207
    .line 208
    move-result v8

    .line 209
    invoke-static {v8}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 210
    .line 211
    .line 212
    move-result-object v33

    .line 213
    const/4 v8, 0x6

    .line 214
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    invoke-static {v8}, Ll/yjq0;->l([B)Ll/al20;

    .line 219
    .line 220
    .line 221
    move-result-object v32

    .line 222
    const/4 v8, 0x7

    .line 223
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    if-eqz v8, :cond_3

    .line 228
    .line 229
    move/from16 v34, v2

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_3
    move/from16 v34, v7

    .line 233
    .line 234
    :goto_3
    const/16 v8, 0x8

    .line 235
    .line 236
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 237
    .line 238
    .line 239
    move-result v8

    .line 240
    if-eqz v8, :cond_4

    .line 241
    .line 242
    move/from16 v35, v2

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_4
    move/from16 v35, v7

    .line 246
    .line 247
    :goto_4
    const/16 v8, 0x9

    .line 248
    .line 249
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 250
    .line 251
    .line 252
    move-result v8

    .line 253
    if-eqz v8, :cond_5

    .line 254
    .line 255
    move/from16 v36, v2

    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_5
    move/from16 v36, v7

    .line 259
    .line 260
    :goto_5
    const/16 v8, 0xa

    .line 261
    .line 262
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 263
    .line 264
    .line 265
    move-result v8

    .line 266
    if-eqz v8, :cond_6

    .line 267
    .line 268
    move/from16 v37, v2

    .line 269
    .line 270
    goto :goto_6

    .line 271
    :cond_6
    move/from16 v37, v7

    .line 272
    .line 273
    :goto_6
    const/16 v8, 0xb

    .line 274
    .line 275
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 276
    .line 277
    .line 278
    move-result-wide v38

    .line 279
    const/16 v8, 0xc

    .line 280
    .line 281
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 282
    .line 283
    .line 284
    move-result-wide v40

    .line 285
    const/16 v8, 0xd

    .line 286
    .line 287
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 288
    .line 289
    .line 290
    move-result-object v8

    .line 291
    invoke-static {v8}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 292
    .line 293
    .line 294
    move-result-object v42

    .line 295
    new-instance v31, Ll/l06;

    .line 296
    .line 297
    invoke-direct/range {v31 .. v42}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 298
    .line 299
    .line 300
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v8

    .line 304
    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v8

    .line 308
    check-cast v8, Ljava/util/ArrayList;

    .line 309
    .line 310
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v9

    .line 314
    invoke-virtual {v5, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v9

    .line 318
    move-object/from16 v32, v9

    .line 319
    .line 320
    check-cast v32, Ljava/util/ArrayList;

    .line 321
    .line 322
    new-instance v9, Ll/mjq0$c;

    .line 323
    .line 324
    move-object/from16 v19, v31

    .line 325
    .line 326
    move-object/from16 v31, v8

    .line 327
    .line 328
    invoke-direct/range {v9 .. v32}, Ll/mjq0$c;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    .line 329
    .line 330
    .line 331
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    goto/16 :goto_2

    .line 335
    .line 336
    :cond_7
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 337
    .line 338
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 339
    .line 340
    .line 341
    :try_start_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v3}, Ll/zkd0;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 345
    .line 346
    .line 347
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 348
    .line 349
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 350
    .line 351
    .line 352
    return-object v6

    .line 353
    :catchall_1
    move-exception v0

    .line 354
    goto :goto_8

    .line 355
    :goto_7
    :try_start_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v3}, Ll/zkd0;->release()V

    .line 359
    .line 360
    .line 361
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 362
    :goto_8
    iget-object v1, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 363
    .line 364
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 365
    .line 366
    .line 367
    throw v0
.end method

.method public i(I)Ljava/util/List;
    .locals 81
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE state=0 ORDER BY last_enqueue_time LIMIT ?"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    move/from16 v3, p1

    .line 11
    .line 12
    int-to-long v3, v3

    .line 13
    invoke-virtual {v1, v2, v3, v4}, Ll/zkd0;->bindLong(IJ)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 19
    .line 20
    .line 21
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-static {v0, v1, v3, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    :try_start_0
    const-string v0, "id"

    .line 30
    .line 31
    invoke-static {v5, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v6, "state"

    .line 36
    .line 37
    invoke-static {v5, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    const-string v7, "worker_class_name"

    .line 42
    .line 43
    invoke-static {v5, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    const-string v8, "input_merger_class_name"

    .line 48
    .line 49
    invoke-static {v5, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    const-string v9, "input"

    .line 54
    .line 55
    invoke-static {v5, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v9

    .line 59
    const-string v10, "output"

    .line 60
    .line 61
    invoke-static {v5, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    const-string v11, "initial_delay"

    .line 66
    .line 67
    invoke-static {v5, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v11

    .line 71
    const-string v12, "interval_duration"

    .line 72
    .line 73
    invoke-static {v5, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v12

    .line 77
    const-string v13, "flex_duration"

    .line 78
    .line 79
    invoke-static {v5, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v13

    .line 83
    const-string v14, "run_attempt_count"

    .line 84
    .line 85
    invoke-static {v5, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v14

    .line 89
    const-string v15, "backoff_policy"

    .line 90
    .line 91
    invoke-static {v5, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v15

    .line 95
    const-string v2, "backoff_delay_duration"

    .line 96
    .line 97
    invoke-static {v5, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    const-string v3, "last_enqueue_time"

    .line 102
    .line 103
    invoke-static {v5, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    const-string v4, "minimum_retention_duration"

    .line 108
    .line 109
    invoke-static {v5, v4}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 113
    move-object/from16 v16, v1

    .line 114
    .line 115
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 116
    .line 117
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    move/from16 v17, v1

    .line 122
    .line 123
    const-string v1, "run_in_foreground"

    .line 124
    .line 125
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    move/from16 v18, v1

    .line 130
    .line 131
    const-string v1, "out_of_quota_policy"

    .line 132
    .line 133
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    move/from16 v19, v1

    .line 138
    .line 139
    const-string v1, "period_count"

    .line 140
    .line 141
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    move/from16 v20, v1

    .line 146
    .line 147
    const-string v1, "generation"

    .line 148
    .line 149
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    move/from16 v21, v1

    .line 154
    .line 155
    const-string v1, "next_schedule_time_override"

    .line 156
    .line 157
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    move/from16 v22, v1

    .line 162
    .line 163
    const-string v1, "next_schedule_time_override_generation"

    .line 164
    .line 165
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    move/from16 v23, v1

    .line 170
    .line 171
    const-string v1, "stop_reason"

    .line 172
    .line 173
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    move/from16 v24, v1

    .line 178
    .line 179
    const-string v1, "trace_tag"

    .line 180
    .line 181
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    move/from16 v25, v1

    .line 186
    .line 187
    const-string v1, "required_network_type"

    .line 188
    .line 189
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    move/from16 v26, v1

    .line 194
    .line 195
    const-string v1, "required_network_request"

    .line 196
    .line 197
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    move/from16 v27, v1

    .line 202
    .line 203
    const-string v1, "requires_charging"

    .line 204
    .line 205
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    move/from16 v28, v1

    .line 210
    .line 211
    const-string v1, "requires_device_idle"

    .line 212
    .line 213
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    move/from16 v29, v1

    .line 218
    .line 219
    const-string v1, "requires_battery_not_low"

    .line 220
    .line 221
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    move/from16 v30, v1

    .line 226
    .line 227
    const-string v1, "requires_storage_not_low"

    .line 228
    .line 229
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    move/from16 v31, v1

    .line 234
    .line 235
    const-string v1, "trigger_content_update_delay"

    .line 236
    .line 237
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    move/from16 v32, v1

    .line 242
    .line 243
    const-string v1, "trigger_max_content_delay"

    .line 244
    .line 245
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    move/from16 v33, v1

    .line 250
    .line 251
    const-string v1, "content_uri_triggers"

    .line 252
    .line 253
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    move/from16 v34, v1

    .line 258
    .line 259
    new-instance v1, Ljava/util/ArrayList;

    .line 260
    .line 261
    move/from16 v35, v4

    .line 262
    .line 263
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    .line 264
    .line 265
    .line 266
    move-result v4

    .line 267
    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 268
    .line 269
    .line 270
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    if-eqz v4, :cond_6

    .line 275
    .line 276
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v37

    .line 280
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    invoke-static {v4}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 285
    .line 286
    .line 287
    move-result-object v38

    .line 288
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v39

    .line 292
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v40

    .line 296
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 301
    .line 302
    .line 303
    move-result-object v41

    .line 304
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 309
    .line 310
    .line 311
    move-result-object v42

    .line 312
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 313
    .line 314
    .line 315
    move-result-wide v43

    .line 316
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 317
    .line 318
    .line 319
    move-result-wide v45

    .line 320
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 321
    .line 322
    .line 323
    move-result-wide v47

    .line 324
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 325
    .line 326
    .line 327
    move-result v50

    .line 328
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    .line 329
    .line 330
    .line 331
    move-result v4

    .line 332
    invoke-static {v4}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 333
    .line 334
    .line 335
    move-result-object v51

    .line 336
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 337
    .line 338
    .line 339
    move-result-wide v52

    .line 340
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 341
    .line 342
    .line 343
    move-result-wide v54

    .line 344
    move/from16 v4, v35

    .line 345
    .line 346
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 347
    .line 348
    .line 349
    move-result-wide v56

    .line 350
    move/from16 v35, v0

    .line 351
    .line 352
    move/from16 v0, v17

    .line 353
    .line 354
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 355
    .line 356
    .line 357
    move-result-wide v58

    .line 358
    move/from16 v17, v0

    .line 359
    .line 360
    move/from16 v0, v18

    .line 361
    .line 362
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 363
    .line 364
    .line 365
    move-result v18

    .line 366
    if-eqz v18, :cond_0

    .line 367
    .line 368
    const/16 v60, 0x1

    .line 369
    .line 370
    :goto_1
    move/from16 v18, v0

    .line 371
    .line 372
    move/from16 v0, v19

    .line 373
    .line 374
    goto :goto_2

    .line 375
    :cond_0
    const/16 v60, 0x0

    .line 376
    .line 377
    goto :goto_1

    .line 378
    :goto_2
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 379
    .line 380
    .line 381
    move-result v19

    .line 382
    invoke-static/range {v19 .. v19}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 383
    .line 384
    .line 385
    move-result-object v61

    .line 386
    move/from16 v19, v0

    .line 387
    .line 388
    move/from16 v0, v20

    .line 389
    .line 390
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 391
    .line 392
    .line 393
    move-result v62

    .line 394
    move/from16 v20, v0

    .line 395
    .line 396
    move/from16 v0, v21

    .line 397
    .line 398
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 399
    .line 400
    .line 401
    move-result v63

    .line 402
    move/from16 v21, v0

    .line 403
    .line 404
    move/from16 v0, v22

    .line 405
    .line 406
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 407
    .line 408
    .line 409
    move-result-wide v64

    .line 410
    move/from16 v22, v0

    .line 411
    .line 412
    move/from16 v0, v23

    .line 413
    .line 414
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 415
    .line 416
    .line 417
    move-result v66

    .line 418
    move/from16 v23, v0

    .line 419
    .line 420
    move/from16 v0, v24

    .line 421
    .line 422
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 423
    .line 424
    .line 425
    move-result v67

    .line 426
    move/from16 v24, v0

    .line 427
    .line 428
    move/from16 v0, v25

    .line 429
    .line 430
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 431
    .line 432
    .line 433
    move-result v25

    .line 434
    if-eqz v25, :cond_1

    .line 435
    .line 436
    const/16 v68, 0x0

    .line 437
    .line 438
    :goto_3
    move/from16 v25, v0

    .line 439
    .line 440
    move/from16 v0, v26

    .line 441
    .line 442
    goto :goto_4

    .line 443
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v25

    .line 447
    move-object/from16 v68, v25

    .line 448
    .line 449
    goto :goto_3

    .line 450
    :goto_4
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 451
    .line 452
    .line 453
    move-result v26

    .line 454
    invoke-static/range {v26 .. v26}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 455
    .line 456
    .line 457
    move-result-object v71

    .line 458
    move/from16 v26, v0

    .line 459
    .line 460
    move/from16 v0, v27

    .line 461
    .line 462
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 463
    .line 464
    .line 465
    move-result-object v27

    .line 466
    invoke-static/range {v27 .. v27}, Ll/yjq0;->l([B)Ll/al20;

    .line 467
    .line 468
    .line 469
    move-result-object v70

    .line 470
    move/from16 v27, v0

    .line 471
    .line 472
    move/from16 v0, v28

    .line 473
    .line 474
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 475
    .line 476
    .line 477
    move-result v28

    .line 478
    if-eqz v28, :cond_2

    .line 479
    .line 480
    const/16 v72, 0x1

    .line 481
    .line 482
    :goto_5
    move/from16 v28, v0

    .line 483
    .line 484
    move/from16 v0, v29

    .line 485
    .line 486
    goto :goto_6

    .line 487
    :cond_2
    const/16 v72, 0x0

    .line 488
    .line 489
    goto :goto_5

    .line 490
    :goto_6
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 491
    .line 492
    .line 493
    move-result v29

    .line 494
    if-eqz v29, :cond_3

    .line 495
    .line 496
    const/16 v73, 0x1

    .line 497
    .line 498
    :goto_7
    move/from16 v29, v0

    .line 499
    .line 500
    move/from16 v0, v30

    .line 501
    .line 502
    goto :goto_8

    .line 503
    :cond_3
    const/16 v73, 0x0

    .line 504
    .line 505
    goto :goto_7

    .line 506
    :goto_8
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 507
    .line 508
    .line 509
    move-result v30

    .line 510
    if-eqz v30, :cond_4

    .line 511
    .line 512
    const/16 v74, 0x1

    .line 513
    .line 514
    :goto_9
    move/from16 v30, v0

    .line 515
    .line 516
    move/from16 v0, v31

    .line 517
    .line 518
    goto :goto_a

    .line 519
    :cond_4
    const/16 v74, 0x0

    .line 520
    .line 521
    goto :goto_9

    .line 522
    :goto_a
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 523
    .line 524
    .line 525
    move-result v31

    .line 526
    if-eqz v31, :cond_5

    .line 527
    .line 528
    const/16 v75, 0x1

    .line 529
    .line 530
    :goto_b
    move/from16 v31, v0

    .line 531
    .line 532
    move/from16 v0, v32

    .line 533
    .line 534
    goto :goto_c

    .line 535
    :cond_5
    const/16 v75, 0x0

    .line 536
    .line 537
    goto :goto_b

    .line 538
    :goto_c
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 539
    .line 540
    .line 541
    move-result-wide v76

    .line 542
    move/from16 v32, v0

    .line 543
    .line 544
    move/from16 v0, v33

    .line 545
    .line 546
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 547
    .line 548
    .line 549
    move-result-wide v78

    .line 550
    move/from16 v33, v0

    .line 551
    .line 552
    move/from16 v0, v34

    .line 553
    .line 554
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 555
    .line 556
    .line 557
    move-result-object v34

    .line 558
    invoke-static/range {v34 .. v34}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 559
    .line 560
    .line 561
    move-result-object v80

    .line 562
    new-instance v49, Ll/l06;

    .line 563
    .line 564
    move-object/from16 v69, v49

    .line 565
    .line 566
    invoke-direct/range {v69 .. v80}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 567
    .line 568
    .line 569
    move-object/from16 v49, v69

    .line 570
    .line 571
    new-instance v36, Ll/mjq0;

    .line 572
    .line 573
    invoke-direct/range {v36 .. v68}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    .line 574
    .line 575
    .line 576
    move/from16 v34, v0

    .line 577
    .line 578
    move-object/from16 v0, v36

    .line 579
    .line 580
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 581
    .line 582
    .line 583
    move/from16 v0, v35

    .line 584
    .line 585
    move/from16 v35, v4

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :catchall_0
    move-exception v0

    .line 590
    goto :goto_d

    .line 591
    :cond_6
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 592
    .line 593
    .line 594
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 595
    .line 596
    .line 597
    return-object v1

    .line 598
    :catchall_1
    move-exception v0

    .line 599
    move-object/from16 v16, v1

    .line 600
    .line 601
    :goto_d
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 602
    .line 603
    .line 604
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 605
    .line 606
    .line 607
    throw v0
.end method

.method public j(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->e:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1}, Ll/yjq0;->k(Landroidx/work/WorkInfo$State;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    int-to-long v1, p1

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-interface {v0, p1, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x2

    .line 22
    invoke-interface {v0, p1, p2}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 35
    .line 36
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    .line 38
    .line 39
    :try_start_2
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 40
    .line 41
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/sjq0;->e:Landroidx/room/SharedSQLiteStatement;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 47
    .line 48
    .line 49
    return p1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_0

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    :try_start_3
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 56
    .line 57
    .line 58
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    :goto_0
    iget-object p0, p0, Ll/sjq0;->e:Landroidx/room/SharedSQLiteStatement;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 62
    .line 63
    .line 64
    throw p1
.end method

.method public k(Ljava/lang/String;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->i:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p2, p3}, Ll/p7h0;->bindLong(IJ)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x2

    .line 17
    invoke-interface {v0, p2, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 31
    .line 32
    .line 33
    :try_start_2
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/sjq0;->i:Landroidx/room/SharedSQLiteStatement;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    goto :goto_0

    .line 46
    :catchall_1
    move-exception p1

    .line 47
    :try_start_3
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 48
    .line 49
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 50
    .line 51
    .line 52
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 53
    :goto_0
    iget-object p0, p0, Ll/sjq0;->i:Landroidx/room/SharedSQLiteStatement;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 56
    .line 57
    .line 58
    throw p1
.end method

.method public l()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5)"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {p0, v0, v1, v2}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception v1

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 49
    .line 50
    .line 51
    return-object v2

    .line 52
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 56
    .line 57
    .line 58
    throw v1
.end method

.method public m()Ljava/util/List;
    .locals 81
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 AND LENGTH(content_uri_triggers)<>0 ORDER BY last_enqueue_time"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 11
    .line 12
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 13
    .line 14
    .line 15
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {v0, v1, v2, v3}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    :try_start_0
    const-string v0, "id"

    .line 23
    .line 24
    invoke-static {v4, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v5, "state"

    .line 29
    .line 30
    invoke-static {v4, v5}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const-string v6, "worker_class_name"

    .line 35
    .line 36
    invoke-static {v4, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const-string v7, "input_merger_class_name"

    .line 41
    .line 42
    invoke-static {v4, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const-string v8, "input"

    .line 47
    .line 48
    invoke-static {v4, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const-string v9, "output"

    .line 53
    .line 54
    invoke-static {v4, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const-string v10, "initial_delay"

    .line 59
    .line 60
    invoke-static {v4, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    const-string v11, "interval_duration"

    .line 65
    .line 66
    invoke-static {v4, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    const-string v12, "flex_duration"

    .line 71
    .line 72
    invoke-static {v4, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v12

    .line 76
    const-string v13, "run_attempt_count"

    .line 77
    .line 78
    invoke-static {v4, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v13

    .line 82
    const-string v14, "backoff_policy"

    .line 83
    .line 84
    invoke-static {v4, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v14

    .line 88
    const-string v15, "backoff_delay_duration"

    .line 89
    .line 90
    invoke-static {v4, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v15

    .line 94
    const-string v2, "last_enqueue_time"

    .line 95
    .line 96
    invoke-static {v4, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const-string v3, "minimum_retention_duration"

    .line 101
    .line 102
    invoke-static {v4, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 106
    move-object/from16 v16, v1

    .line 107
    .line 108
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 109
    .line 110
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    move/from16 v17, v1

    .line 115
    .line 116
    const-string v1, "run_in_foreground"

    .line 117
    .line 118
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    move/from16 v18, v1

    .line 123
    .line 124
    const-string v1, "out_of_quota_policy"

    .line 125
    .line 126
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    move/from16 v19, v1

    .line 131
    .line 132
    const-string v1, "period_count"

    .line 133
    .line 134
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    move/from16 v20, v1

    .line 139
    .line 140
    const-string v1, "generation"

    .line 141
    .line 142
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    move/from16 v21, v1

    .line 147
    .line 148
    const-string v1, "next_schedule_time_override"

    .line 149
    .line 150
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    move/from16 v22, v1

    .line 155
    .line 156
    const-string v1, "next_schedule_time_override_generation"

    .line 157
    .line 158
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    move/from16 v23, v1

    .line 163
    .line 164
    const-string v1, "stop_reason"

    .line 165
    .line 166
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    move/from16 v24, v1

    .line 171
    .line 172
    const-string v1, "trace_tag"

    .line 173
    .line 174
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    move/from16 v25, v1

    .line 179
    .line 180
    const-string v1, "required_network_type"

    .line 181
    .line 182
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    move/from16 v26, v1

    .line 187
    .line 188
    const-string v1, "required_network_request"

    .line 189
    .line 190
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    move/from16 v27, v1

    .line 195
    .line 196
    const-string v1, "requires_charging"

    .line 197
    .line 198
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    move/from16 v28, v1

    .line 203
    .line 204
    const-string v1, "requires_device_idle"

    .line 205
    .line 206
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    move/from16 v29, v1

    .line 211
    .line 212
    const-string v1, "requires_battery_not_low"

    .line 213
    .line 214
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    move/from16 v30, v1

    .line 219
    .line 220
    const-string v1, "requires_storage_not_low"

    .line 221
    .line 222
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    move/from16 v31, v1

    .line 227
    .line 228
    const-string v1, "trigger_content_update_delay"

    .line 229
    .line 230
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    move/from16 v32, v1

    .line 235
    .line 236
    const-string v1, "trigger_max_content_delay"

    .line 237
    .line 238
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    move/from16 v33, v1

    .line 243
    .line 244
    const-string v1, "content_uri_triggers"

    .line 245
    .line 246
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    move/from16 v34, v1

    .line 251
    .line 252
    new-instance v1, Ljava/util/ArrayList;

    .line 253
    .line 254
    move/from16 v35, v3

    .line 255
    .line 256
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 261
    .line 262
    .line 263
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 264
    .line 265
    .line 266
    move-result v3

    .line 267
    if-eqz v3, :cond_6

    .line 268
    .line 269
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v37

    .line 273
    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    invoke-static {v3}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 278
    .line 279
    .line 280
    move-result-object v38

    .line 281
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v39

    .line 285
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v40

    .line 289
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 294
    .line 295
    .line 296
    move-result-object v41

    .line 297
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 302
    .line 303
    .line 304
    move-result-object v42

    .line 305
    invoke-interface {v4, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 306
    .line 307
    .line 308
    move-result-wide v43

    .line 309
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 310
    .line 311
    .line 312
    move-result-wide v45

    .line 313
    invoke-interface {v4, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 314
    .line 315
    .line 316
    move-result-wide v47

    .line 317
    invoke-interface {v4, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 318
    .line 319
    .line 320
    move-result v50

    .line 321
    invoke-interface {v4, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 322
    .line 323
    .line 324
    move-result v3

    .line 325
    invoke-static {v3}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 326
    .line 327
    .line 328
    move-result-object v51

    .line 329
    invoke-interface {v4, v15}, Landroid/database/Cursor;->getLong(I)J

    .line 330
    .line 331
    .line 332
    move-result-wide v52

    .line 333
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 334
    .line 335
    .line 336
    move-result-wide v54

    .line 337
    move/from16 v3, v35

    .line 338
    .line 339
    invoke-interface {v4, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 340
    .line 341
    .line 342
    move-result-wide v56

    .line 343
    move/from16 v35, v0

    .line 344
    .line 345
    move/from16 v0, v17

    .line 346
    .line 347
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 348
    .line 349
    .line 350
    move-result-wide v58

    .line 351
    move/from16 v17, v0

    .line 352
    .line 353
    move/from16 v0, v18

    .line 354
    .line 355
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 356
    .line 357
    .line 358
    move-result v18

    .line 359
    const/16 v36, 0x1

    .line 360
    .line 361
    if-eqz v18, :cond_0

    .line 362
    .line 363
    move/from16 v60, v36

    .line 364
    .line 365
    :goto_1
    move/from16 v18, v0

    .line 366
    .line 367
    move/from16 v0, v19

    .line 368
    .line 369
    goto :goto_2

    .line 370
    :cond_0
    const/16 v60, 0x0

    .line 371
    .line 372
    goto :goto_1

    .line 373
    :goto_2
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 374
    .line 375
    .line 376
    move-result v19

    .line 377
    invoke-static/range {v19 .. v19}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 378
    .line 379
    .line 380
    move-result-object v61

    .line 381
    move/from16 v19, v0

    .line 382
    .line 383
    move/from16 v0, v20

    .line 384
    .line 385
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 386
    .line 387
    .line 388
    move-result v62

    .line 389
    move/from16 v20, v0

    .line 390
    .line 391
    move/from16 v0, v21

    .line 392
    .line 393
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 394
    .line 395
    .line 396
    move-result v63

    .line 397
    move/from16 v21, v0

    .line 398
    .line 399
    move/from16 v0, v22

    .line 400
    .line 401
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 402
    .line 403
    .line 404
    move-result-wide v64

    .line 405
    move/from16 v22, v0

    .line 406
    .line 407
    move/from16 v0, v23

    .line 408
    .line 409
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 410
    .line 411
    .line 412
    move-result v66

    .line 413
    move/from16 v23, v0

    .line 414
    .line 415
    move/from16 v0, v24

    .line 416
    .line 417
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 418
    .line 419
    .line 420
    move-result v67

    .line 421
    move/from16 v24, v0

    .line 422
    .line 423
    move/from16 v0, v25

    .line 424
    .line 425
    invoke-interface {v4, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 426
    .line 427
    .line 428
    move-result v25

    .line 429
    if-eqz v25, :cond_1

    .line 430
    .line 431
    const/16 v68, 0x0

    .line 432
    .line 433
    :goto_3
    move/from16 v25, v0

    .line 434
    .line 435
    move/from16 v0, v26

    .line 436
    .line 437
    goto :goto_4

    .line 438
    :cond_1
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v25

    .line 442
    move-object/from16 v68, v25

    .line 443
    .line 444
    goto :goto_3

    .line 445
    :goto_4
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 446
    .line 447
    .line 448
    move-result v26

    .line 449
    invoke-static/range {v26 .. v26}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 450
    .line 451
    .line 452
    move-result-object v71

    .line 453
    move/from16 v26, v0

    .line 454
    .line 455
    move/from16 v0, v27

    .line 456
    .line 457
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 458
    .line 459
    .line 460
    move-result-object v27

    .line 461
    invoke-static/range {v27 .. v27}, Ll/yjq0;->l([B)Ll/al20;

    .line 462
    .line 463
    .line 464
    move-result-object v70

    .line 465
    move/from16 v27, v0

    .line 466
    .line 467
    move/from16 v0, v28

    .line 468
    .line 469
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 470
    .line 471
    .line 472
    move-result v28

    .line 473
    if-eqz v28, :cond_2

    .line 474
    .line 475
    move/from16 v72, v36

    .line 476
    .line 477
    :goto_5
    move/from16 v28, v0

    .line 478
    .line 479
    move/from16 v0, v29

    .line 480
    .line 481
    goto :goto_6

    .line 482
    :cond_2
    const/16 v72, 0x0

    .line 483
    .line 484
    goto :goto_5

    .line 485
    :goto_6
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 486
    .line 487
    .line 488
    move-result v29

    .line 489
    if-eqz v29, :cond_3

    .line 490
    .line 491
    move/from16 v73, v36

    .line 492
    .line 493
    :goto_7
    move/from16 v29, v0

    .line 494
    .line 495
    move/from16 v0, v30

    .line 496
    .line 497
    goto :goto_8

    .line 498
    :cond_3
    const/16 v73, 0x0

    .line 499
    .line 500
    goto :goto_7

    .line 501
    :goto_8
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 502
    .line 503
    .line 504
    move-result v30

    .line 505
    if-eqz v30, :cond_4

    .line 506
    .line 507
    move/from16 v74, v36

    .line 508
    .line 509
    :goto_9
    move/from16 v30, v0

    .line 510
    .line 511
    move/from16 v0, v31

    .line 512
    .line 513
    goto :goto_a

    .line 514
    :cond_4
    const/16 v74, 0x0

    .line 515
    .line 516
    goto :goto_9

    .line 517
    :goto_a
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 518
    .line 519
    .line 520
    move-result v31

    .line 521
    if-eqz v31, :cond_5

    .line 522
    .line 523
    move/from16 v75, v36

    .line 524
    .line 525
    :goto_b
    move/from16 v31, v0

    .line 526
    .line 527
    move/from16 v0, v32

    .line 528
    .line 529
    goto :goto_c

    .line 530
    :cond_5
    const/16 v75, 0x0

    .line 531
    .line 532
    goto :goto_b

    .line 533
    :goto_c
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 534
    .line 535
    .line 536
    move-result-wide v76

    .line 537
    move/from16 v32, v0

    .line 538
    .line 539
    move/from16 v0, v33

    .line 540
    .line 541
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 542
    .line 543
    .line 544
    move-result-wide v78

    .line 545
    move/from16 v33, v0

    .line 546
    .line 547
    move/from16 v0, v34

    .line 548
    .line 549
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 550
    .line 551
    .line 552
    move-result-object v34

    .line 553
    invoke-static/range {v34 .. v34}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 554
    .line 555
    .line 556
    move-result-object v80

    .line 557
    new-instance v49, Ll/l06;

    .line 558
    .line 559
    move-object/from16 v69, v49

    .line 560
    .line 561
    invoke-direct/range {v69 .. v80}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 562
    .line 563
    .line 564
    move-object/from16 v49, v69

    .line 565
    .line 566
    new-instance v36, Ll/mjq0;

    .line 567
    .line 568
    invoke-direct/range {v36 .. v68}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    .line 569
    .line 570
    .line 571
    move/from16 v34, v0

    .line 572
    .line 573
    move-object/from16 v0, v36

    .line 574
    .line 575
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 576
    .line 577
    .line 578
    move/from16 v0, v35

    .line 579
    .line 580
    move/from16 v35, v3

    .line 581
    .line 582
    goto/16 :goto_0

    .line 583
    .line 584
    :catchall_0
    move-exception v0

    .line 585
    goto :goto_d

    .line 586
    :cond_6
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 587
    .line 588
    .line 589
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 590
    .line 591
    .line 592
    return-object v1

    .line 593
    :catchall_1
    move-exception v0

    .line 594
    move-object/from16 v16, v1

    .line 595
    .line 596
    :goto_d
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 597
    .line 598
    .line 599
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 600
    .line 601
    .line 602
    throw v0
.end method

.method public n(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->k:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 28
    .line 29
    .line 30
    :try_start_2
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/sjq0;->k:Landroidx/room/SharedSQLiteStatement;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    goto :goto_0

    .line 43
    :catchall_1
    move-exception p1

    .line 44
    :try_start_3
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 47
    .line 48
    .line 49
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    :goto_0
    iget-object p0, p0, Ll/sjq0;->k:Landroidx/room/SharedSQLiteStatement;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public o(Ll/mjq0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Ll/sjq0;->b:Ll/u2f;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/u2f;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 31
    .line 32
    .line 33
    throw p1
.end method

.method public p()I
    .locals 3

    .line 1
    const-string v0, "Select COUNT(*) FROM workspec WHERE LENGTH(content_uri_triggers)<>0 AND state NOT IN (2, 3, 5)"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {p0, v0, v1, v2}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 27
    .line 28
    .line 29
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 37
    .line 38
    .line 39
    return v1

    .line 40
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 44
    .line 45
    .line 46
    throw v1
.end method

.method public q(Ljava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->m:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x2

    .line 17
    int-to-long v1, p2

    .line 18
    invoke-interface {v0, p1, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 19
    .line 20
    .line 21
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    .line 33
    .line 34
    :try_start_2
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/sjq0;->m:Landroidx/room/SharedSQLiteStatement;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_0

    .line 47
    :catchall_1
    move-exception p1

    .line 48
    :try_start_3
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 49
    .line 50
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 51
    .line 52
    .line 53
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 54
    :goto_0
    iget-object p0, p0, Ll/sjq0;->m:Landroidx/room/SharedSQLiteStatement;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 57
    .line 58
    .line 59
    throw p1
.end method

.method public r(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->g:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 27
    .line 28
    .line 29
    :try_start_2
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/sjq0;->g:Landroidx/room/SharedSQLiteStatement;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_0

    .line 42
    :catchall_1
    move-exception p1

    .line 43
    :try_start_3
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 46
    .line 47
    .line 48
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    :goto_0
    iget-object p0, p0, Ll/sjq0;->g:Landroidx/room/SharedSQLiteStatement;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 52
    .line 53
    .line 54
    throw p1
.end method

.method public s(J)Ljava/util/List;
    .locals 80
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE last_enqueue_time >= ? AND state IN (2, 3, 5) ORDER BY last_enqueue_time DESC"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    move-wide/from16 v3, p1

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3, v4}, Ll/zkd0;->bindLong(IJ)V

    .line 13
    .line 14
    .line 15
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 18
    .line 19
    .line 20
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-static {v0, v1, v3, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    :try_start_0
    const-string v0, "id"

    .line 29
    .line 30
    invoke-static {v5, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const-string v6, "state"

    .line 35
    .line 36
    invoke-static {v5, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const-string v7, "worker_class_name"

    .line 41
    .line 42
    invoke-static {v5, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const-string v8, "input_merger_class_name"

    .line 47
    .line 48
    invoke-static {v5, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const-string v9, "input"

    .line 53
    .line 54
    invoke-static {v5, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const-string v10, "output"

    .line 59
    .line 60
    invoke-static {v5, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    const-string v11, "initial_delay"

    .line 65
    .line 66
    invoke-static {v5, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    const-string v12, "interval_duration"

    .line 71
    .line 72
    invoke-static {v5, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v12

    .line 76
    const-string v13, "flex_duration"

    .line 77
    .line 78
    invoke-static {v5, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v13

    .line 82
    const-string v14, "run_attempt_count"

    .line 83
    .line 84
    invoke-static {v5, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v14

    .line 88
    const-string v15, "backoff_policy"

    .line 89
    .line 90
    invoke-static {v5, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v15

    .line 94
    const-string v2, "backoff_delay_duration"

    .line 95
    .line 96
    invoke-static {v5, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const-string v3, "last_enqueue_time"

    .line 101
    .line 102
    invoke-static {v5, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    const-string v4, "minimum_retention_duration"

    .line 107
    .line 108
    invoke-static {v5, v4}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 112
    move-object/from16 v16, v1

    .line 113
    .line 114
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 115
    .line 116
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    move/from16 p2, v1

    .line 121
    .line 122
    const-string v1, "run_in_foreground"

    .line 123
    .line 124
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    move/from16 v17, v1

    .line 129
    .line 130
    const-string v1, "out_of_quota_policy"

    .line 131
    .line 132
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    move/from16 v18, v1

    .line 137
    .line 138
    const-string v1, "period_count"

    .line 139
    .line 140
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    move/from16 v19, v1

    .line 145
    .line 146
    const-string v1, "generation"

    .line 147
    .line 148
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    move/from16 v20, v1

    .line 153
    .line 154
    const-string v1, "next_schedule_time_override"

    .line 155
    .line 156
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    move/from16 v21, v1

    .line 161
    .line 162
    const-string v1, "next_schedule_time_override_generation"

    .line 163
    .line 164
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    move/from16 v22, v1

    .line 169
    .line 170
    const-string v1, "stop_reason"

    .line 171
    .line 172
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    move/from16 v23, v1

    .line 177
    .line 178
    const-string v1, "trace_tag"

    .line 179
    .line 180
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    move/from16 v24, v1

    .line 185
    .line 186
    const-string v1, "required_network_type"

    .line 187
    .line 188
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    move/from16 v25, v1

    .line 193
    .line 194
    const-string v1, "required_network_request"

    .line 195
    .line 196
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    move/from16 v26, v1

    .line 201
    .line 202
    const-string v1, "requires_charging"

    .line 203
    .line 204
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    move/from16 v27, v1

    .line 209
    .line 210
    const-string v1, "requires_device_idle"

    .line 211
    .line 212
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    move/from16 v28, v1

    .line 217
    .line 218
    const-string v1, "requires_battery_not_low"

    .line 219
    .line 220
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    move/from16 v29, v1

    .line 225
    .line 226
    const-string v1, "requires_storage_not_low"

    .line 227
    .line 228
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    move/from16 v30, v1

    .line 233
    .line 234
    const-string v1, "trigger_content_update_delay"

    .line 235
    .line 236
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    move/from16 v31, v1

    .line 241
    .line 242
    const-string v1, "trigger_max_content_delay"

    .line 243
    .line 244
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    move/from16 v32, v1

    .line 249
    .line 250
    const-string v1, "content_uri_triggers"

    .line 251
    .line 252
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    move/from16 v33, v1

    .line 257
    .line 258
    new-instance v1, Ljava/util/ArrayList;

    .line 259
    .line 260
    move/from16 v34, v4

    .line 261
    .line 262
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    .line 263
    .line 264
    .line 265
    move-result v4

    .line 266
    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 267
    .line 268
    .line 269
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    if-eqz v4, :cond_6

    .line 274
    .line 275
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v36

    .line 279
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 280
    .line 281
    .line 282
    move-result v4

    .line 283
    invoke-static {v4}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 284
    .line 285
    .line 286
    move-result-object v37

    .line 287
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v38

    .line 291
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v39

    .line 295
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 300
    .line 301
    .line 302
    move-result-object v40

    .line 303
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 304
    .line 305
    .line 306
    move-result-object v4

    .line 307
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 308
    .line 309
    .line 310
    move-result-object v41

    .line 311
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 312
    .line 313
    .line 314
    move-result-wide v42

    .line 315
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 316
    .line 317
    .line 318
    move-result-wide v44

    .line 319
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 320
    .line 321
    .line 322
    move-result-wide v46

    .line 323
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 324
    .line 325
    .line 326
    move-result v49

    .line 327
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    .line 328
    .line 329
    .line 330
    move-result v4

    .line 331
    invoke-static {v4}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 332
    .line 333
    .line 334
    move-result-object v50

    .line 335
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 336
    .line 337
    .line 338
    move-result-wide v51

    .line 339
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 340
    .line 341
    .line 342
    move-result-wide v53

    .line 343
    move/from16 v4, v34

    .line 344
    .line 345
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 346
    .line 347
    .line 348
    move-result-wide v55

    .line 349
    move/from16 v34, v0

    .line 350
    .line 351
    move/from16 v0, p2

    .line 352
    .line 353
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 354
    .line 355
    .line 356
    move-result-wide v57

    .line 357
    move/from16 p2, v0

    .line 358
    .line 359
    move/from16 v0, v17

    .line 360
    .line 361
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 362
    .line 363
    .line 364
    move-result v17

    .line 365
    if-eqz v17, :cond_0

    .line 366
    .line 367
    const/16 v59, 0x1

    .line 368
    .line 369
    :goto_1
    move/from16 v17, v0

    .line 370
    .line 371
    move/from16 v0, v18

    .line 372
    .line 373
    goto :goto_2

    .line 374
    :cond_0
    const/16 v59, 0x0

    .line 375
    .line 376
    goto :goto_1

    .line 377
    :goto_2
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 378
    .line 379
    .line 380
    move-result v18

    .line 381
    invoke-static/range {v18 .. v18}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 382
    .line 383
    .line 384
    move-result-object v60

    .line 385
    move/from16 v18, v0

    .line 386
    .line 387
    move/from16 v0, v19

    .line 388
    .line 389
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 390
    .line 391
    .line 392
    move-result v61

    .line 393
    move/from16 v19, v0

    .line 394
    .line 395
    move/from16 v0, v20

    .line 396
    .line 397
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 398
    .line 399
    .line 400
    move-result v62

    .line 401
    move/from16 v20, v0

    .line 402
    .line 403
    move/from16 v0, v21

    .line 404
    .line 405
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 406
    .line 407
    .line 408
    move-result-wide v63

    .line 409
    move/from16 v21, v0

    .line 410
    .line 411
    move/from16 v0, v22

    .line 412
    .line 413
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 414
    .line 415
    .line 416
    move-result v65

    .line 417
    move/from16 v22, v0

    .line 418
    .line 419
    move/from16 v0, v23

    .line 420
    .line 421
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 422
    .line 423
    .line 424
    move-result v66

    .line 425
    move/from16 v23, v0

    .line 426
    .line 427
    move/from16 v0, v24

    .line 428
    .line 429
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 430
    .line 431
    .line 432
    move-result v24

    .line 433
    if-eqz v24, :cond_1

    .line 434
    .line 435
    const/16 v67, 0x0

    .line 436
    .line 437
    :goto_3
    move/from16 v24, v0

    .line 438
    .line 439
    move/from16 v0, v25

    .line 440
    .line 441
    goto :goto_4

    .line 442
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v24

    .line 446
    move-object/from16 v67, v24

    .line 447
    .line 448
    goto :goto_3

    .line 449
    :goto_4
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 450
    .line 451
    .line 452
    move-result v25

    .line 453
    invoke-static/range {v25 .. v25}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 454
    .line 455
    .line 456
    move-result-object v70

    .line 457
    move/from16 v25, v0

    .line 458
    .line 459
    move/from16 v0, v26

    .line 460
    .line 461
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 462
    .line 463
    .line 464
    move-result-object v26

    .line 465
    invoke-static/range {v26 .. v26}, Ll/yjq0;->l([B)Ll/al20;

    .line 466
    .line 467
    .line 468
    move-result-object v69

    .line 469
    move/from16 v26, v0

    .line 470
    .line 471
    move/from16 v0, v27

    .line 472
    .line 473
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 474
    .line 475
    .line 476
    move-result v27

    .line 477
    if-eqz v27, :cond_2

    .line 478
    .line 479
    const/16 v71, 0x1

    .line 480
    .line 481
    :goto_5
    move/from16 v27, v0

    .line 482
    .line 483
    move/from16 v0, v28

    .line 484
    .line 485
    goto :goto_6

    .line 486
    :cond_2
    const/16 v71, 0x0

    .line 487
    .line 488
    goto :goto_5

    .line 489
    :goto_6
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 490
    .line 491
    .line 492
    move-result v28

    .line 493
    if-eqz v28, :cond_3

    .line 494
    .line 495
    const/16 v72, 0x1

    .line 496
    .line 497
    :goto_7
    move/from16 v28, v0

    .line 498
    .line 499
    move/from16 v0, v29

    .line 500
    .line 501
    goto :goto_8

    .line 502
    :cond_3
    const/16 v72, 0x0

    .line 503
    .line 504
    goto :goto_7

    .line 505
    :goto_8
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 506
    .line 507
    .line 508
    move-result v29

    .line 509
    if-eqz v29, :cond_4

    .line 510
    .line 511
    const/16 v73, 0x1

    .line 512
    .line 513
    :goto_9
    move/from16 v29, v0

    .line 514
    .line 515
    move/from16 v0, v30

    .line 516
    .line 517
    goto :goto_a

    .line 518
    :cond_4
    const/16 v73, 0x0

    .line 519
    .line 520
    goto :goto_9

    .line 521
    :goto_a
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 522
    .line 523
    .line 524
    move-result v30

    .line 525
    if-eqz v30, :cond_5

    .line 526
    .line 527
    const/16 v74, 0x1

    .line 528
    .line 529
    :goto_b
    move/from16 v30, v0

    .line 530
    .line 531
    move/from16 v0, v31

    .line 532
    .line 533
    goto :goto_c

    .line 534
    :cond_5
    const/16 v74, 0x0

    .line 535
    .line 536
    goto :goto_b

    .line 537
    :goto_c
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 538
    .line 539
    .line 540
    move-result-wide v75

    .line 541
    move/from16 v31, v0

    .line 542
    .line 543
    move/from16 v0, v32

    .line 544
    .line 545
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 546
    .line 547
    .line 548
    move-result-wide v77

    .line 549
    move/from16 v32, v0

    .line 550
    .line 551
    move/from16 v0, v33

    .line 552
    .line 553
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 554
    .line 555
    .line 556
    move-result-object v33

    .line 557
    invoke-static/range {v33 .. v33}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 558
    .line 559
    .line 560
    move-result-object v79

    .line 561
    new-instance v48, Ll/l06;

    .line 562
    .line 563
    move-object/from16 v68, v48

    .line 564
    .line 565
    invoke-direct/range {v68 .. v79}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 566
    .line 567
    .line 568
    move-object/from16 v48, v68

    .line 569
    .line 570
    new-instance v35, Ll/mjq0;

    .line 571
    .line 572
    invoke-direct/range {v35 .. v67}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    .line 573
    .line 574
    .line 575
    move/from16 v33, v0

    .line 576
    .line 577
    move-object/from16 v0, v35

    .line 578
    .line 579
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 580
    .line 581
    .line 582
    move/from16 v0, v34

    .line 583
    .line 584
    move/from16 v34, v4

    .line 585
    .line 586
    goto/16 :goto_0

    .line 587
    .line 588
    :catchall_0
    move-exception v0

    .line 589
    goto :goto_d

    .line 590
    :cond_6
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 591
    .line 592
    .line 593
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 594
    .line 595
    .line 596
    return-object v1

    .line 597
    :catchall_1
    move-exception v0

    .line 598
    move-object/from16 v16, v1

    .line 599
    .line 600
    :goto_d
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 601
    .line 602
    .line 603
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 604
    .line 605
    .line 606
    throw v0
.end method

.method public t()Ljava/util/List;
    .locals 81
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/mjq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at<>-1"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 11
    .line 12
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 13
    .line 14
    .line 15
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {v0, v1, v2, v3}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    :try_start_0
    const-string v0, "id"

    .line 23
    .line 24
    invoke-static {v4, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v5, "state"

    .line 29
    .line 30
    invoke-static {v4, v5}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const-string v6, "worker_class_name"

    .line 35
    .line 36
    invoke-static {v4, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const-string v7, "input_merger_class_name"

    .line 41
    .line 42
    invoke-static {v4, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const-string v8, "input"

    .line 47
    .line 48
    invoke-static {v4, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const-string v9, "output"

    .line 53
    .line 54
    invoke-static {v4, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const-string v10, "initial_delay"

    .line 59
    .line 60
    invoke-static {v4, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    const-string v11, "interval_duration"

    .line 65
    .line 66
    invoke-static {v4, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    const-string v12, "flex_duration"

    .line 71
    .line 72
    invoke-static {v4, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v12

    .line 76
    const-string v13, "run_attempt_count"

    .line 77
    .line 78
    invoke-static {v4, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v13

    .line 82
    const-string v14, "backoff_policy"

    .line 83
    .line 84
    invoke-static {v4, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v14

    .line 88
    const-string v15, "backoff_delay_duration"

    .line 89
    .line 90
    invoke-static {v4, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v15

    .line 94
    const-string v2, "last_enqueue_time"

    .line 95
    .line 96
    invoke-static {v4, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const-string v3, "minimum_retention_duration"

    .line 101
    .line 102
    invoke-static {v4, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 106
    move-object/from16 v16, v1

    .line 107
    .line 108
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 109
    .line 110
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    move/from16 v17, v1

    .line 115
    .line 116
    const-string v1, "run_in_foreground"

    .line 117
    .line 118
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    move/from16 v18, v1

    .line 123
    .line 124
    const-string v1, "out_of_quota_policy"

    .line 125
    .line 126
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    move/from16 v19, v1

    .line 131
    .line 132
    const-string v1, "period_count"

    .line 133
    .line 134
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    move/from16 v20, v1

    .line 139
    .line 140
    const-string v1, "generation"

    .line 141
    .line 142
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    move/from16 v21, v1

    .line 147
    .line 148
    const-string v1, "next_schedule_time_override"

    .line 149
    .line 150
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    move/from16 v22, v1

    .line 155
    .line 156
    const-string v1, "next_schedule_time_override_generation"

    .line 157
    .line 158
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    move/from16 v23, v1

    .line 163
    .line 164
    const-string v1, "stop_reason"

    .line 165
    .line 166
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    move/from16 v24, v1

    .line 171
    .line 172
    const-string v1, "trace_tag"

    .line 173
    .line 174
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    move/from16 v25, v1

    .line 179
    .line 180
    const-string v1, "required_network_type"

    .line 181
    .line 182
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    move/from16 v26, v1

    .line 187
    .line 188
    const-string v1, "required_network_request"

    .line 189
    .line 190
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    move/from16 v27, v1

    .line 195
    .line 196
    const-string v1, "requires_charging"

    .line 197
    .line 198
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    move/from16 v28, v1

    .line 203
    .line 204
    const-string v1, "requires_device_idle"

    .line 205
    .line 206
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    move/from16 v29, v1

    .line 211
    .line 212
    const-string v1, "requires_battery_not_low"

    .line 213
    .line 214
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    move/from16 v30, v1

    .line 219
    .line 220
    const-string v1, "requires_storage_not_low"

    .line 221
    .line 222
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    move/from16 v31, v1

    .line 227
    .line 228
    const-string v1, "trigger_content_update_delay"

    .line 229
    .line 230
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    move/from16 v32, v1

    .line 235
    .line 236
    const-string v1, "trigger_max_content_delay"

    .line 237
    .line 238
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    move/from16 v33, v1

    .line 243
    .line 244
    const-string v1, "content_uri_triggers"

    .line 245
    .line 246
    invoke-static {v4, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    move/from16 v34, v1

    .line 251
    .line 252
    new-instance v1, Ljava/util/ArrayList;

    .line 253
    .line 254
    move/from16 v35, v3

    .line 255
    .line 256
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 261
    .line 262
    .line 263
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 264
    .line 265
    .line 266
    move-result v3

    .line 267
    if-eqz v3, :cond_6

    .line 268
    .line 269
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v37

    .line 273
    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    invoke-static {v3}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 278
    .line 279
    .line 280
    move-result-object v38

    .line 281
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v39

    .line 285
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v40

    .line 289
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 294
    .line 295
    .line 296
    move-result-object v41

    .line 297
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 302
    .line 303
    .line 304
    move-result-object v42

    .line 305
    invoke-interface {v4, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 306
    .line 307
    .line 308
    move-result-wide v43

    .line 309
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 310
    .line 311
    .line 312
    move-result-wide v45

    .line 313
    invoke-interface {v4, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 314
    .line 315
    .line 316
    move-result-wide v47

    .line 317
    invoke-interface {v4, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 318
    .line 319
    .line 320
    move-result v50

    .line 321
    invoke-interface {v4, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 322
    .line 323
    .line 324
    move-result v3

    .line 325
    invoke-static {v3}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 326
    .line 327
    .line 328
    move-result-object v51

    .line 329
    invoke-interface {v4, v15}, Landroid/database/Cursor;->getLong(I)J

    .line 330
    .line 331
    .line 332
    move-result-wide v52

    .line 333
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 334
    .line 335
    .line 336
    move-result-wide v54

    .line 337
    move/from16 v3, v35

    .line 338
    .line 339
    invoke-interface {v4, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 340
    .line 341
    .line 342
    move-result-wide v56

    .line 343
    move/from16 v35, v0

    .line 344
    .line 345
    move/from16 v0, v17

    .line 346
    .line 347
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 348
    .line 349
    .line 350
    move-result-wide v58

    .line 351
    move/from16 v17, v0

    .line 352
    .line 353
    move/from16 v0, v18

    .line 354
    .line 355
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 356
    .line 357
    .line 358
    move-result v18

    .line 359
    const/16 v36, 0x1

    .line 360
    .line 361
    if-eqz v18, :cond_0

    .line 362
    .line 363
    move/from16 v60, v36

    .line 364
    .line 365
    :goto_1
    move/from16 v18, v0

    .line 366
    .line 367
    move/from16 v0, v19

    .line 368
    .line 369
    goto :goto_2

    .line 370
    :cond_0
    const/16 v60, 0x0

    .line 371
    .line 372
    goto :goto_1

    .line 373
    :goto_2
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 374
    .line 375
    .line 376
    move-result v19

    .line 377
    invoke-static/range {v19 .. v19}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 378
    .line 379
    .line 380
    move-result-object v61

    .line 381
    move/from16 v19, v0

    .line 382
    .line 383
    move/from16 v0, v20

    .line 384
    .line 385
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 386
    .line 387
    .line 388
    move-result v62

    .line 389
    move/from16 v20, v0

    .line 390
    .line 391
    move/from16 v0, v21

    .line 392
    .line 393
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 394
    .line 395
    .line 396
    move-result v63

    .line 397
    move/from16 v21, v0

    .line 398
    .line 399
    move/from16 v0, v22

    .line 400
    .line 401
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 402
    .line 403
    .line 404
    move-result-wide v64

    .line 405
    move/from16 v22, v0

    .line 406
    .line 407
    move/from16 v0, v23

    .line 408
    .line 409
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 410
    .line 411
    .line 412
    move-result v66

    .line 413
    move/from16 v23, v0

    .line 414
    .line 415
    move/from16 v0, v24

    .line 416
    .line 417
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 418
    .line 419
    .line 420
    move-result v67

    .line 421
    move/from16 v24, v0

    .line 422
    .line 423
    move/from16 v0, v25

    .line 424
    .line 425
    invoke-interface {v4, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 426
    .line 427
    .line 428
    move-result v25

    .line 429
    if-eqz v25, :cond_1

    .line 430
    .line 431
    const/16 v68, 0x0

    .line 432
    .line 433
    :goto_3
    move/from16 v25, v0

    .line 434
    .line 435
    move/from16 v0, v26

    .line 436
    .line 437
    goto :goto_4

    .line 438
    :cond_1
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v25

    .line 442
    move-object/from16 v68, v25

    .line 443
    .line 444
    goto :goto_3

    .line 445
    :goto_4
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 446
    .line 447
    .line 448
    move-result v26

    .line 449
    invoke-static/range {v26 .. v26}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 450
    .line 451
    .line 452
    move-result-object v71

    .line 453
    move/from16 v26, v0

    .line 454
    .line 455
    move/from16 v0, v27

    .line 456
    .line 457
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 458
    .line 459
    .line 460
    move-result-object v27

    .line 461
    invoke-static/range {v27 .. v27}, Ll/yjq0;->l([B)Ll/al20;

    .line 462
    .line 463
    .line 464
    move-result-object v70

    .line 465
    move/from16 v27, v0

    .line 466
    .line 467
    move/from16 v0, v28

    .line 468
    .line 469
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 470
    .line 471
    .line 472
    move-result v28

    .line 473
    if-eqz v28, :cond_2

    .line 474
    .line 475
    move/from16 v72, v36

    .line 476
    .line 477
    :goto_5
    move/from16 v28, v0

    .line 478
    .line 479
    move/from16 v0, v29

    .line 480
    .line 481
    goto :goto_6

    .line 482
    :cond_2
    const/16 v72, 0x0

    .line 483
    .line 484
    goto :goto_5

    .line 485
    :goto_6
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 486
    .line 487
    .line 488
    move-result v29

    .line 489
    if-eqz v29, :cond_3

    .line 490
    .line 491
    move/from16 v73, v36

    .line 492
    .line 493
    :goto_7
    move/from16 v29, v0

    .line 494
    .line 495
    move/from16 v0, v30

    .line 496
    .line 497
    goto :goto_8

    .line 498
    :cond_3
    const/16 v73, 0x0

    .line 499
    .line 500
    goto :goto_7

    .line 501
    :goto_8
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 502
    .line 503
    .line 504
    move-result v30

    .line 505
    if-eqz v30, :cond_4

    .line 506
    .line 507
    move/from16 v74, v36

    .line 508
    .line 509
    :goto_9
    move/from16 v30, v0

    .line 510
    .line 511
    move/from16 v0, v31

    .line 512
    .line 513
    goto :goto_a

    .line 514
    :cond_4
    const/16 v74, 0x0

    .line 515
    .line 516
    goto :goto_9

    .line 517
    :goto_a
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 518
    .line 519
    .line 520
    move-result v31

    .line 521
    if-eqz v31, :cond_5

    .line 522
    .line 523
    move/from16 v75, v36

    .line 524
    .line 525
    :goto_b
    move/from16 v31, v0

    .line 526
    .line 527
    move/from16 v0, v32

    .line 528
    .line 529
    goto :goto_c

    .line 530
    :cond_5
    const/16 v75, 0x0

    .line 531
    .line 532
    goto :goto_b

    .line 533
    :goto_c
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 534
    .line 535
    .line 536
    move-result-wide v76

    .line 537
    move/from16 v32, v0

    .line 538
    .line 539
    move/from16 v0, v33

    .line 540
    .line 541
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 542
    .line 543
    .line 544
    move-result-wide v78

    .line 545
    move/from16 v33, v0

    .line 546
    .line 547
    move/from16 v0, v34

    .line 548
    .line 549
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 550
    .line 551
    .line 552
    move-result-object v34

    .line 553
    invoke-static/range {v34 .. v34}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 554
    .line 555
    .line 556
    move-result-object v80

    .line 557
    new-instance v49, Ll/l06;

    .line 558
    .line 559
    move-object/from16 v69, v49

    .line 560
    .line 561
    invoke-direct/range {v69 .. v80}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 562
    .line 563
    .line 564
    move-object/from16 v49, v69

    .line 565
    .line 566
    new-instance v36, Ll/mjq0;

    .line 567
    .line 568
    invoke-direct/range {v36 .. v68}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    .line 569
    .line 570
    .line 571
    move/from16 v34, v0

    .line 572
    .line 573
    move-object/from16 v0, v36

    .line 574
    .line 575
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 576
    .line 577
    .line 578
    move/from16 v0, v35

    .line 579
    .line 580
    move/from16 v35, v3

    .line 581
    .line 582
    goto/16 :goto_0

    .line 583
    .line 584
    :catchall_0
    move-exception v0

    .line 585
    goto :goto_d

    .line 586
    :cond_6
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 587
    .line 588
    .line 589
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 590
    .line 591
    .line 592
    return-object v1

    .line 593
    :catchall_1
    move-exception v0

    .line 594
    move-object/from16 v16, v1

    .line 595
    .line 596
    :goto_d
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 597
    .line 598
    .line 599
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 600
    .line 601
    .line 602
    throw v0
.end method

.method public u(Ljava/lang/String;)Ll/mjq0$c;
    .locals 43

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id=?"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v0, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    move-object/from16 v0, p1

    .line 11
    .line 12
    invoke-virtual {v3, v2, v0}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 18
    .line 19
    .line 20
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static {v0, v3, v2, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 29
    .line 30
    .line 31
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v6, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    :cond_0
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const/4 v8, 0x0

    .line 47
    if-eqz v7, :cond_2

    .line 48
    .line 49
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-virtual {v0, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    if-nez v9, :cond_1

    .line 58
    .line 59
    new-instance v9, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    goto/16 :goto_6

    .line 70
    .line 71
    :cond_1
    :goto_1
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-nez v8, :cond_0

    .line 80
    .line 81
    new-instance v8, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    const/4 v7, -0x1

    .line 91
    invoke-interface {v5, v7}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ll/sjq0;->K(Ljava/util/HashMap;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v6}, Ll/sjq0;->J(Ljava/util/HashMap;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    if-eqz v7, :cond_7

    .line 105
    .line 106
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v10

    .line 110
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    invoke-static {v4}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 115
    .line 116
    .line 117
    move-result-object v11

    .line 118
    const/4 v4, 0x2

    .line 119
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getBlob(I)[B

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-static {v4}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 124
    .line 125
    .line 126
    move-result-object v12

    .line 127
    const/4 v4, 0x3

    .line 128
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 129
    .line 130
    .line 131
    move-result v20

    .line 132
    const/4 v4, 0x4

    .line 133
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 134
    .line 135
    .line 136
    move-result v27

    .line 137
    const/16 v4, 0xe

    .line 138
    .line 139
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 140
    .line 141
    .line 142
    move-result-wide v13

    .line 143
    const/16 v4, 0xf

    .line 144
    .line 145
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 146
    .line 147
    .line 148
    move-result-wide v15

    .line 149
    const/16 v4, 0x10

    .line 150
    .line 151
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 152
    .line 153
    .line 154
    move-result-wide v17

    .line 155
    const/16 v4, 0x11

    .line 156
    .line 157
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    invoke-static {v4}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 162
    .line 163
    .line 164
    move-result-object v21

    .line 165
    const/16 v4, 0x12

    .line 166
    .line 167
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 168
    .line 169
    .line 170
    move-result-wide v22

    .line 171
    const/16 v4, 0x13

    .line 172
    .line 173
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 174
    .line 175
    .line 176
    move-result-wide v24

    .line 177
    const/16 v4, 0x14

    .line 178
    .line 179
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 180
    .line 181
    .line 182
    move-result v26

    .line 183
    const/16 v4, 0x15

    .line 184
    .line 185
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 186
    .line 187
    .line 188
    move-result-wide v28

    .line 189
    const/16 v4, 0x16

    .line 190
    .line 191
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 192
    .line 193
    .line 194
    move-result v30

    .line 195
    const/4 v4, 0x5

    .line 196
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    invoke-static {v4}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 201
    .line 202
    .line 203
    move-result-object v33

    .line 204
    const/4 v4, 0x6

    .line 205
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getBlob(I)[B

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-static {v4}, Ll/yjq0;->l([B)Ll/al20;

    .line 210
    .line 211
    .line 212
    move-result-object v32

    .line 213
    const/4 v4, 0x7

    .line 214
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-eqz v4, :cond_3

    .line 219
    .line 220
    move/from16 v34, v2

    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_3
    move/from16 v34, v8

    .line 224
    .line 225
    :goto_2
    const/16 v4, 0x8

    .line 226
    .line 227
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    if-eqz v4, :cond_4

    .line 232
    .line 233
    move/from16 v35, v2

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_4
    move/from16 v35, v8

    .line 237
    .line 238
    :goto_3
    const/16 v4, 0x9

    .line 239
    .line 240
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    if-eqz v4, :cond_5

    .line 245
    .line 246
    move/from16 v36, v2

    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_5
    move/from16 v36, v8

    .line 250
    .line 251
    :goto_4
    const/16 v4, 0xa

    .line 252
    .line 253
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    if-eqz v4, :cond_6

    .line 258
    .line 259
    move/from16 v37, v2

    .line 260
    .line 261
    goto :goto_5

    .line 262
    :cond_6
    move/from16 v37, v8

    .line 263
    .line 264
    :goto_5
    const/16 v2, 0xb

    .line 265
    .line 266
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 267
    .line 268
    .line 269
    move-result-wide v38

    .line 270
    const/16 v2, 0xc

    .line 271
    .line 272
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 273
    .line 274
    .line 275
    move-result-wide v40

    .line 276
    const/16 v2, 0xd

    .line 277
    .line 278
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    invoke-static {v2}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 283
    .line 284
    .line 285
    move-result-object v42

    .line 286
    new-instance v31, Ll/l06;

    .line 287
    .line 288
    invoke-direct/range {v31 .. v42}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 289
    .line 290
    .line 291
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    check-cast v0, Ljava/util/ArrayList;

    .line 300
    .line 301
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    move-object/from16 v32, v2

    .line 310
    .line 311
    check-cast v32, Ljava/util/ArrayList;

    .line 312
    .line 313
    new-instance v9, Ll/mjq0$c;

    .line 314
    .line 315
    move-object/from16 v19, v31

    .line 316
    .line 317
    move-object/from16 v31, v0

    .line 318
    .line 319
    invoke-direct/range {v9 .. v32}, Ll/mjq0$c;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    .line 320
    .line 321
    .line 322
    move-object v4, v9

    .line 323
    :cond_7
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 324
    .line 325
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 326
    .line 327
    .line 328
    :try_start_2
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v3}, Ll/zkd0;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 332
    .line 333
    .line 334
    iget-object v0, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 335
    .line 336
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 337
    .line 338
    .line 339
    return-object v4

    .line 340
    :catchall_1
    move-exception v0

    .line 341
    goto :goto_7

    .line 342
    :goto_6
    :try_start_3
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v3}, Ll/zkd0;->release()V

    .line 346
    .line 347
    .line 348
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 349
    :goto_7
    iget-object v1, v1, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 350
    .line 351
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 352
    .line 353
    .line 354
    throw v0
.end method

.method public v(Ljava/lang/String;)Ll/mjq0;
    .locals 80

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "SELECT * FROM workspec WHERE id=?"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    move-object/from16 v3, p1

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v3, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 16
    .line 17
    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 18
    .line 19
    .line 20
    iget-object v0, v0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-static {v0, v1, v3, v4}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    :try_start_0
    const-string v0, "id"

    .line 29
    .line 30
    invoke-static {v5, v0}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const-string v6, "state"

    .line 35
    .line 36
    invoke-static {v5, v6}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const-string v7, "worker_class_name"

    .line 41
    .line 42
    invoke-static {v5, v7}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const-string v8, "input_merger_class_name"

    .line 47
    .line 48
    invoke-static {v5, v8}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const-string v9, "input"

    .line 53
    .line 54
    invoke-static {v5, v9}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const-string v10, "output"

    .line 59
    .line 60
    invoke-static {v5, v10}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    const-string v11, "initial_delay"

    .line 65
    .line 66
    invoke-static {v5, v11}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    const-string v12, "interval_duration"

    .line 71
    .line 72
    invoke-static {v5, v12}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v12

    .line 76
    const-string v13, "flex_duration"

    .line 77
    .line 78
    invoke-static {v5, v13}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v13

    .line 82
    const-string v14, "run_attempt_count"

    .line 83
    .line 84
    invoke-static {v5, v14}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v14

    .line 88
    const-string v15, "backoff_policy"

    .line 89
    .line 90
    invoke-static {v5, v15}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v15

    .line 94
    const-string v2, "backoff_delay_duration"

    .line 95
    .line 96
    invoke-static {v5, v2}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const-string v3, "last_enqueue_time"

    .line 101
    .line 102
    invoke-static {v5, v3}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    const-string v4, "minimum_retention_duration"

    .line 107
    .line 108
    invoke-static {v5, v4}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 112
    move-object/from16 v16, v1

    .line 113
    .line 114
    :try_start_1
    const-string v1, "schedule_requested_at"

    .line 115
    .line 116
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    move/from16 v17, v1

    .line 121
    .line 122
    const-string v1, "run_in_foreground"

    .line 123
    .line 124
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    move/from16 v18, v1

    .line 129
    .line 130
    const-string v1, "out_of_quota_policy"

    .line 131
    .line 132
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    move/from16 v19, v1

    .line 137
    .line 138
    const-string v1, "period_count"

    .line 139
    .line 140
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    move/from16 v20, v1

    .line 145
    .line 146
    const-string v1, "generation"

    .line 147
    .line 148
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    move/from16 v21, v1

    .line 153
    .line 154
    const-string v1, "next_schedule_time_override"

    .line 155
    .line 156
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    move/from16 v22, v1

    .line 161
    .line 162
    const-string v1, "next_schedule_time_override_generation"

    .line 163
    .line 164
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    move/from16 v23, v1

    .line 169
    .line 170
    const-string v1, "stop_reason"

    .line 171
    .line 172
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    move/from16 v24, v1

    .line 177
    .line 178
    const-string v1, "trace_tag"

    .line 179
    .line 180
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    move/from16 v25, v1

    .line 185
    .line 186
    const-string v1, "required_network_type"

    .line 187
    .line 188
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    move/from16 v26, v1

    .line 193
    .line 194
    const-string v1, "required_network_request"

    .line 195
    .line 196
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    move/from16 v27, v1

    .line 201
    .line 202
    const-string v1, "requires_charging"

    .line 203
    .line 204
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    move/from16 v28, v1

    .line 209
    .line 210
    const-string v1, "requires_device_idle"

    .line 211
    .line 212
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    move/from16 v29, v1

    .line 217
    .line 218
    const-string v1, "requires_battery_not_low"

    .line 219
    .line 220
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    move/from16 v30, v1

    .line 225
    .line 226
    const-string v1, "requires_storage_not_low"

    .line 227
    .line 228
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    move/from16 v31, v1

    .line 233
    .line 234
    const-string v1, "trigger_content_update_delay"

    .line 235
    .line 236
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    move/from16 v32, v1

    .line 241
    .line 242
    const-string v1, "trigger_max_content_delay"

    .line 243
    .line 244
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    move/from16 v33, v1

    .line 249
    .line 250
    const-string v1, "content_uri_triggers"

    .line 251
    .line 252
    invoke-static {v5, v1}, Ll/xyb;->e(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    .line 257
    .line 258
    .line 259
    move-result v34

    .line 260
    if-eqz v34, :cond_6

    .line 261
    .line 262
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v36

    .line 266
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    invoke-static {v0}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 271
    .line 272
    .line 273
    move-result-object v37

    .line 274
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v38

    .line 278
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v39

    .line 282
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-static {v0}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 287
    .line 288
    .line 289
    move-result-object v40

    .line 290
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-static {v0}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 295
    .line 296
    .line 297
    move-result-object v41

    .line 298
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 299
    .line 300
    .line 301
    move-result-wide v42

    .line 302
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 303
    .line 304
    .line 305
    move-result-wide v44

    .line 306
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 307
    .line 308
    .line 309
    move-result-wide v46

    .line 310
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 311
    .line 312
    .line 313
    move-result v49

    .line 314
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    invoke-static {v0}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 319
    .line 320
    .line 321
    move-result-object v50

    .line 322
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 323
    .line 324
    .line 325
    move-result-wide v51

    .line 326
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 327
    .line 328
    .line 329
    move-result-wide v53

    .line 330
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 331
    .line 332
    .line 333
    move-result-wide v55

    .line 334
    move/from16 v0, v17

    .line 335
    .line 336
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 337
    .line 338
    .line 339
    move-result-wide v57

    .line 340
    move/from16 v0, v18

    .line 341
    .line 342
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_0

    .line 347
    .line 348
    const/16 v59, 0x1

    .line 349
    .line 350
    :goto_0
    move/from16 v0, v19

    .line 351
    .line 352
    goto :goto_1

    .line 353
    :cond_0
    const/16 v59, 0x0

    .line 354
    .line 355
    goto :goto_0

    .line 356
    :goto_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    invoke-static {v0}, Ll/yjq0;->f(I)Landroidx/work/OutOfQuotaPolicy;

    .line 361
    .line 362
    .line 363
    move-result-object v60

    .line 364
    move/from16 v0, v20

    .line 365
    .line 366
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 367
    .line 368
    .line 369
    move-result v61

    .line 370
    move/from16 v0, v21

    .line 371
    .line 372
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 373
    .line 374
    .line 375
    move-result v62

    .line 376
    move/from16 v0, v22

    .line 377
    .line 378
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 379
    .line 380
    .line 381
    move-result-wide v63

    .line 382
    move/from16 v0, v23

    .line 383
    .line 384
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 385
    .line 386
    .line 387
    move-result v65

    .line 388
    move/from16 v0, v24

    .line 389
    .line 390
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 391
    .line 392
    .line 393
    move-result v66

    .line 394
    move/from16 v0, v25

    .line 395
    .line 396
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 397
    .line 398
    .line 399
    move-result v2

    .line 400
    if-eqz v2, :cond_1

    .line 401
    .line 402
    const/16 v67, 0x0

    .line 403
    .line 404
    :goto_2
    move/from16 v0, v26

    .line 405
    .line 406
    goto :goto_3

    .line 407
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    move-object/from16 v67, v4

    .line 412
    .line 413
    goto :goto_2

    .line 414
    :goto_3
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    invoke-static {v0}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 419
    .line 420
    .line 421
    move-result-object v70

    .line 422
    move/from16 v0, v27

    .line 423
    .line 424
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    invoke-static {v0}, Ll/yjq0;->l([B)Ll/al20;

    .line 429
    .line 430
    .line 431
    move-result-object v69

    .line 432
    move/from16 v0, v28

    .line 433
    .line 434
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-eqz v0, :cond_2

    .line 439
    .line 440
    const/16 v71, 0x1

    .line 441
    .line 442
    :goto_4
    move/from16 v0, v29

    .line 443
    .line 444
    goto :goto_5

    .line 445
    :cond_2
    const/16 v71, 0x0

    .line 446
    .line 447
    goto :goto_4

    .line 448
    :goto_5
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 449
    .line 450
    .line 451
    move-result v0

    .line 452
    if-eqz v0, :cond_3

    .line 453
    .line 454
    const/16 v72, 0x1

    .line 455
    .line 456
    :goto_6
    move/from16 v0, v30

    .line 457
    .line 458
    goto :goto_7

    .line 459
    :cond_3
    const/16 v72, 0x0

    .line 460
    .line 461
    goto :goto_6

    .line 462
    :goto_7
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_4

    .line 467
    .line 468
    const/16 v73, 0x1

    .line 469
    .line 470
    :goto_8
    move/from16 v0, v31

    .line 471
    .line 472
    goto :goto_9

    .line 473
    :cond_4
    const/16 v73, 0x0

    .line 474
    .line 475
    goto :goto_8

    .line 476
    :goto_9
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    if-eqz v0, :cond_5

    .line 481
    .line 482
    const/16 v74, 0x1

    .line 483
    .line 484
    :goto_a
    move/from16 v0, v32

    .line 485
    .line 486
    goto :goto_b

    .line 487
    :cond_5
    const/16 v74, 0x0

    .line 488
    .line 489
    goto :goto_a

    .line 490
    :goto_b
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 491
    .line 492
    .line 493
    move-result-wide v75

    .line 494
    move/from16 v0, v33

    .line 495
    .line 496
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 497
    .line 498
    .line 499
    move-result-wide v77

    .line 500
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getBlob(I)[B

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    invoke-static {v0}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 505
    .line 506
    .line 507
    move-result-object v79

    .line 508
    new-instance v48, Ll/l06;

    .line 509
    .line 510
    move-object/from16 v68, v48

    .line 511
    .line 512
    invoke-direct/range {v68 .. v79}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 513
    .line 514
    .line 515
    move-object/from16 v48, v68

    .line 516
    .line 517
    new-instance v35, Ll/mjq0;

    .line 518
    .line 519
    invoke-direct/range {v35 .. v67}, Ll/mjq0;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 520
    .line 521
    .line 522
    move-object/from16 v4, v35

    .line 523
    .line 524
    goto :goto_c

    .line 525
    :catchall_0
    move-exception v0

    .line 526
    goto :goto_d

    .line 527
    :cond_6
    const/4 v4, 0x0

    .line 528
    :goto_c
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 529
    .line 530
    .line 531
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 532
    .line 533
    .line 534
    return-object v4

    .line 535
    :catchall_1
    move-exception v0

    .line 536
    move-object/from16 v16, v1

    .line 537
    .line 538
    :goto_d
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 539
    .line 540
    .line 541
    invoke-virtual/range {v16 .. v16}, Ll/zkd0;->release()V

    .line 542
    .line 543
    .line 544
    throw v0
.end method

.method public w()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->o:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :try_start_0
    iget-object v1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 24
    .line 25
    .line 26
    :try_start_2
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/sjq0;->o:Landroidx/room/SharedSQLiteStatement;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :catchall_0
    move-exception v1

    .line 38
    goto :goto_0

    .line 39
    :catchall_1
    move-exception v1

    .line 40
    :try_start_3
    iget-object v2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 43
    .line 44
    .line 45
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 46
    :goto_0
    iget-object p0, p0, Ll/sjq0;->o:Landroidx/room/SharedSQLiteStatement;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 49
    .line 50
    .line 51
    throw v1
.end method

.method public x(Ll/mjq0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Ll/sjq0;->c:Ll/t2f;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/t2f;->j(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 31
    .line 32
    .line 33
    throw p1
.end method

.method public y(Ljava/lang/String;J)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjq0;->n:Landroidx/room/SharedSQLiteStatement;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->b()Ll/r7h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1, p2, p3}, Ll/p7h0;->bindLong(IJ)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x2

    .line 17
    invoke-interface {v0, p2, p1}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :try_start_1
    invoke-interface {v0}, Ll/r7h0;->executeUpdateDelete()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 30
    .line 31
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    .line 33
    .line 34
    :try_start_2
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 35
    .line 36
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/sjq0;->n:Landroidx/room/SharedSQLiteStatement;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 42
    .line 43
    .line 44
    return p1

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_0

    .line 47
    :catchall_1
    move-exception p1

    .line 48
    :try_start_3
    iget-object p2, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 49
    .line 50
    invoke-virtual {p2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 51
    .line 52
    .line 53
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 54
    :goto_0
    iget-object p0, p0, Ll/sjq0;->n:Landroidx/room/SharedSQLiteStatement;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroidx/room/SharedSQLiteStatement;->h(Ll/r7h0;)V

    .line 57
    .line 58
    .line 59
    throw p1
.end method

.method public z(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/mjq0$b;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "SELECT id, state FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, v1, p1}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/sjq0;->a:Landroidx/room/RoomDatabase;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p0, v0, v2, p1}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :try_start_0
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-direct {p1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-static {v4}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    new-instance v5, Ll/mjq0$b;

    .line 52
    .line 53
    invoke-direct {v5, v3, v4}, Ll/mjq0$b;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p1

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 66
    .line 67
    .line 68
    return-object p1

    .line 69
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ll/zkd0;->release()V

    .line 73
    .line 74
    .line 75
    throw p1
.end method
