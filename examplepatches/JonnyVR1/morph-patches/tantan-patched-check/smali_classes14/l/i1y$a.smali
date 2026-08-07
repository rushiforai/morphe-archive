.class public Ll/i1y$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i1y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/data/Media;",
        ">;>;",
        "Ll/kcg0;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Z

.field public final c:Ljava/lang/String;

.field public d:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public e:I

.field public f:I

.field public g:Landroid/graphics/Bitmap$CompressFormat;

.field public h:Z

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;ZII",
            "Landroid/graphics/Bitmap$CompressFormat;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move v6, p6

    move-object/from16 v7, p7

    .line 32
    invoke-direct/range {v0 .. v8}, Ll/i1y$a;-><init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;ZII",
            "Landroid/graphics/Bitmap$CompressFormat;",
            "Z",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    .line 33
    invoke-direct/range {v0 .. v9}, Ll/i1y$a;-><init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;ZII",
            "Landroid/graphics/Bitmap$CompressFormat;",
            "Z",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/i1y$a;->b:Z

    .line 5
    .line 6
    iput p3, p0, Ll/i1y$a;->e:I

    .line 7
    .line 8
    iput p4, p0, Ll/i1y$a;->f:I

    .line 9
    .line 10
    iput-object p5, p0, Ll/i1y$a;->g:Landroid/graphics/Bitmap$CompressFormat;

    .line 11
    .line 12
    iput-boolean p6, p0, Ll/i1y$a;->h:Z

    .line 13
    .line 14
    iput-object p7, p0, Ll/i1y$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    :goto_0
    iput-object p1, p0, Ll/i1y$a;->a:Ljava/util/List;

    .line 25
    .line 26
    iput-boolean p8, p0, Ll/i1y$a;->i:Z

    .line 27
    .line 28
    iput-boolean p9, p0, Ll/i1y$a;->j:Z

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZLjava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 34
    sget v3, Ll/sim;->n:I

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v6, 0x1

    const/4 v8, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v8}, Ll/i1y$a;-><init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZLjava/lang/String;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 31
    sget v3, Ll/sim;->n:I

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v6, 0x1

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v7, p3

    move v8, p4

    invoke-direct/range {v0 .. v8}, Ll/i1y$a;-><init>(Ljava/util/List;ZIILandroid/graphics/Bitmap$CompressFormat;ZLjava/lang/String;Z)V

    return-void
.end method

.method public static synthetic a(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->R:Ll/s5m;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ll/s5m;->a(Landroid/graphics/Bitmap;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/c;->toBlocking()Ll/o43;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/o43;->b()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/bkj0;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "\u56fe\u7247\u6821\u9a8c\u4fe1\u606f: hit tags:"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Ljava/util/Collection;

    .line 27
    .line 28
    const-string v2, ","

    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, "\n \u8be6\u7ec6\u4fe1\u606f: "

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "[putong-common][media_process]"

    .line 54
    .line 55
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_0

    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 70
    .line 71
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast p0, Ljava/util/Collection;

    .line 74
    .line 75
    invoke-static {p0, v2}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v2, "\u56fe\u7247\u6821\u9a8c\u4fe1\u606f\u4e0d\u901a\u8fc7: hit tags:"

    .line 82
    .line 83
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/safety/IllegalPictureException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v0
.end method


# virtual methods
.method public b(Ll/gcg0;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/i1y$a;->d:Ll/gcg0;

    .line 6
    .line 7
    if-nez v2, :cond_19

    .line 8
    .line 9
    iput-object v0, v1, Ll/i1y$a;->d:Ll/gcg0;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, v1, Ll/i1y$a;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v3, 0x0

    .line 21
    move v4, v3

    .line 22
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const-string v6, "preprocessed"

    .line 27
    .line 28
    const-string v7, "raw"

    .line 29
    .line 30
    const-wide/16 v8, 0x0

    .line 31
    .line 32
    const/4 v10, 0x1

    .line 33
    if-eqz v5, :cond_5

    .line 34
    .line 35
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    iget-object v11, v5, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 42
    .line 43
    invoke-static {v11, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-eqz v7, :cond_3

    .line 48
    .line 49
    instance-of v7, v5, Lcom/p1/mobile/putong/data/Audio;

    .line 50
    .line 51
    if-eqz v7, :cond_1

    .line 52
    .line 53
    invoke-static {v6}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    iput-object v6, v5, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Video;

    .line 61
    .line 62
    if-eqz v6, :cond_2

    .line 63
    .line 64
    :goto_1
    move v4, v10

    .line 65
    goto :goto_0

    .line 66
    :cond_2
    instance-of v5, v5, Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    if-eqz v5, :cond_0

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Video;

    .line 72
    .line 73
    if-nez v6, :cond_4

    .line 74
    .line 75
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    if-eqz v6, :cond_0

    .line 78
    .line 79
    :cond_4
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v6, :cond_0

    .line 82
    .line 83
    const-string v7, "http"

    .line 84
    .line 85
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    if-nez v6, :cond_0

    .line 90
    .line 91
    iget-wide v6, v5, Lcom/p1/mobile/putong/data/Media;->mediaFileLength:J

    .line 92
    .line 93
    cmp-long v6, v6, v8

    .line 94
    .line 95
    if-gtz v6, :cond_0

    .line 96
    .line 97
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v6}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    invoke-static {v6}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->u(Ljava/lang/String;)J

    .line 104
    .line 105
    .line 106
    move-result-wide v6

    .line 107
    iput-wide v6, v5, Lcom/p1/mobile/putong/data/Media;->mediaFileLength:J

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_5
    iget-object v2, v1, Ll/i1y$a;->a:Ljava/util/List;

    .line 111
    .line 112
    if-eqz v4, :cond_18

    .line 113
    .line 114
    :try_start_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :cond_6
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_16

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 129
    .line 130
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 131
    .line 132
    invoke-static {v4, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    if-eqz v4, :cond_6

    .line 137
    .line 138
    instance-of v4, v2, Lcom/p1/mobile/putong/data/Audio;

    .line 139
    .line 140
    if-eqz v4, :cond_7

    .line 141
    .line 142
    goto/16 :goto_9

    .line 143
    .line 144
    :cond_7
    instance-of v4, v2, Lcom/p1/mobile/putong/data/Video;

    .line 145
    .line 146
    if-eqz v4, :cond_12

    .line 147
    .line 148
    iget-wide v4, v2, Lcom/p1/mobile/putong/data/Media;->processStartTime:J

    .line 149
    .line 150
    cmp-long v4, v4, v8

    .line 151
    .line 152
    if-gtz v4, :cond_8

    .line 153
    .line 154
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 155
    .line 156
    .line 157
    move-result-wide v4

    .line 158
    iput-wide v4, v2, Lcom/p1/mobile/putong/data/Media;->processStartTime:J

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :catch_0
    move-exception v0

    .line 162
    goto/16 :goto_a

    .line 163
    .line 164
    :cond_8
    :goto_3
    move-object v4, v2

    .line 165
    check-cast v4, Lcom/p1/mobile/putong/data/Video;

    .line 166
    .line 167
    const-string v5, "video/mp4"

    .line 168
    .line 169
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 170
    .line 171
    new-instance v5, Ll/vel0;

    .line 172
    .line 173
    iget-object v11, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {v11}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v11

    .line 179
    invoke-direct {v5, v11}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget v11, v5, Ll/vel0;->c:I

    .line 183
    .line 184
    iget v12, v5, Ll/vel0;->d:I

    .line 185
    .line 186
    mul-int/2addr v11, v12

    .line 187
    invoke-static {}, Ll/i1y;->a()I

    .line 188
    .line 189
    .line 190
    move-result v12

    .line 191
    sub-int/2addr v11, v12

    .line 192
    const v12, 0xf4240

    .line 193
    .line 194
    .line 195
    if-ge v11, v12, :cond_11

    .line 196
    .line 197
    new-instance v11, Ll/wel0;

    .line 198
    .line 199
    iget-boolean v12, v1, Ll/i1y$a;->b:Z

    .line 200
    .line 201
    invoke-direct {v11, v5, v12, v3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 202
    .line 203
    .line 204
    iget-wide v12, v11, Ll/wel0;->b:J

    .line 205
    .line 206
    const-wide/16 v14, 0x3e8

    .line 207
    .line 208
    div-long/2addr v12, v14

    .line 209
    long-to-float v5, v12

    .line 210
    iput v5, v4, Lcom/p1/mobile/putong/data/Video;->duration:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .line 212
    :try_start_1
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 213
    .line 214
    if-eqz v5, :cond_9

    .line 215
    .line 216
    iget-wide v12, v5, Lcom/p1/mobile/putong/data/CuttingData;->start:J

    .line 217
    .line 218
    iget-wide v14, v5, Lcom/p1/mobile/putong/data/CuttingData;->end:J

    .line 219
    .line 220
    invoke-virtual {v11, v12, v13, v14, v15}, Ll/wel0;->b(JJ)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    invoke-static {v5}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 229
    .line 230
    goto :goto_4

    .line 231
    :catch_1
    move-exception v0

    .line 232
    goto/16 :goto_7

    .line 233
    .line 234
    :cond_9
    invoke-virtual {v11}, Ll/wel0;->a()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v5

    .line 238
    invoke-static {v5}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_1
    .catch Lcom/p1/mobile/android/media/TTFFmpegCommand$FFmpegCommandException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 243
    .line 244
    :goto_4
    :try_start_2
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 245
    .line 246
    if-eqz v5, :cond_a

    .line 247
    .line 248
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz v5, :cond_a

    .line 251
    .line 252
    new-instance v5, Ljava/io/File;

    .line 253
    .line 254
    iget-object v12, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 255
    .line 256
    iget-object v12, v12, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 257
    .line 258
    invoke-static {v12}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v12

    .line 262
    invoke-direct {v5, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    if-nez v5, :cond_d

    .line 270
    .line 271
    :cond_a
    new-instance v5, Lcom/p1/mobile/putong/data/Picture;

    .line 272
    .line 273
    invoke-direct {v5}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 274
    .line 275
    .line 276
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 277
    .line 278
    :try_start_3
    iget-object v12, v4, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 279
    .line 280
    if-eqz v12, :cond_b

    .line 281
    .line 282
    iget-wide v12, v12, Lcom/p1/mobile/putong/data/CuttingData;->start:J

    .line 283
    .line 284
    long-to-int v12, v12

    .line 285
    invoke-virtual {v11, v12}, Ll/wel0;->e(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v12

    .line 289
    invoke-static {v12}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v12

    .line 293
    iput-object v12, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 294
    .line 295
    goto :goto_5

    .line 296
    :catch_2
    move-exception v0

    .line 297
    goto/16 :goto_6

    .line 298
    .line 299
    :cond_b
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {v11}, Ll/wel0;->k()[I

    .line 302
    .line 303
    .line 304
    move-result-object v12

    .line 305
    aget v12, v12, v3

    .line 306
    .line 307
    invoke-virtual {v11}, Ll/wel0;->k()[I

    .line 308
    .line 309
    .line 310
    move-result-object v13

    .line 311
    aget v13, v13, v10

    .line 312
    .line 313
    invoke-static {v4}, Ll/l7y;->f(Lcom/p1/mobile/putong/data/Video;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v14

    .line 317
    invoke-static {v5, v12, v13, v14}, Ll/wel0;->g(Ljava/lang/String;IILjava/lang/String;)Ljava/io/File;

    .line 318
    .line 319
    .line 320
    move-result-object v5

    .line 321
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result v12
    :try_end_3
    .catch Lcom/p1/mobile/android/media/TTFFmpegCommand$FFmpegCommandException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 325
    iget-object v13, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 326
    .line 327
    if-eqz v12, :cond_c

    .line 328
    .line 329
    :try_start_4
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    invoke-static {v5}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v5

    .line 337
    iput-object v5, v13, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 338
    .line 339
    goto :goto_5

    .line 340
    :cond_c
    invoke-virtual {v11, v3}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v5

    .line 344
    invoke-static {v5}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v5

    .line 348
    iput-object v5, v13, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_4
    .catch Lcom/p1/mobile/android/media/TTFFmpegCommand$FFmpegCommandException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 349
    .line 350
    :goto_5
    :try_start_5
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 351
    .line 352
    new-instance v12, Lcom/p1/mobile/putong/data/Dimension;

    .line 353
    .line 354
    invoke-virtual {v11}, Ll/wel0;->k()[I

    .line 355
    .line 356
    .line 357
    move-result-object v13

    .line 358
    invoke-direct {v12, v13}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 359
    .line 360
    .line 361
    iput-object v12, v5, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 362
    .line 363
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 364
    .line 365
    const-string v12, "image/jpeg"

    .line 366
    .line 367
    iput-object v12, v5, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 368
    .line 369
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 370
    .line 371
    iget-object v12, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 372
    .line 373
    invoke-virtual {v5, v12}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    :cond_d
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 377
    .line 378
    iget-object v12, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 379
    .line 380
    iput-object v12, v5, Lcom/p1/mobile/putong/data/Media;->tempUrl:Ljava/lang/String;

    .line 381
    .line 382
    iget-object v5, v1, Ll/i1y$a;->d:Ll/gcg0;

    .line 383
    .line 384
    if-eqz v5, :cond_e

    .line 385
    .line 386
    iget-object v12, v1, Ll/i1y$a;->a:Ljava/util/List;

    .line 387
    .line 388
    invoke-interface {v5, v12}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 389
    .line 390
    .line 391
    :cond_e
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 392
    .line 393
    .line 394
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 395
    .line 396
    invoke-static {v5}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v5

    .line 400
    invoke-static {v5}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->u(Ljava/lang/String;)J

    .line 401
    .line 402
    .line 403
    move-result-wide v12

    .line 404
    iput-wide v12, v4, Lcom/p1/mobile/putong/data/Media;->mediaFileLength:J

    .line 405
    .line 406
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 407
    .line 408
    .line 409
    move-result-wide v12

    .line 410
    iput-wide v12, v4, Lcom/p1/mobile/putong/data/Media;->processEndTime:J

    .line 411
    .line 412
    new-instance v5, Lcom/p1/mobile/putong/data/Dimension;

    .line 413
    .line 414
    invoke-virtual {v11}, Ll/wel0;->n()[I

    .line 415
    .line 416
    .line 417
    move-result-object v12

    .line 418
    invoke-direct {v5, v12}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 419
    .line 420
    .line 421
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 422
    .line 423
    invoke-virtual {v11}, Ll/wel0;->h()I

    .line 424
    .line 425
    .line 426
    move-result v5

    .line 427
    iput v5, v4, Lcom/p1/mobile/putong/data/Media;->compressType:I

    .line 428
    .line 429
    goto/16 :goto_9

    .line 430
    .line 431
    :goto_6
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 432
    .line 433
    .line 434
    new-instance v2, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$GetVideoFrameException;

    .line 435
    .line 436
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v3

    .line 440
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-direct {v2, v3, v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$GetVideoFrameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 445
    .line 446
    .line 447
    throw v2

    .line 448
    :goto_7
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 449
    .line 450
    .line 451
    iget-object v2, v1, Ll/i1y$a;->c:Ljava/lang/String;

    .line 452
    .line 453
    if-eqz v2, :cond_f

    .line 454
    .line 455
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 456
    .line 457
    invoke-interface {v2}, Ll/bn5;->signedIn_()Z

    .line 458
    .line 459
    .line 460
    move-result v2

    .line 461
    if-eqz v2, :cond_10

    .line 462
    .line 463
    iget-object v2, v1, Ll/i1y$a;->c:Ljava/lang/String;

    .line 464
    .line 465
    sget-object v3, Ll/uqb0;->c0:Ll/bn5;

    .line 466
    .line 467
    invoke-interface {v3}, Ll/bn5;->userId()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v3

    .line 471
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    move-result v2

    .line 475
    if-eqz v2, :cond_10

    .line 476
    .line 477
    :cond_f
    sget v2, Lcom/p1/mobile/putong/common/R$string;->W0:I

    .line 478
    .line 479
    invoke-static {v2}, Ll/o1j0;->h(I)V

    .line 480
    .line 481
    .line 482
    :cond_10
    throw v0

    .line 483
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 484
    .line 485
    const-string v2, "Not Support Resolution 8k"

    .line 486
    .line 487
    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 488
    .line 489
    .line 490
    throw v0

    .line 491
    :cond_12
    instance-of v4, v2, Lcom/p1/mobile/putong/data/Picture;

    .line 492
    .line 493
    if-eqz v4, :cond_15

    .line 494
    .line 495
    iget-wide v4, v2, Lcom/p1/mobile/putong/data/Media;->processStartTime:J

    .line 496
    .line 497
    cmp-long v4, v4, v8

    .line 498
    .line 499
    if-gtz v4, :cond_13

    .line 500
    .line 501
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 502
    .line 503
    .line 504
    move-result-wide v4

    .line 505
    iput-wide v4, v2, Lcom/p1/mobile/putong/data/Media;->processStartTime:J

    .line 506
    .line 507
    :cond_13
    new-instance v11, Ll/sim;

    .line 508
    .line 509
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 510
    .line 511
    invoke-static {v4}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v12

    .line 515
    iget v13, v1, Ll/i1y$a;->e:I

    .line 516
    .line 517
    iget v14, v1, Ll/i1y$a;->f:I

    .line 518
    .line 519
    iget-object v15, v1, Ll/i1y$a;->g:Landroid/graphics/Bitmap$CompressFormat;

    .line 520
    .line 521
    iget-boolean v4, v1, Ll/i1y$a;->h:Z

    .line 522
    .line 523
    move/from16 v16, v4

    .line 524
    .line 525
    invoke-direct/range {v11 .. v16}, Ll/sim;-><init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    .line 526
    .line 527
    .line 528
    iget-boolean v4, v1, Ll/i1y$a;->i:Z

    .line 529
    .line 530
    iget-boolean v5, v1, Ll/i1y$a;->j:Z

    .line 531
    .line 532
    if-eqz v5, :cond_14

    .line 533
    .line 534
    new-instance v5, Ll/h1y;

    .line 535
    .line 536
    invoke-direct {v5}, Ll/h1y;-><init>()V

    .line 537
    .line 538
    .line 539
    goto :goto_8

    .line 540
    :cond_14
    const/4 v5, 0x0

    .line 541
    :goto_8
    invoke-virtual {v11, v4, v5}, Ll/sim;->e(ZLl/y20;)Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v4

    .line 545
    invoke-static {v4}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v4

    .line 549
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 550
    .line 551
    move-object v4, v2

    .line 552
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 553
    .line 554
    new-instance v5, Lcom/p1/mobile/putong/data/Dimension;

    .line 555
    .line 556
    iget-object v12, v11, Ll/sim;->d:[I

    .line 557
    .line 558
    invoke-direct {v5, v12}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 559
    .line 560
    .line 561
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 562
    .line 563
    iget-object v4, v11, Ll/sim;->i:Ljava/lang/String;

    .line 564
    .line 565
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 566
    .line 567
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 568
    .line 569
    invoke-static {v4}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v4

    .line 573
    invoke-static {v4}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->u(Ljava/lang/String;)J

    .line 574
    .line 575
    .line 576
    move-result-wide v4

    .line 577
    iput-wide v4, v2, Lcom/p1/mobile/putong/data/Media;->mediaFileLength:J

    .line 578
    .line 579
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 580
    .line 581
    .line 582
    move-result-wide v4

    .line 583
    iput-wide v4, v2, Lcom/p1/mobile/putong/data/Media;->processEndTime:J

    .line 584
    .line 585
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 586
    .line 587
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 588
    .line 589
    invoke-virtual {v4, v5}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    :cond_15
    :goto_9
    invoke-static {v6}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 593
    .line 594
    .line 595
    move-result-object v4

    .line 596
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 597
    .line 598
    goto/16 :goto_2

    .line 599
    .line 600
    :cond_16
    iget-object v0, v1, Ll/i1y$a;->d:Ll/gcg0;

    .line 601
    .line 602
    if-eqz v0, :cond_17

    .line 603
    .line 604
    iget-object v2, v1, Ll/i1y$a;->a:Ljava/util/List;

    .line 605
    .line 606
    invoke-interface {v0, v2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 607
    .line 608
    .line 609
    iget-object v0, v1, Ll/i1y$a;->d:Ll/gcg0;

    .line 610
    .line 611
    if-eqz v0, :cond_17

    .line 612
    .line 613
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 614
    .line 615
    .line 616
    return-void

    .line 617
    :goto_a
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 618
    .line 619
    .line 620
    iget-object v1, v1, Ll/i1y$a;->d:Ll/gcg0;

    .line 621
    .line 622
    if-eqz v1, :cond_17

    .line 623
    .line 624
    invoke-interface {v1, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 625
    .line 626
    .line 627
    :cond_17
    return-void

    .line 628
    :cond_18
    invoke-interface {v0, v2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 629
    .line 630
    .line 631
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 632
    .line 633
    .line 634
    return-void

    .line 635
    :cond_19
    const-string v0, "only one subscriber supported"

    .line 636
    .line 637
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 638
    .line 639
    .line 640
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i1y$a;->b(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i1y$a;->d:Ll/gcg0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public unsubscribe()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/i1y$a;->d:Ll/gcg0;

    .line 3
    .line 4
    return-void
.end method
