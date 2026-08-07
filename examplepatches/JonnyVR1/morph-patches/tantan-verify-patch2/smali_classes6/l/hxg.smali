.class public Ll/hxg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fxg;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

.field public b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

.field public c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

.field public d:Ll/a4h;

.field public e:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/hxg;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hxg;->i()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;-><init>(Landroid/content/Context;Z)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 10
    .line 11
    iget-object v1, p0, Ll/hxg;->d:Ll/a4h;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setFeedDragDismissListener(Ll/z3h;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setInnerContentView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/hxg;->f(Lcom/p1/mobile/putong/data/Media;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

    .line 36
    .line 37
    return-object p0
.end method

.method public c(Ll/fxg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final d(Landroid/view/View;)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->e:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->e:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->f:Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->f:Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v0, 0x0

    .line 39
    :goto_0
    if-nez v0, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 43
    .line 44
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 48
    .line 49
    int-to-float v1, v1

    .line 50
    invoke-static {v2, v1}, Ll/ksg;->p0(FF)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0}, Ll/hxg;->b(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_3
    :goto_1
    return-object p1
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxg;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    iget-object v0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    iget-object p0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    iget-object v0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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
    iget-object p0, p0, Ll/hxg;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;

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

.method public final synthetic i()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->e:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object p0, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->f:Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/rzi;->G(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 22
    .line 23
    .line 24
    return v1
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fxg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hxg;->c(Ll/fxg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 2
    .line 3
    iget-object p2, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 4
    .line 5
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 9
    .line 10
    iget-object p1, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->e:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p2, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->e:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/hxg;->j(Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->f:Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->f:Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/hxg;->k(Lcom/p1/mobile/putong/data/Picture;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    new-instance p1, Ll/a4h;

    .line 44
    .line 45
    iget-object p2, p0, Ll/hxg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 46
    .line 47
    invoke-direct {p1, p2}, Ll/a4h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/hxg;->d:Ll/a4h;

    .line 51
    .line 52
    iget-object p2, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 53
    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 55
    .line 56
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/hxg;->d(Landroid/view/View;)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/hxg;->e:Landroid/view/View;

    .line 66
    .line 67
    iget-object p1, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 68
    .line 69
    new-instance p2, Ll/gxg;

    .line 70
    .line 71
    invoke-direct {p2, p0}, Ll/gxg;-><init>(Ll/hxg;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->setOnLongPressListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/hxg;->e:Landroid/view/View;

    .line 78
    .line 79
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->setStickerInfo(Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->setPicture(Lcom/p1/mobile/putong/data/Picture;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxg;->b:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->W()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
