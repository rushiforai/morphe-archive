.class public Ll/u1l0$h;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u1l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public a:I

.field public b:Ll/u1l0$g;

.field public c:Landroid/content/res/ColorStateList;

.field public d:Landroid/graphics/PorterDuff$Mode;

.field public e:Z

.field public f:Landroid/graphics/Bitmap;

.field public g:Landroid/content/res/ColorStateList;

.field public h:Landroid/graphics/PorterDuff$Mode;

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 75
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/4 v0, 0x0

    .line 76
    iput-object v0, p0, Ll/u1l0$h;->c:Landroid/content/res/ColorStateList;

    .line 77
    sget-object v0, Ll/u1l0;->k:Landroid/graphics/PorterDuff$Mode;

    iput-object v0, p0, Ll/u1l0$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 78
    new-instance v0, Ll/u1l0$g;

    invoke-direct {v0}, Ll/u1l0$g;-><init>()V

    iput-object v0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    return-void
.end method

.method public constructor <init>(Ll/u1l0$h;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/u1l0$h;->c:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    sget-object v0, Ll/u1l0;->k:Landroid/graphics/PorterDuff$Mode;

    .line 8
    .line 9
    iput-object v0, p0, Ll/u1l0$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget v0, p1, Ll/u1l0$h;->a:I

    .line 14
    .line 15
    iput v0, p0, Ll/u1l0$h;->a:I

    .line 16
    .line 17
    new-instance v0, Ll/u1l0$g;

    .line 18
    .line 19
    iget-object v1, p1, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/u1l0$g;-><init>(Ll/u1l0$g;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 25
    .line 26
    iget-object v1, p1, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 27
    .line 28
    iget-object v1, v1, Ll/u1l0$g;->e:Landroid/graphics/Paint;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    new-instance v1, Landroid/graphics/Paint;

    .line 33
    .line 34
    iget-object v2, p1, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 35
    .line 36
    iget-object v2, v2, Ll/u1l0$g;->e:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, v0, Ll/u1l0$g;->e:Landroid/graphics/Paint;

    .line 42
    .line 43
    :cond_0
    iget-object v0, p1, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 44
    .line 45
    iget-object v0, v0, Ll/u1l0$g;->d:Landroid/graphics/Paint;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 50
    .line 51
    new-instance v1, Landroid/graphics/Paint;

    .line 52
    .line 53
    iget-object v2, p1, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 54
    .line 55
    iget-object v2, v2, Ll/u1l0$g;->d:Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 58
    .line 59
    .line 60
    iput-object v1, v0, Ll/u1l0$g;->d:Landroid/graphics/Paint;

    .line 61
    .line 62
    :cond_1
    iget-object v0, p1, Ll/u1l0$h;->c:Landroid/content/res/ColorStateList;

    .line 63
    .line 64
    iput-object v0, p0, Ll/u1l0$h;->c:Landroid/content/res/ColorStateList;

    .line 65
    .line 66
    iget-object v0, p1, Ll/u1l0$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 67
    .line 68
    iput-object v0, p0, Ll/u1l0$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 69
    .line 70
    iget-boolean p1, p1, Ll/u1l0$h;->e:Z

    .line 71
    .line 72
    iput-boolean p1, p0, Ll/u1l0$h;->e:Z

    .line 73
    .line 74
    :cond_2
    return-void
.end method


# virtual methods
.method public a(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-ne p2, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public b()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/u1l0$h;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/u1l0$h;->g:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    iget-object v1, p0, Ll/u1l0$h;->c:Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/u1l0$h;->h:Landroid/graphics/PorterDuff$Mode;

    .line 12
    .line 13
    iget-object v1, p0, Ll/u1l0$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/u1l0$h;->j:Z

    .line 18
    .line 19
    iget-boolean v1, p0, Ll/u1l0$h;->e:Z

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget v0, p0, Ll/u1l0$h;->i:I

    .line 24
    .line 25
    iget-object p0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/u1l0$g;->getRootAlpha()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-ne v0, p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public c(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/u1l0$h;->a(II)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 14
    .line 15
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Ll/u1l0$h;->k:Z

    .line 23
    .line 24
    return-void
.end method

.method public d(Landroid/graphics/Canvas;Landroid/graphics/ColorFilter;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/u1l0$h;->e(Landroid/graphics/ColorFilter;)Landroid/graphics/Paint;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p0, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, p0, v0, p3, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Landroid/graphics/ColorFilter;)Landroid/graphics/Paint;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/u1l0$h;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/u1l0$h;->l:Landroid/graphics/Paint;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/u1l0$h;->l:Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ll/u1l0$h;->l:Landroid/graphics/Paint;

    .line 27
    .line 28
    iget-object v1, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/u1l0$g;->getRootAlpha()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/u1l0$h;->l:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/u1l0$h;->l:Landroid/graphics/Paint;

    .line 43
    .line 44
    return-object p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1l0$g;->getRootAlpha()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0xff

    .line 8
    .line 9
    if-ge p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1l0$g;->f()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getChangingConfigurations()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$h;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public h([I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/u1l0$g;->g([I)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-boolean v0, p0, Ll/u1l0$h;->k:Z

    .line 8
    .line 9
    or-int/2addr v0, p1

    .line 10
    iput-boolean v0, p0, Ll/u1l0$h;->k:Z

    .line 11
    .line 12
    return p1
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1l0$h;->c:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    iput-object v0, p0, Ll/u1l0$h;->g:Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    iget-object v0, p0, Ll/u1l0$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    iput-object v0, p0, Ll/u1l0$h;->h:Landroid/graphics/PorterDuff$Mode;

    .line 8
    .line 9
    iget-object v0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/u1l0$g;->getRootAlpha()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/u1l0$h;->i:I

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/u1l0$h;->e:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/u1l0$h;->j:Z

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/u1l0$h;->k:Z

    .line 23
    .line 24
    return-void
.end method

.method public j(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/graphics/Canvas;

    .line 8
    .line 9
    iget-object v1, p0, Ll/u1l0$h;->f:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/u1l0$h;->b:Ll/u1l0$g;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, p1, p2, v1}, Ll/u1l0$g;->b(Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/u1l0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/u1l0;-><init>(Ll/u1l0$h;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 7
    new-instance p1, Ll/u1l0;

    invoke-direct {p1, p0}, Ll/u1l0;-><init>(Ll/u1l0$h;)V

    return-object p1
.end method
