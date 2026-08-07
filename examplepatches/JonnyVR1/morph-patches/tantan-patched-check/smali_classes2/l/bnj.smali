.class public Ll/bnj;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Ll/hnj$b;
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bnj$a;
    }
.end annotation


# instance fields
.field private final a:Ll/bnj$a;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:I

.field private g:I

.field private h:Z

.field private i:Landroid/graphics/Paint;

.field private j:Landroid/graphics/Rect;

.field private k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/tp0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/anj;Ll/tgj0;IILandroid/graphics/Bitmap;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/anj;",
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;II",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bnj$a;

    .line 2
    .line 3
    new-instance v1, Ll/hnj;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/bumptech/glide/a;->c(Landroid/content/Context;)Lcom/bumptech/glide/a;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    move-object v3, p2

    .line 10
    move-object v6, p3

    .line 11
    move v4, p4

    .line 12
    move v5, p5

    .line 13
    move-object v7, p6

    .line 14
    invoke-direct/range {v1 .. v7}, Ll/hnj;-><init>(Lcom/bumptech/glide/a;Ll/anj;IILl/tgj0;Landroid/graphics/Bitmap;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/bnj$a;-><init>(Ll/hnj;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Ll/bnj;-><init>(Ll/bnj$a;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Ll/bnj$a;)V
    .locals 1

    .line 24
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Ll/bnj;->e:Z

    const/4 v0, -0x1

    .line 26
    iput v0, p0, Ll/bnj;->g:I

    .line 27
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/bnj$a;

    iput-object p1, p0, Ll/bnj;->a:Ll/bnj$a;

    return-void
.end method

.method private b()Landroid/graphics/drawable/Drawable$Callback;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :goto_0
    instance-of v0, p0, Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object p0
.end method

.method private d()Landroid/graphics/Rect;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bnj;->j:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/bnj;->j:Landroid/graphics/Rect;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/bnj;->j:Landroid/graphics/Rect;

    .line 13
    .line 14
    return-object p0
.end method

.method private h()Landroid/graphics/Paint;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bnj;->i:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/bnj;->i:Landroid/graphics/Paint;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/bnj;->i:Landroid/graphics/Paint;

    .line 14
    .line 15
    return-object p0
.end method

.method private j()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bnj;->k:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Ll/bnj;->k:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ll/tp0;

    .line 19
    .line 20
    invoke-virtual {v2, p0}, Ll/tp0;->onAnimationEnd(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/bnj;->f:I

    .line 3
    .line 4
    return-void
.end method

.method private n()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/bnj;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    const-string v2, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request."

    .line 6
    .line 7
    invoke-static {v0, v2}, Ll/vn80;->a(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 11
    .line 12
    iget-object v0, v0, Ll/bnj$a;->a:Ll/hnj;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/hnj;->f()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-boolean v0, p0, Ll/bnj;->b:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iput-boolean v1, p0, Ll/bnj;->b:Z

    .line 29
    .line 30
    iget-object v0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 31
    .line 32
    iget-object v0, v0, Ll/bnj$a;->a:Ll/hnj;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/hnj;->r(Ll/hnj$b;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method private o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/bnj;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 5
    .line 6
    iget-object v0, v0, Ll/bnj$a;->a:Ll/hnj;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/hnj;->s(Ll/hnj$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/bnj;->b()Landroid/graphics/drawable/Drawable$Callback;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bnj;->stop()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bnj;->g()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Ll/bnj;->f()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/lit8 v1, v1, -0x1

    .line 26
    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    iget v0, p0, Ll/bnj;->f:I

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    iput v0, p0, Ll/bnj;->f:I

    .line 34
    .line 35
    :cond_1
    iget v0, p0, Ll/bnj;->g:I

    .line 36
    .line 37
    const/4 v1, -0x1

    .line 38
    if-eq v0, v1, :cond_2

    .line 39
    .line 40
    iget v1, p0, Ll/bnj;->f:I

    .line 41
    .line 42
    if-lt v1, v0, :cond_2

    .line 43
    .line 44
    invoke-direct {p0}, Ll/bnj;->j()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/bnj;->stop()V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public c()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->b()Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/bnj;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Ll/bnj;->h:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bnj;->getIntrinsicWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Ll/bnj;->getIntrinsicHeight()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-direct {p0}, Ll/bnj;->d()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const/16 v4, 0x77

    .line 27
    .line 28
    invoke-static {v4, v0, v1, v2, v3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Ll/bnj;->h:Z

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 35
    .line 36
    iget-object v0, v0, Ll/bnj$a;->a:Ll/hnj;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/hnj;->c()Landroid/graphics/Bitmap;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0}, Ll/bnj;->d()Landroid/graphics/Rect;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-direct {p0}, Ll/bnj;->h()Landroid/graphics/Paint;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public e()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->e()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->f()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->h()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->k()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hnj;->j()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bnj;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/bnj;->d:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 5
    .line 6
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/hnj;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m(Ll/tgj0;Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bnj;->a:Ll/bnj$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bnj$a;->a:Ll/hnj;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/hnj;->o(Ll/tgj0;Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/bnj;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bnj;->h()Landroid/graphics/Paint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bnj;->h()Landroid/graphics/Paint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setVisible(ZZ)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bnj;->d:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    const-string v1, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View\'s visibility."

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/vn80;->a(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-boolean p1, p0, Ll/bnj;->e:Z

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Ll/bnj;->o()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v0, p0, Ll/bnj;->c:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-direct {p0}, Ll/bnj;->n()V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public start()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/bnj;->c:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/bnj;->l()V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ll/bnj;->e:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ll/bnj;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/bnj;->c:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/bnj;->o()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
