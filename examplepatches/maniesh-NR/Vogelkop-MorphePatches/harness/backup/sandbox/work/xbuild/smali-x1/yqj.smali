.class public final Lyqj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lwv;

.field public final b:Lwv;


# direct methods
.method public constructor <init>(Lwv;Lwv;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyqj;->a:Lwv;

    iput-object p2, p0, Lyqj;->b:Lwv;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lyqj;

    if-eqz v0, :cond_1c

    check-cast p1, Lyqj;

    iget-object v0, p0, Lyqj;->a:Lwv;

    iget-object v1, p1, Lyqj;->a:Lwv;

    invoke-virtual {v0, v1}, Lle3;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lyqj;->b:Lwv;

    iget-object p1, p1, Lyqj;->b:Lwv;

    invoke-virtual {p0, p1}, Lle3;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lyqj;->a:Lwv;

    iget-object v0, v0, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lyqj;->b:Lwv;

    iget-object p0, p0, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SmartContractAddresses(sortedOracles="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lyqj;->a:Lwv;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", federatedAttestationsProxy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lyqj;->b:Lwv;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
