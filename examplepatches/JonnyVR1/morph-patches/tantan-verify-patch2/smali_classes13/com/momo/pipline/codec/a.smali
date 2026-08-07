.class public Lcom/momo/pipline/codec/a;
.super Ll/grx;
.source "SourceFile"

# interfaces
.implements Ll/g220;


# instance fields
.field private l1:F

.field private m1:F

.field private final n1:Ljava/lang/String;

.field private o1:I

.field private p1:I

.field private q1:I

.field private r1:I

.field private s1:Ljava/lang/Object;

.field private t1:Landroid/media/MediaMuxer;

.field private u1:Ljava/lang/String;

.field private v1:Z

.field private w1:I

.field private x1:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/grx;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/momo/pipline/codec/a;->l1:F

    .line 8
    .line 9
    iput p1, p0, Lcom/momo/pipline/codec/a;->m1:F

    .line 10
    .line 11
    const-string p1, "Filter_RecordFile"

    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/pipline/codec/a;->n1:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/momo/pipline/codec/a;->o1:I

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    iput v1, p0, Lcom/momo/pipline/codec/a;->p1:I

    .line 20
    .line 21
    const/4 v1, -0x1

    .line 22
    iput v1, p0, Lcom/momo/pipline/codec/a;->q1:I

    .line 23
    .line 24
    iput v1, p0, Lcom/momo/pipline/codec/a;->r1:I

    .line 25
    .line 26
    new-instance v1, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lcom/momo/pipline/codec/a;->s1:Ljava/lang/Object;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    iput-object v1, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 35
    .line 36
    const-wide/16 v1, 0x0

    .line 37
    .line 38
    iput-wide v1, p0, Lcom/momo/pipline/codec/a;->x1:J

    .line 39
    .line 40
    const-string v1, "init RecorderFilter"

    .line 41
    .line 42
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iput-boolean v0, p0, Ll/grx;->X0:Z

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    return-void
.end method

.method public B1(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 5

    .line 1
    const-string v0, "Media muxer not started !!, already have media type:"

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/momo/pipline/codec/a;->x1:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/grx;->X0:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    iput-wide v1, p0, Lcom/momo/pipline/codec/a;->x1:J

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/momo/pipline/codec/a;->s1:Ljava/lang/Object;

    .line 22
    .line 23
    monitor-enter v1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz p2, :cond_4

    .line 26
    .line 27
    if-nez p3, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :try_start_0
    iget-boolean v3, p0, Ll/grx;->X0:Z

    .line 31
    .line 32
    if-nez v3, :cond_2

    .line 33
    .line 34
    const-string p1, "Filter_RecordFile"

    .line 35
    .line 36
    new-instance p2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/momo/pipline/codec/a;->U2()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p1, p0}, Lcom/core/glcore/util/Log4Cam;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    monitor-exit v1

    .line 56
    return v2

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    iget-object p0, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 60
    .line 61
    if-eqz p0, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2, p3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    monitor-exit v1

    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_4
    :goto_0
    const-string p0, "Filter_RecordFile"

    .line 70
    .line 71
    const-string p1, "[writeSampleData] Invalid Parameter !! ByteBuffer or BufferInfo is null"

    .line 72
    .line 73
    invoke-static {p0, p1}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    monitor-exit v1

    .line 77
    return v2

    .line 78
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method

.method public C0()V
    .locals 0

    .line 1
    return-void
.end method

.method public C1(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E2()Ll/g220;
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    return-object p0
.end method

.method public G2()Ll/nsx;
    .locals 0

    .line 1
    new-instance p0, Ll/nsx;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/nsx;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public H1(I)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    const-string v0, "Filter_RecordFile"

    .line 2
    .line 3
    const-string v1, "prepared init mMediaMuxer"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/pipline/codec/a;->u1:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-lt p1, v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-gt p1, v0, :cond_0

    .line 17
    .line 18
    :try_start_0
    new-instance v0, Landroid/media/MediaMuxer;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/pipline/codec/a;->u1:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-direct {v0, v1, v2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 27
    .line 28
    iput p1, p0, Lcom/momo/pipline/codec/a;->p1:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p0, "Invalid file path or media track info"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public K0(Ljava/nio/ByteBuffer;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public O1()V
    .locals 0

    .line 1
    return-void
.end method

.method public Q2()V
    .locals 6

    .line 1
    const-string v0, "Meida info not enough , need waitting, already have "

    .line 2
    .line 3
    const-string v1, "setOrientationHint"

    .line 4
    .line 5
    const-string v2, "startMuxing mMediaTrackInfo"

    .line 6
    .line 7
    iget-object v3, p0, Lcom/momo/pipline/codec/a;->s1:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v3

    .line 10
    :try_start_0
    const-string v4, "Filter_RecordFile"

    .line 11
    .line 12
    new-instance v5, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v2, p0, Lcom/momo/pipline/codec/a;->p1:I

    .line 18
    .line 19
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "mAddedMediaTrack"

    .line 23
    .line 24
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget v2, p0, Lcom/momo/pipline/codec/a;->o1:I

    .line 28
    .line 29
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v4, v2}, Lcom/core/glcore/util/Log4Cam;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-boolean v2, p0, Ll/grx;->X0:Z

    .line 40
    .line 41
    if-nez v2, :cond_3

    .line 42
    .line 43
    iget v2, p0, Lcom/momo/pipline/codec/a;->p1:I

    .line 44
    .line 45
    iget v4, p0, Lcom/momo/pipline/codec/a;->o1:I

    .line 46
    .line 47
    if-eq v2, v4, :cond_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    const-string v0, "Filter_RecordFile"

    .line 55
    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget v1, p0, Lcom/momo/pipline/codec/a;->w1:I

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v0, v1}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 74
    .line 75
    iget v1, p0, Lcom/momo/pipline/codec/a;->w1:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 78
    .line 79
    .line 80
    iget v0, p0, Lcom/momo/pipline/codec/a;->m1:F

    .line 81
    .line 82
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/high16 v1, 0x43340000    # 180.0f

    .line 87
    .line 88
    cmpg-float v0, v0, v1

    .line 89
    .line 90
    if-gtz v0, :cond_1

    .line 91
    .line 92
    iget v0, p0, Lcom/momo/pipline/codec/a;->l1:F

    .line 93
    .line 94
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    cmpg-float v0, v0, v1

    .line 99
    .line 100
    if-gtz v0, :cond_1

    .line 101
    .line 102
    iget-object v0, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 103
    .line 104
    iget v1, p0, Lcom/momo/pipline/codec/a;->l1:F

    .line 105
    .line 106
    iget v2, p0, Lcom/momo/pipline/codec/a;->m1:F

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaMuxer;->setLocation(FF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catchall_0
    move-exception p0

    .line 113
    goto :goto_2

    .line 114
    :cond_1
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V

    .line 117
    .line 118
    .line 119
    const/4 v0, 0x1

    .line 120
    iput-boolean v0, p0, Ll/grx;->X0:Z

    .line 121
    .line 122
    const-wide/16 v0, 0x0

    .line 123
    .line 124
    iput-wide v0, p0, Lcom/momo/pipline/codec/a;->x1:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .line 126
    :catch_0
    :cond_2
    :try_start_2
    monitor-exit v3

    .line 127
    return-void

    .line 128
    :cond_3
    :goto_1
    const-string v1, "Filter_RecordFile"

    .line 129
    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/momo/pipline/codec/a;->U2()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-static {v1, p0}, Lcom/core/glcore/util/Log4Cam;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    monitor-exit v3

    .line 150
    return-void

    .line 151
    :goto_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    throw p0
.end method

.method public R0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/grx;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U2()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/momo/pipline/codec/a;->o1:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const-string p0, "audio"

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "video"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "audio/video"

    .line 16
    .line 17
    return-object p0
.end method

.method public V2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/a;->u1:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public W(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b0()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    :try_start_0
    invoke-super {p0}, Ll/grx;->f()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/pipline/codec/a;->v1:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    return-void

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f0(Ljava/nio/ByteBuffer;J)V
    .locals 0

    .line 1
    return-void
.end method

.method public getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;
    .locals 0

    return-object p0
.end method

.method public isStarting()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/grx;->X0:Z

    .line 2
    .line 3
    return p0
.end method

.method public k1()V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    const-string v0, "Filter_RecordFile"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "stopMuxing muxer release"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/pipline/codec/a;->s1:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v0

    .line 27
    :try_start_0
    iget-object v1, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-boolean v2, p0, Ll/grx;->X0:Z

    .line 32
    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    iput-wide v2, p0, Lcom/momo/pipline/codec/a;->x1:J

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V

    .line 45
    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput-object v1, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    iput-boolean v1, p0, Ll/grx;->X0:Z

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    const-string v0, "Filter_RecordFile"

    .line 58
    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "Stop media muxing !"

    .line 62
    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget p0, p0, Lcom/momo/pipline/codec/a;->p1:I

    .line 67
    .line 68
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v0, p0}, Lcom/core/glcore/util/Log4Cam;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p0
.end method

.method public l0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m1(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public o1(Ljava/nio/ByteBuffer;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public p(Ljava/lang/String;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public p0(Ljava/nio/ByteBuffer;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public t1(Ljava/nio/ByteBuffer;J)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public v0(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public x0(Landroid/media/MediaFormat;I)I
    .locals 6

    .line 1
    const-string v0, "Add track info "

    .line 2
    .line 3
    const-string v1, "addMediaTrack "

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-lt p2, v3, :cond_3

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    if-le p2, v3, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v3, p0, Lcom/momo/pipline/codec/a;->s1:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter v3

    .line 18
    :try_start_0
    const-string v4, "Filter_RecordFile"

    .line 19
    .line 20
    new-instance v5, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, " "

    .line 29
    .line 30
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-boolean v1, p0, Ll/grx;->X0:Z

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    monitor-exit v3

    .line 52
    return p2

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object v1, p0, Lcom/momo/pipline/codec/a;->t1:Landroid/media/MediaMuxer;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iget p1, p0, Lcom/momo/pipline/codec/a;->o1:I

    .line 64
    .line 65
    or-int/2addr p1, p2

    .line 66
    iput p1, p0, Lcom/momo/pipline/codec/a;->o1:I

    .line 67
    .line 68
    const-string p1, "Filter_RecordFile"

    .line 69
    .line 70
    new-instance p2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/momo/pipline/codec/a;->U2()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-static {p1, p2}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/momo/pipline/codec/a;->Q2()V

    .line 90
    .line 91
    .line 92
    :cond_2
    monitor-exit v3

    .line 93
    return v2

    .line 94
    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    throw p0

    .line 96
    :cond_3
    :goto_1
    const-string p0, "Filter_RecordFile"

    .line 97
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v1, "Add media track error ! Invalid parameter ! format="

    .line 101
    .line 102
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p1, " and track="

    .line 109
    .line 110
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p0, p1}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    return v2
.end method

.method public y0(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/grx;->y0(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z0(Ljava/nio/ByteBuffer;J)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method
