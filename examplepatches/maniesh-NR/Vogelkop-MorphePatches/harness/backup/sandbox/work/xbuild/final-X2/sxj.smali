.class public final Lsxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIII)V
    .registers 5

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lsxj;->a:I

    iput p2, p0, Lsxj;->b:I

    iput p3, p0, Lsxj;->c:I

    iput p4, p0, Lsxj;->d:I

    return-void
.end method

.method public constructor <init>(IIIII)V
    .registers 7

    and-int/lit8 p5, p4, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_6

    move p1, v0

    :cond_6
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_b

    move p2, v0

    :cond_b
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_10

    move p3, v0

    :cond_10
    invoke-direct {p0, p3, p1, p3, p2}, Lsxj;-><init>(IIII)V

    return-void
.end method


# virtual methods
.method public final a(Z)I
    .registers 2

    if-eqz p1, :cond_5

    iget p0, p0, Lsxj;->c:I

    return p0

    :cond_5
    iget p0, p0, Lsxj;->a:I

    return p0
.end method

.method public final b(Z)I
    .registers 2

    if-eqz p1, :cond_5

    iget p0, p0, Lsxj;->a:I

    return p0

    :cond_5
    iget p0, p0, Lsxj;->c:I

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lsxj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lsxj;

    iget v1, p0, Lsxj;->a:I

    iget v3, p1, Lsxj;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lsxj;->b:I

    iget v3, p1, Lsxj;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Lsxj;->c:I

    iget v3, p1, Lsxj;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget p0, p0, Lsxj;->d:I

    iget p1, p1, Lsxj;->d:I

    if-eq p0, p1, :cond_28

    return v2

    :cond_28
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lsxj;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lsxj;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lsxj;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lsxj;->d:I

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
