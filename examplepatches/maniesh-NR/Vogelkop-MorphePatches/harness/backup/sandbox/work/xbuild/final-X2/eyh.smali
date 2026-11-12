.class public final Leyh;
.super Lw3a;
.source "SourceFile"


# instance fields
.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(II)V
    .registers 6

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v2, 0x0

    invoke-static {v2, p1}, Lp37;->j0(FI)I

    move-result v2

    filled-new-array {v2, p1}, [I

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    const/16 v2, 0x57

    invoke-direct {p0, v0, v2, v1}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    iput p1, p0, Leyh;->d:I

    iput p2, p0, Leyh;->e:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Leyh;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Leyh;

    iget v1, p0, Leyh;->d:I

    iget v3, p1, Leyh;->d:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget p0, p0, Leyh;->e:I

    iget p1, p1, Leyh;->e:I

    if-eq p0, p1, :cond_1a

    return v2

    :cond_1a
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Leyh;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Leyh;->e:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
