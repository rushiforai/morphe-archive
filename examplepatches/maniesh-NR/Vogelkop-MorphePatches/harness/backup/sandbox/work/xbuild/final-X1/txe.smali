.class public final Ltxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Lpwe;


# instance fields
.field public final a:Lqwe;

.field public final b:Landroid/view/View;


# direct methods
.method public constructor <init>(Lqwe;Landroid/view/View;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltxe;->a:Lqwe;

    iput-object p2, p0, Ltxe;->b:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p1, Lqwe;->b:Li7f;

    invoke-virtual {v0, p0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p1, Lqwe;->a:Lbp;

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/LightingColorFilter;

    if-eqz p1, :cond_27

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    const/4 p1, 0x2

    invoke-virtual {p2, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_2c

    :cond_27
    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    :cond_2c
    :goto_2c
    invoke-virtual {p2, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 3

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/LightingColorFilter;

    iget-object p0, p0, Ltxe;->b:Landroid/view/View;

    if-eqz p1, :cond_15

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    const/4 p1, 0x2

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return-void

    :cond_15
    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Ltxe;->a:Lqwe;

    iget-object v0, p1, Lqwe;->b:Li7f;

    invoke-virtual {v0, p0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p1, Lqwe;->a:Lbp;

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/LightingColorFilter;

    iget-object p0, p0, Ltxe;->b:Landroid/view/View;

    if-eqz p1, :cond_1e

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    const/4 p1, 0x2

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return-void

    :cond_1e
    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Ltxe;->a:Lqwe;

    iget-object p1, p1, Lqwe;->b:Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
