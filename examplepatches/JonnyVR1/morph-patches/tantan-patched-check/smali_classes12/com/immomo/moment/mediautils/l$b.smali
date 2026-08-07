.class Lcom/immomo/moment/mediautils/l$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/l;->m()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/l;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/f220;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->q(Lcom/immomo/moment/mediautils/l;)Ljava/util/LinkedList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {v0, v1, v1}, Lcom/immomo/moment/mediautils/l;->D(Lcom/immomo/moment/mediautils/l;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    aget-object v1, v0, v1

    .line 34
    .line 35
    check-cast v1, Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    aget-object v0, v0, v2

    .line 39
    .line 40
    check-cast v0, Landroid/media/MediaCodec$BufferInfo;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/immomo/moment/mediautils/l;->A(Lcom/immomo/moment/mediautils/l;)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v2, p0, v1, v0}, Ll/f220;->f(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 2

    .line 1
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->C(Lcom/immomo/moment/mediautils/l;)Lcom/immomo/moment/mediautils/l$c;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/f220;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {v1, p1, p2}, Lcom/immomo/moment/mediautils/l;->D(Lcom/immomo/moment/mediautils/l;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)[Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x0

    .line 30
    aget-object p2, p1, p2

    .line 31
    .line 32
    check-cast p2, Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    aget-object p1, p1, v0

    .line 36
    .line 37
    check-cast p1, Landroid/media/MediaCodec$BufferInfo;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/immomo/moment/mediautils/l;->A(Lcom/immomo/moment/mediautils/l;)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-virtual {v0, p0, p2, p1}, Ll/f220;->f(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-static {v1}, Lcom/immomo/moment/mediautils/l;->q(Lcom/immomo/moment/mediautils/l;)Ljava/util/LinkedList;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance v0, Ll/ad60;

    .line 60
    .line 61
    invoke-direct {v0, p1, p2}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onError(IILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/immomo/moment/mediautils/l;->z(Lcom/immomo/moment/mediautils/l;)Ll/spw;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/immomo/moment/mediautils/l;->z(Lcom/immomo/moment/mediautils/l;)Ll/spw;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "["

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, "]"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, " mOutputFilePath:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/16 v0, 0xbbe

    .line 50
    .line 51
    invoke-interface {p1, v0, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string p1, "Audio mediaEncode failed !!!"

    .line 57
    .line 58
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "MediaEncoder"

    .line 72
    .line 73
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/immomo/moment/mediautils/l;->u(Lcom/immomo/moment/mediautils/l;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onFinished()V
    .locals 4

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->q(Lcom/immomo/moment/mediautils/l;)Ljava/util/LinkedList;

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
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    invoke-static {v1}, Lcom/immomo/moment/mediautils/l;->q(Lcom/immomo/moment/mediautils/l;)Ljava/util/LinkedList;

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
    iget-object v1, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 32
    .line 33
    invoke-static {v2}, Lcom/immomo/moment/mediautils/l;->A(Lcom/immomo/moment/mediautils/l;)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v0}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v1, v2, v3, v0}, Ll/f220;->f(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-static {v1}, Lcom/immomo/moment/mediautils/l;->s(Lcom/immomo/moment/mediautils/l;)Lcom/immomo/moment/mediautils/l$d;

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/immomo/moment/mediautils/l;->t(Lcom/immomo/moment/mediautils/l;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 59
    .line 60
    .line 61
    const-string p0, "MediaEncoder"

    .line 62
    .line 63
    const-string v0, "Audio media Encode finished !!!"

    .line 64
    .line 65
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onFormatChanged(Landroid/media/MediaFormat;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, p1, v2}, Ll/f220;->a(Landroid/media/MediaFormat;I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {v0, p1}, Lcom/immomo/moment/mediautils/l;->B(Lcom/immomo/moment/mediautils/l;I)I

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/immomo/moment/mediautils/l$b;->a:Lcom/immomo/moment/mediautils/l;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/immomo/moment/mediautils/l;->o(Lcom/immomo/moment/mediautils/l;)Ll/f220;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/f220;->d()V

    .line 32
    .line 33
    .line 34
    :cond_0
    const-string p0, "MediaEncoder"

    .line 35
    .line 36
    const-string p1, "Audio media format failed !!!"

    .line 37
    .line 38
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
