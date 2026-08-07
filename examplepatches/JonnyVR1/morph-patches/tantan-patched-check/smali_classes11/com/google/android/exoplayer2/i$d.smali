.class public final Lcom/google/android/exoplayer2/i$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iel0;
.implements Ll/gb4;
.implements Lcom/google/android/exoplayer2/u$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public a:Ll/iel0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/gb4;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/iel0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/gb4;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/i$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/google/android/exoplayer2/i$d;-><init>()V

    return-void
.end method


# virtual methods
.method public a(JJLcom/google/android/exoplayer2/k;Landroid/media/MediaFormat;)V
    .locals 7
    .param p6    # Landroid/media/MediaFormat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$d;->c:Ll/iel0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-wide v1, p1

    .line 6
    move-wide v3, p3

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-interface/range {v0 .. v6}, Ll/iel0;->a(JJLcom/google/android/exoplayer2/k;Landroid/media/MediaFormat;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$d;->a:Ll/iel0;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface/range {p0 .. p6}, Ll/iel0;->a(JJLcom/google/android/exoplayer2/k;Landroid/media/MediaFormat;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public e(J[F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$d;->d:Ll/gb4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3}, Ll/gb4;->e(J[F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$d;->b:Ll/gb4;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1, p2, p3}, Ll/gb4;->e(J[F)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public f(ILjava/lang/Object;)V
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x7

    .line 2
    if-eq p1, v0, :cond_3

    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    if-eq p1, v0, :cond_2

    .line 7
    .line 8
    const/16 v0, 0x2710

    .line 9
    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    check-cast p2, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/google/android/exoplayer2/i$d;->c:Ll/iel0;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/google/android/exoplayer2/i$d;->d:Ll/gb4;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;->getVideoFrameMetadataListener()Ll/iel0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/google/android/exoplayer2/i$d;->c:Ll/iel0;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;->getCameraMotionListener()Ll/gb4;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/google/android/exoplayer2/i$d;->d:Ll/gb4;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    check-cast p2, Ll/gb4;

    .line 37
    .line 38
    iput-object p2, p0, Lcom/google/android/exoplayer2/i$d;->b:Ll/gb4;

    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    check-cast p2, Ll/iel0;

    .line 42
    .line 43
    iput-object p2, p0, Lcom/google/android/exoplayer2/i$d;->a:Ll/iel0;

    .line 44
    .line 45
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$d;->d:Ll/gb4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/gb4;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$d;->b:Ll/gb4;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Ll/gb4;->h()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
