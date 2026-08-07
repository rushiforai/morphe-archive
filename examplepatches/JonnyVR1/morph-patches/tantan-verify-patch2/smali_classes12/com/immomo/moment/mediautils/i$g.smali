.class Lcom/immomo/moment/mediautils/i$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/i;->f0(Ljava/lang/String;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/i;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCodecIdle()V
    .locals 0

    return-void
.end method

.method public onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 0

    return-void
.end method

.method public onError(IILjava/lang/String;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 4
    .line 5
    const-string v0, "]"

    .line 6
    .line 7
    const-string v1, "["

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, " sourcePath:"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/immomo/moment/mediautils/i;->D(Lcom/immomo/moment/mediautils/i;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/16 v2, 0x232d

    .line 44
    .line 45
    invoke-interface {p1, v2, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "MediaDecoder"

    .line 67
    .line 68
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 12

    .line 1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-boolean v3, v2, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    if-eqz v3, :cond_3

    .line 7
    .line 8
    invoke-virtual {v2, p1, p2}, Lcom/immomo/moment/mediautils/i;->d0(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 13
    .line 14
    if-gtz v2, :cond_1

    .line 15
    .line 16
    iget-boolean v2, v3, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    const-wide/16 v4, 0x0

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, -0x1

    .line 25
    move-object v1, p2

    .line 26
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-wide/16 v4, 0x0

    .line 31
    .line 32
    const/4 v6, 0x0

    .line 33
    const/4 v2, 0x0

    .line 34
    const/4 v3, 0x0

    .line 35
    move-object v1, p2

    .line 36
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 40
    .line 41
    iput-boolean v7, v0, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    iget-wide v4, v3, Lcom/immomo/moment/mediautils/m;->q:J

    .line 45
    .line 46
    const-wide/16 v8, 0x0

    .line 47
    .line 48
    cmp-long v0, v4, v8

    .line 49
    .line 50
    if-lez v0, :cond_2

    .line 51
    .line 52
    iget-wide v8, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 53
    .line 54
    const-wide/32 v10, 0x1e8480

    .line 55
    .line 56
    .line 57
    add-long/2addr v4, v10

    .line 58
    cmp-long v0, v8, v4

    .line 59
    .line 60
    if-lez v0, :cond_2

    .line 61
    .line 62
    iput-boolean v7, v3, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 63
    .line 64
    const-wide/16 v3, 0x0

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    const/4 v1, 0x0

    .line 68
    const/4 v2, 0x0

    .line 69
    move-object v0, p2

    .line 70
    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 74
    return v0

    .line 75
    :cond_3
    return v7
.end method

.method public onFinished()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "video end finished endpts = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->W(Lcom/immomo/moment/mediautils/i;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "MediaDecoder"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-interface {v0, v1}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/m$e;->a()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 44
    .line 45
    const/16 v0, 0x10

    .line 46
    .line 47
    invoke-static {p0, v0}, Lcom/immomo/moment/mediautils/i;->E(Lcom/immomo/moment/mediautils/i;I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onFormatChanged(Landroid/media/MediaFormat;)V
    .locals 5

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "Video format changed !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Landroid/media/MediaFormat;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/media/MediaFormat;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, v0, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 20
    .line 21
    :cond_0
    const-string v0, "stride"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iput v2, v1, Lcom/immomo/moment/mediautils/m;->i:I

    .line 36
    .line 37
    :cond_1
    const-string v1, "color-format"

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 46
    .line 47
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    iput v3, v2, Lcom/immomo/moment/mediautils/m;->j:I

    .line 52
    .line 53
    :cond_2
    const-string v2, "rotation-degrees"

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 62
    .line 63
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, v3, Lcom/immomo/moment/mediautils/m;->k:I

    .line 68
    .line 69
    :cond_3
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 72
    .line 73
    const-string v4, "width"

    .line 74
    .line 75
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->a:I

    .line 76
    .line 77
    invoke-virtual {v3, v4, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 81
    .line 82
    iget-object v3, p1, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 83
    .line 84
    const-string v4, "height"

    .line 85
    .line 86
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->b:I

    .line 87
    .line 88
    invoke-virtual {v3, v4, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 94
    .line 95
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->j:I

    .line 96
    .line 97
    invoke-virtual {v3, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 103
    .line 104
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->i:I

    .line 105
    .line 106
    invoke-virtual {v1, v0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 110
    .line 111
    iget-object v0, p1, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 112
    .line 113
    iget p1, p1, Lcom/immomo/moment/mediautils/m;->k:I

    .line 114
    .line 115
    invoke-virtual {v0, v2, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$g;->a:Lcom/immomo/moment/mediautils/i;

    .line 119
    .line 120
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 121
    .line 122
    if-eqz p1, :cond_4

    .line 123
    .line 124
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 125
    .line 126
    invoke-interface {p1, p0}, Lcom/immomo/moment/mediautils/m$e;->d(Landroid/media/MediaFormat;)V

    .line 127
    .line 128
    .line 129
    :cond_4
    return-void
.end method
