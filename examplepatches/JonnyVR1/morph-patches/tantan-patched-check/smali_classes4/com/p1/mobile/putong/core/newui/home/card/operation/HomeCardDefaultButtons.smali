.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;
.super Landroidx/appcompat/widget/LinearLayoutCompat;
.source "SourceFile"

# interfaces
.implements Ll/bvl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;

.field public b:Lv/VFrame_FlipContainer;

.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public f:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lcom/tantan/library/svga/SVGAnimationView;

.field public i:Lv/VFrame_FlipContainer;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public k:Lv/VText;

.field public l:Lv/VFrame;

.field public m:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "default"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->n:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->o:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->n:Ljava/lang/String;

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->o:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->n:Ljava/lang/String;

    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->o:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b6l;->a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->o:Ljava/lang/Boolean;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->n:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->o:Ljava/lang/Boolean;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getDislikeBtn()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getLikeBtn()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

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

.method public bridge synthetic getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getPinImage()Lv/VImage;

    move-result-object p0

    return-object p0
.end method

.method public getPinLikeLayout()Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getPinText()Lv/VText;

    move-result-object p0

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getSuperLike()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->getSuperLike()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->i:Lv/VFrame_FlipContainer;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->k:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeWarpLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndo()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getUndo()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->getUndo()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->b:Lv/VFrame_FlipContainer;

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setButtonStyleType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->e()V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->o:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
