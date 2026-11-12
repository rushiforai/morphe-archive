.class public final Lckn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/graphics/Rect;

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Rect;FFFFF)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lckn;->a:Ljava/lang/String;

    iput-object p2, p0, Lckn;->b:Landroid/graphics/Rect;

    iput p3, p0, Lckn;->c:F

    iput p4, p0, Lckn;->d:F

    iput p5, p0, Lckn;->e:F

    iput p6, p0, Lckn;->f:F

    iput p7, p0, Lckn;->g:F

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lckn;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lckn;

    iget-object v1, p0, Lckn;->a:Ljava/lang/String;

    iget-object v3, p1, Lckn;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lckn;->b:Landroid/graphics/Rect;

    iget-object v3, p1, Lckn;->b:Landroid/graphics/Rect;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget v1, p0, Lckn;->c:F

    iget v3, p1, Lckn;->c:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_2d

    return v2

    :cond_2d
    iget v1, p0, Lckn;->d:F

    iget v3, p1, Lckn;->d:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_38

    return v2

    :cond_38
    iget v1, p0, Lckn;->e:F

    iget v3, p1, Lckn;->e:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_43

    return v2

    :cond_43
    iget v1, p0, Lckn;->f:F

    iget v3, p1, Lckn;->f:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_4e

    return v2

    :cond_4e
    iget p0, p0, Lckn;->g:F

    iget p1, p1, Lckn;->g:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_59

    return v2

    :cond_59
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lckn;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lckn;->b:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget v0, p0, Lckn;->c:F

    invoke-static {v0, v2, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Lckn;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Lckn;->e:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Lckn;->f:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget p0, p0, Lckn;->g:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
