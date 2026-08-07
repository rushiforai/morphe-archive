.class public Ll/sim;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final n:I

.field public static o:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:[I

.field public final c:Ljava/lang/String;

.field public final d:[I

.field public final e:F

.field public final f:Z

.field public final g:I

.field public final h:Landroid/graphics/Bitmap$CompressFormat;

.field public i:Ljava/lang/String;

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x3c0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 v0, 0x5a0

    .line 9
    .line 10
    :goto_0
    sput v0, Ll/sim;->n:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 6

    .line 260
    sget v2, Ll/sim;->n:I

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v5, 0x1

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ll/sim;-><init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 6

    .line 259
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v5, 0x1

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Ll/sim;-><init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/asx;->c()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/sim;->j:I

    .line 13
    .line 14
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/asx;->b()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/sim;->k:I

    .line 23
    .line 24
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/asx;->e()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/sim;->l:I

    .line 33
    .line 34
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/asx;->d()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/sim;->m:I

    .line 43
    .line 44
    iput-object p1, p0, Ll/sim;->a:Ljava/lang/String;

    .line 45
    .line 46
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 53
    .line 54
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 58
    .line 59
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 60
    .line 61
    const/4 v4, 0x2

    .line 62
    new-array v4, v4, [I

    .line 63
    .line 64
    iput-object v4, p0, Ll/sim;->b:[I

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    aput v3, v4, v5

    .line 68
    .line 69
    aput v2, v4, v1

    .line 70
    .line 71
    invoke-virtual {p0, v0, p2, p3}, Ll/sim;->g(Landroid/graphics/BitmapFactory$Options;II)F

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iput p2, p0, Ll/sim;->e:F

    .line 76
    .line 77
    float-to-double p2, p2

    .line 78
    invoke-static {p2, p3}, Ljava/lang/Math;->log(D)D

    .line 79
    .line 80
    .line 81
    move-result-wide p2

    .line 82
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 83
    .line 84
    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    .line 85
    .line 86
    .line 87
    move-result-wide v8

    .line 88
    div-double/2addr p2, v8

    .line 89
    invoke-static {p2, p3}, Ljava/lang/Math;->floor(D)D

    .line 90
    .line 91
    .line 92
    move-result-wide p2

    .line 93
    double-to-int p2, p2

    .line 94
    int-to-double p2, p2

    .line 95
    invoke-static {v6, v7, p2, p3}, Ljava/lang/Math;->pow(DD)D

    .line 96
    .line 97
    .line 98
    move-result-wide p2

    .line 99
    double-to-int p2, p2

    .line 100
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    iput p2, p0, Ll/sim;->g:I

    .line 105
    .line 106
    :try_start_0
    new-instance p2, Landroid/media/ExifInterface;

    .line 107
    .line 108
    invoke-direct {p2, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catch_0
    move-exception p1

    .line 113
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    const/4 p2, 0x0

    .line 117
    :goto_0
    int-to-float p1, v3

    .line 118
    iget p3, p0, Ll/sim;->e:F

    .line 119
    .line 120
    div-float/2addr p1, p3

    .line 121
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    int-to-float p3, v2

    .line 126
    iget v2, p0, Ll/sim;->e:F

    .line 127
    .line 128
    div-float/2addr p3, v2

    .line 129
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 130
    .line 131
    .line 132
    move-result p3

    .line 133
    if-eqz p2, :cond_3

    .line 134
    .line 135
    const-string v2, "Orientation"

    .line 136
    .line 137
    invoke-virtual {p2, v2}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    if-eqz p2, :cond_2

    .line 142
    .line 143
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    const/4 v2, 0x6

    .line 148
    if-eq p2, v2, :cond_1

    .line 149
    .line 150
    const/16 v2, 0x8

    .line 151
    .line 152
    if-ne p2, v2, :cond_0

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_0
    filled-new-array {p1, p3}, [I

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, p0, Ll/sim;->d:[I

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_1
    :goto_1
    filled-new-array {p3, p1}, [I

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    iput-object p1, p0, Ll/sim;->d:[I

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_2
    filled-new-array {p1, p3}, [I

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iput-object p1, p0, Ll/sim;->d:[I

    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_3
    filled-new-array {p1, p3}, [I

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iput-object p1, p0, Ll/sim;->d:[I

    .line 181
    .line 182
    :goto_2
    move p2, v5

    .line 183
    :goto_3
    iget-object p1, v0, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    .line 184
    .line 185
    iput-object p1, p0, Ll/sim;->c:Ljava/lang/String;

    .line 186
    .line 187
    const-string p3, "image/jpeg"

    .line 188
    .line 189
    if-eqz p5, :cond_6

    .line 190
    .line 191
    invoke-static {}, Ll/sim;->c()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_5

    .line 196
    .line 197
    if-le p2, v1, :cond_4

    .line 198
    .line 199
    move-object v0, p3

    .line 200
    goto :goto_4

    .line 201
    :cond_4
    const-string v0, "image/webp"

    .line 202
    .line 203
    :goto_4
    iput-object v0, p0, Ll/sim;->i:Ljava/lang/String;

    .line 204
    .line 205
    goto :goto_5

    .line 206
    :cond_5
    iput-object p3, p0, Ll/sim;->i:Ljava/lang/String;

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_6
    iput-object p1, p0, Ll/sim;->i:Ljava/lang/String;

    .line 210
    .line 211
    :goto_5
    iget v0, p0, Ll/sim;->e:F

    .line 212
    .line 213
    const/high16 v2, 0x3f800000    # 1.0f

    .line 214
    .line 215
    cmpg-float v0, v0, v2

    .line 216
    .line 217
    if-gtz v0, :cond_7

    .line 218
    .line 219
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-eqz p1, :cond_7

    .line 224
    .line 225
    move v5, v1

    .line 226
    :cond_7
    iput-boolean v5, p0, Ll/sim;->f:Z

    .line 227
    .line 228
    invoke-static {}, Ll/sim;->c()Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_a

    .line 233
    .line 234
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 235
    .line 236
    if-eq p4, p1, :cond_8

    .line 237
    .line 238
    sget-object p3, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    .line 239
    .line 240
    if-eq p4, p3, :cond_8

    .line 241
    .line 242
    if-eqz p5, :cond_a

    .line 243
    .line 244
    :cond_8
    if-le p2, v1, :cond_9

    .line 245
    .line 246
    goto :goto_6

    .line 247
    :cond_9
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    .line 248
    .line 249
    :goto_6
    iput-object p1, p0, Ll/sim;->h:Landroid/graphics/Bitmap$CompressFormat;

    .line 250
    .line 251
    goto :goto_7

    .line 252
    :cond_a
    if-le p2, v1, :cond_b

    .line 253
    .line 254
    sget-object p4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 255
    .line 256
    :cond_b
    iput-object p4, p0, Ll/sim;->h:Landroid/graphics/Bitmap$CompressFormat;

    .line 257
    .line 258
    :goto_7
    return-void
.end method

.method public static a(Landroid/graphics/Bitmap;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ll/sim;->f(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static c()Z
    .locals 1

    .line 1
    sget-object v0, Ll/sim;->o:Ll/pcj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static f(I)I
    .locals 1

    .line 1
    const v0, 0x19000

    .line 2
    .line 3
    .line 4
    if-ge p0, v0, :cond_0

    .line 5
    .line 6
    const/16 p0, 0x5c

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const v0, 0x32000

    .line 10
    .line 11
    .line 12
    if-ge p0, v0, :cond_1

    .line 13
    .line 14
    const/16 p0, 0x5a

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    const v0, 0x96000

    .line 18
    .line 19
    .line 20
    if-ge p0, v0, :cond_2

    .line 21
    .line 22
    const/16 p0, 0x56

    .line 23
    .line 24
    return p0

    .line 25
    :cond_2
    const v0, 0x177000

    .line 26
    .line 27
    .line 28
    if-ge p0, v0, :cond_3

    .line 29
    .line 30
    const/16 p0, 0x54

    .line 31
    .line 32
    return p0

    .line 33
    :cond_3
    const v0, 0x1f4000

    .line 34
    .line 35
    .line 36
    if-ge p0, v0, :cond_4

    .line 37
    .line 38
    const/16 p0, 0x52

    .line 39
    .line 40
    return p0

    .line 41
    :cond_4
    const/16 p0, 0x50

    .line 42
    .line 43
    return p0
.end method

.method public static i(Ll/pcj;)V
    .locals 0
    .param p0    # Ll/pcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sput-object p0, Ll/sim;->o:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Bitmap;)I
    .locals 0

    .line 1
    invoke-static {}, Ll/sim;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ll/sim;->f(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/16 p0, 0x5f

    .line 17
    .line 18
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Ll/sim;->e(ZLl/y20;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e(ZLl/y20;)Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/sim;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ljava/io/File;

    .line 13
    .line 14
    iget-object v2, p0, Ll/sim;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/sim;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1}, Ll/q110;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    :try_start_0
    new-instance p1, Ljava/io/FileInputStream;

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 31
    .line 32
    .line 33
    :try_start_1
    invoke-static {p1, v1, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 34
    .line 35
    .line 36
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    invoke-static {p1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 38
    .line 39
    .line 40
    move-object p1, v0

    .line 41
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    move-object p0, v0

    .line 53
    move-object v1, p1

    .line 54
    goto :goto_1

    .line 55
    :catchall_1
    move-exception v0

    .line 56
    move-object p0, v0

    .line 57
    :goto_1
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 58
    .line 59
    .line 60
    throw p0

    .line 61
    :cond_1
    :goto_2
    iget-object p0, p0, Ll/sim;->a:Ljava/lang/String;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_2
    const-string v0, "cache"

    .line 65
    .line 66
    invoke-static {v0}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 71
    .line 72
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 73
    .line 74
    .line 75
    iget v3, p0, Ll/sim;->g:I

    .line 76
    .line 77
    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 78
    .line 79
    new-instance v3, Ljava/io/File;

    .line 80
    .line 81
    iget-object v4, p0, Ll/sim;->a:Ljava/lang/String;

    .line 82
    .line 83
    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    :try_start_2
    iget-object p1, p0, Ll/sim;->a:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p1}, Ll/q110;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    move-object v4, p1

    .line 95
    move-object p1, v1

    .line 96
    goto :goto_3

    .line 97
    :catchall_2
    move-exception v0

    .line 98
    move-object p0, v0

    .line 99
    goto :goto_7

    .line 100
    :cond_3
    new-instance p1, Ljava/io/FileInputStream;

    .line 101
    .line 102
    invoke-direct {p1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 103
    .line 104
    .line 105
    :try_start_3
    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 106
    .line 107
    .line 108
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 109
    move-object v4, v0

    .line 110
    :goto_3
    invoke-static {p1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 111
    .line 112
    .line 113
    new-instance v9, Landroid/graphics/Matrix;

    .line 114
    .line 115
    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v4}, Ll/sim;->b(Landroid/graphics/Bitmap;)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iget v0, p0, Ll/sim;->g:I

    .line 123
    .line 124
    int-to-float v0, v0

    .line 125
    iget v5, p0, Ll/sim;->e:F

    .line 126
    .line 127
    div-float/2addr v0, v5

    .line 128
    invoke-virtual {v9, v0, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 129
    .line 130
    .line 131
    :try_start_4
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    const/4 v10, 0x1

    .line 140
    const/4 v5, 0x0

    .line 141
    const/4 v6, 0x0

    .line 142
    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    if-eqz v5, :cond_4

    .line 151
    .line 152
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :catch_0
    move-exception v0

    .line 157
    move-object p2, v0

    .line 158
    goto :goto_5

    .line 159
    :cond_4
    :goto_4
    if-eq v0, v4, :cond_5

    .line 160
    .line 161
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_0

    .line 162
    .line 163
    .line 164
    :cond_5
    move-object v1, v0

    .line 165
    goto :goto_6

    .line 166
    :goto_5
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    :goto_6
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Ll/sim;->h:Landroid/graphics/Bitmap$CompressFormat;

    .line 173
    .line 174
    new-instance p2, Ljava/io/FileOutputStream;

    .line 175
    .line 176
    invoke-direct {p2, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, p0, p1, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 180
    .line 181
    .line 182
    const/4 p0, 0x1

    .line 183
    invoke-static {v3, v2, p0}, Ll/t7f;->a(Ljava/io/File;Ljava/io/File;Z)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    return-object p0

    .line 191
    :catchall_3
    move-exception v0

    .line 192
    move-object p0, v0

    .line 193
    move-object v1, p1

    .line 194
    :goto_7
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 195
    .line 196
    .line 197
    throw p0
.end method

.method public g(Landroid/graphics/BitmapFactory$Options;II)F
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/sim;->h(Landroid/graphics/BitmapFactory$Options;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    iget p0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 10
    .line 11
    if-eqz p0, :cond_3

    .line 12
    .line 13
    iget v1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 14
    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    const/high16 p1, 0x44340000    # 720.0f

    .line 18
    .line 19
    const/16 p2, 0x2d0

    .line 20
    .line 21
    if-le p0, v1, :cond_1

    .line 22
    .line 23
    if-gt v1, p2, :cond_0

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_0
    int-to-float p0, v1

    .line 27
    :goto_0
    div-float/2addr p1, p0

    .line 28
    return p1

    .line 29
    :cond_1
    if-gt p0, p2, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    int-to-float p0, p0

    .line 33
    goto :goto_0

    .line 34
    :cond_3
    const/4 p0, 0x1

    .line 35
    if-ne p3, p0, :cond_5

    .line 36
    .line 37
    iget p0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 38
    .line 39
    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 40
    .line 41
    if-le p0, p1, :cond_4

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_4
    move p0, p1

    .line 45
    :goto_1
    if-le p0, p2, :cond_6

    .line 46
    .line 47
    int-to-float p0, p0

    .line 48
    mul-float/2addr p0, v0

    .line 49
    int-to-float p1, p2

    .line 50
    div-float/2addr p0, p1

    .line 51
    return p0

    .line 52
    :cond_5
    iget p0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 53
    .line 54
    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 55
    .line 56
    mul-int p3, p0, p1

    .line 57
    .line 58
    mul-int/2addr p2, p2

    .line 59
    if-le p3, p2, :cond_6

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    mul-float/2addr p0, v0

    .line 63
    int-to-float p1, p1

    .line 64
    mul-float/2addr p0, p1

    .line 65
    int-to-float p1, p2

    .line 66
    div-float/2addr p0, p1

    .line 67
    float-to-double p0, p0

    .line 68
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 69
    .line 70
    .line 71
    move-result-wide p0

    .line 72
    double-to-float p0, p0

    .line 73
    return p0

    .line 74
    :cond_6
    :goto_2
    return v0
.end method

.method public final h(Landroid/graphics/BitmapFactory$Options;)Z
    .locals 4

    .line 1
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 2
    .line 3
    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 12
    .line 13
    invoke-static {v2}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    if-le v0, p1, :cond_2

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    int-to-float p1, p1

    .line 22
    div-float/2addr v0, p1

    .line 23
    iget p1, p0, Ll/sim;->k:I

    .line 24
    .line 25
    int-to-float p1, p1

    .line 26
    cmpg-float p1, v0, p1

    .line 27
    .line 28
    if-gtz p1, :cond_1

    .line 29
    .line 30
    iget p0, p0, Ll/sim;->j:I

    .line 31
    .line 32
    int-to-float p0, p0

    .line 33
    cmpl-float p0, v0, p0

    .line 34
    .line 35
    if-ltz p0, :cond_1

    .line 36
    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    return v3

    .line 40
    :cond_1
    return v1

    .line 41
    :cond_2
    int-to-float p1, p1

    .line 42
    int-to-float v0, v0

    .line 43
    div-float/2addr p1, v0

    .line 44
    iget v0, p0, Ll/sim;->l:I

    .line 45
    .line 46
    int-to-float v0, v0

    .line 47
    cmpl-float v0, p1, v0

    .line 48
    .line 49
    if-ltz v0, :cond_3

    .line 50
    .line 51
    iget p0, p0, Ll/sim;->m:I

    .line 52
    .line 53
    int-to-float p0, p0

    .line 54
    cmpg-float p0, p1, p0

    .line 55
    .line 56
    if-gtz p0, :cond_3

    .line 57
    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    return v3

    .line 61
    :cond_3
    :goto_0
    return v1
.end method
