.class public final Lnmc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzmc;


# instance fields
.field public final a:Llmc;

.field public final b:Lxmc;

.field public final c:Lxmc;

.field public final d:Lmmc;


# direct methods
.method public constructor <init>(Llmc;Lxmc;Lxmc;Lmmc;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnmc;->a:Llmc;

    iput-object p2, p0, Lnmc;->b:Lxmc;

    iput-object p3, p0, Lnmc;->c:Lxmc;

    iput-object p4, p0, Lnmc;->d:Lmmc;

    return-void
.end method


# virtual methods
.method public final a()Llmc;
    .registers 1

    iget-object p0, p0, Lnmc;->a:Llmc;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2e

    instance-of v0, p1, Lnmc;

    if-eqz v0, :cond_2c

    check-cast p1, Lnmc;

    iget-object v0, p0, Lnmc;->a:Llmc;

    iget-object v1, p1, Lnmc;->a:Llmc;

    invoke-virtual {v0, v1}, Llmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lnmc;->b:Lxmc;

    iget-object v1, p1, Lnmc;->b:Lxmc;

    invoke-virtual {v0, v1}, Lxmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lnmc;->c:Lxmc;

    iget-object v1, p1, Lnmc;->c:Lxmc;

    invoke-virtual {v0, v1}, Lxmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object p0, p0, Lnmc;->d:Lmmc;

    iget-object p1, p1, Lnmc;->d:Lmmc;

    if-eq p0, p1, :cond_2e

    :cond_2c
    const/4 p0, 0x0

    return p0

    :cond_2e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lnmc;->a:Llmc;

    invoke-virtual {v0}, Llmc;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnmc;->b:Lxmc;

    invoke-virtual {v1}, Lxmc;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lnmc;->c:Lxmc;

    invoke-virtual {v0}, Lxmc;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lnmc;->d:Lmmc;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
