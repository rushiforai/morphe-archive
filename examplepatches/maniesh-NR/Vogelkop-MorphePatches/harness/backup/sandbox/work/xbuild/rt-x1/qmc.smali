.class public final Lqmc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzmc;


# instance fields
.field public final a:Llmc;

.field public final b:Lxmc;

.field public final c:Lxmc;


# direct methods
.method public constructor <init>(Llmc;Lxmc;Lxmc;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqmc;->a:Llmc;

    iput-object p2, p0, Lqmc;->b:Lxmc;

    iput-object p3, p0, Lqmc;->c:Lxmc;

    return-void
.end method


# virtual methods
.method public final a()Llmc;
    .registers 1

    iget-object p0, p0, Lqmc;->a:Llmc;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lqmc;

    if-eqz v0, :cond_26

    check-cast p1, Lqmc;

    iget-object v0, p0, Lqmc;->a:Llmc;

    iget-object v1, p1, Lqmc;->a:Llmc;

    invoke-virtual {v0, v1}, Llmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lqmc;->b:Lxmc;

    iget-object v1, p1, Lqmc;->b:Lxmc;

    invoke-virtual {v0, v1}, Lxmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lqmc;->c:Lxmc;

    iget-object p1, p1, Lqmc;->c:Lxmc;

    invoke-virtual {p0, p1}, Lxmc;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lqmc;->a:Llmc;

    invoke-virtual {v0}, Llmc;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lqmc;->b:Lxmc;

    invoke-virtual {v1}, Lxmc;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lqmc;->c:Lxmc;

    invoke-virtual {p0}, Lxmc;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
