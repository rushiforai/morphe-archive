.class public final Lndo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:F

.field public final c:I

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:F


# direct methods
.method public constructor <init>(ZFIFFFF)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lndo;->a:Z

    iput p2, p0, Lndo;->b:F

    iput p3, p0, Lndo;->c:I

    iput p4, p0, Lndo;->d:F

    iput p5, p0, Lndo;->e:F

    iput p6, p0, Lndo;->f:F

    iput p7, p0, Lndo;->g:F

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lndo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lndo;

    iget-boolean v1, p0, Lndo;->a:Z

    iget-boolean v3, p1, Lndo;->a:Z

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lndo;->b:F

    iget v3, p1, Lndo;->b:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_1e

    return v2

    :cond_1e
    iget v1, p0, Lndo;->c:I

    iget v3, p1, Lndo;->c:I

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget v1, p0, Lndo;->d:F

    iget v3, p1, Lndo;->d:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_30

    return v2

    :cond_30
    iget v1, p0, Lndo;->e:F

    iget v3, p1, Lndo;->e:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_3b

    return v2

    :cond_3b
    iget v1, p0, Lndo;->f:F

    iget v3, p1, Lndo;->f:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_46

    return v2

    :cond_46
    iget p0, p0, Lndo;->g:F

    iget p1, p1, Lndo;->g:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_51

    return v2

    :cond_51
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lndo;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lndo;->b:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Lndo;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lndo;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Lndo;->e:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Lndo;->f:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget p0, p0, Lndo;->g:F

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
