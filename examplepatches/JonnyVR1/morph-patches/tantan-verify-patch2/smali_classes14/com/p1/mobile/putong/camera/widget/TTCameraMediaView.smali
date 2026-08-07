.class public Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/TextureView;

.field public c:Ll/dyh0;

.field public d:Landroid/view/Surface;

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->e:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->h(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
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

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x1

    .line 12
    iput-boolean p2, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->e:Z

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->h(Landroid/content/Context;)V

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    .line 15
    iput-boolean p2, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->e:Z

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->h(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->j(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->i(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->k(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->f:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->d:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->f:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final g()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->a:Lv/VDraweeView;

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

.method public final h(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/iec0;->d:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    sget p1, Ll/xcc0;->j:I

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
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->a:Lv/VDraweeView;

    .line 20
    .line 21
    sget p1, Ll/xcc0;->r:I

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
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->b:Landroid/view/TextureView;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;-><init>(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic i(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->l(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->g()V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic k(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->m()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public l(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dyh0;->isPlaying()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->m()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->d:Landroid/view/Surface;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-instance v0, Ll/yth0;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1}, Ll/yth0;-><init>(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->f:Ljava/lang/Runnable;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-static {}, Ll/fyh0;->d()Ll/fyh0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/fyh0;->e()Ll/dyh0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 42
    .line 43
    new-instance v0, Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v1, ""

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/irq;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "Authorization"

    .line 55
    .line 56
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {v1, v2, p1, v0}, Ll/dyh0;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/dyh0;->prepareAsync()V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 82
    .line 83
    new-instance v0, Ll/zth0;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/zth0;-><init>(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->d:Landroid/view/Surface;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 99
    .line 100
    new-instance v0, Ll/auh0;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/auh0;-><init>(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ll/dyh0;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 109
    .line 110
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->e:Z

    .line 111
    .line 112
    invoke-virtual {p1, p0}, Ll/dyh0;->setLooping(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :catch_0
    move-exception p0

    .line 117
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    :goto_0
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->f:Ljava/lang/Runnable;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->n()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/dyh0;->stop()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c:Ll/dyh0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->a:Lv/VDraweeView;

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

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->m()V

    .line 2
    .line 3
    .line 4
    return-void
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
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setRadius(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->b:Landroid/view/TextureView;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
