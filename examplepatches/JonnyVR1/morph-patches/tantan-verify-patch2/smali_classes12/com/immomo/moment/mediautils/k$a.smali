.class Lcom/immomo/moment/mediautils/k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/k;->m()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/k;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

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
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/k;->o(Lcom/immomo/moment/mediautils/k;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/immomo/moment/mediautils/k;->r(Lcom/immomo/moment/mediautils/k;)Ljava/util/LinkedList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {v0, v1, v1}, Lcom/immomo/moment/mediautils/k;->p(Lcom/immomo/moment/mediautils/k;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    aget-object v2, v0, v1

    .line 30
    .line 31
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    aget-object v0, v0, v3

    .line 35
    .line 36
    check-cast v0, Landroid/media/MediaCodec$BufferInfo;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    new-array v4, v3, [B

    .line 43
    .line 44
    invoke-virtual {v2, v4, v1, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/immomo/moment/mediautils/k;->q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-wide v0, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 62
    .line 63
    invoke-virtual {p0, v4, v3, v0, v1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeAudioFrame([BIJ)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 3

    .line 1
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/moment/mediautils/k;->o(Lcom/immomo/moment/mediautils/k;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-static {v1, p1, p2}, Lcom/immomo/moment/mediautils/k;->p(Lcom/immomo/moment/mediautils/k;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 p2, 0x0

    .line 21
    aget-object v0, p1, p2

    .line 22
    .line 23
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    aget-object p1, p1, v1

    .line 27
    .line 28
    check-cast p1, Landroid/media/MediaCodec$BufferInfo;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    new-array v2, v1, [B

    .line 35
    .line 36
    invoke-virtual {v0, v2, p2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 40
    .line 41
    invoke-static {p2}, Lcom/immomo/moment/mediautils/k;->q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/immomo/moment/mediautils/k;->q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-wide p1, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 54
    .line 55
    invoke-virtual {p0, v2, v1, p1, p2}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeAudioFrame([BIJ)Z

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void

    .line 59
    :cond_2
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->r(Lcom/immomo/moment/mediautils/k;)Ljava/util/LinkedList;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v0, Ll/ad60;

    .line 64
    .line 65
    invoke-direct {v0, p1, p2}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onError(IILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/k;->u(Lcom/immomo/moment/mediautils/k;)Ll/jpw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/moment/mediautils/k;->u(Lcom/immomo/moment/mediautils/k;)Ll/jpw;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2, p3}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p1, "Audio encode failed!!!"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "MediaEncoder"

    .line 36
    .line 37
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/immomo/moment/mediautils/k;->v(Lcom/immomo/moment/mediautils/k;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onFinished()V
    .locals 6

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/k;->r(Lcom/immomo/moment/mediautils/k;)Ljava/util/LinkedList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 12
    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->r(Lcom/immomo/moment/mediautils/k;)Ljava/util/LinkedList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/ad60;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->o(Lcom/immomo/moment/mediautils/k;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object v1, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 42
    .line 43
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->q(Lcom/immomo/moment/mediautils/k;)Lcom/imomo/momo/mediamuxer/MediaMuxer;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v0}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-wide v4, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 66
    .line 67
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->writeAudioFrame([BIJ)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    invoke-static {v1}, Lcom/immomo/moment/mediautils/k;->s(Lcom/immomo/moment/mediautils/k;)Lcom/immomo/moment/mediautils/l$d;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/immomo/moment/mediautils/k$a;->a:Lcom/immomo/moment/mediautils/k;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/immomo/moment/mediautils/k;->t(Lcom/immomo/moment/mediautils/k;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 81
    .line 82
    .line 83
    const-string p0, "MediaEncoder"

    .line 84
    .line 85
    const-string v0, "Audio encode finished!!!"

    .line 86
    .line 87
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public onFormatChanged(Landroid/media/MediaFormat;)V
    .locals 0

    .line 1
    const-string p0, "MediaEncoder"

    .line 2
    .line 3
    const-string p1, "Audio encode format changed !!!"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
