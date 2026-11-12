.class public final Llvk;
.super Lf3d;
.source "SourceFile"


# instance fields
.field public final I:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Lf3d;-><init>()V

    const/high16 v0, 0x42400000    # 48.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Llvk;->I:I

    return-void
.end method


# virtual methods
.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Llvk;->I:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Llvk;->I:I

    return p0
.end method

.method public final o(Lp2d;)Z
    .registers 2

    invoke-super {p0, p1}, Lf3d;->o(Lp2d;)Z

    move-result p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_11

    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_11
    const/4 p0, 0x1

    return p0
.end method
