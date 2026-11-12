.class public final Leh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le2m;


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Leh7;->a:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    move-object v1, p1

    :goto_5
    iget v2, p0, Leh7;->a:I

    if-le v0, v2, :cond_20

    div-int/lit8 v0, v0, 0x2

    if-le v0, v2, :cond_e

    move v2, v0

    :cond_e
    const/4 v0, 0x1

    invoke-static {v1, v2, v2, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eq v1, p1, :cond_18

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_18
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    move v3, v1

    move-object v1, v0

    move v0, v3

    goto :goto_5

    :cond_20
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_29
    return-object v1
.end method

.method public final key()Ljava/lang/String;
    .registers 3

    const-string v0, "DownscaleSquareBitmapTransformation("

    const-string v1, ")"

    iget p0, p0, Leh7;->a:I

    invoke-static {p0, v0, v1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
