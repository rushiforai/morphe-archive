.class public final Lban;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Ly9n;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:I


# direct methods
.method public constructor <init>(Landroid/view/View;ZLy9n;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lban;->a:Landroid/view/View;

    iput-boolean p2, p0, Lban;->e:Z

    iput-object p3, p0, Lban;->b:Ly9n;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->isLaidOut()Z

    move-result p2

    iget-boolean p3, p0, Lban;->c:Z

    if-eq p3, p2, :cond_1c

    iput-boolean p2, p0, Lban;->c:Z

    invoke-virtual {p0}, Lban;->a()V

    :cond_1c
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    iget-boolean p2, p0, Lban;->d:Z

    if-ne p2, p1, :cond_25

    return-void

    :cond_25
    iput-boolean p1, p0, Lban;->d:Z

    invoke-virtual {p0}, Lban;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-boolean v0, p0, Lban;->e:Z

    iget-object v1, p0, Lban;->a:Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v0, :cond_61

    iget-boolean v0, p0, Lban;->c:Z

    if-nez v0, :cond_17

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-gtz v0, :cond_17

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_61

    :cond_17
    iget-boolean v0, p0, Lban;->d:Z

    if-eqz v0, :cond_61

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    const/16 v4, 0x64

    if-eqz v0, :cond_3f

    if-eqz v3, :cond_3f

    sget-object v5, Lcan;->c:Landroid/graphics/Rect;

    invoke-virtual {v1, v5}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_61

    mul-int/2addr v0, v3

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v3

    mul-int/2addr v3, v2

    mul-int/2addr v3, v4

    div-int v2, v3, v0

    goto :goto_61

    :cond_3f
    sget-object v5, Lcan;->c:Landroid/graphics/Rect;

    const/4 v6, 0x1

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v5, v2, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_61

    const/4 v3, 0x0

    invoke-interface {v0, v1, v5, v3}, Landroid/view/ViewParent;->getChildVisibleRect(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Point;)Z

    move-result v0

    if-eqz v0, :cond_61

    invoke-virtual {v5}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_61

    move v2, v4

    :cond_61
    :goto_61
    iget v0, p0, Lban;->f:I

    if-ne v0, v2, :cond_66

    return-void

    :cond_66
    iput v2, p0, Lban;->f:I

    iget-object p0, p0, Lban;->b:Ly9n;

    invoke-interface {p0, v1, v2, v0}, Ly9n;->T(Landroid/view/View;II)V

    sget-object p0, Lcan;->c:Landroid/graphics/Rect;

    return-void
.end method

.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-boolean p1, p0, Lban;->c:Z

    const/4 p2, 0x1

    if-ne p1, p2, :cond_6

    return-void

    :cond_6
    iput-boolean p2, p0, Lban;->c:Z

    invoke-virtual {p0}, Lban;->a()V

    return-void
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    iget-boolean p1, p0, Lban;->d:Z

    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    return-void

    :cond_6
    iput-boolean v0, p0, Lban;->d:Z

    invoke-virtual {p0}, Lban;->a()V

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    iget-boolean p1, p0, Lban;->d:Z

    if-nez p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x0

    iput-boolean p1, p0, Lban;->d:Z

    invoke-virtual {p0}, Lban;->a()V

    return-void
.end method
