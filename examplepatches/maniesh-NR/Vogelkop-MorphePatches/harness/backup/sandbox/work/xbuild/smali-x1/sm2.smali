.class public final Lsm2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:J

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(IJLjava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_c

    iput p1, p0, Lsm2;->a:I

    iput-wide p2, p0, Lsm2;->b:J

    iput-object p4, p0, Lsm2;->c:Ljava/lang/String;

    return-void

    :cond_c
    const-string p0, "Null status"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p1, p0, :cond_29

    instance-of v0, p1, Lsm2;

    if-eqz v0, :cond_2b

    check-cast p1, Lsm2;

    iget v0, p0, Lsm2;->a:I

    iget v1, p1, Lsm2;->a:I

    invoke-static {v0, v1}, Lvep;->e(II)Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-wide v0, p0, Lsm2;->b:J

    iget-wide v2, p1, Lsm2;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2b

    iget-object p1, p1, Lsm2;->c:Ljava/lang/String;

    iget-object p0, p0, Lsm2;->c:Ljava/lang/String;

    if-nez p0, :cond_23

    if-nez p1, :cond_2b

    goto :goto_29

    :cond_23
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2b

    :cond_29
    :goto_29
    const/4 p0, 0x1

    return p0

    :cond_2b
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 8

    iget v0, p0, Lsm2;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    const/16 v2, 0x20

    iget-wide v3, p0, Lsm2;->b:J

    ushr-long v5, v3, v2

    xor-long/2addr v5, v3

    long-to-int v2, v5

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lsm2;->c:Ljava/lang/String;

    if-nez p0, :cond_1b

    const/4 p0, 0x0

    goto :goto_1f

    :cond_1b
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    :goto_1f
    xor-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BackendResponse{status="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    iget v2, p0, Lsm2;->a:I

    if-eq v2, v1, :cond_21

    const/4 v1, 0x2

    if-eq v2, v1, :cond_1e

    const/4 v1, 0x3

    if-eq v2, v1, :cond_1b

    const/4 v1, 0x4

    if-eq v2, v1, :cond_18

    const-string v1, "null"

    goto :goto_23

    :cond_18
    const-string v1, "INVALID_PAYLOAD"

    goto :goto_23

    :cond_1b
    const-string v1, "FATAL_ERROR"

    goto :goto_23

    :cond_1e
    const-string v1, "TRANSIENT_ERROR"

    goto :goto_23

    :cond_21
    const-string v1, "OK"

    :goto_23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", nextRequestWaitMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lsm2;->b:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", updatedPseudonymousId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lsm2;->c:Ljava/lang/String;

    const-string v1, "}"

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
