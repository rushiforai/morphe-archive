.class public Lcom/opera/android/custom_views/CapturableButton;
.super Lcom/google/android/material/button/MaterialButton;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/google/android/material/button/MaterialButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/opera/android/custom_views/CapturableButton;->P(Landroid/graphics/drawable/Drawable;Ljava/util/HashSet;)V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_29

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzdd;

    invoke-virtual {p1}, Lzdd;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Lzdd;

    invoke-virtual {p1}, Lzdd;->w()V

    goto :goto_13

    :cond_29
    return-void
.end method

.method public static P(Landroid/graphics/drawable/Drawable;Ljava/util/HashSet;)V
    .registers 4

    if-eqz p0, :cond_30

    instance-of v0, p0, Lzdd;

    if-eqz v0, :cond_c

    check-cast p0, Lzdd;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_c
    instance-of v0, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_23

    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v0, 0x0

    :goto_13
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v1

    if-ge v0, v1, :cond_30

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/opera/android/custom_views/CapturableButton;->P(Landroid/graphics/drawable/Drawable;Ljava/util/HashSet;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    :cond_23
    instance-of v0, p0, Landroid/graphics/drawable/InsetDrawable;

    if-eqz v0, :cond_30

    check-cast p0, Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/DrawableWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/opera/android/custom_views/CapturableButton;->P(Landroid/graphics/drawable/Drawable;Ljava/util/HashSet;)V

    :cond_30
    return-void
.end method
