.class public final Lnt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(III)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lnt3;->a:I

    iput p2, p0, Lnt3;->b:I

    iput p3, p0, Lnt3;->c:I

    return-void
.end method


# virtual methods
.method public final compareTo(Ljava/lang/Object;)I
    .registers 4

    check-cast p1, Lnt3;

    iget v0, p1, Lnt3;->a:I

    iget v1, p0, Lnt3;->a:I

    if-lt v1, v0, :cond_18

    if-gt v1, v0, :cond_1c

    iget v0, p1, Lnt3;->b:I

    iget v1, p0, Lnt3;->b:I

    if-lt v1, v0, :cond_18

    if-gt v1, v0, :cond_1c

    iget p1, p1, Lnt3;->c:I

    iget p0, p0, Lnt3;->c:I

    if-ge p0, p1, :cond_1a

    :cond_18
    const/4 p0, -0x1

    return p0

    :cond_1a
    if-le p0, p1, :cond_1e

    :cond_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lnt3;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lnt3;

    iget v1, p0, Lnt3;->a:I

    iget v3, p1, Lnt3;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lnt3;->b:I

    iget v3, p1, Lnt3;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget p0, p0, Lnt3;->c:I

    iget p1, p1, Lnt3;->c:I

    if-eq p0, p1, :cond_21

    return v2

    :cond_21
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lnt3;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lnt3;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lnt3;->c:I

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
