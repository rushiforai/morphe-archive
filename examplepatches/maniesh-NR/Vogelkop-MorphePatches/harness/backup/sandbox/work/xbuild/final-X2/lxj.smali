.class public final Llxj;
.super Ln6h;
.source "SourceFile"


# instance fields
.field public final a:Lkxj;

.field public final b:I

.field public final c:I

.field public final d:Lsxj;

.field public final e:I


# direct methods
.method public constructor <init>(Lkxj;IILsxj;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llxj;->a:Lkxj;

    iput p2, p0, Llxj;->b:I

    iput p3, p0, Llxj;->c:I

    iput-object p4, p0, Llxj;->d:Lsxj;

    iput p5, p0, Llxj;->e:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_30

    instance-of v0, p1, Llxj;

    if-eqz v0, :cond_2e

    check-cast p1, Llxj;

    iget-object v0, p0, Llxj;->a:Lkxj;

    iget-object v1, p1, Llxj;->a:Lkxj;

    invoke-virtual {v0, v1}, Lkxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget v0, p0, Llxj;->b:I

    iget v1, p1, Llxj;->b:I

    if-ne v0, v1, :cond_2e

    iget v0, p0, Llxj;->c:I

    iget v1, p1, Llxj;->c:I

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Llxj;->d:Lsxj;

    iget-object v1, p1, Llxj;->d:Lsxj;

    invoke-virtual {v0, v1}, Lsxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget p0, p0, Llxj;->e:I

    iget p1, p1, Llxj;->e:I

    if-eq p0, p1, :cond_30

    :cond_2e
    const/4 p0, 0x0

    return p0

    :cond_30
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Llxj;->a:Lkxj;

    invoke-virtual {v0}, Lkxj;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Llxj;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Llxj;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Llxj;->d:Lsxj;

    invoke-virtual {v2}, Lsxj;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget p0, p0, Llxj;->e:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
