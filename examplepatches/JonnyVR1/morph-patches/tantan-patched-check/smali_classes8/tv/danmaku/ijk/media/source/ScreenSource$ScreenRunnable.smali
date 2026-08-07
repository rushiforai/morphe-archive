.class Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/source/ScreenSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScreenRunnable"
.end annotation


# instance fields
.field private volatile a:Z

.field private b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private c:Ltv/danmaku/ijk/media/util/helpSurface;

.field private d:I

.field private e:I

.field final synthetic f:Ltv/danmaku/ijk/media/source/ScreenSource;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/source/ScreenSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->f:Ltv/danmaku/ijk/media/source/ScreenSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->a:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 11
    .line 12
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/source/ScreenSource;Ltv/danmaku/ijk/media/source/ScreenSource$1;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;-><init>(Ltv/danmaku/ijk/media/source/ScreenSource;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public b(Ltv/danmaku/ijk/media/util/helpSurface;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "----screen: textureID="

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 13
    .line 14
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/util/helpSurface;->e()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, ",surfaceTexture="

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 27
    .line 28
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/util/helpSurface;->d()Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "ScreenStream"

    .line 40
    .line 41
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public c(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    return-void
.end method

.method public d(II)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "screen size: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "ScreenStream"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iput p2, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->d:I

    .line 29
    .line 30
    iput p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->e:I

    .line 31
    .line 32
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    :cond_0
    :goto_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "screen runnable:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->a:Z

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "ScreenStream"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    const-string p0, "screen runnable thread exit success"

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-wide/16 v0, 0x14

    .line 33
    .line 34
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catch_0
    move-exception v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/util/helpSurface;->d()Landroid/graphics/SurfaceTexture;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 55
    .line 56
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/util/helpSurface;->e()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget v3, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->e:I

    .line 61
    .line 62
    iget v4, p0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->d:I

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2, v3, v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h1(Landroid/graphics/SurfaceTexture;III)V

    .line 65
    .line 66
    .line 67
    goto :goto_0
.end method
