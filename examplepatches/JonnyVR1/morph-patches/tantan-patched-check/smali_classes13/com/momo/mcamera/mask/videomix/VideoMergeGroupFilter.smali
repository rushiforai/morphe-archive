.class public Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/suf;
.implements Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;
.implements Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;


# instance fields
.field private duration:J

.field private faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

.field private listener:Lcom/momo/mcamera/mask/videomix/IVideoTimeoutListener;

.field private normalFilter:Ll/qv40;

.field private startTime:J

.field private videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

.field private videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

.field private videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

.field private videoTimestamp:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;J)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoTimestamp:J

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->duration:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->startTime:J

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, p0, Ll/gfj;->useCache:Z

    .line 16
    .line 17
    new-instance v3, Ll/qv40;

    .line 18
    .line 19
    invoke-direct {v3}, Ll/qv40;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->normalFilter:Ll/qv40;

    .line 23
    .line 24
    iput-boolean v2, v3, Ll/gfj;->useCache:Z

    .line 25
    .line 26
    new-instance v3, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 27
    .line 28
    invoke-direct {v3}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 32
    .line 33
    iput-boolean v2, v3, Ll/gfj;->useCache:Z

    .line 34
    .line 35
    invoke-virtual {v3, p0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->setOnVertexCoordinateUpdateListener(Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;)V

    .line 36
    .line 37
    .line 38
    new-instance v3, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 39
    .line 40
    new-instance v4, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getVideo()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {p3}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getFrameRateToPlay()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    invoke-direct {v3, p1, v4, v5}, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    iput-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 72
    .line 73
    iput-boolean v2, v3, Ll/gfj;->useCache:Z

    .line 74
    .line 75
    invoke-virtual {v3, p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->setRenderTimestampListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 79
    .line 80
    invoke-direct {p1}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 84
    .line 85
    iput-boolean v2, p1, Ll/gfj;->useCache:Z

    .line 86
    .line 87
    new-instance p1, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 88
    .line 89
    invoke-direct {p1}, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 93
    .line 94
    iput-boolean v2, p1, Ll/gfj;->useCache:Z

    .line 95
    .line 96
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->normalFilter:Ll/qv40;

    .line 97
    .line 98
    iget-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 99
    .line 100
    invoke-virtual {p1, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->normalFilter:Ll/qv40;

    .line 104
    .line 105
    iget-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 106
    .line 107
    invoke-virtual {p1, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->normalFilter:Ll/qv40;

    .line 111
    .line 112
    iget-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 118
    .line 119
    iget-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 120
    .line 121
    invoke-virtual {p1, v3, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 125
    .line 126
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 127
    .line 128
    const/4 v3, 0x1

    .line 129
    invoke-virtual {p1, v2, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 133
    .line 134
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 135
    .line 136
    const/4 v3, 0x2

    .line 137
    invoke-virtual {p1, v2, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 141
    .line 142
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 143
    .line 144
    invoke-virtual {p1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 148
    .line 149
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 150
    .line 151
    invoke-virtual {p1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 155
    .line 156
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 157
    .line 158
    invoke-virtual {p1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 162
    .line 163
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->normalFilter:Ll/qv40;

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 172
    .line 173
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 187
    .line 188
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 189
    .line 190
    .line 191
    invoke-direct {p0, p2, p3}, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->setVideoFileConfig(Ljava/lang/String;Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;)V

    .line 192
    .line 193
    .line 194
    cmp-long p1, p4, v0

    .line 195
    .line 196
    if-lez p1, :cond_0

    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_0
    const-wide/16 p4, 0x1388

    .line 200
    .line 201
    :goto_0
    iput-wide p4, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->duration:J

    .line 202
    .line 203
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 204
    .line 205
    .line 206
    move-result-wide p1

    .line 207
    iput-wide p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->startTime:J

    .line 208
    .line 209
    return-void
.end method

.method private setVideoFileConfig(Ljava/lang/String;Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_3

    .line 2
    .line 3
    invoke-static {p1}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getTimeStamp()[F

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getFaceData()[[F

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->setVideoFileConfig([F[[F)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getMaskBorder()Landroid/graphics/RectF;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getMaskImage()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {v0, v1, p1}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->setVideoFileConfig(Landroid/graphics/RectF;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;->getType()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->setVideoFileConfig(I)V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->setOnVertexCoordinateUpdateListener(Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoResourceFilter:Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->setRenderTimestampListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v0, -0x1

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoTimestamp:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public onFaceUpdate([FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->updateVertexCoordinate([F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMaskFilter:Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->updateMaskRoll(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onRenderTimestampChanged(J)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->startTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->duration:J

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->listener:Lcom/momo/mcamera/mask/videomix/IVideoTimeoutListener;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/momo/mcamera/mask/videomix/IVideoTimeoutListener;->onTimeout()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iput-wide p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoTimestamp:J

    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->updateTimestamp(J)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoTimestamp:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->videoMergeFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->setMMCVInfo(Ll/omw;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->faceCutFilter:Lcom/momo/mcamera/mask/videomix/FaceCutFilter;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->setMMCVInfo(Ll/omw;)V

    .line 22
    .line 23
    .line 24
    :cond_2
    :goto_0
    return-void
.end method

.method public setOnVideoTimeoutListener(Lcom/momo/mcamera/mask/videomix/IVideoTimeoutListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->listener:Lcom/momo/mcamera/mask/videomix/IVideoTimeoutListener;

    .line 2
    .line 3
    return-void
.end method
