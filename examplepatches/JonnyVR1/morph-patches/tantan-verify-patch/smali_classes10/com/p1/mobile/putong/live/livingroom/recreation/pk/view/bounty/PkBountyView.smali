.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/it70;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

.field public c:Ll/it70;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Ljava/util/List;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->i(Ljava/util/List;Ljava/lang/String;Ll/x20;)V

    return-void
.end method

.method private d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lt70;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/it70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->c:Ll/it70;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/immomo/svgaplayer/bean/InsertTextBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_0
    new-instance v2, Lcom/immomo/svgaplayer/bean/InsertTextBean;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/immomo/svgaplayer/bean/InsertTextBean;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->setKey(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;->type:I

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->setType(I)V

    .line 35
    .line 36
    .line 37
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;->value:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Lcom/immomo/svgaplayer/bean/InsertTextBean;->setText(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;->size:I

    .line 43
    .line 44
    int-to-float v3, v3

    .line 45
    invoke-virtual {v2, v3}, Lcom/immomo/svgaplayer/bean/InsertTextBean;->setTextSize(F)V

    .line 46
    .line 47
    .line 48
    :try_start_0
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyEffectExtras;->color:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {v2, v1}, Lcom/immomo/svgaplayer/bean/InsertTextBean;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catch_0
    move-exception v1

    .line 59
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    const-string v1, "#FFFFFF"

    .line 63
    .line 64
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v2, v1}, Lcom/immomo/svgaplayer/bean/InsertTextBean;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    :goto_1
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-object p0
.end method

.method public final synthetic i(Ljava/util/List;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->clearInsertData()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->f(Ljava/util/List;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->insertBeanList(Ljava/util/List;)Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->l(Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/it70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->c(Ll/it70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Ll/x20;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->getAnchorResource()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->resourceId:Ljava/lang/String;

    .line 12
    .line 13
    const/16 v1, 0x258

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/n1k0;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->effectExtras:Ljava/util/List;

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_2
    new-instance v1, Ll/jt70;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, v0, p2}, Ll/jt70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Ljava/util/List;Ljava/lang/String;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->getAnchorWinIndicator()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->k(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public l(Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 8
    .line 9
    sget-object v2, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;->ALIGN_PARENT_BOTTOM:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->setLayoutType(Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;)Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 15
    .line 16
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;

    .line 17
    .line 18
    invoke-direct {v2, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-virtual {v0, p1, v1, p0, v2}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->n()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->d()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
