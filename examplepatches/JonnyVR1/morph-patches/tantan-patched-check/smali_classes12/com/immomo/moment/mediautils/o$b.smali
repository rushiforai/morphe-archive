.class Lcom/immomo/moment/mediautils/o$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/m$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/o;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/o$d;->b(Ljava/nio/ByteBuffer;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/media/MediaFormat;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/o$d;->h(Landroid/media/MediaFormat;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public e(Landroid/media/MediaCodec$BufferInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->p(Lcom/immomo/moment/mediautils/o;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-gez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 24
    .line 25
    iget-wide v1, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/immomo/moment/mediautils/o;->q(Lcom/immomo/moment/mediautils/o;J)J

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->r(Lcom/immomo/moment/mediautils/o;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iget-wide v2, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 37
    .line 38
    iget-object p1, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/immomo/moment/mediautils/o;->p(Lcom/immomo/moment/mediautils/o;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v4

    .line 44
    sub-long/2addr v2, v4

    .line 45
    add-long/2addr v0, v2

    .line 46
    iget-object p1, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1, v0, v1}, Lcom/immomo/moment/mediautils/o$d;->c(J)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 56
    .line 57
    invoke-static {p0, v0, v1}, Lcom/immomo/moment/mediautils/o;->s(Lcom/immomo/moment/mediautils/o;J)J

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-wide/16 v0, -0x1

    .line 66
    .line 67
    invoke-interface {p0, v0, v1}, Lcom/immomo/moment/mediautils/o$d;->c(J)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public f(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$b;->a:Lcom/immomo/moment/mediautils/o;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/o$d;->i(Landroid/graphics/SurfaceTexture;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
