.class public final Lc8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Ldeg;

.field public final d:Lmcj;

.field public final e:Lmcj;

.field public final f:Lqie;

.field public final g:Li7f;

.field public final h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ldeg;Ln7l;Lv4b;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc8l;->a:Landroid/content/Context;

    iput-object p2, p0, Lc8l;->b:Lumi;

    iput-object p3, p0, Lc8l;->c:Ldeg;

    new-instance p1, Lmcj;

    new-instance p3, Lg7l;

    invoke-direct {p3}, Lg7l;-><init>()V

    invoke-direct {p1, p3, p4}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lc8l;->d:Lmcj;

    new-instance p1, Lmcj;

    new-instance p3, Livg;

    invoke-direct {p3, p5}, Livg;-><init>(Lv4b;)V

    new-instance p4, Ljvg;

    invoke-direct {p4, p2}, Ljvg;-><init>(Lumi;)V

    invoke-direct {p1, p3, p4}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lc8l;->e:Lmcj;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lc8l;->f:Lqie;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lc8l;->g:Li7f;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lc8l;->h:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lw7l;

    iget-object p0, p0, Lc8l;->g:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lw7l;

    iget-object p0, p0, Lc8l;->g:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(FLandroid/graphics/Bitmap;)Landroid/util/Size;
    .registers 5

    iget-object p0, p0, Lc8l;->a:Landroid/content/Context;

    invoke-static {p0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float p0, p0

    mul-float/2addr p0, p1

    invoke-static {p0}, Lzed;->b(F)I

    move-result p0

    const/16 p1, 0x48

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-ge p0, p1, :cond_2d

    move p0, p1

    :cond_2d
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    mul-int/2addr v1, p0

    div-int/2addr v1, v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    mul-int/2addr p2, p0

    div-int/2addr p2, v0

    invoke-direct {p1, v1, p2}, Landroid/util/Size;-><init>(II)V

    return-object p1
.end method

.method public final b(Lb2l;Lw7l;)V
    .registers 7

    new-instance v0, Lrv3;

    const/4 v1, 0x1

    invoke-direct {v0, p2, p0, v1}, Lrv3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->m0()Lyul;

    move-result-object p2

    iget-boolean p2, p2, Lyul;->b:Z

    iget-object v2, p1, Ld7l;->e:Lw6j;

    iget-object v2, v2, Lw6j;->d:Ljava/lang/Object;

    check-cast v2, Lknf;

    if-nez v2, :cond_19

    sget-object v2, Lq8l;->c:Lq8l;

    goto :goto_1d

    :cond_19
    invoke-interface {v2}, Lknf;->D()Lq8l;

    move-result-object v2

    :goto_1d
    iget-object v2, v2, Lq8l;->a:Lp8l;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_2b

    if-eq v2, v1, :cond_2c

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2b
    const/4 v1, 0x0

    :cond_2c
    new-instance v2, Ls2g;

    const/16 v3, 0xb

    invoke-direct {v2, p0, p1, v0, v3}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v1, v2}, Ld7l;->C(ZZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final c(Lp6l;)Lmcj;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_11

    const/4 v0, 0x1

    if-ne p1, v0, :cond_c

    iget-object p0, p0, Lc8l;->e:Lmcj;

    return-object p0

    :cond_c
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_11
    iget-object p0, p0, Lc8l;->d:Lmcj;

    return-object p0
.end method
