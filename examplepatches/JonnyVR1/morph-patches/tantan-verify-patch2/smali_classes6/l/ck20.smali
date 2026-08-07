.class public Ll/ck20;
.super Ll/ruf0;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ck20$a;
    }
.end annotation


# instance fields
.field public a:Ll/ck20$a;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ck20$a;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/ck20$a;-><init>(Landroid/graphics/Bitmap;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ll/ck20$a;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 14
    iput-object p1, p0, Ll/ck20;->a:Ll/ck20$a;

    return-void
.end method

.method public synthetic constructor <init>(Ll/ck20$a;Ll/dk20;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Ll/ck20;-><init>(Ll/ck20$a;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ck20$a;->b:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ck20$a;->b:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/16 v0, 0xff

    .line 28
    .line 29
    if-ge p0, v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, -0x1

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, -0x3

    .line 35
    return p0
.end method

.method public getRatio()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ck20$a;->a(Ll/ck20$a;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ck20;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/ck20$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/ck20$a;-><init>(Ll/ck20$a;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/ck20;->b:Z

    .line 22
    .line 23
    :cond_0
    return-object p0
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 12
    .line 13
    iget-object v0, v0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ck20;->a:Ll/ck20$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    return-void
.end method
