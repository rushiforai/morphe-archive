.class public Lcom/cmic/sso/sdk/auth/AuthnHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cmic/sso/sdk/auth/AuthnHelper$a;
    }
.end annotation


# static fields
.field public static final SDK_VERSION:Ljava/lang/String; = "quick_login_android_9.5.5.3"

.field private static c:Lcom/cmic/sso/sdk/auth/AuthnHelper;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lcom/cmic/sso/sdk/auth/a;

.field private final b:Landroid/content/Context;

.field private d:J

.field private final e:Landroid/os/Handler;

.field private f:Ljava/lang/String;

.field private final g:Lcom/cmic/sso/sdk/c;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1f40

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 13
    .line 14
    new-instance v0, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e:Landroid/os/Handler;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/cmic/sso/sdk/auth/a;->a(Landroid/content/Context;)Lcom/cmic/sso/sdk/auth/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a:Lcom/cmic/sso/sdk/auth/a;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/r;->a(Landroid/content/Context;)Lcom/cmic/sso/sdk/e/r;

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/k;->a(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/j;->a(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Lcom/cmic/sso/sdk/c;

    .line 41
    .line 42
    invoke-direct {p1}, Lcom/cmic/sso/sdk/c;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->g:Lcom/cmic/sso/sdk/c;

    .line 46
    .line 47
    new-instance p1, Lcom/cmic/sso/sdk/auth/AuthnHelper$1;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Lcom/cmic/sso/sdk/auth/AuthnHelper$1;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/auth/AuthnHelper;-><init>(Landroid/content/Context;)V

    .line 57
    iput-object p2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->f:Ljava/lang/String;

    return-void
.end method

.method private a(Lcom/cmic/sso/sdk/auth/TokenListener;)Lcom/cmic/sso/sdk/a;
    .locals 2

    .line 427
    new-instance p0, Lcom/cmic/sso/sdk/a;

    const/16 v0, 0x40

    invoke-direct {p0, v0}, Lcom/cmic/sso/sdk/a;-><init>(I)V

    .line 428
    invoke-static {}, Lcom/cmic/sso/sdk/e/q;->c()Ljava/lang/String;

    move-result-object v0

    .line 429
    new-instance v1, Lcom/cmic/sso/sdk/d/a;

    invoke-direct {v1}, Lcom/cmic/sso/sdk/d/a;-><init>()V

    invoke-virtual {p0, v1}, Lcom/cmic/sso/sdk/a;->a(Lcom/cmic/sso/sdk/d/a;)V

    .line 430
    const-string v1, "traceId"

    invoke-virtual {p0, v1, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 432
    invoke-static {v0, p1}, Lcom/cmic/sso/sdk/e/e;->a(Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;)V

    :cond_0
    return-object p0
.end method

.method private a()V
    .locals 2

    .line 424
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "%"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/cmic/sso/sdk/e/q;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 425
    const-string v0, "generate aid = "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AuthnHelper"

    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    const-string v0, "AID"

    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Lcom/cmic/sso/sdk/a;)V
    .locals 1

    .line 435
    new-instance v0, Lcom/cmic/sso/sdk/auth/AuthnHelper$8;

    invoke-direct {v0, p0, p2, p1, p3}, Lcom/cmic/sso/sdk/auth/AuthnHelper$8;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Ljava/lang/String;Landroid/content/Context;Lcom/cmic/sso/sdk/a;)V

    invoke-static {v0}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    return-void
.end method

.method private a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V
    .locals 2

    .line 433
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a:Lcom/cmic/sso/sdk/auth/a;

    new-instance v1, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;

    invoke-direct {v1, p0, p2}, Lcom/cmic/sso/sdk/auth/AuthnHelper$5;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    invoke-virtual {v0, p1, v1}, Lcom/cmic/sso/sdk/auth/a;->a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V

    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/auth/AuthnHelper;)V
    .locals 0

    .line 434
    invoke-direct {p0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a()V

    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V
    .locals 0

    .line 422
    invoke-direct {p0, p1, p2}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    return-void
.end method

.method private declared-synchronized a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/cmic/sso/sdk/auth/TokenListener;)Z
    .locals 8

    .line 1
    const-string v0, "\u4f7f\u7528operator\u4f5c\u4e3a\u7f13\u5b58key = "

    .line 2
    .line 3
    const-string v1, "\u4f7f\u7528subId\u4f5c\u4e3a\u7f13\u5b58key = "

    .line 4
    .line 5
    const-string v2, "subId = "

    .line 6
    .line 7
    const-string v3, "umcConfigBean = "

    .line 8
    .line 9
    monitor-enter p0

    .line 10
    :try_start_0
    iget-object v4, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v4}, Lcom/cmic/sso/sdk/a/c;->a(Landroid/content/Context;)Lcom/cmic/sso/sdk/a/c;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/c;->a()Lcom/cmic/sso/sdk/a/a;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    const-string v5, "AuthnHelper"

    .line 21
    .line 22
    new-instance v6, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-static {v5, v3}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v4}, Lcom/cmic/sso/sdk/a;->a(Lcom/cmic/sso/sdk/a/a;)V

    .line 42
    .line 43
    .line 44
    const-string v3, "use2048PublicKey"

    .line 45
    .line 46
    const-string v5, "rsa2048"

    .line 47
    .line 48
    iget-object v6, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->f:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    invoke-virtual {p1, v3, v5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    const-string v3, "systemStartTime"

    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    invoke-virtual {p1, v3, v5, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;J)V

    .line 64
    .line 65
    .line 66
    const-string v3, "starttime"

    .line 67
    .line 68
    invoke-static {}, Lcom/cmic/sso/sdk/e/o;->a()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {p1, v3, v5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    const-string v3, "loginMethod"

    .line 76
    .line 77
    invoke-virtual {p1, v3, p4}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const-string p4, "appkey"

    .line 81
    .line 82
    invoke-virtual {p1, p4, p3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    const-string p4, "appid"

    .line 86
    .line 87
    invoke-virtual {p1, p4, p2}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-string p4, "timeOut"

    .line 91
    .line 92
    iget-wide v5, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 93
    .line 94
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {p1, p4, v3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p4, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {p4}, Lcom/cmic/sso/sdk/e/m;->a(Landroid/content/Context;)Z

    .line 104
    .line 105
    .line 106
    move-result p4

    .line 107
    invoke-static {}, Lcom/cmic/sso/sdk/b/a;->a()Lcom/cmic/sso/sdk/b/a;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    iget-object v5, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 112
    .line 113
    invoke-virtual {v3, v5, p4}, Lcom/cmic/sso/sdk/b/a;->a(Landroid/content/Context;Z)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Lcom/cmic/sso/sdk/e/j;->a()Lcom/cmic/sso/sdk/e/j;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v3}, Lcom/cmic/sso/sdk/e/j;->b()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {}, Lcom/cmic/sso/sdk/e/j;->a()Lcom/cmic/sso/sdk/e/j;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5}, Lcom/cmic/sso/sdk/e/j;->c()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-static {}, Lcom/cmic/sso/sdk/e/j;->a()Lcom/cmic/sso/sdk/e/j;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-virtual {v6, v5}, Lcom/cmic/sso/sdk/e/j;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    invoke-static {}, Lcom/cmic/sso/sdk/e/j;->a()Lcom/cmic/sso/sdk/e/j;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    invoke-virtual {v7, p1}, Lcom/cmic/sso/sdk/e/j;->a(Lcom/cmic/sso/sdk/a;)V

    .line 145
    .line 146
    .line 147
    const-string v7, "operator"

    .line 148
    .line 149
    invoke-virtual {p1, v7, v5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    const-string v7, "operatortype"

    .line 153
    .line 154
    invoke-virtual {p1, v7, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const-string v7, "logintype"

    .line 158
    .line 159
    invoke-virtual {p1, v7, p5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;I)V

    .line 160
    .line 161
    .line 162
    const-string p5, "AuthnHelper"

    .line 163
    .line 164
    new-instance v7, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-static {p5, v2}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result p5

    .line 183
    if-nez p5, :cond_0

    .line 184
    .line 185
    const-string p5, "AuthnHelper"

    .line 186
    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-static {p5, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    const-string p5, "scripType"

    .line 203
    .line 204
    const-string v0, "subid"

    .line 205
    .line 206
    invoke-virtual {p1, p5, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    const-string p5, "scripKey"

    .line 210
    .line 211
    invoke-virtual {p1, p5, v3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    goto :goto_0

    .line 215
    :catchall_0
    move-exception p1

    .line 216
    goto/16 :goto_3

    .line 217
    .line 218
    :cond_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result p5

    .line 222
    if-nez p5, :cond_1

    .line 223
    .line 224
    const-string p5, "AuthnHelper"

    .line 225
    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-static {p5, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    const-string p5, "scripType"

    .line 242
    .line 243
    const-string v0, "operator"

    .line 244
    .line 245
    invoke-virtual {p1, p5, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    const-string p5, "scripKey"

    .line 249
    .line 250
    invoke-virtual {p1, p5, v5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    :cond_1
    :goto_0
    iget-object p5, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 254
    .line 255
    invoke-static {p5, p4, p1}, Lcom/cmic/sso/sdk/e/m;->a(Landroid/content/Context;ZLcom/cmic/sso/sdk/a;)I

    .line 256
    .line 257
    .line 258
    move-result p5

    .line 259
    const-string v0, "networktype"

    .line 260
    .line 261
    invoke-virtual {p1, v0, p5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;I)V

    .line 262
    .line 263
    .line 264
    const/4 v0, 0x0

    .line 265
    const/4 v1, 0x0

    .line 266
    if-nez p4, :cond_2

    .line 267
    .line 268
    const-string p2, "authType"

    .line 269
    .line 270
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p3

    .line 274
    invoke-virtual {p1, p2, p3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    const-string p2, "200010"

    .line 278
    .line 279
    const-string p3, "\u65e0\u6cd5\u8bc6\u522bsim\u5361\u6216\u6ca1\u6709sim\u5361"

    .line 280
    .line 281
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    .line 283
    .line 284
    monitor-exit p0

    .line 285
    return v1

    .line 286
    :cond_2
    if-nez p6, :cond_3

    .line 287
    .line 288
    :try_start_1
    const-string p2, "102203"

    .line 289
    .line 290
    const-string p3, "listener\u4e0d\u80fd\u4e3a\u7a7a"

    .line 291
    .line 292
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 293
    .line 294
    .line 295
    monitor-exit p0

    .line 296
    return v1

    .line 297
    :cond_3
    :try_start_2
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->g()Z

    .line 298
    .line 299
    .line 300
    move-result p4

    .line 301
    if-eqz p4, :cond_4

    .line 302
    .line 303
    const-string p2, "200082"

    .line 304
    .line 305
    const-string p3, "\u670d\u52a1\u5668\u7e41\u5fd9\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 306
    .line 307
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 308
    .line 309
    .line 310
    monitor-exit p0

    .line 311
    return v1

    .line 312
    :cond_4
    if-nez p2, :cond_5

    .line 313
    .line 314
    :try_start_3
    const-string p2, ""

    .line 315
    .line 316
    goto :goto_1

    .line 317
    :cond_5
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p2

    .line 321
    :goto_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 322
    .line 323
    .line 324
    move-result p2

    .line 325
    if-eqz p2, :cond_6

    .line 326
    .line 327
    const-string p2, "102203"

    .line 328
    .line 329
    const-string p3, "appId \u4e0d\u80fd\u4e3a\u7a7a"

    .line 330
    .line 331
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 332
    .line 333
    .line 334
    monitor-exit p0

    .line 335
    return v1

    .line 336
    :cond_6
    if-nez p3, :cond_7

    .line 337
    .line 338
    :try_start_4
    const-string p2, ""

    .line 339
    .line 340
    goto :goto_2

    .line 341
    :cond_7
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    :goto_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 346
    .line 347
    .line 348
    move-result p2

    .line 349
    if-eqz p2, :cond_8

    .line 350
    .line 351
    const-string p2, "102203"

    .line 352
    .line 353
    const-string p3, "appkey\u4e0d\u80fd\u4e3a\u7a7a"

    .line 354
    .line 355
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 356
    .line 357
    .line 358
    monitor-exit p0

    .line 359
    return v1

    .line 360
    :cond_8
    if-nez p5, :cond_9

    .line 361
    .line 362
    :try_start_5
    const-string p2, "102101"

    .line 363
    .line 364
    const-string p3, "\u672a\u68c0\u6d4b\u5230\u7f51\u7edc"

    .line 365
    .line 366
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 367
    .line 368
    .line 369
    monitor-exit p0

    .line 370
    return v1

    .line 371
    :cond_9
    :try_start_6
    const-string p2, "2"

    .line 372
    .line 373
    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result p2

    .line 377
    if-eqz p2, :cond_a

    .line 378
    .line 379
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->f()Z

    .line 380
    .line 381
    .line 382
    move-result p2

    .line 383
    if-eqz p2, :cond_a

    .line 384
    .line 385
    const-string p2, "200082"

    .line 386
    .line 387
    const-string p3, "\u670d\u52a1\u5668\u7e41\u5fd9\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 388
    .line 389
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 390
    .line 391
    .line 392
    monitor-exit p0

    .line 393
    return v1

    .line 394
    :cond_a
    :try_start_7
    const-string p2, "3"

    .line 395
    .line 396
    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result p2

    .line 400
    if-eqz p2, :cond_b

    .line 401
    .line 402
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->e()Z

    .line 403
    .line 404
    .line 405
    move-result p2

    .line 406
    if-eqz p2, :cond_b

    .line 407
    .line 408
    const-string p2, "200082"

    .line 409
    .line 410
    const-string p3, "\u670d\u52a1\u5668\u7e41\u5fd9\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 411
    .line 412
    invoke-virtual {p0, p2, p3, p1, v0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 413
    .line 414
    .line 415
    monitor-exit p0

    .line 416
    return v1

    .line 417
    :cond_b
    monitor-exit p0

    .line 418
    const/4 p0, 0x1

    .line 419
    return p0

    .line 420
    :goto_3
    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 421
    throw p1
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/cmic/sso/sdk/auth/TokenListener;)Z
    .locals 0

    .line 423
    invoke-direct/range {p0 .. p6}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/cmic/sso/sdk/auth/TokenListener;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/cmic/sso/sdk/auth/AuthnHelper;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/cmic/sso/sdk/auth/AuthnHelper;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic d(Lcom/cmic/sso/sdk/auth/AuthnHelper;)Lcom/cmic/sso/sdk/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->g:Lcom/cmic/sso/sdk/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/cmic/sso/sdk/auth/AuthnHelper;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/cmic/sso/sdk/auth/AuthnHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/cmic/sso/sdk/auth/AuthnHelper;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    .line 27
    .line 28
    return-object p0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/cmic/sso/sdk/auth/AuthnHelper;
    .locals 2

    .line 29
    sget-object v0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    if-nez v0, :cond_1

    .line 30
    const-class v0, Lcom/cmic/sso/sdk/auth/AuthnHelper;

    monitor-enter v0

    .line 31
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    if-nez v1, :cond_0

    .line 32
    new-instance v1, Lcom/cmic/sso/sdk/auth/AuthnHelper;

    invoke-direct {v1, p0, p1}, Lcom/cmic/sso/sdk/auth/AuthnHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v1, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 34
    :cond_1
    :goto_2
    sget-object p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->c:Lcom/cmic/sso/sdk/auth/AuthnHelper;

    return-object p0
.end method

.method public static setDebugMode(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/c;->a(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public callBackResult(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    :try_start_0
    const-string v0, "traceId"

    .line 2
    .line 3
    invoke-virtual {p3, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/e;->a(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_4

    .line 12
    .line 13
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    :try_start_1
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/e;->c(Ljava/lang/String;)Lcom/cmic/sso/sdk/auth/TokenListener;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/e;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    :try_start_2
    const-string v0, "systemEndTime"

    .line 30
    .line 31
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    invoke-virtual {p3, v0, v2, v3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;J)V

    .line 36
    .line 37
    .line 38
    const-string v0, "endtime"

    .line 39
    .line 40
    invoke-static {}, Lcom/cmic/sso/sdk/e/o;->a()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p3, v0, v2}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-string v0, "logintype"

    .line 48
    .line 49
    invoke-virtual {p3, v0}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez p4, :cond_1

    .line 54
    .line 55
    invoke-static {p1, p2}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    :cond_1
    const/4 v2, 0x3

    .line 60
    if-ne v0, v2, :cond_2

    .line 61
    .line 62
    invoke-static {p1, p3, p4}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-object p4, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->g:Lcom/cmic/sso/sdk/c;

    .line 67
    .line 68
    invoke-virtual {p4}, Lcom/cmic/sso/sdk/c;->a()V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-static {p1, p2, p3, p4}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    :goto_0
    const-string p4, "scripExpiresIn"

    .line 77
    .line 78
    invoke-static {}, Lcom/cmic/sso/sdk/e/h;->a()J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p2, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    iget-object p4, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e:Landroid/os/Handler;

    .line 90
    .line 91
    new-instance v0, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;

    .line 92
    .line 93
    invoke-direct {v0, p0, v1, p2}, Lcom/cmic/sso/sdk/auth/AuthnHelper$6;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/auth/TokenListener;Lorg/json/JSONObject;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p4, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 97
    .line 98
    .line 99
    iget-object p2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 100
    .line 101
    invoke-static {p2}, Lcom/cmic/sso/sdk/a/c;->a(Landroid/content/Context;)Lcom/cmic/sso/sdk/a/c;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p2, p3}, Lcom/cmic/sso/sdk/a/c;->a(Lcom/cmic/sso/sdk/a;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p3}, Lcom/cmic/sso/sdk/a;->b()Lcom/cmic/sso/sdk/a/a;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/a/a;->j()Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-nez p2, :cond_3

    .line 117
    .line 118
    invoke-virtual {p3}, Lcom/cmic/sso/sdk/a;->b()Lcom/cmic/sso/sdk/a/a;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-static {p2}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a/a;)Z

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    if-nez p2, :cond_3

    .line 127
    .line 128
    iget-object p2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 129
    .line 130
    invoke-direct {p0, p2, p1, p3}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Landroid/content/Context;Ljava/lang/String;Lcom/cmic/sso/sdk/a;)V

    .line 131
    .line 132
    .line 133
    :cond_3
    invoke-static {}, Lcom/cmic/sso/sdk/e/e;->a()Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_4

    .line 138
    .line 139
    new-instance p1, Lcom/cmic/sso/sdk/auth/AuthnHelper$7;

    .line 140
    .line 141
    invoke-direct {p1, p0}, Lcom/cmic/sso/sdk/auth/AuthnHelper$7;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 149
    :try_start_4
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 150
    :cond_4
    return-void

    .line 151
    :catch_0
    move-exception p0

    .line 152
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public delScrip()V
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    :try_start_0
    invoke-static {p0, p0}, Lcom/cmic/sso/sdk/e/h;->a(ZZ)V

    .line 3
    .line 4
    .line 5
    const-string p0, "AuthnHelper"

    .line 6
    .line 7
    const-string v0, "\u5220\u9664scrip"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getNetworkType(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 7

    .line 1
    const-string v0, "AuthnHelper"

    .line 2
    .line 3
    const-string v1, "\u8fd0\u8425\u5546\u7c7b\u578b: "

    .line 4
    .line 5
    const-string v2, "\u7f51\u7edc\u7c7b\u578b: "

    .line 6
    .line 7
    new-instance v3, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/m;->a(Landroid/content/Context;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {}, Lcom/cmic/sso/sdk/b/a;->a()Lcom/cmic/sso/sdk/b/a;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v4, p1, p0}, Lcom/cmic/sso/sdk/b/a;->a(Landroid/content/Context;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/cmic/sso/sdk/e/j;->a()Lcom/cmic/sso/sdk/e/j;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const/4 v5, 0x0

    .line 30
    invoke-virtual {v4, v5}, Lcom/cmic/sso/sdk/e/j;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    new-instance v5, Lcom/cmic/sso/sdk/a;

    .line 35
    .line 36
    const/4 v6, 0x1

    .line 37
    invoke-direct {v5, v6}, Lcom/cmic/sso/sdk/a;-><init>(I)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, p0, v5}, Lcom/cmic/sso/sdk/e/m;->a(Landroid/content/Context;ZLcom/cmic/sso/sdk/a;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const-string p1, "operatortype"

    .line 45
    .line 46
    invoke-virtual {v3, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string p1, "networktype"

    .line 50
    .line 51
    new-instance v5, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v6, ""

    .line 60
    .line 61
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v3, p1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    new-instance p0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    .line 101
    return-object v3

    .line 102
    :catch_0
    :try_start_1
    const-string p0, "errorDes"

    .line 103
    .line 104
    const-string p1, "\u53d1\u751f\u672a\u77e5\u9519\u8bef"

    .line 105
    .line 106
    invoke-virtual {v3, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :catch_1
    move-exception p0

    .line 111
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 112
    .line 113
    .line 114
    :goto_0
    return-object v3
.end method

.method public getPhoneInfo(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;)V
    .locals 9

    .line 1
    invoke-direct {p0, p3}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/auth/TokenListener;)Lcom/cmic/sso/sdk/a;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    new-instance v8, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 6
    .line 7
    invoke-direct {v8, p0, v3}, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e:Landroid/os/Handler;

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 13
    .line 14
    invoke-virtual {v0, v8, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 20
    .line 21
    move-object v4, v3

    .line 22
    move-object v1, p0

    .line 23
    move-object v5, p1

    .line 24
    move-object v6, p2

    .line 25
    move-object v7, p3

    .line 26
    invoke-direct/range {v0 .. v8}, Lcom/cmic/sso/sdk/auth/AuthnHelper$4;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Landroid/content/Context;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public loginAuth(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;)V
    .locals 9

    .line 1
    invoke-direct {p0, p3}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/auth/TokenListener;)Lcom/cmic/sso/sdk/a;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    new-instance v8, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 6
    .line 7
    invoke-direct {v8, p0, v3}, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e:Landroid/os/Handler;

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 13
    .line 14
    invoke-virtual {v0, v8, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 20
    .line 21
    move-object v4, v3

    .line 22
    move-object v1, p0

    .line 23
    move-object v5, p1

    .line 24
    move-object v6, p2

    .line 25
    move-object v7, p3

    .line 26
    invoke-direct/range {v0 .. v8}, Lcom/cmic/sso/sdk/auth/AuthnHelper$2;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Landroid/content/Context;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public mobileAuth(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;)V
    .locals 9

    .line 1
    invoke-direct {p0, p3}, Lcom/cmic/sso/sdk/auth/AuthnHelper;->a(Lcom/cmic/sso/sdk/auth/TokenListener;)Lcom/cmic/sso/sdk/a;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    new-instance v8, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;

    .line 6
    .line 7
    invoke-direct {v8, p0, v3}, Lcom/cmic/sso/sdk/auth/AuthnHelper$a;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Lcom/cmic/sso/sdk/a;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->e:Landroid/os/Handler;

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 13
    .line 14
    invoke-virtual {v0, v8, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/cmic/sso/sdk/auth/AuthnHelper$3;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->b:Landroid/content/Context;

    .line 20
    .line 21
    move-object v4, v3

    .line 22
    move-object v1, p0

    .line 23
    move-object v5, p1

    .line 24
    move-object v6, p2

    .line 25
    move-object v7, p3

    .line 26
    invoke-direct/range {v0 .. v8}, Lcom/cmic/sso/sdk/auth/AuthnHelper$3;-><init>(Lcom/cmic/sso/sdk/auth/AuthnHelper;Landroid/content/Context;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/a;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/auth/TokenListener;Lcom/cmic/sso/sdk/auth/AuthnHelper$a;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setOverTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/cmic/sso/sdk/auth/AuthnHelper;->d:J

    .line 2
    .line 3
    return-void
.end method
