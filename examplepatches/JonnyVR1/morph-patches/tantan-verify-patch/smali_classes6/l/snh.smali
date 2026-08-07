.class public Ll/snh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ll/snh;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/snh;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/snh;->o(Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic b(Ll/snh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/snh;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/snh;Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/io/File;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/snh;->n(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/io/File;Ljava/lang/StringBuilder;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->T:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/lang/Exception;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "downloadMedia Fail exception:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    const/16 p1, 0x32

    .line 30
    .line 31
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;FFLandroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 15

    .line 1
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v7, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-ge v3, v0, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gt v4, v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    int-to-float v1, v4

    .line 29
    int-to-float v2, v3

    .line 30
    div-float v5, v0, v2

    .line 31
    .line 32
    mul-float/2addr v5, v1

    .line 33
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    int-to-float v6, v6

    .line 38
    cmpl-float v6, v5, v6

    .line 39
    .line 40
    if-lez v6, :cond_0

    .line 41
    .line 42
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    int-to-float v5, p0

    .line 47
    div-float p0, v5, v1

    .line 48
    .line 49
    mul-float v0, v2, p0

    .line 50
    .line 51
    :cond_0
    div-float/2addr v0, v2

    .line 52
    div-float/2addr v5, v1

    .line 53
    new-instance p0, Landroid/graphics/Matrix;

    .line 54
    .line 55
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 59
    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    const/4 v6, 0x1

    .line 63
    const/4 v1, 0x0

    .line 64
    move-object v5, p0

    .line 65
    move-object/from16 v0, p3

    .line 66
    .line 67
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    :goto_0
    move v0, v7

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-le v4, v0, :cond_2

    .line 86
    .line 87
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    int-to-float p0, p0

    .line 92
    int-to-float v0, v3

    .line 93
    int-to-float v1, v4

    .line 94
    div-float/2addr p0, v1

    .line 95
    mul-float v1, v0, p0

    .line 96
    .line 97
    div-float/2addr v1, v0

    .line 98
    new-instance v5, Landroid/graphics/Matrix;

    .line 99
    .line 100
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5, v1, p0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 104
    .line 105
    .line 106
    const/4 v2, 0x0

    .line 107
    const/4 v6, 0x1

    .line 108
    const/4 v1, 0x0

    .line 109
    move-object/from16 v0, p3

    .line 110
    .line 111
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    goto :goto_0

    .line 124
    :cond_2
    int-to-float p0, v3

    .line 125
    div-float v7, p0, p1

    .line 126
    .line 127
    int-to-float p0, v4

    .line 128
    div-float p0, p0, p2

    .line 129
    .line 130
    move v0, p0

    .line 131
    move-object/from16 p0, p3

    .line 132
    .line 133
    :goto_1
    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v11

    .line 137
    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 138
    .line 139
    .line 140
    move-result v12

    .line 141
    new-instance v13, Landroid/graphics/Matrix;

    .line 142
    .line 143
    invoke-direct {v13}, Landroid/graphics/Matrix;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v13, v7, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 147
    .line 148
    .line 149
    const/4 v10, 0x0

    .line 150
    const/4 v14, 0x1

    .line 151
    const/4 v9, 0x0

    .line 152
    move-object/from16 v8, p4

    .line 153
    .line 154
    invoke-static/range {v8 .. v14}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 167
    .line 168
    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    new-instance v6, Landroid/graphics/Canvas;

    .line 173
    .line 174
    invoke-direct {v6, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 175
    .line 176
    .line 177
    const/4 v7, 0x0

    .line 178
    const/4 v8, 0x0

    .line 179
    invoke-virtual {v6, p0, v7, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 180
    .line 181
    .line 182
    sub-int/2addr v3, v1

    .line 183
    const/high16 p0, 0x41c00000    # 24.0f

    .line 184
    .line 185
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    sub-int/2addr v3, p0

    .line 190
    int-to-float p0, v3

    .line 191
    sub-int/2addr v4, v2

    .line 192
    const/high16 v1, 0x41a00000    # 20.0f

    .line 193
    .line 194
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    sub-int/2addr v4, v1

    .line 199
    int-to-float v1, v4

    .line 200
    invoke-virtual {v6, v0, p0, v1, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v6}, Landroid/graphics/Canvas;->save()I

    .line 204
    .line 205
    .line 206
    invoke-virtual {v6}, Landroid/graphics/Canvas;->restore()V

    .line 207
    .line 208
    .line 209
    return-object v5
.end method

.method public static k()Ll/snh;
    .locals 2

    .line 1
    sget-object v0, Ll/snh;->a:Ll/snh;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/snh;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/snh;->a:Ll/snh;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/snh;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/snh;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/snh;->a:Ll/snh;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

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
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/snh;->a:Ll/snh;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final g(Lcom/p1/mobile/android/app/Act;Ljava/io/File;FF)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Ll/lbc0;->L0:I

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {p1, p3, p4, v0, v1}, Ll/snh;->f(Lcom/p1/mobile/android/app/Act;FFLandroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object p3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 25
    .line 26
    const/4 p4, 0x1

    .line 27
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/snh;->p(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p0

    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/snh;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 12
    .line 13
    filled-new-array {v1}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/nnh;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nnh;-><init>(Ll/snh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/onh;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/onh;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Ll/snh;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 10

    .line 1
    const-string v0, "Tantan"

    .line 2
    .line 3
    new-instance v6, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :try_start_0
    instance-of v2, p2, Lcom/p1/mobile/putong/data/Video;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    move-object v2, p2

    .line 14
    check-cast v2, Lcom/p1/mobile/putong/data/Video;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget-object v3, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    instance-of v2, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    move-object v2, p2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget-object v3, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move-object v2, v1

    .line 45
    move-object v3, v2

    .line 46
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-nez v4, :cond_4

    .line 51
    .line 52
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_4

    .line 57
    .line 58
    const-string v4, "."

    .line 59
    .line 60
    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    const/16 v5, 0x3f

    .line 73
    .line 74
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    const/4 v7, -0x1

    .line 79
    if-ne v5, v7, :cond_2

    .line 80
    .line 81
    new-instance v5, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 87
    .line 88
    .line 89
    move-result-wide v7

    .line 90
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    goto :goto_1

    .line 101
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 107
    .line 108
    .line 109
    move-result-wide v8

    .line 110
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const/4 v8, 0x0

    .line 114
    invoke-virtual {v4, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-static {v3}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    new-instance v8, Ljava/io/File;

    .line 151
    .line 152
    invoke-direct {v8, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 156
    .line 157
    .line 158
    move-result v9

    .line 159
    if-nez v9, :cond_3

    .line 160
    .line 161
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 162
    .line 163
    .line 164
    move-result v9

    .line 165
    if-nez v9, :cond_4

    .line 166
    .line 167
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    if-eqz v8, :cond_4

    .line 172
    .line 173
    :cond_3
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :cond_4
    move-object v0, v1

    .line 204
    move-object v1, v2

    .line 205
    goto :goto_3

    .line 206
    :goto_2
    new-instance v2, Ljava/lang/Exception;

    .line 207
    .line 208
    new-instance v3, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    const-string v4, "downloadMediaWithPermission exception:"

    .line 211
    .line 212
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-direct {v2, v3, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    move-object v0, v1

    .line 233
    :goto_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    if-nez v2, :cond_6

    .line 238
    .line 239
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    if-nez v2, :cond_6

    .line 244
    .line 245
    new-instance v2, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 246
    .line 247
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 248
    .line 249
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 250
    .line 251
    .line 252
    move-result-object v3

    .line 253
    invoke-direct {v2, v3}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    new-instance v1, Ll/pnh;

    .line 265
    .line 266
    move-object v2, p0

    .line 267
    move-object v5, p1

    .line 268
    move-object v3, p2

    .line 269
    move v4, p3

    .line 270
    invoke-direct/range {v1 .. v6}, Ll/pnh;-><init>(Ll/snh;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/lang/StringBuilder;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    new-instance p1, Ll/qnh;

    .line 278
    .line 279
    invoke-direct {p1}, Ll/qnh;-><init>()V

    .line 280
    .line 281
    .line 282
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/a;->y(Ljava/lang/String;)Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    if-eqz p1, :cond_5

    .line 303
    .line 304
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->j5:I

    .line 305
    .line 306
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 307
    .line 308
    .line 309
    goto :goto_4

    .line 310
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 315
    .line 316
    .line 317
    goto :goto_4

    .line 318
    :cond_6
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->T:I

    .line 319
    .line 320
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 321
    .line 322
    .line 323
    :goto_4
    return-void
.end method

.method public final l(Landroid/graphics/Bitmap;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/snh;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/io/File;Ljava/lang/StringBuilder;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "file://"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v2, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 28
    .line 29
    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    if-eqz p3, :cond_0

    .line 38
    .line 39
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 40
    .line 41
    iget p2, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 42
    .line 43
    int-to-float p2, p2

    .line 44
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    invoke-virtual {p0, p4, p5, p2, p1}, Ll/snh;->g(Lcom/p1/mobile/android/app/Act;Ljava/io/File;FF)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 52
    .line 53
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->P:I

    .line 54
    .line 55
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 8

    .line 1
    new-instance v0, Ll/rnh;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move v4, p2

    .line 6
    move-object v5, p3

    .line 7
    move-object v7, p4

    .line 8
    move-object v2, p5

    .line 9
    move-object v6, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/rnh;-><init>(Ll/snh;Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/io/File;Ljava/lang/StringBuilder;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final p(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;Z)Z
    .locals 3

    .line 1
    const-string v0, "file://"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/snh;->l(Landroid/graphics/Bitmap;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    :try_start_0
    new-instance p0, Ljava/io/BufferedOutputStream;

    .line 12
    .line 13
    new-instance v2, Ljava/io/FileOutputStream;

    .line 14
    .line 15
    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x64

    .line 22
    .line 23
    invoke-virtual {p1, p3, v2, p0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz p4, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    const-string p0, "\u56fe\u7247\u5df2\u4fdd\u5b58\u5230\u76f8\u518c"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 47
    .line 48
    new-instance p1, Landroid/content/Intent;

    .line 49
    .line 50
    const-string p3, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 51
    .line 52
    new-instance p4, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-direct {p1, p3, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    return v1

    .line 79
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 83
    .line 84
    .line 85
    return v1
.end method
