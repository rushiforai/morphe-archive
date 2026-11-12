.class public final Lkxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Llxh;

.field public final c:Llxh;

.field public final d:Llxh;


# direct methods
.method public constructor <init>(ILlxh;Llxh;Llxh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkxj;->a:I

    iput-object p2, p0, Lkxj;->b:Llxh;

    iput-object p3, p0, Lkxj;->c:Llxh;

    iput-object p4, p0, Lkxj;->d:Llxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2e

    instance-of v0, p1, Lkxj;

    if-eqz v0, :cond_2c

    check-cast p1, Lkxj;

    iget v0, p0, Lkxj;->a:I

    iget v1, p1, Lkxj;->a:I

    if-ne v0, v1, :cond_2c

    iget-object v0, p0, Lkxj;->b:Llxh;

    iget-object v1, p1, Lkxj;->b:Llxh;

    invoke-virtual {v0, v1}, Llxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lkxj;->c:Llxh;

    iget-object v1, p1, Lkxj;->c:Llxh;

    invoke-virtual {v0, v1}, Llxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object p0, p0, Lkxj;->d:Llxh;

    iget-object p1, p1, Lkxj;->d:Llxh;

    invoke-virtual {p0, p1}, Llxh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    :cond_2c
    const/4 p0, 0x0

    return p0

    :cond_2e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lkxj;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lkxj;->b:Llxh;

    iget v2, v2, Llxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lkxj;->c:Llxh;

    iget v2, v2, Llxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lkxj;->d:Llxh;

    iget p0, p0, Llxh;->a:I

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
