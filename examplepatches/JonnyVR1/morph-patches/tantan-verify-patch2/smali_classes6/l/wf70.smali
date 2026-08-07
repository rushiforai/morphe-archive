.class public Ll/wf70;
.super Ll/lb2;
.source "SourceFile"


# static fields
.field public static y:Z


# instance fields
.field public e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

.field public f:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

.field public g:Ll/ie80;

.field public h:Ll/ie80;

.field public i:Ll/z3h;

.field public j:Ll/ie80$c;

.field public k:Lcom/p1/mobile/android/app/Act;

.field public l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/feed/data/Moment;

.field public n:Z

.field public o:I

.field public p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

.field public q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;",
            ">;"
        }
    .end annotation
.end field

.field public r:Z

.field public s:Ll/jxh;

.field public t:Z

.field public u:Lv/VImage;

.field public v:Z

.field public w:I

.field public x:Ll/ga1;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wf70;->q:Ljava/util/HashMap;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/wf70;->r:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/wf70;->t:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/wf70;->v:Z

    .line 18
    .line 19
    iput v0, p0, Ll/wf70;->w:I

    .line 20
    .line 21
    new-instance v0, Ll/wf70$c;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/wf70$c;-><init>(Ll/wf70;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/wf70;->x:Ll/ga1;

    .line 27
    .line 28
    iput-object p1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    iput-object p2, p0, Ll/wf70;->l:Ljava/util/ArrayList;

    .line 31
    .line 32
    iput-object p3, p0, Ll/wf70;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic A(Ll/wf70;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wf70;->w:I

    return p0
.end method

.method public static bridge synthetic C(Ll/wf70;)Ll/ie80$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wf70;->j:Ll/ie80$c;

    return-object p0
.end method

.method public static bridge synthetic D(Ll/wf70;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    return-object p0
.end method

.method public static bridge synthetic E(Ll/wf70;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wf70;->R()Z

    move-result p0

    return p0
.end method

.method private F(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-boolean v2, p0, Ll/wf70;->t:Z

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;-><init>(Landroid/content/Context;Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/wf70;->i:Ll/z3h;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setFeedDragDismissListener(Ll/z3h;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setInnerContentView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p2}, Ll/wf70;->Q(Lcom/p1/mobile/putong/data/Media;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->getDragBackListener()Ll/y3h;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setFeedDragDismissBackListener(Ll/y3h;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-boolean p1, p0, Ll/wf70;->r:Z

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 48
    .line 49
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-direct {p0, p2}, Ll/wf70;->P(Lcom/p1/mobile/putong/data/Media;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 62
    .line 63
    return-object p0
.end method

.method private G(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
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
    invoke-static {v1, v0}, Ll/ksg;->p0(FF)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    :cond_0
    invoke-direct {p0, p2}, Ll/wf70;->Q(Lcom/p1/mobile/putong/data/Media;)Z

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
    invoke-direct {p0, p1, p2}, Ll/wf70;->F(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method private L(Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    move-object v1, p1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->V(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/qf70;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/qf70;-><init>(Ll/wf70;Lcom/p1/mobile/putong/data/Media;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->setOnLongPressListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/rf70;

    .line 24
    .line 25
    invoke-direct {p1, p0, v0}, Ll/rf70;-><init>(Ll/wf70;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;)V

    .line 29
    .line 30
    .line 31
    iget-boolean p1, p0, Ll/wf70;->n:Z

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 36
    .line 37
    iget-object p0, p0, Ll/wf70;->i:Ll/z3h;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-object v0
.end method

.method public static N()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_preview_vedio_voice_mute"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private P(Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 2
    .line 3
    sget v1, Ll/hdc0;->o1:I

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
    iget-object v0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setOriginalHeight(F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setOriginalWidth(F)V

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
    iget-object v0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setOriginalHeight(F)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/wf70;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setOriginalWidth(F)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method private Q(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->v0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private R()Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "livephoto_function"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    :catch_0
    :cond_0
    return p0
.end method

.method private b0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Video;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 31
    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    const-string v1, "normal"

    .line 35
    .line 36
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 68
    .line 69
    iget v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->duration:F

    .line 70
    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 76
    .line 77
    return-object p0
.end method

.method private k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/mf70;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/mf70;-><init>(Ll/wf70;)V

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

.method public static l0(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/wf70;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic q(Ll/wf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wf70;->S()V

    return-void
.end method

.method public static synthetic r(Ll/wf70;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wf70;->T(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    return-void
.end method

.method public static synthetic s(Ll/wf70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wf70;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/wf70;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wf70;->Z(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic u(Ll/wf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wf70;->V()V

    return-void
.end method

.method public static synthetic v(Ll/wf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wf70;->Y()V

    return-void
.end method

.method public static synthetic w(Ll/wf70;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wf70;->X(Z)V

    return-void
.end method

.method public static synthetic x(Ll/wf70;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wf70;->W(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    return-void
.end method

.method public static synthetic y(Ll/wf70;Lcom/p1/mobile/putong/data/Media;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wf70;->U(Lcom/p1/mobile/putong/data/Media;)Z

    move-result p0

    return p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/jka;->S6(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public H()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/jka;->H:Z

    .line 4
    .line 5
    xor-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput-boolean v2, v0, Ll/jka;->H:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v0, "off"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "on"

    .line 15
    .line 16
    :goto_0
    const-string v1, "voiceswitch"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {v0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "e_video_voice_switch"

    .line 27
    .line 28
    const-string v2, "p_moment_preview"

    .line 29
    .line 30
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/wf70;->i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wf70;->q:Ljava/util/HashMap;

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
    iget-object v0, p0, Ll/wf70;->q:Ljava/util/HashMap;

    .line 10
    .line 11
    iget v1, p0, Ll/wf70;->o:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/wf70;->q:Ljava/util/HashMap;

    .line 24
    .line 25
    iget p0, p0, Ll/wf70;->o:I

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/data/Media;I)Landroid/view/View;
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/wf70;->Q(Lcom/p1/mobile/putong/data/Media;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/wf70;->K(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ll/wf70;->L(Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    move-object v0, p1

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/wf70;->M(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 v0, 0x0

    .line 37
    :goto_0
    iget-object v1, p0, Ll/wf70;->s:Ll/jxh;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    iget-object v1, p0, Ll/wf70;->s:Ll/jxh;

    .line 46
    .line 47
    invoke-interface {v1, p2, v0}, Ll/jxh;->d(ILandroid/view/View;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 51
    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    move-object p2, v0

    .line 55
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 56
    .line 57
    iput-object p2, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/wf70;->k0()V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_4
    instance-of v2, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 64
    .line 65
    if-eqz v2, :cond_5

    .line 66
    .line 67
    iget-object v2, p0, Ll/wf70;->q:Ljava/util/HashMap;

    .line 68
    .line 69
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    move-object v3, v0

    .line 74
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 75
    .line 76
    invoke-virtual {v2, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Ll/wf70;->q:Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    const/4 v2, 0x1

    .line 86
    if-ne p2, v2, :cond_5

    .line 87
    .line 88
    invoke-direct {p0}, Ll/wf70;->k0()V

    .line 89
    .line 90
    .line 91
    :cond_5
    :goto_1
    invoke-direct {p0, v0, p1}, Ll/wf70;->G(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-nez v1, :cond_7

    .line 96
    .line 97
    instance-of p2, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 98
    .line 99
    if-eqz p2, :cond_6

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_6
    return-object p1

    .line 103
    :cond_7
    :goto_2
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 104
    .line 105
    iget-object v0, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;-><init>(Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    iput-object p2, p0, Ll/wf70;->f:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    invoke-virtual {p2, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/wf70;->s:Ll/jxh;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_8

    .line 123
    .line 124
    iget-object p1, p0, Ll/wf70;->s:Ll/jxh;

    .line 125
    .line 126
    iget-object p2, p0, Ll/wf70;->f:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 127
    .line 128
    invoke-interface {p1, p2}, Ll/jxh;->l(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    .line 129
    .line 130
    .line 131
    :cond_8
    iget-object p0, p0, Ll/wf70;->f:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 132
    .line 133
    return-object p0
.end method

.method public final K(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/wf70;->b0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 6
    .line 7
    iget-object v1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->setProgressBarsEnabled(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/wf70;->O(Ljava/lang/String;)Ll/ie80;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "moments"

    .line 23
    .line 24
    invoke-interface {v1, v2}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/wf70;->O(Ljava/lang/String;)Ll/ie80;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->setPlayer(Ll/ie80;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/bnl0;->y0()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {}, Ll/bnl0;->w0()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-static {}, Ll/bnl0;->F0()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    sub-int/2addr v2, v3

    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->q(II)V

    .line 53
    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    iput v1, p0, Ll/wf70;->w:I

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
    iget-object v3, p0, Ll/wf70;->x:Ll/ga1;

    .line 65
    .line 66
    const-string v4, "PhotoAlbumFeedPreviewAdapter"

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
    new-instance p1, Ll/pf70;

    .line 89
    .line 90
    invoke-direct {p1, p0, v0}, Ll/pf70;-><init>(Ll/wf70;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->setOnTapListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;)V

    .line 94
    .line 95
    .line 96
    new-instance p1, Ll/wf70$b;

    .line 97
    .line 98
    invoke-direct {p1, p0}, Ll/wf70$b;-><init>(Ll/wf70;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->o(Ll/ie80$b;)V

    .line 102
    .line 103
    .line 104
    return-object v0
.end method

.method public final M(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->h:Lv/VFrame_ColorFilter;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->i:Landroid/widget/ImageView;

    .line 15
    .line 16
    invoke-static {}, Ll/j4h;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    sget v2, Ll/lbc0;->U3:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget v2, Ll/lbc0;->T3:I

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/of70;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/of70;-><init>(Ll/wf70;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->setOnClickButtonListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView$c;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/wf70;->d0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->setProgressBarsEnabled(Z)V

    .line 43
    .line 44
    .line 45
    const-string v1, ""

    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move-object v2, v1

    .line 53
    :goto_1
    invoke-virtual {p0, v2}, Ll/wf70;->O(Ljava/lang/String;)Ll/ie80;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v3, "moments"

    .line 58
    .line 59
    invoke-interface {v2, v3}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 65
    .line 66
    :cond_2
    invoke-virtual {p0, v1}, Ll/wf70;->O(Ljava/lang/String;)Ll/ie80;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->setPlayer(Ll/ie80;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ll/bnl0;->y0()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-static {}, Ll/bnl0;->w0()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-static {}, Ll/bnl0;->F0()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    sub-int/2addr v2, v3

    .line 89
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->t(II)V

    .line 90
    .line 91
    .line 92
    const/4 v1, -0x1

    .line 93
    iput v1, p0, Ll/wf70;->w:I

    .line 94
    .line 95
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 100
    .line 101
    iget-object v3, p0, Ll/wf70;->x:Ll/ga1;

    .line 102
    .line 103
    const-string v4, "PhotoAlbumFeedPreviewAdapter"

    .line 104
    .line 105
    invoke-virtual {v1, v4, v2, v3}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_3

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {p1}, Ll/uqb0;->S0(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_3
    new-instance p1, Ll/wf70$a;

    .line 132
    .line 133
    invoke-direct {p1, p0}, Ll/wf70$a;-><init>(Ll/wf70;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->r(Ll/ie80$b;)V

    .line 137
    .line 138
    .line 139
    return-object v0
.end method

.method public O(Ljava/lang/String;)Ll/ie80;
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
    iget-object p1, p0, Ll/wf70;->g:Ll/ie80;

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
    iput-object p1, p0, Ll/wf70;->g:Ll/ie80;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/wf70;->g:Ll/ie80;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p1, p0, Ll/wf70;->h:Ll/ie80;

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
    iput-object p1, p0, Ll/wf70;->h:Ll/ie80;

    .line 39
    .line 40
    :cond_2
    iget-object p0, p0, Ll/wf70;->h:Ll/ie80;

    .line 41
    .line 42
    return-object p0
.end method

.method public final synthetic S()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/wf70;->c0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V
    .locals 3

    .line 1
    new-instance v0, Ll/uf70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uf70;-><init>(Ll/wf70;)V

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

.method public final synthetic U(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    iget-object v1, p0, Ll/wf70;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    iget-object v3, p0, Ll/wf70;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    new-instance v4, Ll/tf70;

    .line 26
    .line 27
    invoke-direct {v4}, Ll/tf70;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v6, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    const-string v7, "p_moment_preview"

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    move-object v9, p1

    .line 36
    invoke-static/range {v3 .. v9}, Ll/rzi;->Q(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Media;)V

    .line 37
    .line 38
    .line 39
    return v2
.end method

.method public final synthetic V()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/wf70;->c0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V
    .locals 3

    .line 1
    new-instance v0, Ll/sf70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sf70;-><init>(Ll/wf70;)V

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

.method public final synthetic X(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wf70;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic Y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wf70;->n0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

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
    iget-object p1, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/wf70;->i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->F()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->z()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-boolean p1, p1, Ll/jka;->H:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Ll/wf70;->w:I

    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 15
    .line 16
    iget-object p0, p0, Ll/wf70;->x:Ll/ga1;

    .line 17
    .line 18
    const-string v1, "PhotoAlbumFeedPreviewAdapter"

    .line 19
    .line 20
    invoke-virtual {p1, v1, v0, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/wf70;->H()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public c0(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/wf70;->s:Ll/jxh;

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
    iget-object p0, p0, Ll/wf70;->s:Ll/jxh;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/jxh;->g()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public d0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wf70;->h:Ll/ie80;

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
    iget-object v0, p0, Ll/wf70;->h:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/wf70;->g:Ll/ie80;

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
    iget-object p0, p0, Ll/wf70;->g:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->release()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public f0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wf70;->t:Z

    .line 2
    .line 3
    return-void
.end method

.method public g0(Ll/jxh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wf70;->s:Ll/jxh;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/jxh;->e()Ll/ie80$c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/wf70;->j:Ll/ie80$c;

    .line 8
    .line 9
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wf70;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

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

.method public h0(Ll/z3h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wf70;->i:Ll/z3h;

    .line 2
    .line 3
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
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
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-boolean v0, v0, Ll/jka;->H:Z

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->D(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ll/wf70;->u:Lv/VImage;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_4

    .line 21
    .line 22
    iget-object p1, p0, Ll/wf70;->u:Lv/VImage;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/j4h;->h()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget-object v0, p0, Ll/wf70;->u:Lv/VImage;

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    iget-boolean p1, p1, Ll/jka;->H:Z

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    sget p1, Ll/lbc0;->N5:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    sget p1, Ll/lbc0;->P5:I

    .line 46
    .line 47
    :goto_0
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 52
    .line 53
    iget-boolean p1, p1, Ll/jka;->H:Z

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    sget p1, Ll/lbc0;->M5:I

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    sget p1, Ll/lbc0;->O5:I

    .line 61
    .line 62
    :goto_1
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 63
    .line 64
    .line 65
    :goto_2
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 66
    .line 67
    iget-object p1, p1, Ll/jka;->I:Ll/jxd0;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    invoke-static {}, Ll/cmg;->A0()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_4

    .line 86
    .line 87
    iget-object p1, p0, Ll/wf70;->u:Lv/VImage;

    .line 88
    .line 89
    new-instance v0, Ll/vf70;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/vf70;-><init>(Ll/wf70;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 95
    .line 96
    .line 97
    :cond_4
    return-void
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

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

.method public j0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wf70;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public m0(Lv/VImage;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/wf70;->u:Lv/VImage;

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
    iget-object p1, p0, Ll/wf70;->u:Lv/VImage;

    .line 10
    .line 11
    new-instance v0, Ll/nf70;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/nf70;-><init>(Ll/wf70;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public n0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->I:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 19
    .line 20
    iget-object v0, v0, Ll/jka;->I:Ll/jxd0;

    .line 21
    .line 22
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 28
    .line 29
    iget-object v1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "\u89c6\u9891\u58f0\u97f3\u9ed8\u8ba4\u5173\u95ed\uff0c\u5355\u51fb\u5f00\u542f"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/wf70;->k:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {}, Ll/j4h;->h()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    sget v2, Ll/k9c0;->i:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    sget v2, Ll/k9c0;->n:I

    .line 56
    .line 57
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    filled-new-array {v1}, [I

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const/high16 v1, 0x41500000    # 13.0f

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/4 v1, 0x1

    .line 76
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-wide/16 v2, 0x2710

    .line 81
    .line 82
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 91
    .line 92
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 93
    .line 94
    or-int/2addr v1, v2

    .line 95
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 100
    .line 101
    const/high16 v2, 0x40c00000    # 6.0f

    .line 102
    .line 103
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iget-object p0, p0, Ll/wf70;->u:Lv/VImage;

    .line 116
    .line 117
    const-string v2, "moment_preview_vedio_voice_mute"

    .line 118
    .line 119
    invoke-virtual {v1, v0, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
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
    if-eqz p2, :cond_3

    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    move-object p2, p0

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->setPlayer(Ll/ie80;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    move-object p2, p0

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 29
    .line 30
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->setPlayer(Ll/ie80;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 35
    .line 36
    if-eqz p2, :cond_2

    .line 37
    .line 38
    move-object p2, p0

    .line 39
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->T()V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    return-void
.end method

.method public o0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wf70;->h:Ll/ie80;

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
    iget-object v0, p0, Ll/wf70;->h:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/wf70;->g:Ll/ie80;

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
    iget-object p0, p0, Ll/wf70;->g:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/wf70;->o:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/wf70;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

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
    iget-object v0, p0, Ll/wf70;->h:Ll/ie80;

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
    iget-object v0, p0, Ll/wf70;->h:Ll/ie80;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/wf70;->g:Ll/ie80;

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
    iget-object v0, p0, Ll/wf70;->g:Ll/ie80;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget v0, p0, Ll/wf70;->o:I

    .line 40
    .line 41
    if-eq v0, p1, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Ll/wf70;->q:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->B()V

    .line 66
    .line 67
    .line 68
    :cond_2
    iput p1, p0, Ll/wf70;->o:I

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->z()V

    .line 85
    .line 86
    .line 87
    :cond_3
    iput p1, p0, Ll/wf70;->o:I

    .line 88
    .line 89
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wf70;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p2}, Ll/wf70;->J(Lcom/p1/mobile/putong/data/Media;I)Landroid/view/View;

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

.method public p0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ll/wf70;->R()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Ll/wf70;->I()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    xor-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->x(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
