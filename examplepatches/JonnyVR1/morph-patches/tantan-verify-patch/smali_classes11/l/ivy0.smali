.class public final Ll/ivy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bwy0;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x17
.end annotation


# instance fields
.field public final a:Landroid/media/MediaCodec;

.field public final b:Ll/rvy0;

.field public final c:Ll/dwy0;

.field public d:Z

.field public e:I


# direct methods
.method public synthetic constructor <init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;Ll/dwy0;Ll/hvy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 5
    .line 6
    new-instance p1, Ll/rvy0;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/rvy0;-><init>(Landroid/os/HandlerThread;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 12
    .line 13
    iput-object p3, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Ll/ivy0;->e:I

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic g(I)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "ExoPlayer:MediaCodecAsyncAdapter:"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/ivy0;->k(ILjava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic i(I)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "ExoPlayer:MediaCodecQueueingThread:"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/ivy0;->k(ILjava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic j(Ll/ivy0;Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Ll/rvy0;->f(Landroid/media/MediaCodec;)V

    .line 6
    .line 7
    .line 8
    sget p3, Ll/mpw0;->a:I

    .line 9
    .line 10
    const-string p3, "configureCodec"

    .line 11
    .line 12
    invoke-static {p3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p3, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p3, p1, p2, v0, p4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 25
    .line 26
    invoke-interface {p1}, Ll/dwy0;->zzh()V

    .line 27
    .line 28
    .line 29
    const-string p1, "startCodec"

    .line 30
    .line 31
    invoke-static {p1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x1

    .line 43
    iput p1, p0, Ll/ivy0;->e:I

    .line 44
    .line 45
    return-void
.end method

.method public static k(ILjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const-string p0, "Audio"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x2

    .line 16
    if-ne p0, p1, :cond_1

    .line 17
    .line 18
    const-string p0, "Video"

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p1, "Unknown("

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, ")"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method


# virtual methods
.method public final F(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/dwy0;->a(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final a(IIIJI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-interface/range {p0 .. p6}, Ll/dwy0;->c(IIIJI)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final b(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setOutputSurface(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(IILl/tux0;JI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    const/4 p6, 0x0

    .line 5
    invoke-interface/range {p0 .. p6}, Ll/dwy0;->b(IILl/tux0;JI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setVideoScalingMode(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final f(Landroid/media/MediaCodec$BufferInfo;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/dwy0;->zzc()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/rvy0;->b(Landroid/media/MediaCodec$BufferInfo;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final h(IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zza()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/dwy0;->zzc()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rvy0;->a()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final zzc()Landroid/media/MediaFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rvy0;->c()Landroid/media/MediaFormat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzf(I)Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzg(I)Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzi()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/dwy0;->zzb()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rvy0;->e()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/media/MediaCodec;->start()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final zzl()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget v1, p0, Ll/ivy0;->e:I

    .line 3
    .line 4
    if-ne v1, v0, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Ll/ivy0;->c:Ll/dwy0;

    .line 7
    .line 8
    invoke-interface {v1}, Ll/dwy0;->zzg()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/ivy0;->b:Ll/rvy0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/rvy0;->g()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    const/4 v1, 0x2

    .line 20
    iput v1, p0, Ll/ivy0;->e:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    iget-boolean v1, p0, Ll/ivy0;->d:Z

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 29
    .line 30
    .line 31
    iput-boolean v0, p0, Ll/ivy0;->d:Z

    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_1
    iget-boolean v2, p0, Ll/ivy0;->d:Z

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_2
    iget-object v2, p0, Ll/ivy0;->a:Landroid/media/MediaCodec;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    .line 42
    .line 43
    .line 44
    iput-boolean v0, p0, Ll/ivy0;->d:Z

    .line 45
    .line 46
    :goto_2
    throw v1
.end method
