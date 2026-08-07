.class public Ll/dl5;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Z

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/pq80;

.field public i:Lcom/p1/mobile/putong/core/ui/PlayerView;

.field public j:Ll/ie80;

.field public k:Ll/ie80;

.field public l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

.field public final m:Ll/xae;

.field public n:Ll/ie80$c;

.field public o:Z

.field public p:Z

.field public q:I

.field public r:Lv/VImage;

.field public s:I

.field public t:Ll/ga1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dl5;->e:Z

    .line 6
    .line 7
    new-instance v1, Ll/xae;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/xae;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/dl5;->m:Ll/xae;

    .line 13
    .line 14
    iput v0, p0, Ll/dl5;->s:I

    .line 15
    .line 16
    new-instance v0, Ll/dl5$b;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/dl5$b;-><init>(Ll/dl5;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/dl5;->t:Ll/ga1;

    .line 22
    .line 23
    iput-object p1, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iput-object p2, p0, Ll/dl5;->g:Ljava/util/List;

    .line 26
    .line 27
    return-void
.end method

.method private C(Lcom/p1/mobile/putong/data/Media;I)Landroid/view/View;
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dl5;->D(Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/dl5;->E(Lcom/p1/mobile/putong/data/Video;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    :goto_0
    iget-object v1, p0, Ll/dl5;->h:Ll/pq80;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Ll/dl5;->h:Ll/pq80;

    .line 32
    .line 33
    invoke-interface {v1, p2, v0}, Ll/pq80;->d(ILandroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    instance-of p2, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 37
    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    move-object p2, v0

    .line 41
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 42
    .line 43
    iput-object p2, p0, Ll/dl5;->i:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/dl5;->Q()V

    .line 46
    .line 47
    .line 48
    :cond_3
    invoke-virtual {p0, v0, p1}, Ll/dl5;->z(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method private G(Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 2
    .line 3
    sget v1, Ll/adc0;->z9:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 17
    .line 18
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setOriginalHeight(F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 29
    .line 30
    int-to-float p1, p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setOriginalWidth(F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 40
    .line 41
    invoke-static {}, Ll/bnl0;->w0()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 48
    .line 49
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 50
    .line 51
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    int-to-float v1, v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setOriginalHeight(F)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 62
    .line 63
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 64
    .line 65
    int-to-float p1, p1

    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setOriginalWidth(F)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public static synthetic q(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic r(Ll/dl5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dl5;->I()V

    return-void
.end method

.method public static synthetic s(Ll/dl5;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dl5;->K(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic t(Ll/dl5;Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dl5;->J(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    return-void
.end method

.method public static bridge synthetic u(Ll/dl5;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/dl5;->s:I

    return p0
.end method

.method public static bridge synthetic v(Ll/dl5;)Ll/ie80$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl5;->n:Ll/ie80$c;

    return-object p0
.end method

.method public static bridge synthetic w(Ll/dl5;)Lcom/p1/mobile/putong/core/ui/PlayerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl5;->i:Lcom/p1/mobile/putong/core/ui/PlayerView;

    return-object p0
.end method

.method private y(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-boolean v2, p0, Ll/dl5;->e:Z

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;-><init>(Landroid/content/Context;Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/dl5;->m:Ll/xae;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setFeedDragDismissListener(Ll/rae;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setInnerContentView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-boolean p1, p0, Ll/dl5;->o:Z

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 27
    .line 28
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-direct {p0, p2}, Ll/dl5;->G(Lcom/p1/mobile/putong/data/Media;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/dl5;->l:Lcom/p1/mobile/putong/core/ui/mediapreview/DragDismissContainerView;

    .line 41
    .line 42
    return-object p0
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->sh()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Re(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->sh()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const-string v1, "off"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string v1, "on"

    .line 38
    .line 39
    :goto_0
    const-string v2, "voiceswitch"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    filled-new-array {v1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, "e_video_voice_switch"

    .line 50
    .line 51
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/dl5;->i:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/dl5;->O(Lcom/p1/mobile/putong/core/ui/PlayerView;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->N(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 12
    .line 13
    .line 14
    const/16 p1, 0x8

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setReplayVisibility(I)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ll/al5;

    .line 20
    .line 21
    invoke-direct {p1, p0, v0}, Ll/al5;-><init>(Ll/dl5;Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dl5;->m:Ll/xae;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public final E(Lcom/p1/mobile/putong/data/Video;)Landroid/view/View;
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setProgressBarsEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/dl5;->F(Ljava/lang/String;)Ll/ie80;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "profile"

    .line 19
    .line 20
    invoke-interface {v1, v2}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/bnl0;->y0()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {}, Ll/bnl0;->w0()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {}, Ll/bnl0;->F0()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    sub-int/2addr v2, v3

    .line 48
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/PlayerView;->x(II)V

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setReplayVisibility(I)V

    .line 53
    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    iput v1, p0, Ll/dl5;->s:I

    .line 57
    .line 58
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 63
    .line 64
    iget-object v3, p0, Ll/dl5;->t:Ll/ga1;

    .line 65
    .line 66
    const-string v4, "CommonMediaPreviewAdapter"

    .line 67
    .line 68
    invoke-virtual {v1, v4, v2, v3}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-nez v1, :cond_0

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Ll/uqb0;->S0(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->K()V

    .line 89
    .line 90
    .line 91
    new-instance p1, Ll/zk5;

    .line 92
    .line 93
    invoke-direct {p1}, Ll/zk5;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 97
    .line 98
    .line 99
    new-instance p1, Ll/dl5$a;

    .line 100
    .line 101
    invoke-direct {p1, p0}, Ll/dl5$a;-><init>(Ll/dl5;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->v(Ll/ie80$b;)V

    .line 105
    .line 106
    .line 107
    return-object v0
.end method

.method public F(Ljava/lang/String;)Ll/ie80;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "http"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/dl5;->j:Ll/ie80;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/re80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/re80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/dl5;->j:Ll/ie80;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/dl5;->j:Ll/ie80;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p1, p0, Ll/dl5;->k:Ll/ie80;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    new-instance p1, Ll/ye80;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ye80;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/dl5;->k:Ll/ie80;

    .line 39
    .line 40
    :cond_2
    iget-object p0, p0, Ll/dl5;->k:Ll/ie80;

    .line 41
    .line 42
    return-object p0
.end method

.method public final H(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic I()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/dl5;->L(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
    .locals 3

    .line 1
    new-instance v0, Ll/bl5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bl5;-><init>(Ll/dl5;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/dl5;->i:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/dl5;->i:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->K()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dl5;->h:Ll/pq80;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dl5;->h:Ll/pq80;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/pq80;->g()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dl5;->k:Ll/ie80;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dl5;->k:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/dl5;->j:Ll/ie80;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/dl5;->j:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->release()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public N(Ll/pq80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dl5;->h:Ll/pq80;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/pq80;->e()Ll/ie80$c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/dl5;->n:Ll/ie80$c;

    .line 8
    .line 9
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/core/ui/PlayerView;)V
    .locals 1

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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->sh()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->H(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/dl5;->r:Lv/VImage;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Ll/dl5;->r:Lv/VImage;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/dl5;->r:Lv/VImage;

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->sh()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    sget v0, Ll/dbc0;->Qr:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget v0, Ll/dbc0;->Rr:I

    .line 48
    .line 49
    :goto_0
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ln()Ll/jxd0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    invoke-static {}, Ll/gra;->Y2()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    iget-object p1, p0, Ll/dl5;->r:Lv/VImage;

    .line 79
    .line 80
    new-instance v0, Ll/cl5;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/cl5;-><init>(Ll/dl5;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public P(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/dl5;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/yk5;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/yk5;-><init>(Ll/dl5;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public R()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ln()Ll/jxd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 15
    .line 16
    iget-object v1, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const-string v1, "\u89c6\u9891\u58f0\u97f3\u9ed8\u8ba4\u5173\u95ed\uff0c\u5355\u51fb\u5f00\u542f"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/dl5;->f:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Ll/c9c0;->I:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    filled-new-array {v1}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/high16 v1, 0x41500000    # 13.0f

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-wide/16 v2, 0x2710

    .line 59
    .line 60
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 69
    .line 70
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 71
    .line 72
    or-int/2addr v1, v2

    .line 73
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 78
    .line 79
    const/high16 v2, 0x40c00000    # 6.0f

    .line 80
    .line 81
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object p0, p0, Ll/dl5;->r:Lv/VImage;

    .line 94
    .line 95
    const-string v2, "preview_vedio_voice_mute"

    .line 96
    .line 97
    invoke-virtual {v1, v0, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public S()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dl5;->k:Ll/ie80;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dl5;->k:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/dl5;->j:Ll/ie80;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/dl5;->j:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl5;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_2

    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    move-object p2, p0

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    move-object p2, p0

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->M()V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/dl5;->q:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/dl5;->i:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/dl5;->k:Ll/ie80;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/dl5;->k:Ll/ie80;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/dl5;->j:Ll/ie80;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/dl5;->j:Ll/ie80;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 37
    .line 38
    .line 39
    :cond_1
    iput p1, p0, Ll/dl5;->q:I

    .line 40
    .line 41
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dl5;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-direct {p0, v0, p2}, Ll/dl5;->C(Lcom/p1/mobile/putong/data/Media;I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public x(Ll/rae;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl5;->m:Ll/xae;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xae;->g(Ll/rae;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final z(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
    .locals 2

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p2

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 13
    .line 14
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 15
    .line 16
    int-to-float v1, v1

    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    invoke-static {v1, v0}, Ll/vnb;->r1(FF)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, p2}, Ll/dl5;->H(Lcom/p1/mobile/putong/data/Media;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-object p1

    .line 34
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p2}, Ll/dl5;->y(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method
