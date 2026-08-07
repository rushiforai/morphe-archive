.class public Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/TextureView;

.field public b:Ll/dyh0;

.field public c:Landroid/view/Surface;

.field public d:Z

.field public e:Z

.field public f:Ljava/lang/Runnable;
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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->e:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->i(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
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

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x1

    .line 14
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->d:Z

    .line 15
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->e:Z

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->i(Landroid/content/Context;)V

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

    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    .line 18
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->d:Z

    .line 19
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->e:Z

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->i(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->k(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->j(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->l(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)Ljava/lang/Boolean;
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

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->f:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->c:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->f:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
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
    iget v1, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mWidth:I

    .line 12
    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    int-to-float v1, v1

    .line 17
    div-float/2addr v0, v1

    .line 18
    invoke-static {}, Ll/bnl0;->y0()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v2, v1

    .line 23
    mul-float/2addr v2, v0

    .line 24
    float-to-int v2, v2

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->a:Landroid/view/TextureView;

    .line 26
    .line 27
    invoke-static {v3, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->a:Landroid/view/TextureView;

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    new-array v3, v3, [Landroid/view/View;

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    aput-object p0, v3, v4

    .line 37
    .line 38
    invoke-static {v1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "ratio:"

    .line 44
    .line 45
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, " streamWH:"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v0, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mWidth:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, ":"

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget p1, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mHeight:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p1, " viewWH:"

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "live_Media_Bg_View"

    .line 90
    .line 91
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method public final i(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/yec0;->L3:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    sget p1, Ll/mdc0;->J6:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/view/TextureView;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->a:Landroid/view/TextureView;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic j(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->n(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    const/4 p3, 0x3

    .line 2
    if-ne p2, p3, :cond_1

    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->e:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getMediaInfo()Lcom/tantanapp/ijk/media/player/MediaInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, Lcom/tantanapp/ijk/media/player/MediaInfo;->mMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta;->mStreams:Ljava/util/ArrayList;

    .line 15
    .line 16
    new-instance p2, Ll/c4t;

    .line 17
    .line 18
    invoke-direct {p2}, Ll/c4t;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->h(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final synthetic l(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "player onError what: "

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p2, " extra: "

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "live_Media_Bg_View"

    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/dyh0;->stop()V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 37
    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public m(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->n(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->c:Landroid/view/Surface;

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    new-instance v0, Ll/z3t;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1, p2}, Ll/z3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->f:Ljava/lang/Runnable;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/dyh0;->prepareAsync()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 42
    .line 43
    new-instance v0, Ll/a4t;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/a4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->c:Landroid/view/Surface;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->setMute(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 62
    .line 63
    new-instance p2, Ll/b4t;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/b4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Ll/dyh0;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 72
    .line 73
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->d:Z

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Ll/dyh0;->setLooping(Z)V
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

.method public o()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->f:Ljava/lang/Runnable;

    .line 3
    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/dyh0;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v1

    .line 13
    goto :goto_2

    .line 14
    :catch_0
    move-exception v1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 17
    .line 18
    return-void

    .line 19
    :goto_1
    :try_start_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 23
    .line 24
    return-void

    .line 25
    :goto_2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

    .line 26
    .line 27
    throw v1
.end method

.method public setMute(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->b:Ll/dyh0;

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
