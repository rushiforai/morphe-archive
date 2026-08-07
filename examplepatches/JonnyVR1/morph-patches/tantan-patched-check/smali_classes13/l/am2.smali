.class public Ll/am2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/am2$b;
    }
.end annotation


# static fields
.field public static final c:I

.field public static d:Ljava/io/File;

.field public static e:Ljava/io/File;


# instance fields
.field public a:Ll/rjm;

.field public b:Ll/ug50;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-int v0, v0

    .line 10
    div-int/lit8 v0, v0, 0x4

    .line 11
    .line 12
    sput v0, Ll/am2;->c:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Ll/am2;->d:Ljava/io/File;

    .line 16
    .line 17
    sput-object v0, Ll/am2;->e:Ljava/io/File;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ll/rg50;Ll/cy3;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/am2;->f(Ll/rg50;Ll/cy3;)Ll/sjm;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {v0, p1}, Ll/f9j;->c(Landroid/content/Context;Ll/sjm;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception p1

    .line 15
    const-class p2, Ljava/io/EOFException;

    .line 16
    .line 17
    invoke-static {p1, p2}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-static {}, Ll/f9j;->a()Ll/rjm;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/am2;->a:Ll/rjm;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    throw p1
.end method

.method public static synthetic a(Ll/npy;)Ll/npy;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static bridge synthetic b()Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-static {}, Ll/am2;->k()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public static k()Ljava/lang/Throwable;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Throwable;

    .line 2
    .line 3
    const-string v1, "imageinfo is null"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public final c(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .locals 1

    .line 1
    const-string p0, "file://"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->z(Z)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public d(I)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "System Callback level:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "low_memory_callback"

    .line 16
    .line 17
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 21
    .line 22
    invoke-static {p0}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const/16 p0, 0x28

    .line 29
    .line 30
    if-lt p1, p0, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/f9j;->a()Ll/rjm;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/rjm;->c()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const/16 p0, 0x3c

    .line 41
    .line 42
    if-ge p1, p0, :cond_2

    .line 43
    .line 44
    const/16 p0, 0xf

    .line 45
    .line 46
    if-ne p1, p0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-void

    .line 50
    :cond_2
    :goto_0
    invoke-static {}, Ll/f9j;->a()Ll/rjm;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/rjm;->c()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public e(Ll/rg50;)Ll/ug50;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final f(Ll/rg50;Ll/cy3;)Ll/sjm;
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    sget v1, Ll/am2;->c:I

    .line 2
    .line 3
    new-instance v0, Ll/npy;

    .line 4
    .line 5
    const v4, 0x7fffffff

    .line 6
    .line 7
    .line 8
    const v5, 0x7fffffff

    .line 9
    .line 10
    .line 11
    const v2, 0x7fffffff

    .line 12
    .line 13
    .line 14
    const v3, 0x7fffffff

    .line 15
    .line 16
    .line 17
    invoke-direct/range {v0 .. v5}, Ll/npy;-><init>(IIIII)V

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 27
    .line 28
    invoke-static {v2}, Ll/b4e;->m(Landroid/content/Context;)Ll/b4e$b;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2, v1}, Ll/b4e$b;->p(Ljava/io/File;)Ll/b4e$b;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v3, "imagepipeline_cache_small"

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ll/b4e$b;->o(Ljava/lang/String;)Ll/b4e$b;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-wide/32 v4, 0x2800000

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v4, v5}, Ll/b4e$b;->q(J)Ll/b4e$b;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-wide/32 v4, 0x1400000

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v4, v5}, Ll/b4e$b;->r(J)Ll/b4e$b;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-wide/32 v4, 0x500000

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v4, v5}, Ll/b4e$b;->s(J)Ll/b4e$b;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ll/b4e$b;->n()Ll/b4e;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    new-instance v4, Ljava/io/File;

    .line 68
    .line 69
    invoke-direct {v4, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sput-object v4, Ll/am2;->e:Ljava/io/File;

    .line 73
    .line 74
    invoke-static {}, Ll/oki;->n()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_0

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 81
    .line 82
    invoke-virtual {v1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    goto :goto_0

    .line 87
    :cond_0
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    :goto_0
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 94
    .line 95
    invoke-static {v3}, Ll/b4e;->m(Landroid/content/Context;)Ll/b4e$b;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3, v1}, Ll/b4e$b;->p(Ljava/io/File;)Ll/b4e$b;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    const-string v4, "imagepipeline_cache"

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Ll/b4e$b;->o(Ljava/lang/String;)Ll/b4e$b;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    const-wide/32 v5, 0x4b00000

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, v5, v6}, Ll/b4e$b;->q(J)Ll/b4e$b;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const-wide/32 v5, 0x1e00000

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3, v5, v6}, Ll/b4e$b;->r(J)Ll/b4e$b;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    const-wide/32 v5, 0xf00000

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3, v5, v6}, Ll/b4e$b;->s(J)Ll/b4e$b;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v3}, Ll/b4e$b;->n()Ll/b4e;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    new-instance v5, Ljava/io/File;

    .line 135
    .line 136
    invoke-direct {v5, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sput-object v5, Ll/am2;->d:Ljava/io/File;

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ll/am2;->e(Ll/rg50;)Ll/ug50;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Ll/am2;->b:Ll/ug50;

    .line 146
    .line 147
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 148
    .line 149
    invoke-static {p1}, Ll/sjm;->K(Landroid/content/Context;)Ll/sjm$a;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    new-instance v1, Ll/yl2;

    .line 154
    .line 155
    invoke-direct {v1, v0}, Ll/yl2;-><init>(Ll/npy;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1, v1}, Ll/sjm$a;->Q(Ll/a7h0;)Ll/sjm$a;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1, p2}, Ll/sjm$a;->S(Ll/cy3;)Ll/sjm$a;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1, v3}, Ll/sjm$a;->X(Ll/b4e;)Ll/sjm$a;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    const/4 p2, 0x1

    .line 171
    invoke-virtual {p1, p2}, Ll/sjm$a;->T(Z)Ll/sjm$a;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    new-instance v0, Ll/pod;

    .line 176
    .line 177
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {v1}, Ljava/lang/Runtime;->availableProcessors()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    const/4 v3, 0x2

    .line 186
    div-int/2addr v1, v3

    .line 187
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    invoke-direct {v0, v1}, Ll/pod;-><init>(I)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, v0}, Ll/sjm$a;->W(Ll/d7f;)Ll/sjm$a;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1, v2}, Ll/sjm$a;->a0(Ll/b4e;)Ll/sjm$a;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iget-object p0, p0, Ll/am2;->b:Ll/ug50;

    .line 203
    .line 204
    invoke-virtual {p1, p0}, Ll/sjm$a;->Z(Ll/vj20;)Ll/sjm$a;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {}, Ll/gt40;->b()Ll/gt40;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    new-instance v0, Ll/zl2;

    .line 213
    .line 214
    invoke-direct {v0}, Ll/zl2;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-interface {p1, v0}, Ll/gqy;->a(Ll/fqy;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0, p1}, Ll/sjm$a;->Y(Ll/gqy;)Ll/sjm$a;

    .line 221
    .line 222
    .line 223
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 224
    .line 225
    invoke-static {p1}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_1

    .line 230
    .line 231
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 232
    .line 233
    const-string v0, "activity"

    .line 234
    .line 235
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    check-cast p1, Landroid/app/ActivityManager;

    .line 240
    .line 241
    invoke-static {p1}, Ll/cgw;->c(Landroid/app/ActivityManager;)Ll/a7h0;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p0, v0}, Ll/sjm$a;->Q(Ll/a7h0;)Ll/sjm$a;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-static {p1}, Ll/cgw;->d(Landroid/app/ActivityManager;)Ll/a7h0;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-virtual {v0, p1}, Ll/sjm$a;->V(Ll/a7h0;)Ll/sjm$a;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 258
    .line 259
    invoke-virtual {p1, v0}, Ll/sjm$a;->R(Landroid/graphics/Bitmap$Config;)Ll/sjm$a;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-virtual {p1, p2}, Ll/sjm$a;->T(Z)Ll/sjm$a;

    .line 264
    .line 265
    .line 266
    :cond_1
    invoke-virtual {p0}, Ll/sjm$a;->a()Ll/sjm;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    return-object p0
.end method

.method public g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/am2;->h(Lcom/facebook/drawee/view/DraweeView;Z)Ll/lq70;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public h(Lcom/facebook/drawee/view/DraweeView;Z)Ll/lq70;
    .locals 0

    .line 1
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/lq70;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->z(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/lq70;

    .line 20
    .line 21
    return-object p0
.end method

.method public i(Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/am2;->a:Ll/rjm;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 12
    .line 13
    invoke-virtual {v0, p1, v1}, Ll/rjm;->k(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/am2$a;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2}, Ll/am2$a;-><init>(Ll/am2;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/f94;->k()Ll/f94;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p1, v0, p0}, Ll/i6c;->f(Ll/s6c;Ljava/util/concurrent/Executor;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rjm;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l()Ll/xlj;
    .locals 1

    .line 1
    new-instance p0, Ll/xlj;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public m(Ll/x1d0;)Ll/ry3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/am2;->b:Ll/ug50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ug50;->l()Ll/rg50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/am2;->c(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-static {p1}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-static {p1}, Ll/cgw;->f(Landroid/content/Context;)Ll/q3d0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-object p0
.end method

.method public o(Lcom/facebook/drawee/view/DraweeView;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/am2;->b:Ll/ug50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ug50;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
