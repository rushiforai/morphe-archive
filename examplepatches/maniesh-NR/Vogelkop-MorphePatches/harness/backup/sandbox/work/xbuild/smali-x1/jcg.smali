.class public final Ljcg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzi4;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(Lzi4;IIIII)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljcg;->a:Lzi4;

    iput p2, p0, Ljcg;->b:I

    iput p3, p0, Ljcg;->c:I

    iput p4, p0, Ljcg;->d:I

    iput p5, p0, Ljcg;->e:I

    iput p6, p0, Ljcg;->f:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_32

    instance-of v0, p1, Ljcg;

    if-eqz v0, :cond_30

    check-cast p1, Ljcg;

    iget-object v0, p0, Ljcg;->a:Lzi4;

    iget-object v1, p1, Ljcg;->a:Lzi4;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget v0, p0, Ljcg;->b:I

    iget v1, p1, Ljcg;->b:I

    if-ne v0, v1, :cond_30

    iget v0, p0, Ljcg;->c:I

    iget v1, p1, Ljcg;->c:I

    if-ne v0, v1, :cond_30

    iget v0, p0, Ljcg;->d:I

    iget v1, p1, Ljcg;->d:I

    if-ne v0, v1, :cond_30

    iget v0, p0, Ljcg;->e:I

    iget v1, p1, Ljcg;->e:I

    if-ne v0, v1, :cond_30

    iget p0, p0, Ljcg;->f:I

    iget p1, p1, Ljcg;->f:I

    if-eq p0, p1, :cond_32

    :cond_30
    const/4 p0, 0x0

    return p0

    :cond_32
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ljcg;->a:Lzi4;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ljcg;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ljcg;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ljcg;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ljcg;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Ljcg;->f:I

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
