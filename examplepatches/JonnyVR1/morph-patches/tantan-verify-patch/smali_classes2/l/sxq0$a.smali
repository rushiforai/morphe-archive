.class Ll/sxq0$a;
.super Ljava/lang/Object;

# interfaces
.implements Ll/bwq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sxq0;->a(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field a:J

.field final synthetic b:Ljava/lang/Throwable;

.field final synthetic c:Z

.field final synthetic d:J

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Z

.field final synthetic g:Ljava/lang/Thread;

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Ljava/io/File;

.field final synthetic j:Ll/sxq0;


# direct methods
.method public constructor <init>(Ll/sxq0;Ljava/lang/Throwable;ZJLjava/lang/String;ZLjava/lang/Thread;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sxq0$a;->j:Ll/sxq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sxq0$a;->b:Ljava/lang/Throwable;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/sxq0$a;->c:Z

    .line 6
    .line 7
    iput-wide p4, p0, Ll/sxq0$a;->d:J

    .line 8
    .line 9
    iput-object p6, p0, Ll/sxq0$a;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean p7, p0, Ll/sxq0$a;->f:Z

    .line 12
    .line 13
    iput-object p8, p0, Ll/sxq0$a;->g:Ljava/lang/Thread;

    .line 14
    .line 15
    iput-object p9, p0, Ll/sxq0$a;->h:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p10, p0, Ll/sxq0$a;->i:Ljava/io/File;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    const-wide/16 p1, 0x0

    .line 23
    .line 24
    iput-wide p1, p0, Ll/sxq0$a;->a:J

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(ILl/gsq0;)Ll/gsq0;
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/sxq0$a;->a:J

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p1, :cond_a

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    if-eq p1, v0, :cond_6

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p1, v0, :cond_4

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    if-eq p1, v0, :cond_2

    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    if-eq p1, v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x5

    .line 24
    if-eq p1, v0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    const-string p1, "crash_uuid"

    .line 29
    .line 30
    iget-object p0, p0, Ll/sxq0$a;->h:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, p1, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/j5r0;->F(Landroid/content/Context;)Ljava/io/File;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p1, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 44
    .line 45
    invoke-static {p0, p1, v1}, Ll/s2r0;->a(Ljava/io/File;Lcom/apm/lite/CrashType;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object p2

    .line 49
    :cond_1
    iget-boolean p1, p0, Ll/sxq0$a;->c:Z

    .line 50
    .line 51
    if-nez p1, :cond_b

    .line 52
    .line 53
    iget-object p0, p0, Ll/sxq0$a;->j:Ll/sxq0;

    .line 54
    .line 55
    invoke-static {p0}, Ll/sxq0;->c(Ll/sxq0;)Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p2}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p0, p1}, Ll/lrq0;->d(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 64
    .line 65
    .line 66
    return-object p2

    .line 67
    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ll/d6r0;->r(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    const-string p1, "all_thread_stacks"

    .line 82
    .line 83
    invoke-virtual {p2, p1, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/h4r0;->b(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string p1, "logcat"

    .line 95
    .line 96
    invoke-virtual {p2, p1, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-object p2

    .line 100
    :cond_4
    iget-boolean p1, p0, Ll/sxq0$a;->c:Z

    .line 101
    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    iget-object p0, p0, Ll/sxq0$a;->j:Ll/sxq0;

    .line 105
    .line 106
    invoke-static {p0}, Ll/sxq0;->c(Ll/sxq0;)Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p2}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-static {p0, p1}, Ll/lrq0;->d(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    invoke-static {}, Ll/vxq0;->b()Lorg/json/JSONArray;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    invoke-static {v0, v1}, Ll/vxq0;->c(J)Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    const/16 v2, 0x64

    .line 130
    .line 131
    invoke-static {v2, v0, v1}, Ll/t1r0;->a(IJ)Lorg/json/JSONArray;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const-string v1, "history_message"

    .line 136
    .line 137
    invoke-virtual {p2, v1, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    const-string p0, "current_message"

    .line 141
    .line 142
    invoke-virtual {p2, p0, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    const-string p0, "pending_messages"

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/nrq0;->l()Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p1, "disable_looper_monitor"

    .line 159
    .line 160
    invoke-virtual {p2, p1, p0}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 161
    .line 162
    .line 163
    return-object p2

    .line 164
    :cond_6
    iget-object p1, p0, Ll/sxq0$a;->g:Ljava/lang/Thread;

    .line 165
    .line 166
    if-eqz p1, :cond_7

    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    :cond_7
    const-string p1, "crash_thread_name"

    .line 173
    .line 174
    invoke-virtual {p2, p1, v1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    invoke-static {}, Landroid/os/Process;->myTid()I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    const-string v0, "tid"

    .line 186
    .line 187
    invoke-virtual {p2, v0, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    invoke-static {}, Ll/b350;->c()Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    const-string v0, "false"

    .line 195
    .line 196
    const-string v1, "true"

    .line 197
    .line 198
    if-eqz p1, :cond_8

    .line 199
    .line 200
    move-object p1, v1

    .line 201
    goto :goto_0

    .line 202
    :cond_8
    move-object p1, v0

    .line 203
    :goto_0
    const-string v2, "crash_after_crash"

    .line 204
    .line 205
    invoke-virtual {p2, v2, p1}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 206
    .line 207
    .line 208
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->k()Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-eqz p1, :cond_9

    .line 213
    .line 214
    move-object v0, v1

    .line 215
    :cond_9
    const-string p1, "crash_after_native"

    .line 216
    .line 217
    invoke-virtual {p2, p1, v0}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 218
    .line 219
    .line 220
    invoke-static {}, Ll/frq0;->e()Ll/frq0;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object v0, p0, Ll/sxq0$a;->g:Ljava/lang/Thread;

    .line 225
    .line 226
    iget-object p0, p0, Ll/sxq0$a;->b:Ljava/lang/Throwable;

    .line 227
    .line 228
    const/4 v1, 0x0

    .line 229
    invoke-virtual {p1, v0, p0, v1, p2}, Ll/frq0;->i(Ljava/lang/Thread;Ljava/lang/Throwable;ZLl/gsq0;)V

    .line 230
    .line 231
    .line 232
    return-object p2

    .line 233
    :cond_a
    iget-object p1, p0, Ll/sxq0$a;->b:Ljava/lang/Throwable;

    .line 234
    .line 235
    invoke-static {p1}, Ll/d6r0;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    const-string v1, "data"

    .line 240
    .line 241
    invoke-virtual {p2, v1, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 242
    .line 243
    .line 244
    iget-boolean p1, p0, Ll/sxq0$a;->c:Z

    .line 245
    .line 246
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    const-string v1, "isOOM"

    .line 251
    .line 252
    invoke-virtual {p2, v1, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    const-string p1, "isJava"

    .line 256
    .line 257
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {p2, p1, v0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    iget-wide v0, p0, Ll/sxq0$a;->d:J

    .line 265
    .line 266
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    const-string v0, "crash_time"

    .line 271
    .line 272
    invoke-virtual {p2, v0, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    invoke-static {}, Ll/euq0;->n()I

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    const-string v0, "launch_mode"

    .line 284
    .line 285
    invoke-virtual {p2, v0, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 286
    .line 287
    .line 288
    invoke-static {}, Ll/euq0;->s()J

    .line 289
    .line 290
    .line 291
    move-result-wide v0

    .line 292
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    const-string v0, "launch_time"

    .line 297
    .line 298
    invoke-virtual {p2, v0, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Ll/sxq0$a;->e:Ljava/lang/String;

    .line 302
    .line 303
    if-eqz p1, :cond_b

    .line 304
    .line 305
    const-string v0, "crash_md5"

    .line 306
    .line 307
    invoke-virtual {p2, v0, p1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Ll/sxq0$a;->e:Ljava/lang/String;

    .line 311
    .line 312
    invoke-virtual {p2, v0, p1}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 313
    .line 314
    .line 315
    iget-boolean p0, p0, Ll/sxq0$a;->f:Z

    .line 316
    .line 317
    if-eqz p0, :cond_b

    .line 318
    .line 319
    const-string p1, "has_ignore"

    .line 320
    .line 321
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    invoke-virtual {p2, p1, p0}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 326
    .line 327
    .line 328
    :cond_b
    :goto_1
    return-object p2
.end method

.method public a(Ljava/lang/Throwable;)V
    .locals 0

    .line 329
    return-void
.end method

.method public b(ILl/gsq0;Z)Ll/gsq0;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/u5r0;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-static {p3}, Ll/u5r0;->c(I)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    return-object p2

    .line 12
    :cond_0
    :try_start_0
    new-instance p3, Ljava/io/File;

    .line 13
    .line 14
    iget-object v0, p0, Ll/sxq0$a;->i:Ljava/io/File;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/sxq0$a;->i:Ljava/io/File;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "."

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {p3, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {p3, p0, p1}, Ll/r3r0;->m(Ljava/io/File;Lorg/json/JSONObject;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-object p2

    .line 54
    :catch_0
    move-exception p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    return-object p2
.end method
