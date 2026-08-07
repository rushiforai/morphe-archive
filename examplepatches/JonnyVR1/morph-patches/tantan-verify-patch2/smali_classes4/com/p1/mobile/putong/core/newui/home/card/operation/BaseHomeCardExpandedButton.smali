.class public abstract Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/avl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->d(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private synthetic d(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->b:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return p1
.end method


# virtual methods
.method public getRealView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public i()V
    .locals 0

    .line 1
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Ll/avl;->a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public setIconAlpha(F)V
    .locals 0

    return-void
.end method

.method public setIconPressStateColor(I)V
    .locals 0

    return-void
.end method

.method public setNormalStateIcon(I)V
    .locals 0

    return-void
.end method

.method public setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    return-void
.end method

.method public setOnLongPressListener(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

    .line 2
    .line 3
    new-instance p1, Ll/dm2;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/dm2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setPressed(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->b:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->b:Z

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    return-void
.end method
