.class public final Lgq4;
.super Lf26;
.source "SourceFile"


# virtual methods
.method public final getChangingConfigurations()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    new-instance v0, Lhq4;

    iget-object v1, p0, Lf26;->a:Landroid/graphics/Bitmap;

    iget p0, p0, Lf26;->b:I

    invoke-direct {v0, v1, p0}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    return-object v0
.end method
