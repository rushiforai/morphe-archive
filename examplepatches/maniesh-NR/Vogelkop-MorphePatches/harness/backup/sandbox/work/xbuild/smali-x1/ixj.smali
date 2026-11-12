.class public final Lixj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Rect;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:Z

.field public final g:Z

.field public final h:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(ILandroid/graphics/Rect;II)V
    .registers 12

    const/4 v5, 0x0

    const/16 v6, 0xf0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 35
    invoke-direct/range {v0 .. v6}, Lixj;-><init>(ILandroid/graphics/Rect;IIZI)V

    return-void
.end method

.method public constructor <init>(ILandroid/graphics/Rect;IIIZZLandroid/graphics/Rect;)V
    .registers 9

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput p1, p0, Lixj;->a:I

    .line 28
    iput-object p2, p0, Lixj;->b:Landroid/graphics/Rect;

    .line 29
    iput p3, p0, Lixj;->c:I

    .line 30
    iput p4, p0, Lixj;->d:I

    .line 31
    iput p5, p0, Lixj;->e:I

    .line 32
    iput-boolean p6, p0, Lixj;->f:Z

    .line 33
    iput-boolean p7, p0, Lixj;->g:Z

    .line 34
    iput-object p8, p0, Lixj;->h:Landroid/graphics/Rect;

    return-void
.end method

.method public synthetic constructor <init>(ILandroid/graphics/Rect;IIZI)V
    .registers 17

    and-int/lit8 v0, p6, 0x10

    if-eqz v0, :cond_7

    const/4 v0, 0x3

    :goto_5
    move v6, v0

    goto :goto_9

    :cond_7
    const/4 v0, 0x1

    goto :goto_5

    :goto_9
    and-int/lit8 v0, p6, 0x20

    if-eqz v0, :cond_e

    const/4 p5, 0x0

    :cond_e
    move v7, p5

    const/4 v8, 0x0

    move-object v9, p2

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v1 .. v9}, Lixj;-><init>(ILandroid/graphics/Rect;IIIZZLandroid/graphics/Rect;)V

    return-void
.end method

.method public static final b(Landroid/view/View;)Lr9b;
    .registers 8

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    invoke-static {v1, v1, v1, v1}, Lr9b;->c(IIII)Lr9b;

    move-result-object p0

    return-object p0

    :cond_e
    const/16 v2, 0x20f

    iget-object v0, v0, Lg3o;->a:Ld3o;

    invoke-virtual {v0, v2}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    iget v3, v2, Landroid/graphics/Rect;->left:I

    iget v4, v0, Lr9b;->a:I

    add-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Rect;->top:I

    iget v5, v0, Lr9b;->b:I

    add-int/2addr v4, v5

    iget v5, v2, Landroid/graphics/Rect;->right:I

    iget v6, v0, Lr9b;->c:I

    sub-int/2addr v5, v6

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    iget v0, v0, Lr9b;->d:I

    sub-int/2addr v2, v0

    invoke-static {p0}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    iget v0, p0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v0

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v3, p0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v3

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, p0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, v5

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, v2

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {v0, v3, v4, p0}, Lr9b;->c(IIII)Lr9b;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Lr9b;)Lixj;
    .registers 13

    iget v0, p0, Lixj;->c:I

    iget v1, p1, Lr9b;->b:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    iget v0, p0, Lixj;->d:I

    iget p1, p1, Lr9b;->d:I

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v6

    new-instance v2, Lixj;

    iget v3, p0, Lixj;->a:I

    iget-object v4, p0, Lixj;->b:Landroid/graphics/Rect;

    iget v7, p0, Lixj;->e:I

    iget-boolean v8, p0, Lixj;->f:Z

    iget-boolean v9, p0, Lixj;->g:Z

    iget-object v10, p0, Lixj;->h:Landroid/graphics/Rect;

    invoke-direct/range {v2 .. v10}, Lixj;-><init>(ILandroid/graphics/Rect;IIIZZLandroid/graphics/Rect;)V

    return-object v2
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lixj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lixj;

    iget v1, p0, Lixj;->a:I

    iget v3, p1, Lixj;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lixj;->b:Landroid/graphics/Rect;

    iget-object v3, p1, Lixj;->b:Landroid/graphics/Rect;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget v1, p0, Lixj;->c:I

    iget v3, p1, Lixj;->c:I

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget v1, p0, Lixj;->d:I

    iget v3, p1, Lixj;->d:I

    if-eq v1, v3, :cond_2c

    return v2

    :cond_2c
    iget v1, p0, Lixj;->e:I

    iget v3, p1, Lixj;->e:I

    if-eq v1, v3, :cond_33

    return v2

    :cond_33
    iget-boolean v1, p0, Lixj;->f:Z

    iget-boolean v3, p1, Lixj;->f:Z

    if-eq v1, v3, :cond_3a

    return v2

    :cond_3a
    iget-boolean v1, p0, Lixj;->g:Z

    iget-boolean v3, p1, Lixj;->g:Z

    if-eq v1, v3, :cond_41

    return v2

    :cond_41
    iget-object p0, p0, Lixj;->h:Landroid/graphics/Rect;

    iget-object p1, p1, Lixj;->h:Landroid/graphics/Rect;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4c

    return v2

    :cond_4c
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget v0, p0, Lixj;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lixj;->b:Landroid/graphics/Rect;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Landroid/graphics/Rect;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget v3, p0, Lixj;->c:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v3, p0, Lixj;->d:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v3, p0, Lixj;->e:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v3, p0, Lixj;->f:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lixj;->g:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lixj;->h:Landroid/graphics/Rect;

    if-eqz p0, :cond_3c

    invoke-virtual {p0}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    :cond_3c
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
