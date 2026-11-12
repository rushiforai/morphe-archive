.class public final Lhr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgr;
.implements Ly63;


# instance fields
.field public a:F

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lhr;->a:F

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzvb;

    iput-object p1, p0, Lhr;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzni;)V
    .registers 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lhr;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lir;Lwv3;)Landroid/graphics/Rect;
    .registers 7

    invoke-virtual {p2}, Lwv3;->b()Landroid/graphics/Rect;

    move-result-object p1

    iget-object v0, p0, Lhr;->b:Ljava/lang/Object;

    check-cast v0, Lzni;

    iget-object v0, v0, Lzni;->a:Lyni;

    invoke-virtual {p2}, Lwv3;->b()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    iget-object v2, p2, Lwv3;->a:Lcom/opera/android/BrowserActivity;

    sget v3, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v3

    invoke-virtual {p2, v3}, Lwv3;->a(Lb2l;)I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v1

    invoke-virtual {p2, v1}, Lwv3;->a(Lb2l;)I

    move-result p2

    int-to-float p2, p2

    int-to-float v1, v3

    div-float/2addr p2, v1

    iget v0, v0, Lyni;->b:F

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p0, Lhr;->a:F

    mul-float/2addr p2, v1

    invoke-static {p2}, Lzed;->b(F)I

    move-result p0

    new-instance p2, Landroid/graphics/Rect;

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, p0

    iget p0, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-direct {p2, v0, v1, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p2
.end method

.method public final f(F)Z
    .registers 3

    iget v0, p0, Lhr;->a:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    iput p1, p0, Lhr;->a:F

    const/4 p0, 0x0

    return p0
.end method

.method public final h()Lzvb;
    .registers 1

    iget-object p0, p0, Lhr;->b:Ljava/lang/Object;

    check-cast p0, Lzvb;

    return-object p0
.end method

.method public final i(F)Z
    .registers 2

    iget-object p0, p0, Lhr;->b:Ljava/lang/Object;

    check-cast p0, Lzvb;

    invoke-virtual {p0}, Lzvb;->c()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final isEmpty()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final k()F
    .registers 1

    iget-object p0, p0, Lhr;->b:Ljava/lang/Object;

    check-cast p0, Lzvb;

    invoke-virtual {p0}, Lzvb;->b()F

    move-result p0

    return p0
.end method

.method public final l(F)V
    .registers 3

    iget-object v0, p0, Lhr;->b:Ljava/lang/Object;

    check-cast v0, Lzni;

    iget p0, p0, Lhr;->a:F

    mul-float/2addr p0, p1

    iget p1, v0, Lzni;->h:F

    cmpg-float p1, p0, p1

    if-nez p1, :cond_e

    return-void

    :cond_e
    iput p0, v0, Lzni;->h:F

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final u()F
    .registers 1

    iget-object p0, p0, Lhr;->b:Ljava/lang/Object;

    check-cast p0, Lzvb;

    invoke-virtual {p0}, Lzvb;->a()F

    move-result p0

    return p0
.end method
