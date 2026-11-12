.class public final Lal2;
.super Lol7;
.source "SourceFile"


# instance fields
.field public b:Z


# direct methods
.method public static b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V
    .registers 4

    if-eqz p0, :cond_4a

    instance-of v0, p0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_c

    check-cast p0, Landroid/graphics/drawable/Animatable;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_c
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p0, v0, :cond_19

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    :cond_19
    instance-of v0, p0, Landroid/graphics/drawable/DrawableWrapper;

    if-eqz v0, :cond_27

    check-cast p0, Landroid/graphics/drawable/DrawableWrapper;

    invoke-virtual {p0}, Landroid/graphics/drawable/DrawableWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p0, p1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    return-void

    :cond_27
    instance-of v0, p0, Lol7;

    if-eqz v0, :cond_33

    check-cast p0, Lol7;

    iget-object p0, p0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, p1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    return-void

    :cond_33
    instance-of v0, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_4a

    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v0, 0x0

    :goto_3a
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v1

    if-ge v0, v1, :cond_4a

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v1, p1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3a

    :cond_4a
    return-void
.end method

.method public static c(Lx05;)Landroid/graphics/drawable/Drawable;
    .registers 4

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    new-instance v1, Lab;

    const/16 v2, 0x18

    invoke-direct {v1, v0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_16

    return-object p0

    :cond_16
    new-instance v0, Lal2;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    invoke-direct {v0, v1}, Lol7;-><init>(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lal2;->setVisible(ZZ)Z

    invoke-virtual {v0, p0}, Lol7;->a(Landroid/graphics/drawable/Drawable;)V

    new-instance p0, Lvk2;

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lvk2;-><init>(B)V

    invoke-static {v0, p0}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    return-object v0
.end method


# virtual methods
.method public final setVisible(ZZ)Z
    .registers 4

    invoke-super {p0, p1, p2}, Lol7;->setVisible(ZZ)Z

    move-result v0

    if-eqz p1, :cond_18

    if-nez v0, :cond_e

    if-nez p2, :cond_e

    iget-boolean p1, p0, Lal2;->b:Z

    if-nez p1, :cond_21

    :cond_e
    new-instance p1, Lvk2;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lvk2;-><init>(B)V

    invoke-static {p0, p1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    goto :goto_21

    :cond_18
    new-instance p1, Lvk2;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lvk2;-><init>(B)V

    invoke-static {p0, p1}, Lal2;->b(Landroid/graphics/drawable/Drawable;Lcom/opera/api/Callback;)V

    :cond_21
    :goto_21
    const/4 p1, 0x1

    iput-boolean p1, p0, Lal2;->b:Z

    return v0
.end method
