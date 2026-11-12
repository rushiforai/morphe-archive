.class public final Lyni;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Bitmap;

.field public final b:F


# direct methods
.method public constructor <init>(FLandroid/graphics/Bitmap;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyni;->a:Landroid/graphics/Bitmap;

    iput p1, p0, Lyni;->b:F

    return-void
.end method

.method public static final a(Landroid/graphics/Bitmap;II)Lyni;
    .registers 4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_9

    move p1, v0

    :cond_9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_13

    move p2, v0

    :cond_13
    if-lez p2, :cond_1d

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    sub-int/2addr v0, p2

    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->setHeight(I)V

    :cond_1d
    new-instance p2, Lyni;

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-direct {p2, p1, p0}, Lyni;-><init>(FLandroid/graphics/Bitmap;)V

    return-object p2
.end method
