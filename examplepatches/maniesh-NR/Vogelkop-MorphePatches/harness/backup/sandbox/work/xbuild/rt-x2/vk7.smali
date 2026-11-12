.class public final Lvk7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljva;


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b()J
    .registers 5

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-static {p0}, Lnzm;->b(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    int-to-long v0, v0

    const/4 v2, 0x2

    shl-long/2addr v0, v2

    invoke-static {p0}, Lnzm;->a(Landroid/graphics/drawable/Drawable;)I

    move-result p0

    int-to-long v2, p0

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-gez p0, :cond_16

    return-wide v2

    :cond_16
    return-wide v0
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .registers 2

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lvk7;

    if-eqz v1, :cond_14

    check-cast p1, Lvk7;

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    iget-object p1, p1, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    return v0
.end method

.method public final getHeight()I
    .registers 1

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-static {p0}, Lnzm;->a(Landroid/graphics/drawable/Drawable;)I

    move-result p0

    return p0
.end method

.method public final getWidth()I
    .registers 1

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-static {p0}, Lnzm;->b(Landroid/graphics/drawable/Drawable;)I

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DrawableImage(drawable="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lvk7;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", shareable=false)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
