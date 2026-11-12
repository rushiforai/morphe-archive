.class public final Lnxj;
.super Ln6h;
.source "SourceFile"


# instance fields
.field public final a:Lkxj;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Lsxj;

.field public final f:Lcyj;


# direct methods
.method public constructor <init>(Lkxj;IIILsxj;Lcyj;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnxj;->a:Lkxj;

    iput p2, p0, Lnxj;->b:I

    iput p3, p0, Lnxj;->c:I

    iput p4, p0, Lnxj;->d:I

    iput-object p5, p0, Lnxj;->e:Lsxj;

    iput-object p6, p0, Lnxj;->f:Lcyj;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3a

    instance-of v0, p1, Lnxj;

    if-eqz v0, :cond_38

    check-cast p1, Lnxj;

    iget-object v0, p0, Lnxj;->a:Lkxj;

    iget-object v1, p1, Lnxj;->a:Lkxj;

    invoke-virtual {v0, v1}, Lkxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget v0, p0, Lnxj;->b:I

    iget v1, p1, Lnxj;->b:I

    if-ne v0, v1, :cond_38

    iget v0, p0, Lnxj;->c:I

    iget v1, p1, Lnxj;->c:I

    if-ne v0, v1, :cond_38

    iget v0, p0, Lnxj;->d:I

    iget v1, p1, Lnxj;->d:I

    if-ne v0, v1, :cond_38

    iget-object v0, p0, Lnxj;->e:Lsxj;

    iget-object v1, p1, Lnxj;->e:Lsxj;

    invoke-virtual {v0, v1}, Lsxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object p0, p0, Lnxj;->f:Lcyj;

    iget-object p1, p1, Lnxj;->f:Lcyj;

    invoke-virtual {p0, p1}, Lcyj;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    :cond_38
    const/4 p0, 0x0

    return p0

    :cond_3a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lnxj;->a:Lkxj;

    invoke-virtual {v0}, Lkxj;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lnxj;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lnxj;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lnxj;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lnxj;->e:Lsxj;

    invoke-virtual {v2}, Lsxj;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Lnxj;->f:Lcyj;

    invoke-virtual {p0}, Lcyj;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
