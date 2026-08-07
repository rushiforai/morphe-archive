.class public interface abstract Ll/bvl;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public a(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public getButtonRadius()I
    .locals 0

    .line 1
    const/high16 p0, 0x41c80000    # 25.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract getButtonRootLayout()Landroid/view/ViewGroup;
.end method

.method public getButtonScrolledDistance()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getButtonsRightLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getDislikeBtn()Ll/avl;
.end method

.method public getDislikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->h4:I

    .line 2
    .line 3
    return p0
.end method

.method public getImmediatelyAndSuperLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getImmediatelyMatch()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getImmediatelyMatchButton()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getLikeBtn()Ll/avl;
.end method

.method public getLikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->v2:I

    .line 2
    .line 3
    return p0
.end method

.method public getNormalBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->b2:I

    .line 2
    .line 3
    return p0
.end method

.method public getOperationBtnBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->c2:I

    .line 2
    .line 3
    return p0
.end method

.method public getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v0, 0x42400000    # 48.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    invoke-direct {p0, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    const/high16 v0, 0x41800000    # 16.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 20
    .line 21
    const/16 v0, 0x51

    .line 22
    .line 23
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 24
    .line 25
    return-object p0
.end method

.method public getSayHiNewLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getSuperLike()Ll/avl;
.end method

.method public abstract getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;
.end method

.method public abstract getSuperLikeLayout()Lv/VFrame_FlipContainer;
.end method

.method public getSuperLikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->r3:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract getSuperLikeRemaining()Lv/VText;
.end method

.method public abstract getSuperLikeWarpLayout()Landroid/view/View;
.end method

.method public abstract getUndo()Ll/avl;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getUndoLayout()Lv/VFrame_FlipContainer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public getUndoPressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->h4:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract setButtonStyleType(Ljava/lang/String;)V
.end method

.method public setSuperLikeBtnGray(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract setSuperLikeComboIsSlowly(Z)V
.end method
