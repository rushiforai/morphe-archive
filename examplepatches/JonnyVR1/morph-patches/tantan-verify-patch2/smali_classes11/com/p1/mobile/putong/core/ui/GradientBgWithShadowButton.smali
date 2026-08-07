.class public Lcom/p1/mobile/putong/core/ui/GradientBgWithShadowButton;
.super Lcom/p1/mobile/putong/core/ui/GradientBgButton;
.source "SourceFile"


# instance fields
.field public N:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public h(Landroid/graphics/Canvas;FF)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgWithShadowButton;->N:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->j(Landroid/graphics/Canvas;FF)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->i(Landroid/graphics/Canvas;FF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setShadowColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setShadowColorLight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public setShadowColorSameWihtShader(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgWithShadowButton;->N:Z

    .line 2
    .line 3
    return-void
.end method
