.class public final Llkh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/math/BigInteger;

.field public final c:Ljava/math/BigInteger;

.field public final d:Lwv;

.field public final e:Ljava/math/BigInteger;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/math/BigInteger;

.field public final h:Ljava/math/BigInteger;

.field public final i:Lwv;


# direct methods
.method public constructor <init>(JLjava/math/BigInteger;Ljava/math/BigInteger;Lwv;Ljava/math/BigInteger;Ljava/lang/String;Ljava/math/BigInteger;Ljava/math/BigInteger;Lwv;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    long-to-int p1, p1

    iput p1, p0, Llkh;->a:I

    iput-object p3, p0, Llkh;->b:Ljava/math/BigInteger;

    iput-object p4, p0, Llkh;->c:Ljava/math/BigInteger;

    iput-object p5, p0, Llkh;->d:Lwv;

    iput-object p6, p0, Llkh;->e:Ljava/math/BigInteger;

    iput-object p7, p0, Llkh;->f:Ljava/lang/String;

    iput-object p8, p0, Llkh;->g:Ljava/math/BigInteger;

    iput-object p9, p0, Llkh;->h:Ljava/math/BigInteger;

    iput-object p10, p0, Llkh;->i:Lwv;

    sget-object p0, Lkkh;->a:[Lkkh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_64

    instance-of v0, p1, Llkh;

    if-eqz v0, :cond_62

    check-cast p1, Llkh;

    iget v0, p0, Llkh;->a:I

    int-to-long v0, v0

    iget v2, p1, Llkh;->a:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_62

    iget-object v0, p0, Llkh;->b:Ljava/math/BigInteger;

    iget-object v1, p1, Llkh;->b:Ljava/math/BigInteger;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Llkh;->c:Ljava/math/BigInteger;

    iget-object v1, p1, Llkh;->c:Ljava/math/BigInteger;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Llkh;->d:Lwv;

    iget-object v1, p1, Llkh;->d:Lwv;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Llkh;->e:Ljava/math/BigInteger;

    iget-object v1, p1, Llkh;->e:Ljava/math/BigInteger;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Llkh;->f:Ljava/lang/String;

    iget-object v1, p1, Llkh;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Llkh;->g:Ljava/math/BigInteger;

    iget-object v1, p1, Llkh;->g:Ljava/math/BigInteger;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Llkh;->h:Ljava/math/BigInteger;

    iget-object v1, p1, Llkh;->h:Ljava/math/BigInteger;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    iget-object p0, p0, Llkh;->i:Lwv;

    iget-object p1, p1, Llkh;->i:Lwv;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    :cond_62
    const/4 p0, 0x0

    return p0

    :cond_64
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget v0, p0, Llkh;->a:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Llkh;->b:Ljava/math/BigInteger;

    if-nez v3, :cond_11

    move v3, v2

    goto :goto_15

    :cond_11
    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    :goto_15
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Llkh;->c:Ljava/math/BigInteger;

    if-nez v3, :cond_1d

    move v3, v2

    goto :goto_21

    :cond_1d
    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    :goto_21
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Llkh;->d:Lwv;

    if-nez v3, :cond_29

    move v3, v2

    goto :goto_2f

    :cond_29
    iget-object v3, v3, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    :goto_2f
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Llkh;->e:Ljava/math/BigInteger;

    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Llkh;->f:Ljava/lang/String;

    invoke-static {v3, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v3, p0, Llkh;->g:Ljava/math/BigInteger;

    if-nez v3, :cond_45

    move v3, v2

    goto :goto_49

    :cond_45
    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    :goto_49
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Llkh;->h:Ljava/math/BigInteger;

    if-nez v3, :cond_51

    move v3, v2

    goto :goto_55

    :cond_51
    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    :goto_55
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Llkh;->i:Lwv;

    if-eqz p0, :cond_61

    iget-object p0, p0, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    move-result v2

    :cond_61
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget v0, p0, Llkh;->a:I

    int-to-long v0, v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "RawTransaction(chainId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", nonce="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->b:Ljava/math/BigInteger;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", gasLimit="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->c:Ljava/math/BigInteger;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", to="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->d:Lwv;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", value="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->e:Ljava/math/BigInteger;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", data="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->f:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", maxPriorityFeePerGas="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->g:Ljava/math/BigInteger;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", maxFeePerGas="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Llkh;->h:Ljava/math/BigInteger;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", feeCurrency="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Llkh;->i:Lwv;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
