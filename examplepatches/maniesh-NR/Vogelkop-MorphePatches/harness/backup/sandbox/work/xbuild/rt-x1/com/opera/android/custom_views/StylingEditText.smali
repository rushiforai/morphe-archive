.class public Lcom/opera/android/custom_views/StylingEditText;
.super Lcom/opera/android/custom_views/ObservableEditText;
.source "SourceFile"


# instance fields
.field public final v:Lua7;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/ObservableEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Lua7;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2, v1}, Lua7;-><init>(Landroid/view/View;ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingEditText;->v:Lua7;

    sget-object p0, Lkhh;->K:[I

    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Lua7;->A(Landroid/content/res/TypedArray;I)V

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/custom_views/StylingEditText;->v:Lua7;

    if-eqz v0, :cond_15

    iget-object v2, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Lua7;->X([IILandroid/graphics/drawable/Drawable;)V

    goto :goto_18

    :cond_15
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_18
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final drawableStateChanged()V
    .registers 1

    invoke-super {p0}, Lbq1;->drawableStateChanged()V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingEditText;->v:Lua7;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lua7;->G()V

    :cond_a
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingEditText;->v:Lua7;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lua7;->F()V

    :cond_a
    return-void
.end method
