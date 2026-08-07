.class public Lcom/xiaomi/mipush/sdk/f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/f$f;
    }
.end annotation


# static fields
.field private static l:Lcom/xiaomi/mipush/sdk/f;

.field private static m:Z

.field private static final n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/mipush/sdk/f$f;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Z

.field private b:Landroid/content/Context;

.field private c:Ljava/lang/String;

.field private d:Landroid/os/Messenger;

.field private e:Landroid/os/Handler;

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field private g:Z

.field private h:J

.field private i:Ljava/lang/String;

.field private j:Landroid/content/Intent;

.field private k:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/mipush/sdk/f;->n:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/f;->a:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->e:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v2, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/f;->g:Z

    .line 18
    .line 19
    iput-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->i:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->j:Landroid/content/Intent;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->k:Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->V()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/f;->a:Z

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->Z()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    sput-boolean v0, Lcom/xiaomi/mipush/sdk/f;->m:Z

    .line 44
    .line 45
    new-instance v0, Lcom/xiaomi/mipush/sdk/f$a;

    .line 46
    .line 47
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-direct {v0, p0, v1}, Lcom/xiaomi/mipush/sdk/f$a;-><init>(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Looper;)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->e:Landroid/os/Handler;

    .line 55
    .line 56
    invoke-static {p1}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    new-instance p1, Lcom/xiaomi/mipush/sdk/f$b;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Lcom/xiaomi/mipush/sdk/f$b;-><init>(Lcom/xiaomi/mipush/sdk/f;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Lcom/xiaomi/push/service/g;->a(Lcom/xiaomi/push/service/g$b;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->M()Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->P(Landroid/content/Intent;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method private F(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/xiaomi/mipush/sdk/v;",
            "Z",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_9

    .line 12
    .line 13
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v0}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_4

    .line 22
    .line 23
    :cond_0
    new-instance v0, Lcom/xiaomi/push/he;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/xiaomi/push/he;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->a(Z)Lcom/xiaomi/push/he;

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/4 v4, 0x0

    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/xiaomi/push/service/aj;->a()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 48
    .line 49
    .line 50
    if-eqz p3, :cond_1

    .line 51
    .line 52
    new-instance v3, Lcom/xiaomi/push/he;

    .line 53
    .line 54
    invoke-direct {v3, p1, v1}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    move-object v3, v4

    .line 59
    :goto_0
    const-class v5, Ll/m5r0;

    .line 60
    .line 61
    monitor-enter v5

    .line 62
    :try_start_0
    iget-object v6, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 63
    .line 64
    invoke-static {v6}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-virtual {v6, p1}, Ll/m5r0;->e(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    monitor-exit v5

    .line 72
    :goto_1
    move-object v6, v3

    .line 73
    goto :goto_2

    .line 74
    :catchall_0
    move-exception v0

    .line 75
    move-object p0, v0

    .line 76
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    throw p0

    .line 78
    :cond_2
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 79
    .line 80
    .line 81
    if-eqz p3, :cond_3

    .line 82
    .line 83
    new-instance v3, Lcom/xiaomi/push/he;

    .line 84
    .line 85
    invoke-direct {v3, p1, v1}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    move-object v6, v4

    .line 90
    :goto_2
    sget-object v3, Lcom/xiaomi/mipush/sdk/f$e;->a:[I

    .line 91
    .line 92
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    aget v3, v3, v5

    .line 97
    .line 98
    packed-switch v3, :pswitch_data_0

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :pswitch_0
    sget-object v3, Lcom/xiaomi/push/gp;->N:Lcom/xiaomi/push/gp;

    .line 103
    .line 104
    iget-object v3, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 107
    .line 108
    .line 109
    if-eqz p4, :cond_6

    .line 110
    .line 111
    invoke-virtual {v0, p4}, Lcom/xiaomi/push/he;->a(Ljava/util/Map;)Lcom/xiaomi/push/he;

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :pswitch_1
    sget-object v3, Lcom/xiaomi/push/gp;->F:Lcom/xiaomi/push/gp;

    .line 116
    .line 117
    iget-object v5, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0, v5}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 120
    .line 121
    .line 122
    iget-object v3, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v6, v3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 125
    .line 126
    .line 127
    if-eqz p4, :cond_4

    .line 128
    .line 129
    invoke-virtual {v0, p4}, Lcom/xiaomi/push/he;->a(Ljava/util/Map;)Lcom/xiaomi/push/he;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v6, p4}, Lcom/xiaomi/push/he;->a(Ljava/util/Map;)Lcom/xiaomi/push/he;

    .line 133
    .line 134
    .line 135
    :cond_4
    const-string v3, "com.xiaomi.mipush.ENABLE_PUSH_MESSAGE"

    .line 136
    .line 137
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    .line 139
    .line 140
    goto :goto_3

    .line 141
    :pswitch_2
    sget-object v3, Lcom/xiaomi/push/gp;->E:Lcom/xiaomi/push/gp;

    .line 142
    .line 143
    iget-object v5, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v0, v5}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 146
    .line 147
    .line 148
    iget-object v3, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v6, v3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 151
    .line 152
    .line 153
    if-eqz p4, :cond_5

    .line 154
    .line 155
    invoke-virtual {v0, p4}, Lcom/xiaomi/push/he;->a(Ljava/util/Map;)Lcom/xiaomi/push/he;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v6, p4}, Lcom/xiaomi/push/he;->a(Ljava/util/Map;)Lcom/xiaomi/push/he;

    .line 159
    .line 160
    .line 161
    :cond_5
    const-string v3, "com.xiaomi.mipush.DISABLE_PUSH_MESSAGE"

    .line 162
    .line 163
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 164
    .line 165
    .line 166
    :cond_6
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string v5, "type:"

    .line 169
    .line 170
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v5, ", "

    .line 177
    .line 178
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-static {v3}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 192
    .line 193
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-virtual {v0, v3}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 202
    .line 203
    .line 204
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 205
    .line 206
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-virtual {v0, v3}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 211
    .line 212
    .line 213
    sget-object v7, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 214
    .line 215
    const/4 v3, 0x0

    .line 216
    invoke-virtual {p0, v0, v7, v3, v4}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 217
    .line 218
    .line 219
    if-eqz p3, :cond_7

    .line 220
    .line 221
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 222
    .line 223
    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 224
    .line 225
    .line 226
    move-result-object p3

    .line 227
    invoke-virtual {p3}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p3

    .line 231
    invoke-virtual {v6, p3}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 232
    .line 233
    .line 234
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 235
    .line 236
    invoke-virtual {p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p3

    .line 240
    invoke-virtual {v6, p3}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 241
    .line 242
    .line 243
    iget-object v5, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 244
    .line 245
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v9

    .line 249
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 250
    .line 251
    invoke-static {p3}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 252
    .line 253
    .line 254
    move-result-object p3

    .line 255
    invoke-virtual {p3}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v10

    .line 259
    const/4 v8, 0x0

    .line 260
    invoke-static/range {v5 .. v10}, Ll/s5r0;->b(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;

    .line 261
    .line 262
    .line 263
    move-result-object p3

    .line 264
    invoke-static {p3}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 265
    .line 266
    .line 267
    move-result-object p3

    .line 268
    if-eqz p3, :cond_7

    .line 269
    .line 270
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 271
    .line 272
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 277
    .line 278
    array-length v4, p3

    .line 279
    invoke-static {v0, v3, v6, v7, v4}, Ll/jxq0;->f(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;I)V

    .line 280
    .line 281
    .line 282
    const-string v0, "mipush_payload"

    .line 283
    .line 284
    invoke-virtual {v2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 285
    .line 286
    .line 287
    const-string p3, "com.xiaomi.mipush.MESSAGE_CACHE"

    .line 288
    .line 289
    invoke-virtual {v2, p3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 290
    .line 291
    .line 292
    const-string p3, "mipush_app_id"

    .line 293
    .line 294
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 295
    .line 296
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {v2, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 305
    .line 306
    .line 307
    const-string p3, "mipush_app_token"

    .line 308
    .line 309
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 310
    .line 311
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->m()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v2, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 320
    .line 321
    .line 322
    invoke-direct {p0, v2}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 323
    .line 324
    .line 325
    :cond_7
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 326
    .line 327
    .line 328
    move-result-object p3

    .line 329
    const/16 v0, 0x13

    .line 330
    .line 331
    iput v0, p3, Landroid/os/Message;->what:I

    .line 332
    .line 333
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 334
    .line 335
    .line 336
    move-result p2

    .line 337
    iput-object p1, p3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 338
    .line 339
    iput p2, p3, Landroid/os/Message;->arg1:I

    .line 340
    .line 341
    if-eqz p4, :cond_8

    .line 342
    .line 343
    const-string p1, "third_sync_reason"

    .line 344
    .line 345
    invoke-virtual {p4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    if-eqz p1, :cond_8

    .line 350
    .line 351
    new-instance p1, Landroid/os/Bundle;

    .line 352
    .line 353
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 354
    .line 355
    .line 356
    const-string p2, "third_sync_reason"

    .line 357
    .line 358
    const-string v0, "third_sync_reason"

    .line 359
    .line 360
    invoke-virtual {p4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object p4

    .line 364
    check-cast p4, Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {p1, p2, p4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {p3, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 370
    .line 371
    .line 372
    :cond_8
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->e:Landroid/os/Handler;

    .line 373
    .line 374
    const-wide/16 p1, 0x1388

    .line 375
    .line 376
    invoke-virtual {p0, p3, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 377
    .line 378
    .line 379
    :cond_9
    :goto_4
    return-void

    .line 380
    nop

    .line 381
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic L(Lcom/xiaomi/mipush/sdk/f;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/f;->g:Z

    .line 2
    .line 3
    return p1
.end method

.method private M()Landroid/content/Intent;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "com.xiaomi.xmsf"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->R()Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string v0, "pushChannel xmsf create own channel"

    .line 21
    .line 22
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->a0()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method private P(Landroid/content/Intent;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/l4r0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x1a

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->Y(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private R()Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/f;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "pushChannel app start miui china channel"

    .line 8
    .line 9
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->W()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string v0, "pushChannel app start  own channel"

    .line 18
    .line 19
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->a0()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private declared-synchronized T(I)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 3
    .line 4
    const-string v1, "mipush_extra"

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "service_boot_mode"

    .line 16
    .line 17
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method private U(Landroid/content/Intent;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/xiaomi/push/gk;->T:Lcom/xiaomi/push/gk;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sget-object v2, Lcom/xiaomi/push/gg;->a:Lcom/xiaomi/push/gg;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/xiaomi/push/gg;->a()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v0, v1, v3}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->a()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    sget-object v3, Lcom/xiaomi/push/gg;->b:Lcom/xiaomi/push/gg;

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/xiaomi/push/gg;->a()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-ne v0, v4, :cond_0

    .line 34
    .line 35
    sget-boolean v0, Lcom/xiaomi/mipush/sdk/f;->m:Z

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    :goto_0
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/xiaomi/push/gg;->a()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v2}, Lcom/xiaomi/push/gg;->a()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    :goto_1
    if-eq v2, v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Lcom/xiaomi/mipush/sdk/f;->K(I)Z

    .line 56
    .line 57
    .line 58
    :cond_2
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->Y(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->P(Landroid/content/Intent;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private V()Z
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :try_start_0
    const-string v1, "com.xiaomi.xmsf"

    .line 9
    .line 10
    const/4 v2, 0x4

    .line 11
    invoke-virtual {p0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    const/16 v1, 0x69

    .line 21
    .line 22
    if-ge p0, v1, :cond_1

    .line 23
    .line 24
    return v0

    .line 25
    :cond_1
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :catchall_0
    return v0
.end method

.method private W()Landroid/content/Intent;
    .locals 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "com.xiaomi.xmsf"

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v2, "mipush_app_package"

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->f0()V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method private declared-synchronized Y(Landroid/content/Intent;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/mipush/sdk/f;->g:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->e(Landroid/content/Intent;)Landroid/os/Message;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v2, 0x32

    .line 18
    .line 19
    if-lt v0, v2, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_2

    .line 29
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->d:Landroid/os/Messenger;

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 41
    .line 42
    new-instance v1, Lcom/xiaomi/mipush/sdk/f$d;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/f$d;-><init>(Lcom/xiaomi/mipush/sdk/f;)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {v0, p1, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 49
    .line 50
    .line 51
    iput-boolean v2, p0, Lcom/xiaomi/mipush/sdk/f;->g:Z

    .line 52
    .line 53
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->e(Landroid/content/Intent;)Landroid/os/Message;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->e(Landroid/content/Intent;)Landroid/os/Message;

    .line 69
    .line 70
    .line 71
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->d:Landroid/os/Messenger;

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catch_0
    const/4 p1, 0x0

    .line 79
    :try_start_3
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->d:Landroid/os/Messenger;

    .line 80
    .line 81
    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/f;->g:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    .line 83
    :goto_1
    monitor-exit p0

    .line 84
    return-void

    .line 85
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 86
    throw p1
.end method

.method private Z()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/f;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "com.xiaomi.xmsf"

    .line 15
    .line 16
    const/4 v2, 0x4

    .line 17
    invoke-virtual {p0, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    const/16 v0, 0x6c

    .line 24
    .line 25
    if-lt p0, v0, :cond_0

    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :catch_0
    :cond_1
    return v1
.end method

.method private declared-synchronized a()I
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 3
    .line 4
    const-string v1, "mipush_extra"

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "service_boot_mode"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    monitor-exit p0

    .line 19
    return v0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method private a0()Landroid/content/Intent;
    .locals 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->g0()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Landroid/content/ComponentName;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 18
    .line 19
    const-string v3, "com.xiaomi.push.service.XMPushService"

    .line 20
    .line 21
    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    const-string p0, "mipush_app_package"

    .line 28
    .line 29
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public static synthetic c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method private c0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "miui"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    const-string v1, "xiaomi"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 32
    .line 33
    and-int/2addr p0, v2

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :cond_2
    :goto_0
    return v2
.end method

.method private d()Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/f;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "com.xiaomi.xmsf"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->W()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->a0()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method private e(Landroid/content/Intent;)Landroid/os/Message;
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x11

    .line 6
    .line 7
    iput v0, p0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput-object p1, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    return-object p0
.end method

.method private e0()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/xiaomi/mipush/sdk/f;->h:J

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic f(Lcom/xiaomi/mipush/sdk/f;)Landroid/os/Messenger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->d:Landroid/os/Messenger;

    .line 2
    .line 3
    return-object p0
.end method

.method private f0()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/content/ComponentName;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 10
    .line 11
    const-string v2, "com.xiaomi.push.service.XMPushService"

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v2, 0x2

    .line 21
    if-ne p0, v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x1

    .line 25
    invoke-virtual {v0, v1, v2, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    :catchall_0
    :goto_0
    return-void
.end method

.method public static synthetic g(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Messenger;)Landroid/os/Messenger;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->d:Landroid/os/Messenger;

    .line 2
    .line 3
    return-object p1
.end method

.method private g0()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/content/ComponentName;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 10
    .line 11
    const-string v2, "com.xiaomi.push.service.XMPushService"

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-ne p0, v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0, v1, v2, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    :catchall_0
    :goto_0
    return-void
.end method

.method public static declared-synchronized h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;
    .locals 2

    .line 1
    const-class v0, Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/f;->l:Lcom/xiaomi/mipush/sdk/f;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/xiaomi/mipush/sdk/f;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/f;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/xiaomi/mipush/sdk/f;->l:Lcom/xiaomi/mipush/sdk/f;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/f;->l:Lcom/xiaomi/mipush/sdk/f;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic i(Lcom/xiaomi/mipush/sdk/f;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->k:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->k:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method private k()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->i:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "com.xiaomi.xmsf"

    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 20
    .line 21
    const/16 v1, 0x6a

    .line 22
    .line 23
    if-lt v0, v1, :cond_1

    .line 24
    .line 25
    const-string v0, "com.xiaomi.push.service.XMPushService"

    .line 26
    .line 27
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->i:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :catch_0
    :cond_1
    const-string v0, "com.xiaomi.xmsf.push.service.XMPushService"

    .line 31
    .line 32
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->i:Ljava/lang/String;

    .line 33
    .line 34
    return-object v0
.end method

.method public static synthetic l(Lcom/xiaomi/mipush/sdk/f;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xiaomi/mipush/sdk/f;->F(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "ZZ",
            "Lcom/xiaomi/push/gs;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v7

    .line 7
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v8

    .line 17
    move-object v0, p0

    .line 18
    move-object v1, p1

    .line 19
    move-object v2, p2

    .line 20
    move v3, p3

    .line 21
    move v4, p4

    .line 22
    move-object v5, p5

    .line 23
    move v6, p6

    .line 24
    invoke-virtual/range {v0 .. v8}, Lcom/xiaomi/mipush/sdk/f;->B(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final B(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "ZZ",
            "Lcom/xiaomi/push/gs;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v9, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move/from16 v6, p6

    .line 9
    .line 10
    move-object/from16 v7, p7

    .line 11
    .line 12
    move-object/from16 v8, p8

    .line 13
    .line 14
    invoke-virtual/range {v0 .. v9}, Lcom/xiaomi/mipush/sdk/f;->C(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final C(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;Z)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "ZZ",
            "Lcom/xiaomi/push/gs;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    const/4 v10, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object/from16 v5, p5

    .line 8
    .line 9
    move/from16 v6, p6

    .line 10
    .line 11
    move-object/from16 v7, p7

    .line 12
    .line 13
    move-object/from16 v8, p8

    .line 14
    .line 15
    move/from16 v9, p9

    .line 16
    .line 17
    invoke-virtual/range {v0 .. v10}, Lcom/xiaomi/mipush/sdk/f;->D(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;ZZ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final D(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;ZLjava/lang/String;Ljava/lang/String;ZZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "ZZ",
            "Lcom/xiaomi/push/gs;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    if-eqz p10, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->s()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    if-eqz p4, :cond_0

    .line 16
    .line 17
    invoke-virtual/range {p0 .. p3}, Lcom/xiaomi/mipush/sdk/f;->x(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "drop the message before initialization."

    .line 22
    .line 23
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 28
    .line 29
    if-eqz p9, :cond_2

    .line 30
    .line 31
    move-object v1, p1

    .line 32
    move-object v2, p2

    .line 33
    move v3, p3

    .line 34
    move-object v4, p7

    .line 35
    move-object v5, p8

    .line 36
    invoke-static/range {v0 .. v5}, Ll/s5r0;->b(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move-object v1, p1

    .line 42
    move-object v2, p2

    .line 43
    move v3, p3

    .line 44
    move-object v4, p7

    .line 45
    move-object v5, p8

    .line 46
    invoke-static/range {v0 .. v5}, Ll/s5r0;->f(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    :goto_0
    if-eqz p5, :cond_3

    .line 51
    .line 52
    invoke-virtual {p3, p5}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/hb;

    .line 53
    .line 54
    .line 55
    :cond_3
    invoke-static {p3}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    if-nez p3, :cond_4

    .line 60
    .line 61
    const-string p0, "send message fail, because msgBytes is null."

    .line 62
    .line 63
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    iget-object p4, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {p4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    iget-object p5, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 74
    .line 75
    array-length p7, p3

    .line 76
    invoke-static {p4, p5, p1, p2, p7}, Ll/jxq0;->f(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;I)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-string p2, "com.xiaomi.mipush.SEND_MESSAGE"

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    const-string p2, "mipush_payload"

    .line 89
    .line 90
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    const-string p2, "com.xiaomi.mipush.MESSAGE_CACHE"

    .line 94
    .line 95
    invoke-virtual {p1, p2, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final E(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "syncing"

    .line 8
    .line 9
    invoke-virtual {v0, p2, v1}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {v0, p3}, Ll/n1r0;->e(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ljava/util/HashMap;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    const-string v0, "third_sync_reason"

    .line 19
    .line 20
    invoke-virtual {p3, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    const/4 p4, 0x0

    .line 24
    invoke-direct {p0, p1, p2, p4, p3}, Lcom/xiaomi/mipush/sdk/f;->F(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public G(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.CLEAR_NOTIFICATION"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/xiaomi/push/service/an;->F:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/xiaomi/push/service/an;->L:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    sget-object p1, Lcom/xiaomi/push/service/an;->M:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final H(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/mipush/sdk/f;->I(ZLjava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final I(ZLjava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const-string v3, ""

    .line 6
    .line 7
    const-string v4, "syncing"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget-object v0, Lcom/xiaomi/mipush/sdk/v;->a:Lcom/xiaomi/mipush/sdk/v;

    .line 16
    .line 17
    invoke-virtual {p1, v0, v4}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {p1}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v4, Lcom/xiaomi/mipush/sdk/v;->b:Lcom/xiaomi/mipush/sdk/v;

    .line 27
    .line 28
    invoke-virtual {p1, v4, v3}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, p2, v0, v2, v1}, Lcom/xiaomi/mipush/sdk/f;->F(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {v0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, Lcom/xiaomi/mipush/sdk/v;->b:Lcom/xiaomi/mipush/sdk/v;

    .line 40
    .line 41
    invoke-virtual {p1, v0, v4}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {p1}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v4, Lcom/xiaomi/mipush/sdk/v;->a:Lcom/xiaomi/mipush/sdk/v;

    .line 51
    .line 52
    invoke-virtual {p1, v4, v3}, Ll/m5r0;->d(Lcom/xiaomi/mipush/sdk/v;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0, p2, v0, v2, v1}, Lcom/xiaomi/mipush/sdk/f;->F(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public J()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/xiaomi/mipush/sdk/f;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/c;->a()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-ne v0, p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public K(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->T(I)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/xiaomi/push/he;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/xiaomi/push/he;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/xiaomi/push/service/aj;->a()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v2}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 50
    .line 51
    .line 52
    sget-object v2, Lcom/xiaomi/push/gp;->G:Lcom/xiaomi/push/gp;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 57
    .line 58
    .line 59
    new-instance v2, Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v2, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 65
    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p1, ""

    .line 75
    .line 76
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-string v3, "boot_mode"

    .line 84
    .line 85
    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object p1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 95
    .line 96
    const/4 v2, 0x0

    .line 97
    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 98
    .line 99
    .line 100
    const/4 p0, 0x1

    .line 101
    return p0
.end method

.method public final N()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.DISABLE_PUSH"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public O(I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.SET_NOTIFICATION_TYPE"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/xiaomi/push/service/an;->F:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/xiaomi/push/service/an;->I:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    sget-object v1, Lcom/xiaomi/push/service/an;->K:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ll/zuq0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public Q()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/f;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->c0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->k:Ljava/lang/Integer;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/xiaomi/push/service/ap;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ap;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/xiaomi/push/service/ap;->a()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->k:Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    new-instance v0, Lcom/xiaomi/mipush/sdk/f$c;

    .line 42
    .line 43
    new-instance v3, Landroid/os/Handler;

    .line 44
    .line 45
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, p0, v3}, Lcom/xiaomi/mipush/sdk/f$c;-><init>(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Handler;)V

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 62
    .line 63
    invoke-static {v4}, Lcom/xiaomi/push/service/ap;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ap;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v4}, Lcom/xiaomi/push/service/ap;->a()Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v3, v4, v2, v0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f;->k:Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_1

    .line 81
    .line 82
    return v1

    .line 83
    :cond_1
    return v2

    .line 84
    :cond_2
    return v1
.end method

.method public S()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->j:Landroid/content/Intent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->e0()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->j:Landroid/content/Intent;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->j:Landroid/content/Intent;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public X()V
    .locals 11

    .line 1
    sget-object v1, Lcom/xiaomi/mipush/sdk/f;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lcom/xiaomi/mipush/sdk/f$f;

    .line 36
    .line 37
    iget-object v5, v3, Lcom/xiaomi/mipush/sdk/f$f;->a:Lcom/xiaomi/push/hq;

    .line 38
    .line 39
    iget-object v6, v3, Lcom/xiaomi/mipush/sdk/f$f;->b:Lcom/xiaomi/push/gf;

    .line 40
    .line 41
    iget-boolean v7, v3, Lcom/xiaomi/mipush/sdk/f$f;->c:Z

    .line 42
    .line 43
    const/4 v9, 0x0

    .line 44
    const/4 v10, 0x1

    .line 45
    const/4 v8, 0x0

    .line 46
    move-object v4, p0

    .line 47
    invoke-virtual/range {v4 .. v10}, Lcom/xiaomi/mipush/sdk/f;->A(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    const-wide/16 v5, 0x64

    .line 53
    .line 54
    :try_start_1
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    move-object p0, v0

    .line 60
    goto :goto_3

    .line 61
    :catch_0
    :cond_1
    :goto_2
    move-object p0, v4

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    :try_start_2
    sget-object p0, Lcom/xiaomi/mipush/sdk/f;->n:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 66
    .line 67
    .line 68
    monitor-exit v1

    .line 69
    return-void

    .line 70
    :goto_3
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    throw p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/xiaomi/mipush/sdk/f;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b0()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.CLEAR_HEADSUPNOTIFICATION"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    new-array v1, v1, [Ljava/lang/Object;

    .line 12
    .line 13
    const-string v2, "android.app.ActivityThread"

    .line 14
    .line 15
    const-string v3, "currentApplication"

    .line 16
    .line 17
    invoke-static {v2, v3, v1}, Ll/otq0;->g(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/app/Application;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v1, 0x0

    .line 41
    :goto_0
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-nez v3, :cond_1

    .line 58
    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v4, "application package name: "

    .line 62
    .line 63
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v4, ", not equals context package name: "

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    move-object v1, v2

    .line 86
    :goto_1
    sget-object v2, Lcom/xiaomi/push/service/an;->F:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public d0()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.SET_NOTIFICATION_TYPE"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/xiaomi/push/service/an;->F:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/xiaomi/push/service/an;->K:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2}, Ll/zuq0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->P(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/mipush/sdk/f;->o(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o(II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.CLEAR_NOTIFICATION"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/xiaomi/push/service/an;->F:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/xiaomi/push/service/an;->G:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    sget-object p1, Lcom/xiaomi/push/service/an;->H:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public p(ILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.xiaomi.mipush.thirdparty"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    const-string v1, "com.xiaomi.mipush.thirdparty_LEVEL"

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string p1, "com.xiaomi.mipush.thirdparty_DESC"

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->P(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/l4r0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Ll/f3r0;->a(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/q;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/xiaomi/mipush/sdk/q;->a:Lcom/xiaomi/mipush/sdk/q;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, "update"

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/xiaomi/mipush/sdk/v;->c:Lcom/xiaomi/mipush/sdk/v;

    .line 24
    .line 25
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 26
    .line 27
    invoke-virtual {p0, v2, v0, v3, v1}, Lcom/xiaomi/mipush/sdk/f;->E(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    sget-object v0, Lcom/xiaomi/mipush/sdk/q;->d:Lcom/xiaomi/mipush/sdk/q;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v0, Lcom/xiaomi/mipush/sdk/v;->e:Lcom/xiaomi/mipush/sdk/v;

    .line 39
    .line 40
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 41
    .line 42
    invoke-virtual {p0, v2, v0, v3, v1}, Lcom/xiaomi/mipush/sdk/f;->E(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    sget-object v0, Lcom/xiaomi/mipush/sdk/q;->e:Lcom/xiaomi/mipush/sdk/q;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->f:Lcom/xiaomi/mipush/sdk/v;

    .line 54
    .line 55
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->d:Lcom/xiaomi/mipush/sdk/d;

    .line 56
    .line 57
    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/xiaomi/mipush/sdk/f;->E(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;Lcom/xiaomi/mipush/sdk/d;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    :goto_0
    return-void
.end method

.method public r(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x18

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->fillIn(Landroid/content/Intent;I)I

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final t(Lcom/xiaomi/push/gj;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p0, "send TinyData failed, because tinyDataBytes is null."

    .line 12
    .line 13
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v1, "com.xiaomi.mipush.SEND_TINYDATA"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    const-string v1, "mipush_payload"

    .line 23
    .line 24
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->P(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final u(Lcom/xiaomi/push/hf;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->a()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const/16 v5, 0x1771

    .line 22
    .line 23
    const/4 v6, 0x0

    .line 24
    const-string v3, "E100003"

    .line 25
    .line 26
    invoke-virtual/range {v1 .. v6}, Ll/tzq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->j:Landroid/content/Intent;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->a()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/xiaomi/mipush/sdk/c;->d:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 49
    .line 50
    sget-object v2, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 51
    .line 52
    invoke-static {v1, p1, v2}, Ll/s5r0;->a(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-nez p1, :cond_0

    .line 61
    .line 62
    const-string p0, "register fail, because msgBytes is null."

    .line 63
    .line 64
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    const-string v1, "com.xiaomi.mipush.REGISTER_APP"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "mipush_app_id"

    .line 84
    .line 85
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    const-string v1, "mipush_payload"

    .line 89
    .line 90
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    const-string p1, "mipush_session"

    .line 94
    .line 95
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->c:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    const-string p1, "mipush_env_chanage"

    .line 101
    .line 102
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 106
    .line 107
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/c;->a()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    const-string p2, "mipush_env_type"

    .line 116
    .line 117
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 121
    .line 122
    invoke-static {p1}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_1

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/f;->Q()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_1

    .line 133
    .line 134
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->e0()V

    .line 135
    .line 136
    .line 137
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_1
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->j:Landroid/content/Intent;

    .line 142
    .line 143
    return-void
.end method

.method public final v(Lcom/xiaomi/push/hl;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v1, Lcom/xiaomi/push/gf;->b:Lcom/xiaomi/push/gf;

    .line 4
    .line 5
    invoke-static {v0, p1, v1}, Ll/s5r0;->a(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const-string p0, "unregister fail, because msgBytes is null."

    .line 16
    .line 17
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f;->d()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "com.xiaomi.mipush.UNREGISTER_APP"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f;->b:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "mipush_app_id"

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    const-string v1, "mipush_payload"

    .line 46
    .line 47
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v0}, Lcom/xiaomi/mipush/sdk/f;->U(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final w(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Lcom/xiaomi/push/gs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "Lcom/xiaomi/push/gs;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public x(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "Z)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/xiaomi/mipush/sdk/f$f;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/f$f;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f$f;->a:Lcom/xiaomi/push/hq;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/f$f;->b:Lcom/xiaomi/push/gf;

    .line 9
    .line 10
    iput-boolean p3, p0, Lcom/xiaomi/mipush/sdk/f$f;->c:Z

    .line 11
    .line 12
    sget-object p1, Lcom/xiaomi/mipush/sdk/f;->n:Ljava/util/ArrayList;

    .line 13
    .line 14
    monitor-enter p1

    .line 15
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/16 p2, 0xa

    .line 23
    .line 24
    if-le p0, p2, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit p1

    .line 34
    return-void

    .line 35
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method public final y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "Z",
            "Lcom/xiaomi/push/gs;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x1

    .line 2
    const/4 v6, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/xiaomi/mipush/sdk/f;->A(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final z(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(TT;",
            "Lcom/xiaomi/push/gf;",
            "Z",
            "Lcom/xiaomi/push/gs;",
            "Z)V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v5, p4

    .line 7
    move v6, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/xiaomi/mipush/sdk/f;->A(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZZLcom/xiaomi/push/gs;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
