.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->n0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->m0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ddh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V
    .locals 1

    .line 1
    new-instance v0, Ll/adh;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/adh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->schema:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    add-int/2addr p1, v2

    .line 30
    invoke-static {v1, p1, v2}, Ll/dug;->i(Lcom/p1/mobile/putong/feed/data/Moment;IZ)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->h:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->schema:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->gj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->h:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->extra:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->zn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->h:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->extra:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->M7(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/bdh;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/bdh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/cdh;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/cdh;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    invoke-static {p0}, Ll/dug;->e(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->h:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 4
    .line 5
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->l:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->p0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->l0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    invoke-static {p0}, Ll/dug;->f(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->d:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->e:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->f:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->desc:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->g:Landroid/widget/TextView;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->buttonText:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
