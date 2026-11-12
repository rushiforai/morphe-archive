.class public final synthetic Llol;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Landroid/graphics/drawable/LayerDrawable;

.field public final synthetic b:Lc9i;

.field public final synthetic c:I

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/drawable/LayerDrawable;Lc9i;IF)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llol;->a:Landroid/graphics/drawable/LayerDrawable;

    iput-object p2, p0, Llol;->b:Lc9i;

    iput p3, p0, Llol;->c:I

    iput p4, p0, Llol;->d:F

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Lxw0;

    sget-object v0, Luw0;->a:Luw0;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    new-instance p1, Lf08;

    invoke-direct {p1, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_4d

    :cond_11
    instance-of v0, p1, Lvw0;

    if-eqz v0, :cond_39

    check-cast p1, Lvw0;

    iget v0, p1, Lvw0;->b:I

    iget-object v2, p0, Llol;->b:Lc9i;

    iget v3, v2, Lc9i;->b:I

    if-eq v0, v3, :cond_24

    iput v0, v2, Lc9i;->b:I

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_24
    iget-object v0, p1, Lvw0;->a:Landroid/graphics/drawable/Drawable;

    iget-object p1, p1, Lvw0;->c:Ljava/lang/Integer;

    if-eqz p1, :cond_31

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :cond_31
    new-instance p1, Lw3a;

    const/16 v2, 0x11

    invoke-direct {p1, v0, v2, v1}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    goto :goto_4d

    :cond_39
    instance-of v0, p1, Lww0;

    if-eqz v0, :cond_59

    new-instance v0, Lhq4;

    check-cast p1, Lww0;

    iget-object p1, p1, Lww0;->a:Landroid/graphics/Bitmap;

    const/16 v1, 0xc

    iget v2, p0, Llol;->d:F

    iget v3, p0, Llol;->c:I

    invoke-direct {v0, v2, v3, v1, p1}, Lhq4;-><init>(FIILandroid/graphics/Bitmap;)V

    move-object p1, v0

    :goto_4d
    iget-object p0, p0, Llol;->a:Landroid/graphics/drawable/LayerDrawable;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_59
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method
