.class public Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(FLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    div-float/2addr p0, p1

    .line 10
    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final b(FLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    div-float/2addr p0, p1

    .line 10
    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/gdc0;->P:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/gdc0;->R:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->b:Landroid/view/View;

    .line 19
    .line 20
    return-void
.end method

.method public setScaleX(F)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    div-float/2addr v0, p1

    .line 10
    invoke-static {v0}, Ll/bnl0;->S(F)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    sub-int/2addr v2, v3

    .line 38
    int-to-float v2, v2

    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->b:Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a(FLandroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    return-void
.end method

.method public setScaleY(F)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    div-float/2addr v0, p1

    .line 10
    invoke-static {v0}, Ll/bnl0;->S(F)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    sub-int/2addr v2, v3

    .line 38
    int-to-float v2, v2

    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->a:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->b:Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;->b(FLandroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    return-void
.end method
