.class public final Lb0k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(IIIII)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lb0k;->a:I

    iput p2, p0, Lb0k;->b:I

    iput p3, p0, Lb0k;->c:I

    iput p4, p0, Lb0k;->d:I

    iput p5, p0, Lb0k;->e:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lb0k;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lb0k;

    iget v1, p0, Lb0k;->a:I

    iget v3, p1, Lb0k;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lb0k;->b:I

    iget v3, p1, Lb0k;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Lb0k;->c:I

    iget v3, p1, Lb0k;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget v1, p0, Lb0k;->d:I

    iget v3, p1, Lb0k;->d:I

    if-eq v1, v3, :cond_28

    return v2

    :cond_28
    iget p0, p0, Lb0k;->e:I

    iget p1, p1, Lb0k;->e:I

    if-eq p0, p1, :cond_2f

    return v2

    :cond_2f
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lb0k;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lb0k;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lb0k;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lb0k;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lb0k;->e:I

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
