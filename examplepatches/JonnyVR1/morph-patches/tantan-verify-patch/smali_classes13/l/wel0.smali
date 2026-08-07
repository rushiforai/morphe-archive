.class public final Ll/wel0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static o:Ljava/util/Random;


# instance fields
.field public final a:Ll/vel0;

.field public final b:J

.field public final c:Z

.field public d:Ll/e710;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:Ll/it5;

.field public m:Ll/ht5;

.field public n:Ll/tnd;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/wel0;->o:Ljava/util/Random;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/vel0;ZZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p3, -0x1

    .line 5
    iput p3, p0, Ll/wel0;->k:I

    .line 6
    .line 7
    new-instance p3, Ll/e710;

    .line 8
    .line 9
    iget-object v0, p1, Ll/vel0;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p3, v0}, Ll/e710;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p3, p0, Ll/wel0;->d:Ll/e710;

    .line 15
    .line 16
    iput-object p1, p0, Ll/wel0;->a:Ll/vel0;

    .line 17
    .line 18
    iget-wide v0, p1, Ll/vel0;->b:J

    .line 19
    .line 20
    iput-wide v0, p0, Ll/wel0;->b:J

    .line 21
    .line 22
    iput-boolean p2, p0, Ll/wel0;->c:Z

    .line 23
    .line 24
    new-instance p1, Ll/it5;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/it5;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/wel0;->l:Ll/it5;

    .line 30
    .line 31
    new-instance p1, Ll/ht5;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/ht5;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/wel0;->m:Ll/ht5;

    .line 37
    .line 38
    new-instance p1, Ll/tnd;

    .line 39
    .line 40
    invoke-direct {p1}, Ll/tnd;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/wel0;->n:Ll/tnd;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/wel0;->j()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 15

    .line 1
    const-class v1, Ll/wel0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    const-string v2, "ffmpeg"

    .line 5
    .line 6
    const-string v3, "-probesize"

    .line 7
    .line 8
    const-string v4, "32M"

    .line 9
    .line 10
    const-string v5, "-analyzeduration"

    .line 11
    .line 12
    const-string v6, "10000000"

    .line 13
    .line 14
    const-string v7, "-ss"

    .line 15
    .line 16
    move/from16 v0, p2

    .line 17
    .line 18
    int-to-long v8, v0

    .line 19
    invoke-static {v8, v9}, Ll/hmj0;->g(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    const-string v9, "-i"

    .line 24
    .line 25
    const-string v11, "-frames:v"

    .line 26
    .line 27
    const-string v12, "1"

    .line 28
    .line 29
    const-string v13, "-y"

    .line 30
    .line 31
    move-object v14, p0

    .line 32
    move-object/from16 v10, p1

    .line 33
    .line 34
    filled-new-array/range {v2 .. v14}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/google/common/collect/Lists;->m([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    new-array v2, v2, [Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    invoke-static {v2}, Lcom/p1/mobile/android/media/TTFFmpegCommand;->a([Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    monitor-exit v1

    .line 58
    return-object p0

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    move-object p0, v0

    .line 61
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    throw p0
.end method

.method public static g(Ljava/lang/String;IILjava/lang/String;)Ljava/io/File;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Landroid/util/Size;

    .line 18
    .line 19
    invoke-direct {p0, p1, p2}, Landroid/util/Size;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, p0, v2}, Ll/xwv;->a(Ljava/io/File;Landroid/util/Size;Landroid/os/CancellationSignal;)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-static {p0, p1}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    new-instance p1, Ljava/io/File;

    .line 43
    .line 44
    invoke-direct {p1, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :try_start_0
    new-instance p2, Ljava/io/FileOutputStream;

    .line 48
    .line 49
    invoke-direct {p2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 50
    .line 51
    .line 52
    :try_start_1
    sget-object p3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 53
    .line 54
    const/16 v0, 0x64

    .line 55
    .line 56
    invoke-virtual {p0, p3, v0, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 63
    .line 64
    .line 65
    return-object p1

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    move-object v2, p2

    .line 68
    goto :goto_2

    .line 69
    :catch_0
    move-exception p0

    .line 70
    goto :goto_1

    .line 71
    :catchall_1
    move-exception p0

    .line 72
    goto :goto_2

    .line 73
    :catch_1
    move-exception p0

    .line 74
    move-object p2, v2

    .line 75
    :goto_1
    :try_start_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    .line 77
    .line 78
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 79
    .line 80
    .line 81
    return-object v2

    .line 82
    :goto_2
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 83
    .line 84
    .line 85
    throw p0

    .line 86
    :cond_1
    return-object v2
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1, v0, v1}, Ll/wel0;->b(JJ)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(JJ)Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 2
    .line 3
    iget v1, v0, Ll/it5;->d:I

    .line 4
    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    const/4 v4, -0x1

    .line 8
    if-eq v1, v4, :cond_0

    .line 9
    .line 10
    iget-object v5, p0, Ll/wel0;->a:Ll/vel0;

    .line 11
    .line 12
    iget v5, v5, Ll/vel0;->c:I

    .line 13
    .line 14
    if-gt v5, v1, :cond_2

    .line 15
    .line 16
    :cond_0
    iget v0, v0, Ll/it5;->e:I

    .line 17
    .line 18
    if-eq v0, v4, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Ll/wel0;->a:Ll/vel0;

    .line 21
    .line 22
    iget v1, v1, Ll/vel0;->d:I

    .line 23
    .line 24
    if-gt v1, v0, :cond_2

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ll/wel0;->a:Ll/vel0;

    .line 27
    .line 28
    iget v1, v0, Ll/vel0;->f:I

    .line 29
    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    const-string v1, "video/mp4"

    .line 33
    .line 34
    iget-object v0, v0, Ll/vel0;->e:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    cmp-long v0, p3, v2

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Ll/wel0;->a:Ll/vel0;

    .line 47
    .line 48
    iget-object p0, p0, Ll/vel0;->a:Ljava/lang/String;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_2
    const-class v0, Ll/wel0;

    .line 52
    .line 53
    monitor-enter v0

    .line 54
    :try_start_0
    const-string v1, "mp4"

    .line 55
    .line 56
    invoke-static {v1}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v4, p0, Ll/wel0;->l:Ll/it5;

    .line 65
    .line 66
    const-wide/16 v5, 0x0

    .line 67
    .line 68
    cmp-long v7, p1, v5

    .line 69
    .line 70
    if-lez v7, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    move-wide p1, v2

    .line 74
    :goto_0
    iput-wide p1, v4, Ll/it5;->h:J

    .line 75
    .line 76
    cmp-long p1, p3, v5

    .line 77
    .line 78
    if-lez p1, :cond_4

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    move-wide p3, v2

    .line 82
    :goto_1
    iput-wide p3, v4, Ll/it5;->i:J

    .line 83
    .line 84
    invoke-static {}, Ll/kc5;->f()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    const/4 p2, 0x0

    .line 89
    if-eqz p1, :cond_6

    .line 90
    .line 91
    invoke-static {}, Ll/ucl0;->c()Ll/ucl0;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p3, p0, Ll/wel0;->a:Ll/vel0;

    .line 96
    .line 97
    iget-object p3, p3, Ll/vel0;->a:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p1, p3}, Ll/ucl0;->i(Ljava/lang/String;)Ll/ucl0;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object p3, p0, Ll/wel0;->m:Ll/ht5;

    .line 104
    .line 105
    invoke-virtual {p1, p3}, Ll/ucl0;->h(Ll/ht5;)Ll/ucl0;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1, v1}, Ll/ucl0;->g(Ljava/lang/String;)Ll/ucl0;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p3, p0, Ll/wel0;->l:Ll/it5;

    .line 114
    .line 115
    invoke-virtual {p1, p3}, Ll/ucl0;->j(Ll/it5;)Ll/ucl0;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object p3, p0, Ll/wel0;->n:Ll/tnd;

    .line 120
    .line 121
    invoke-virtual {p1, p3}, Ll/ucl0;->e(Ll/bam$e;)Ll/ucl0;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1, p2}, Ll/ucl0;->f(Z)Ll/ucl0;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Ll/ucl0;->d()Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-eqz p2, :cond_5

    .line 134
    .line 135
    const/4 p1, -0x3

    .line 136
    goto :goto_2

    .line 137
    :cond_5
    const/4 p1, -0x2

    .line 138
    :goto_2
    iput p1, p0, Ll/wel0;->k:I

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :catchall_0
    move-exception p0

    .line 142
    goto :goto_4

    .line 143
    :cond_6
    :goto_3
    if-nez p2, :cond_7

    .line 144
    .line 145
    invoke-static {}, Ll/ucl0;->c()Ll/ucl0;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iget-object p2, p0, Ll/wel0;->a:Ll/vel0;

    .line 150
    .line 151
    iget-object p2, p2, Ll/vel0;->a:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Ll/ucl0;->i(Ljava/lang/String;)Ll/ucl0;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iget-object p2, p0, Ll/wel0;->m:Ll/ht5;

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Ll/ucl0;->h(Ll/ht5;)Ll/ucl0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1, v1}, Ll/ucl0;->g(Ljava/lang/String;)Ll/ucl0;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-object p2, p0, Ll/wel0;->l:Ll/it5;

    .line 168
    .line 169
    invoke-virtual {p1, p2}, Ll/ucl0;->j(Ll/it5;)Ll/ucl0;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iget-object p0, p0, Ll/wel0;->n:Ll/tnd;

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Ll/ucl0;->e(Ll/bam$e;)Ll/ucl0;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    const/4 p1, 0x1

    .line 180
    invoke-virtual {p0, p1}, Ll/ucl0;->f(Z)Ll/ucl0;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0}, Ll/ucl0;->d()Z

    .line 185
    .line 186
    .line 187
    monitor-exit v0

    .line 188
    return-object v1

    .line 189
    :cond_7
    monitor-exit v0

    .line 190
    return-object v1

    .line 191
    :goto_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    throw p0
.end method

.method public c(I)Ljava/lang/String;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "jpg"

    .line 4
    .line 5
    invoke-static {v1}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v16

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "crop="

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v2, v0, Ll/wel0;->e:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ":"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, v0, Ll/wel0;->f:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, ":"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v2, v0, Ll/wel0;->i:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, ":"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget v2, v0, Ll/wel0;->j:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget v2, v0, Ll/wel0;->e:I

    .line 60
    .line 61
    iget v3, v0, Ll/wel0;->g:I

    .line 62
    .line 63
    if-ne v2, v3, :cond_1

    .line 64
    .line 65
    iget v2, v0, Ll/wel0;->f:I

    .line 66
    .line 67
    iget v3, v0, Ll/wel0;->h:I

    .line 68
    .line 69
    if-eq v2, v3, :cond_0

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_0
    :goto_0
    move-object v12, v1

    .line 73
    goto :goto_2

    .line 74
    :cond_1
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v1, ",scale="

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget v1, v0, Ll/wel0;->g:I

    .line 88
    .line 89
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v1, ":"

    .line 93
    .line 94
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget v1, v0, Ll/wel0;->h:I

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    goto :goto_0

    .line 107
    :goto_2
    iget-object v1, v0, Ll/wel0;->a:Ll/vel0;

    .line 108
    .line 109
    invoke-virtual {v1}, Ll/vel0;->a()V

    .line 110
    .line 111
    .line 112
    const-class v1, Ll/wel0;

    .line 113
    .line 114
    monitor-enter v1

    .line 115
    :try_start_0
    const-string v2, "ffmpeg"

    .line 116
    .line 117
    const-string v3, "-probesize"

    .line 118
    .line 119
    const-string v4, "32M"

    .line 120
    .line 121
    const-string v5, "-analyzeduration"

    .line 122
    .line 123
    const-string v6, "10000000"

    .line 124
    .line 125
    const-string v7, "-ss"

    .line 126
    .line 127
    move/from16 v8, p1

    .line 128
    .line 129
    int-to-long v8, v8

    .line 130
    invoke-static {v8, v9}, Ll/hmj0;->g(J)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    const-string v9, "-i"

    .line 135
    .line 136
    iget-object v0, v0, Ll/wel0;->a:Ll/vel0;

    .line 137
    .line 138
    iget-object v10, v0, Ll/vel0;->a:Ljava/lang/String;

    .line 139
    .line 140
    const-string v11, "-vf"

    .line 141
    .line 142
    const-string v13, "-frames:v"

    .line 143
    .line 144
    const-string v14, "1"

    .line 145
    .line 146
    const-string v15, "-y"

    .line 147
    .line 148
    filled-new-array/range {v2 .. v16}, [Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v0}, Lcom/google/common/collect/Lists;->m([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    new-array v2, v2, [Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    invoke-static {v2}, Lcom/p1/mobile/android/media/TTFFmpegCommand;->a([Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    monitor-exit v1

    .line 172
    return-object v16

    .line 173
    :catchall_0
    move-exception v0

    .line 174
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    throw v0
.end method

.method public e(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/wel0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wel0;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    if-lez p1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wel0;->a:Ll/vel0;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/vel0;->b:J

    .line 4
    .line 5
    long-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    sget-object v1, Ll/wel0;->o:Ljava/util/Random;

    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    mul-float/2addr v0, v1

    .line 23
    const/high16 v1, 0x40a00000    # 5.0f

    .line 24
    .line 25
    div-float/2addr v0, v1

    .line 26
    float-to-int v0, v0

    .line 27
    invoke-virtual {p0, v0}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wel0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public final i(II)V
    .locals 5

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Ll/wel0;->c:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iput v0, p0, Ll/wel0;->e:I

    .line 10
    .line 11
    iput v0, p0, Ll/wel0;->f:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iput p1, p0, Ll/wel0;->e:I

    .line 15
    .line 16
    iput p2, p0, Ll/wel0;->f:I

    .line 17
    .line 18
    :goto_0
    int-to-float v2, p1

    .line 19
    const/high16 v3, 0x44700000    # 960.0f

    .line 20
    .line 21
    cmpg-float v4, v2, v3

    .line 22
    .line 23
    if-gtz v4, :cond_2

    .line 24
    .line 25
    int-to-float v4, p2

    .line 26
    cmpg-float v4, v4, v3

    .line 27
    .line 28
    if-gtz v4, :cond_2

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iput v0, p0, Ll/wel0;->g:I

    .line 33
    .line 34
    iput v0, p0, Ll/wel0;->h:I

    .line 35
    .line 36
    :cond_1
    return-void

    .line 37
    :cond_2
    const/16 v0, 0x3c0

    .line 38
    .line 39
    if-eqz v1, :cond_4

    .line 40
    .line 41
    iput v0, p0, Ll/wel0;->g:I

    .line 42
    .line 43
    iput v0, p0, Ll/wel0;->h:I

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    if-le p1, p2, :cond_3

    .line 47
    .line 48
    sub-int/2addr p1, p2

    .line 49
    div-int/lit8 p1, p1, 0x2

    .line 50
    .line 51
    iput p1, p0, Ll/wel0;->i:I

    .line 52
    .line 53
    iput v0, p0, Ll/wel0;->j:I

    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    iput v0, p0, Ll/wel0;->i:I

    .line 57
    .line 58
    sub-int/2addr p2, p1

    .line 59
    div-int/lit8 p2, p2, 0x2

    .line 60
    .line 61
    iput p2, p0, Ll/wel0;->j:I

    .line 62
    .line 63
    return-void

    .line 64
    :cond_4
    int-to-float v1, p2

    .line 65
    div-float/2addr v2, v1

    .line 66
    if-le p1, p2, :cond_5

    .line 67
    .line 68
    iput v0, p0, Ll/wel0;->g:I

    .line 69
    .line 70
    div-float/2addr v3, v2

    .line 71
    float-to-int p1, v3

    .line 72
    iput p1, p0, Ll/wel0;->h:I

    .line 73
    .line 74
    return-void

    .line 75
    :cond_5
    mul-float/2addr v2, v3

    .line 76
    float-to-int p1, v2

    .line 77
    iput p1, p0, Ll/wel0;->g:I

    .line 78
    .line 79
    iput v0, p0, Ll/wel0;->h:I

    .line 80
    .line 81
    return-void
.end method

.method public final j()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/wel0;->a:Ll/vel0;

    .line 2
    .line 3
    iget v1, v0, Ll/vel0;->f:I

    .line 4
    .line 5
    const/16 v2, 0x10e

    .line 6
    .line 7
    const/16 v3, 0x5a

    .line 8
    .line 9
    if-eq v1, v3, :cond_1

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v4, p0, Ll/wel0;->m:Ll/ht5;

    .line 15
    .line 16
    iget v5, v0, Ll/vel0;->c:I

    .line 17
    .line 18
    iput v5, v4, Ll/ht5;->a:I

    .line 19
    .line 20
    iget v5, v0, Ll/vel0;->d:I

    .line 21
    .line 22
    iput v5, v4, Ll/ht5;->b:I

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    iget-object v4, p0, Ll/wel0;->m:Ll/ht5;

    .line 26
    .line 27
    iget v5, v0, Ll/vel0;->d:I

    .line 28
    .line 29
    iput v5, v4, Ll/ht5;->a:I

    .line 30
    .line 31
    iget v5, v0, Ll/vel0;->c:I

    .line 32
    .line 33
    iput v5, v4, Ll/ht5;->b:I

    .line 34
    .line 35
    :goto_1
    iget-boolean v4, p0, Ll/wel0;->c:Z

    .line 36
    .line 37
    iget-object v5, p0, Ll/wel0;->m:Ll/ht5;

    .line 38
    .line 39
    const/16 v6, 0x2d0

    .line 40
    .line 41
    if-eqz v4, :cond_3

    .line 42
    .line 43
    iget v0, v5, Ll/ht5;->a:I

    .line 44
    .line 45
    iget v1, v5, Ll/ht5;->b:I

    .line 46
    .line 47
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v1, p0, Ll/wel0;->l:Ll/it5;

    .line 52
    .line 53
    invoke-static {v0, v6}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iput v2, v1, Ll/it5;->e:I

    .line 58
    .line 59
    iput v2, v1, Ll/it5;->d:I

    .line 60
    .line 61
    iget-object v1, p0, Ll/wel0;->l:Ll/it5;

    .line 62
    .line 63
    iput v0, v1, Ll/it5;->g:I

    .line 64
    .line 65
    iput v0, v1, Ll/it5;->f:I

    .line 66
    .line 67
    iget-object v0, p0, Ll/wel0;->m:Ll/ht5;

    .line 68
    .line 69
    iget v2, v0, Ll/ht5;->a:I

    .line 70
    .line 71
    iget v0, v0, Ll/ht5;->b:I

    .line 72
    .line 73
    const/4 v3, 0x0

    .line 74
    if-le v2, v0, :cond_2

    .line 75
    .line 76
    sub-int/2addr v2, v0

    .line 77
    div-int/lit8 v2, v2, 0x2

    .line 78
    .line 79
    iput v2, v1, Ll/it5;->j:I

    .line 80
    .line 81
    iput v3, v1, Ll/it5;->k:I

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_2
    iput v3, v1, Ll/it5;->j:I

    .line 85
    .line 86
    sub-int/2addr v0, v2

    .line 87
    div-int/lit8 v0, v0, 0x2

    .line 88
    .line 89
    iput v0, v1, Ll/it5;->k:I

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_3
    iget v4, v5, Ll/ht5;->a:I

    .line 93
    .line 94
    int-to-float v7, v4

    .line 95
    iget v5, v5, Ll/ht5;->b:I

    .line 96
    .line 97
    int-to-float v8, v5

    .line 98
    div-float/2addr v7, v8

    .line 99
    iget-object v8, p0, Ll/wel0;->l:Ll/it5;

    .line 100
    .line 101
    iput v4, v8, Ll/it5;->f:I

    .line 102
    .line 103
    iput v5, v8, Ll/it5;->g:I

    .line 104
    .line 105
    const/high16 v4, 0x41000000    # 8.0f

    .line 106
    .line 107
    if-eq v1, v3, :cond_6

    .line 108
    .line 109
    if-ne v1, v2, :cond_4

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 113
    .line 114
    cmpl-float v1, v7, v1

    .line 115
    .line 116
    const/16 v2, 0x500

    .line 117
    .line 118
    if-lez v1, :cond_5

    .line 119
    .line 120
    iget v0, v0, Ll/vel0;->c:I

    .line 121
    .line 122
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    div-int/lit8 v0, v0, 0x8

    .line 127
    .line 128
    mul-int/lit8 v0, v0, 0x8

    .line 129
    .line 130
    iput v0, v8, Ll/it5;->d:I

    .line 131
    .line 132
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 133
    .line 134
    iget v1, v0, Ll/it5;->d:I

    .line 135
    .line 136
    int-to-float v1, v1

    .line 137
    div-float/2addr v1, v7

    .line 138
    div-float/2addr v1, v4

    .line 139
    float-to-int v1, v1

    .line 140
    mul-int/lit8 v1, v1, 0x8

    .line 141
    .line 142
    iput v1, v0, Ll/it5;->e:I

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_5
    iget v0, v0, Ll/vel0;->d:I

    .line 146
    .line 147
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    div-int/lit8 v0, v0, 0x8

    .line 152
    .line 153
    mul-int/lit8 v0, v0, 0x8

    .line 154
    .line 155
    iput v0, v8, Ll/it5;->e:I

    .line 156
    .line 157
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 158
    .line 159
    iget v1, v0, Ll/it5;->e:I

    .line 160
    .line 161
    int-to-float v1, v1

    .line 162
    mul-float/2addr v1, v7

    .line 163
    div-float/2addr v1, v4

    .line 164
    float-to-int v1, v1

    .line 165
    mul-int/lit8 v1, v1, 0x8

    .line 166
    .line 167
    iput v1, v0, Ll/it5;->d:I

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_6
    :goto_2
    iget v0, v0, Ll/vel0;->d:I

    .line 171
    .line 172
    invoke-static {v0, v6}, Ljava/lang/Math;->min(II)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    div-int/lit8 v0, v0, 0x8

    .line 177
    .line 178
    mul-int/lit8 v0, v0, 0x8

    .line 179
    .line 180
    iput v0, v8, Ll/it5;->d:I

    .line 181
    .line 182
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 183
    .line 184
    iget v1, v0, Ll/it5;->d:I

    .line 185
    .line 186
    int-to-float v1, v1

    .line 187
    div-float/2addr v1, v7

    .line 188
    div-float/2addr v1, v4

    .line 189
    float-to-int v1, v1

    .line 190
    mul-int/lit8 v1, v1, 0x8

    .line 191
    .line 192
    iput v1, v0, Ll/it5;->e:I

    .line 193
    .line 194
    :goto_3
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 195
    .line 196
    iget-boolean v1, p0, Ll/wel0;->c:Z

    .line 197
    .line 198
    iput-boolean v1, v0, Ll/it5;->l:Z

    .line 199
    .line 200
    iget-object v0, p0, Ll/wel0;->a:Ll/vel0;

    .line 201
    .line 202
    iget-wide v0, v0, Ll/vel0;->i:J

    .line 203
    .line 204
    const-wide/32 v2, 0x3200000

    .line 205
    .line 206
    .line 207
    sub-long/2addr v0, v2

    .line 208
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 209
    .line 210
    .line 211
    move-result-wide v0

    .line 212
    const-wide/32 v4, 0x4c4b40

    .line 213
    .line 214
    .line 215
    cmp-long v0, v0, v4

    .line 216
    .line 217
    const v1, 0x2dc6c0

    .line 218
    .line 219
    .line 220
    if-gez v0, :cond_7

    .line 221
    .line 222
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 223
    .line 224
    iput v1, v0, Ll/it5;->b:I

    .line 225
    .line 226
    goto :goto_4

    .line 227
    :cond_7
    iget-object v0, p0, Ll/wel0;->a:Ll/vel0;

    .line 228
    .line 229
    iget-wide v4, v0, Ll/vel0;->i:J

    .line 230
    .line 231
    cmp-long v2, v4, v2

    .line 232
    .line 233
    if-lez v2, :cond_8

    .line 234
    .line 235
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 236
    .line 237
    iput v1, v0, Ll/it5;->b:I

    .line 238
    .line 239
    goto :goto_4

    .line 240
    :cond_8
    iget v0, v0, Ll/vel0;->h:I

    .line 241
    .line 242
    const v1, 0x4c4b40

    .line 243
    .line 244
    .line 245
    sub-int/2addr v0, v1

    .line 246
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    const v2, 0x30d40

    .line 251
    .line 252
    .line 253
    if-ge v0, v2, :cond_9

    .line 254
    .line 255
    iget-object v0, p0, Ll/wel0;->l:Ll/it5;

    .line 256
    .line 257
    iput v1, v0, Ll/it5;->b:I

    .line 258
    .line 259
    goto :goto_4

    .line 260
    :cond_9
    iget-object v0, p0, Ll/wel0;->a:Ll/vel0;

    .line 261
    .line 262
    iget v0, v0, Ll/vel0;->h:I

    .line 263
    .line 264
    iget-object v2, p0, Ll/wel0;->l:Ll/it5;

    .line 265
    .line 266
    if-le v0, v1, :cond_a

    .line 267
    .line 268
    iput v1, v2, Ll/it5;->b:I

    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_a
    iput v0, v2, Ll/it5;->b:I

    .line 272
    .line 273
    :goto_4
    iget-object v0, p0, Ll/wel0;->m:Ll/ht5;

    .line 274
    .line 275
    iget v1, v0, Ll/ht5;->a:I

    .line 276
    .line 277
    iget v0, v0, Ll/ht5;->b:I

    .line 278
    .line 279
    invoke-virtual {p0, v1, v0}, Ll/wel0;->i(II)V

    .line 280
    .line 281
    .line 282
    iget-object p0, p0, Ll/wel0;->l:Ll/it5;

    .line 283
    .line 284
    invoke-virtual {p0}, Ll/it5;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    return-void
.end method

.method public k()[I
    .locals 1

    .line 1
    iget v0, p0, Ll/wel0;->e:I

    .line 2
    .line 3
    iget p0, p0, Ll/wel0;->f:I

    .line 4
    .line 5
    filled-new-array {v0, p0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final l()[I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wel0;->l:Ll/it5;

    .line 2
    .line 3
    iget v0, p0, Ll/it5;->d:I

    .line 4
    .line 5
    iget p0, p0, Ll/it5;->e:I

    .line 6
    .line 7
    filled-new-array {v0, p0}, [I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public m()[I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wel0;->l()[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n()[I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wel0;->l()[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
