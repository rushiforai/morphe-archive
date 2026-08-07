.class public Ll/sjq0$i;
.super Ll/u2f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sjq0;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/u2f<",
        "Ll/mjq0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic d:Ll/sjq0;


# direct methods
.method public constructor <init>(Ll/sjq0;Landroidx/room/RoomDatabase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjq0$i;->d:Ll/sjq0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/u2f;-><init>(Landroidx/room/RoomDatabase;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "INSERT OR IGNORE INTO `WorkSpec` (`id`,`state`,`worker_class_name`,`input_merger_class_name`,`input`,`output`,`initial_delay`,`interval_duration`,`flex_duration`,`run_attempt_count`,`backoff_policy`,`backoff_delay_duration`,`last_enqueue_time`,`minimum_retention_duration`,`schedule_requested_at`,`run_in_foreground`,`out_of_quota_policy`,`period_count`,`generation`,`next_schedule_time_override`,`next_schedule_time_override_generation`,`stop_reason`,`trace_tag`,`required_network_type`,`required_network_request`,`requires_charging`,`requires_device_idle`,`requires_battery_not_low`,`requires_storage_not_low`,`trigger_content_update_delay`,`trigger_max_content_delay`,`content_uri_triggers`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i(Ll/r7h0;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ll/r7h0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p2, Ll/mjq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sjq0$i;->k(Ll/r7h0;Ll/mjq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ll/r7h0;Ll/mjq0;)V
    .locals 3
    .param p1    # Ll/r7h0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/mjq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-object v0, p2, Ll/mjq0;->a:Ljava/lang/String;

    .line 3
    .line 4
    invoke-interface {p1, p0, v0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/yjq0;->INSTANCE:Ll/yjq0;

    .line 8
    .line 9
    iget-object p0, p2, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 10
    .line 11
    invoke-static {p0}, Ll/yjq0;->k(Landroidx/work/WorkInfo$State;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x2

    .line 16
    int-to-long v1, p0

    .line 17
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x3

    .line 21
    iget-object v0, p2, Ll/mjq0;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p1, p0, v0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x4

    .line 27
    iget-object v0, p2, Ll/mjq0;->d:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {p1, p0, v0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p2, Ll/mjq0;->e:Landroidx/work/Data;

    .line 33
    .line 34
    invoke-static {p0}, Landroidx/work/Data;->g(Landroidx/work/Data;)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v0, 0x5

    .line 39
    invoke-interface {p1, v0, p0}, Ll/p7h0;->bindBlob(I[B)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p2, Ll/mjq0;->f:Landroidx/work/Data;

    .line 43
    .line 44
    invoke-static {p0}, Landroidx/work/Data;->g(Landroidx/work/Data;)[B

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/4 v0, 0x6

    .line 49
    invoke-interface {p1, v0, p0}, Ll/p7h0;->bindBlob(I[B)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x7

    .line 53
    iget-wide v0, p2, Ll/mjq0;->g:J

    .line 54
    .line 55
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x8

    .line 59
    .line 60
    iget-wide v0, p2, Ll/mjq0;->h:J

    .line 61
    .line 62
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 63
    .line 64
    .line 65
    const/16 p0, 0x9

    .line 66
    .line 67
    iget-wide v0, p2, Ll/mjq0;->i:J

    .line 68
    .line 69
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 70
    .line 71
    .line 72
    iget p0, p2, Ll/mjq0;->k:I

    .line 73
    .line 74
    int-to-long v0, p0

    .line 75
    const/16 p0, 0xa

    .line 76
    .line 77
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p2, Ll/mjq0;->l:Landroidx/work/BackoffPolicy;

    .line 81
    .line 82
    invoke-static {p0}, Ll/yjq0;->a(Landroidx/work/BackoffPolicy;)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    const/16 v0, 0xb

    .line 87
    .line 88
    int-to-long v1, p0

    .line 89
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 90
    .line 91
    .line 92
    const/16 p0, 0xc

    .line 93
    .line 94
    iget-wide v0, p2, Ll/mjq0;->m:J

    .line 95
    .line 96
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 97
    .line 98
    .line 99
    const/16 p0, 0xd

    .line 100
    .line 101
    iget-wide v0, p2, Ll/mjq0;->n:J

    .line 102
    .line 103
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 104
    .line 105
    .line 106
    const/16 p0, 0xe

    .line 107
    .line 108
    iget-wide v0, p2, Ll/mjq0;->o:J

    .line 109
    .line 110
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 111
    .line 112
    .line 113
    const/16 p0, 0xf

    .line 114
    .line 115
    iget-wide v0, p2, Ll/mjq0;->p:J

    .line 116
    .line 117
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 118
    .line 119
    .line 120
    iget-boolean p0, p2, Ll/mjq0;->q:Z

    .line 121
    .line 122
    const/16 v0, 0x10

    .line 123
    .line 124
    int-to-long v1, p0

    .line 125
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p2, Ll/mjq0;->r:Landroidx/work/OutOfQuotaPolicy;

    .line 129
    .line 130
    invoke-static {p0}, Ll/yjq0;->i(Landroidx/work/OutOfQuotaPolicy;)I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    const/16 v0, 0x11

    .line 135
    .line 136
    int-to-long v1, p0

    .line 137
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2}, Ll/mjq0;->h()I

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    int-to-long v0, p0

    .line 145
    const/16 p0, 0x12

    .line 146
    .line 147
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2}, Ll/mjq0;->e()I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    int-to-long v0, p0

    .line 155
    const/16 p0, 0x13

    .line 156
    .line 157
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 158
    .line 159
    .line 160
    const/16 p0, 0x14

    .line 161
    .line 162
    invoke-virtual {p2}, Ll/mjq0;->f()J

    .line 163
    .line 164
    .line 165
    move-result-wide v0

    .line 166
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2}, Ll/mjq0;->g()I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    int-to-long v0, p0

    .line 174
    const/16 p0, 0x15

    .line 175
    .line 176
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p2}, Ll/mjq0;->i()I

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    int-to-long v0, p0

    .line 184
    const/16 p0, 0x16

    .line 185
    .line 186
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ll/mjq0;->j()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    const/16 v0, 0x17

    .line 194
    .line 195
    if-nez p0, :cond_0

    .line 196
    .line 197
    invoke-interface {p1, v0}, Ll/p7h0;->bindNull(I)V

    .line 198
    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_0
    invoke-virtual {p2}, Ll/mjq0;->j()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-interface {p1, v0, p0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :goto_0
    iget-object p0, p2, Ll/mjq0;->j:Ll/l06;

    .line 209
    .line 210
    invoke-virtual {p0}, Ll/l06;->f()Landroidx/work/NetworkType;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    invoke-static {p2}, Ll/yjq0;->h(Landroidx/work/NetworkType;)I

    .line 215
    .line 216
    .line 217
    move-result p2

    .line 218
    const/16 v0, 0x18

    .line 219
    .line 220
    int-to-long v1, p2

    .line 221
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Ll/l06;->e()Ll/al20;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-static {p2}, Ll/yjq0;->c(Ll/al20;)[B

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    const/16 v0, 0x19

    .line 233
    .line 234
    invoke-interface {p1, v0, p2}, Ll/p7h0;->bindBlob(I[B)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Ll/l06;->i()Z

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    const/16 v0, 0x1a

    .line 242
    .line 243
    int-to-long v1, p2

    .line 244
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Ll/l06;->j()Z

    .line 248
    .line 249
    .line 250
    move-result p2

    .line 251
    const/16 v0, 0x1b

    .line 252
    .line 253
    int-to-long v1, p2

    .line 254
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0}, Ll/l06;->h()Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    const/16 v0, 0x1c

    .line 262
    .line 263
    int-to-long v1, p2

    .line 264
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0}, Ll/l06;->k()Z

    .line 268
    .line 269
    .line 270
    move-result p2

    .line 271
    const/16 v0, 0x1d

    .line 272
    .line 273
    int-to-long v1, p2

    .line 274
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 275
    .line 276
    .line 277
    const/16 p2, 0x1e

    .line 278
    .line 279
    invoke-virtual {p0}, Ll/l06;->b()J

    .line 280
    .line 281
    .line 282
    move-result-wide v0

    .line 283
    invoke-interface {p1, p2, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 284
    .line 285
    .line 286
    const/16 p2, 0x1f

    .line 287
    .line 288
    invoke-virtual {p0}, Ll/l06;->a()J

    .line 289
    .line 290
    .line 291
    move-result-wide v0

    .line 292
    invoke-interface {p1, p2, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0}, Ll/l06;->c()Ljava/util/Set;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-static {p0}, Ll/yjq0;->j(Ljava/util/Set;)[B

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    const/16 p2, 0x20

    .line 304
    .line 305
    invoke-interface {p1, p2, p0}, Ll/p7h0;->bindBlob(I[B)V

    .line 306
    .line 307
    .line 308
    return-void
.end method
