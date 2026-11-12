.class public final Lg26;
.super Lf26;
.source "SourceFile"


# instance fields
.field public final e:F


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IFFF)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lf26;-><init>(Landroid/graphics/Bitmap;IFF)V

    iput p5, p0, Lg26;->e:F

    return-void
.end method


# virtual methods
.method public final getChangingConfigurations()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 7

    new-instance v0, Lhq4;

    iget v4, p0, Lf26;->d:F

    iget v5, p0, Lg26;->e:F

    iget-object v1, p0, Lf26;->a:Landroid/graphics/Bitmap;

    iget v2, p0, Lf26;->b:I

    iget v3, p0, Lf26;->c:F

    invoke-direct/range {v0 .. v5}, Lhq4;-><init>(Landroid/graphics/Bitmap;IFFF)V

    return-object v0
.end method
