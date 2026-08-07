.class public Lcom/xiaomi/push/service/p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/xiaomi/push/service/p;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/xiaomi/push/service/p;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/xiaomi/push/service/p;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/xiaomi/push/service/p;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/xiaomi/push/service/p;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/xiaomi/push/service/p;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput p7, p0, Lcom/xiaomi/push/service/p;->a:I

    .line 17
    .line 18
    return-void
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 299
    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x0

    .line 300
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    const-string p0, "ro.miui.region"

    invoke-static {p0}, Ll/l4r0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 302
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    const-string p0, "ro.product.locale.region"

    invoke-static {p0}, Ll/l4r0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0

    .line 304
    :cond_1
    invoke-static {}, Ll/l4r0;->n()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a()Z
    .locals 3

    .line 296
    :try_start_0
    const-string v0, "miui.os.Build"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ll/t5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 297
    const-string v2, "IS_ALPHA_BUILD"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 298
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 v0, 0x0

    return v0
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1

    .line 294
    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 295
    invoke-static {}, Lcom/xiaomi/push/service/p;->a()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static b(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "com.xiaomi.xmsf"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/am$b;
    .locals 3

    .line 292
    new-instance v0, Lcom/xiaomi/push/service/am$b;

    invoke-direct {v0, p1}, Lcom/xiaomi/push/service/am$b;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    .line 293
    invoke-virtual {p1}, Lcom/xiaomi/push/service/XMPushService;->b()Lcom/xiaomi/push/service/h;

    move-result-object v1

    const-string v2, "c"

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/xiaomi/push/service/p;->a(Lcom/xiaomi/push/service/am$b;Landroid/content/Context;Lcom/xiaomi/push/service/h;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    return-object v0
.end method

.method public a(Lcom/xiaomi/push/service/am$b;Landroid/content/Context;Lcom/xiaomi/push/service/h;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/xiaomi/push/service/p;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/xiaomi/push/service/p;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/xiaomi/push/service/p;->b:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->c:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "5"

    .line 20
    .line 21
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "XMPUSH-PASS"

    .line 24
    .line 25
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p1, Lcom/xiaomi/push/service/am$b;->a:Z

    .line 29
    .line 30
    new-instance v0, Ll/w5r0$a;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/w5r0$a;-><init>()V

    .line 33
    .line 34
    .line 35
    const/16 v1, 0x30

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "sdk_ver"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "cpvn"

    .line 48
    .line 49
    const-string v3, "5_9_9-C"

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const v2, 0xc6dd

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "cpvc"

    .line 63
    .line 64
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {p2}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/b;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2}, Lcom/xiaomi/push/service/b;->b()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const-string v3, "country_code"

    .line 77
    .line 78
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {p2}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/b;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Lcom/xiaomi/push/service/b;->a()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    const-string v3, "region"

    .line 91
    .line 92
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v2, "miui_vn"

    .line 97
    .line 98
    invoke-static {}, Ll/l4r0;->q()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v1, v2, v3}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {p2}, Ll/l4r0;->b(Landroid/content/Context;)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    const-string v3, "miui_vc"

    .line 115
    .line 116
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const-string v2, "com.xiaomi.xmsf"

    .line 121
    .line 122
    invoke-static {p2, v2}, Lcom/xiaomi/push/g;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    const-string v3, "xmsf_vc"

    .line 131
    .line 132
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 137
    .line 138
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    const-string v3, "android_ver"

    .line 143
    .line 144
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-static {p2}, Lcom/xiaomi/push/service/af;->a(Landroid/content/Context;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    const-string v3, "n_belong_to_app"

    .line 157
    .line 158
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-static {p2}, Lcom/xiaomi/push/g;->a(Landroid/content/Context;)I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    const-string v3, "systemui_vc"

    .line 171
    .line 172
    invoke-virtual {v1, v3, v2}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 173
    .line 174
    .line 175
    invoke-static {p2}, Lcom/xiaomi/push/service/p;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    if-nez v2, :cond_0

    .line 184
    .line 185
    const-string v2, "latest_country_code"

    .line 186
    .line 187
    invoke-virtual {v0, v2, v1}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 188
    .line 189
    .line 190
    :cond_0
    invoke-static {}, Ll/l4r0;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    if-nez v2, :cond_1

    .line 199
    .line 200
    const-string v2, "device_ch"

    .line 201
    .line 202
    invoke-virtual {v0, v2, v1}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 203
    .line 204
    .line 205
    :cond_1
    invoke-static {}, Ll/l4r0;->u()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    if-nez v2, :cond_2

    .line 214
    .line 215
    const-string v2, "device_mfr"

    .line 216
    .line 217
    invoke-virtual {v0, v2, v1}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 218
    .line 219
    .line 220
    :cond_2
    invoke-virtual {v0}, Ll/w5r0$a;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iput-object v0, p1, Lcom/xiaomi/push/service/am$b;->e:Ljava/lang/String;

    .line 225
    .line 226
    invoke-static {p2}, Lcom/xiaomi/push/service/p;->b(Landroid/content/Context;)Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-eqz v0, :cond_3

    .line 231
    .line 232
    const-string p0, "1000271"

    .line 233
    .line 234
    goto :goto_0

    .line 235
    :cond_3
    iget-object p0, p0, Lcom/xiaomi/push/service/p;->d:Ljava/lang/String;

    .line 236
    .line 237
    :goto_0
    new-instance v0, Ll/w5r0$a;

    .line 238
    .line 239
    invoke-direct {v0}, Ll/w5r0$a;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string v1, "appid"

    .line 243
    .line 244
    invoke-virtual {v0, v1, p0}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    const-string v2, "locale"

    .line 257
    .line 258
    invoke-virtual {p0, v2, v1}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    const/4 v1, 0x1

    .line 263
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    const-string v2, "sync"

    .line 268
    .line 269
    invoke-virtual {p0, v2, v1}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 270
    .line 271
    .line 272
    invoke-static {p2}, Lcom/xiaomi/push/service/p;->a(Landroid/content/Context;)Z

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    if-eqz p0, :cond_4

    .line 277
    .line 278
    const-string p0, "ab"

    .line 279
    .line 280
    invoke-virtual {v0, p0, p4}, Ll/w5r0$a;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/w5r0$a;

    .line 281
    .line 282
    .line 283
    :cond_4
    invoke-virtual {v0}, Ll/w5r0$a;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    iput-object p0, p1, Lcom/xiaomi/push/service/am$b;->f:Ljava/lang/String;

    .line 288
    .line 289
    iput-object p3, p1, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/h;

    .line 290
    .line 291
    return-object p1
.end method
