.class public Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/bvl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;

.field public b:Lv/VFrame_FlipContainer;

.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VFrame_FlipContainer;

.field public h:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public k:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public l:Lv/VLinear;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "default"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->o:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->p:Ljava/lang/Boolean;

    .line 10
    .line 11
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

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->p:Ljava/lang/Boolean;

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

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->p:Ljava/lang/Boolean;

    return-void
.end method

.method private d()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->p:Ljava/lang/Boolean;

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
    sget-object v0, Ll/a6l;->INSTANCE:Ll/a6l;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->o:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->p:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/a6l;->a(Landroid/content/Context;Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nbl;->a(Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getButtonRadius()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getButtonRadius()I

    move-result p0

    return p0
.end method

.method public getButtonRootLayout()Landroid/view/ViewGroup;
    .locals 0

    return-object p0
.end method

.method public bridge synthetic getButtonScrolledDistance()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getButtonScrolledDistance()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getButtonsRightLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getButtonsRightLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getDislikeBtn()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDislikePressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getDislikePressBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getImmediatelyAndSuperLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyAndSuperLikeLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getImmediatelyMatch()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyMatch()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getImmediatelyMatchButton()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyMatchButton()Ll/avl;

    move-result-object p0

    return-object p0
.end method

.method public getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getLikeBtn()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getLikePressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getLikePressBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getNormalBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getNormalBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getOperationBtnBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getOperationBtnBg()I

    move-result p0

    return p0
.end method

.method public getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->m:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPinLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->l:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->n:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getSayHiNewLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getSayHiNewLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getSuperLike()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getSuperLike()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->getSuperLike()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->g:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getSuperLikePressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getSuperLikePressBg()I

    move-result p0

    return p0
.end method

.method public getSuperLikeRemaining()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->i:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeWarpLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndo()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getUndo()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->getUndo()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getUndoLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->b:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getUndoPressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getUndoPressBg()I

    move-result p0

    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setButtonStyleType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic setSuperLikeBtnGray(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bvl;->setSuperLikeBtnGray(Z)V

    return-void
.end method

.method public setSuperLikeComboIsSlowly(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->p:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomePlatinumButton;->d()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
