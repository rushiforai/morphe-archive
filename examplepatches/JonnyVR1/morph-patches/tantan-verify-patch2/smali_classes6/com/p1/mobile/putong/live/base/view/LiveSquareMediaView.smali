.class public Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/TextureView;

.field public c:Ll/dyh0;

.field public d:Landroid/view/Surface;

.field public e:Z

.field public f:Z

.field public g:Ljava/lang/Runnable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->f:Z

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->j(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x1

    .line 15
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->e:Z

    const/4 p2, 0x0

    .line 16
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->f:Z

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->j(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    .line 19
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->e:Z

    const/4 p2, 0x0

    .line 20
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->f:Z

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->j(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->l(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "video"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->k(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->m(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->g:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->d:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->g:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureView()Landroid/view/TextureView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->b:Landroid/view/TextureView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mHeight:I

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget p1, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mWidth:I

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    int-to-float p1, p1

    .line 17
    div-float/2addr v0, p1

    .line 18
    invoke-static {}, Ll/bnl0;->y0()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    int-to-float v1, p1

    .line 23
    mul-float/2addr v1, v0

    .line 24
    float-to-int v0, v1

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->b:Landroid/view/TextureView;

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->b:Landroid/view/TextureView;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    new-array v3, v2, [Landroid/view/View;

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    aput-object v1, v3, v4

    .line 37
    .line 38
    invoke-static {p1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 47
    .line 48
    new-array v0, v2, [Landroid/view/View;

    .line 49
    .line 50
    aput-object p0, v0, v4

    .line 51
    .line 52
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final j(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/vec0;->L:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    sget p1, Ll/jdc0;->H:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lv/VDraweeView;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 20
    .line 21
    sget p1, Ll/jdc0;->W0:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Landroid/view/TextureView;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->b:Landroid/view/TextureView;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView$a;-><init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->o(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    const/4 p3, 0x3

    .line 2
    if-ne p2, p3, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->i()V

    .line 5
    .line 6
    .line 7
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->f:Z

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getMediaInfo()Lcom/tantanapp/ijk/media/player/MediaInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/tantanapp/ijk/media/player/MediaInfo;->mMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta;->mStreams:Ljava/util/ArrayList;

    .line 18
    .line 19
    new-instance p2, Ll/e4u;

    .line 20
    .line 21
    invoke-direct {p2}, Ll/e4u;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->h(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public final synthetic m(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dyh0;->stop()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public n(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->o(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dyh0;->stop()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Ll/fyh0;->d()Ll/fyh0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/fyh0;->e()Ll/dyh0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->d:Landroid/view/Surface;

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    new-instance v0, Ll/b4u;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1, p2}, Ll/b4u;-><init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->g:Ljava/lang/Runnable;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :try_start_0
    invoke-virtual {v0, p1}, Ll/dyh0;->setDataSource(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/dyh0;->prepareAsync()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 42
    .line 43
    new-instance v0, Ll/c4u;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/c4u;-><init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->d:Landroid/view/Surface;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setMute(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 62
    .line 63
    new-instance p2, Ll/d4u;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/d4u;-><init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Ll/dyh0;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 69
    .line 70
    .line 71
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->e:Z

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/dyh0;->setLooping(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catch_0
    move-exception p0

    .line 80
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->g:Ljava/lang/Runnable;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->p()V

    .line 5
    .line 6
    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/dyh0;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_2

    .line 17
    :catch_0
    move-exception v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 20
    .line 21
    return-void

    .line 22
    :goto_1
    :try_start_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 26
    .line 27
    return-void

    .line 28
    :goto_2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 29
    .line 30
    throw v1
.end method

.method public setCoverUrl(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "context_square"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setMute(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c:Ll/dyh0;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1, p1}, Ll/dyh0;->setVolume(FF)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p0, p1, p1}, Ll/dyh0;->setVolume(FF)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setNeedAdjustUI(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRadius(F)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView$b;-><init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;F)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->b:Landroid/view/TextureView;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->b:Landroid/view/TextureView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->a:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
