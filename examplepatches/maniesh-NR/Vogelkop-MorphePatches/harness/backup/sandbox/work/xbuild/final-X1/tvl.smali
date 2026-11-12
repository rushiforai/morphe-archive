.class public final Ltvl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:F

.field public final b:F

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(FFII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ltvl;->a:F

    iput p2, p0, Ltvl;->b:F

    iput p3, p0, Ltvl;->c:I

    iput p4, p0, Ltvl;->d:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ltvl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ltvl;

    iget v1, p0, Ltvl;->a:F

    iget v3, p1, Ltvl;->a:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_17

    return v2

    :cond_17
    iget v1, p0, Ltvl;->b:F

    iget v3, p1, Ltvl;->b:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_22

    return v2

    :cond_22
    iget v1, p0, Ltvl;->c:I

    iget v3, p1, Ltvl;->c:I

    if-eq v1, v3, :cond_29

    return v2

    :cond_29
    iget p0, p0, Ltvl;->d:I

    iget p1, p1, Ltvl;->d:I

    if-eq p0, p1, :cond_30

    return v2

    :cond_30
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Ltvl;->a:F

    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ltvl;->b:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Ltvl;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Ltvl;->d:I

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
