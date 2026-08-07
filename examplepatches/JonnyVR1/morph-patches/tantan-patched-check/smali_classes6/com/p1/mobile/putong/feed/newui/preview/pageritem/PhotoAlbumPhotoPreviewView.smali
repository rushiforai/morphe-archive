.class public Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lv/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;,
        Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;
    }
.end annotation


# static fields
.field public static g:I

.field public static h:I


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

.field public b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public c:Lv/VLinear;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;

.field public f:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->init()V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->init()V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->init()V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->L(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->getImageContainerHeight()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->getImageContainerWidth()I

    move-result p0

    return p0
.end method

.method private synthetic K(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic L(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of p1, p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private R()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->e:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->e:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;->a()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private S()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->f:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->f:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private getImageContainerHeight()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->h:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->w0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private getImageContainerWidth()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->g:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private init()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 13
    .line 14
    new-instance v1, Ll/ii70;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ii70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnViewTapListener(Ll/fp50;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 23
    .line 24
    new-instance v1, Ll/ji70;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ji70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    new-instance v1, Ll/ki70;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ki70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 43
    .line 44
    new-instance v1, Ll/li70;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/li70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->d:Lv/VImage;

    .line 53
    .line 54
    new-instance v1, Ll/mi70;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/mi70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Lcom/p1/mobile/putong/data/Picture;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->P(Lcom/p1/mobile/putong/data/Picture;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->Q(Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->K(Landroid/view/View;FF)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->N(Landroid/view/View;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oi70;->b(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/StickerInfo;->new_()Lcom/p1/mobile/putong/data/StickerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 33
    .line 34
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    const-string v1, "selfCollect"

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StickerSourceInfo;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StickerSourceInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/StickerInfo;->source:Lcom/p1/mobile/putong/data/StickerSourceInfo;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p1, v0, Lcom/p1/mobile/putong/data/StickerInfo;->hash:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ff(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/Picture;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->G(Lcom/p1/mobile/putong/data/Picture;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_add_gif"

    .line 2
    .line 3
    const-string v0, "p_comment_picture_preview"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ff(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ll/lde;->e()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/Picture;Z)V
    .locals 7

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 46
    .line 47
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$a;

    .line 48
    .line 49
    invoke-direct {v4, p0, v3}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 50
    .line 51
    .line 52
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 53
    .line 54
    const-string v6, ""

    .line 55
    .line 56
    invoke-virtual/range {v1 .. v6}, Ll/fsb0;->D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public W()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->c:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "e_add_gif"

    .line 10
    .line 11
    const-string v0, "p_comment_picture_preview"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VDraweeView;->k()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VDraweeView;->getZoomAnimationAttacher()Lv/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lv/a;->H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    sput p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->g:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sput p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->h:I

    .line 15
    .line 16
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnLongPressListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->e:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setOnTapListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->f:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

    .line 2
    .line 3
    return-void
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPicture(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->d:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->c:Lv/VLinear;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->c:Lv/VLinear;

    .line 14
    .line 15
    new-instance v2, Ll/hi70;

    .line 16
    .line 17
    invoke-direct {v2, p0, p1}, Ll/hi70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Lcom/p1/mobile/putong/data/Picture;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->V(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setStickerInfo(Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    const/high16 v1, 0x41200000    # 10.0f

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->V(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->c:Lv/VLinear;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->d:Lv/VImage;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->c:Lv/VLinear;

    .line 43
    .line 44
    new-instance v1, Ll/ni70;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1}, Ll/ni70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setZoomEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setZoomEnabled(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
