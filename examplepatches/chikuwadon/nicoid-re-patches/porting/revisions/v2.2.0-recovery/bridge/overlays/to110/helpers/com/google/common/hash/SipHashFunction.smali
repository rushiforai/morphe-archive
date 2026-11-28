.class final Lcom/google/common/hash/SipHashFunction;
.super Lcom/google/common/hash/AbstractHashFunction;
.source "SipHashFunction.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation runtime Lcom/google/errorprone/annotations/Immutable;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/hash/SipHashFunction$SipHasher;
    }
.end annotation


# static fields
.field static final SIP_HASH_24:Lcom/google/common/hash/HashFunction;

.field private static final serialVersionUID:J


# instance fields
.field private final c:I

.field private final d:I

.field private final k0:J

.field private final k1:J


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 40
    new-instance v0, Lcom/google/common/hash/SipHashFunction;

    const-wide v3, 0x706050403020100L

    const-wide v5, 0xf0e0d0c0b0a0908L

    const/4 v1, 0x2

    const/4 v2, 0x4

    invoke-direct/range {v0 .. v6}, Lcom/google/common/hash/SipHashFunction;-><init>(IIJJ)V

    sput-object v0, Lcom/google/common/hash/SipHashFunction;->SIP_HASH_24:Lcom/google/common/hash/HashFunction;

    return-void
.end method

.method constructor <init>(IIJJ)V
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "c",
            "d",
            "k0",
            "k1"
        }
    .end annotation

    .line 57
    invoke-direct {p0}, Lcom/google/common/hash/AbstractHashFunction;-><init>()V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 58
    :goto_0
    const-string v3, "The number of SipRound iterations (c=%s) during Compression must be positive."

    invoke-static {v2, v3, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    if-gtz p2, :cond_1

    move v0, v1

    .line 60
    :cond_1
    const-string v1, "The number of SipRound iterations (d=%s) during Finalization must be positive."

    invoke-static {v0, v1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 62
    iput p1, p0, Lcom/google/common/hash/SipHashFunction;->c:I

    .line 63
    iput p2, p0, Lcom/google/common/hash/SipHashFunction;->d:I

    .line 64
    iput-wide p3, p0, Lcom/google/common/hash/SipHashFunction;->k0:J

    .line 65
    iput-wide p5, p0, Lcom/google/common/hash/SipHashFunction;->k1:J

    return-void
.end method


# virtual methods
.method public bits()I
    .registers 1

    const/16 p0, 0x40

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 87
    instance-of v0, p1, Lcom/google/common/hash/SipHashFunction;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 88
    check-cast p1, Lcom/google/common/hash/SipHashFunction;

    .line 89
    iget v0, p0, Lcom/google/common/hash/SipHashFunction;->c:I

    iget v2, p1, Lcom/google/common/hash/SipHashFunction;->c:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/google/common/hash/SipHashFunction;->d:I

    iget v2, p1, Lcom/google/common/hash/SipHashFunction;->d:I

    if-ne v0, v2, :cond_0

    iget-wide v2, p0, Lcom/google/common/hash/SipHashFunction;->k0:J

    iget-wide v4, p1, Lcom/google/common/hash/SipHashFunction;->k0:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    iget-wide v2, p0, Lcom/google/common/hash/SipHashFunction;->k1:J

    iget-wide p0, p1, Lcom/google/common/hash/SipHashFunction;->k1:J

    cmp-long p0, v2, p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public hashCode()I
    .registers 5

    .line 96
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/google/common/hash/SipHashFunction;->c:I

    xor-int/2addr v0, v1

    iget v1, p0, Lcom/google/common/hash/SipHashFunction;->d:I

    xor-int/2addr v0, v1

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/google/common/hash/SipHashFunction;->k0:J

    xor-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/common/hash/SipHashFunction;->k1:J

    xor-long/2addr v0, v2

    long-to-int p0, v0

    return p0
.end method

.method public newHasher()Lcom/google/common/hash/Hasher;
    .registers 8

    .line 75
    new-instance v0, Lcom/google/common/hash/SipHashFunction$SipHasher;

    iget v1, p0, Lcom/google/common/hash/SipHashFunction;->c:I

    iget v2, p0, Lcom/google/common/hash/SipHashFunction;->d:I

    iget-wide v3, p0, Lcom/google/common/hash/SipHashFunction;->k0:J

    iget-wide v5, p0, Lcom/google/common/hash/SipHashFunction;->k1:J

    invoke-direct/range {v0 .. v6}, Lcom/google/common/hash/SipHashFunction$SipHasher;-><init>(IIJJ)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Hashing.sipHash"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/google/common/hash/SipHashFunction;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/common/hash/SipHashFunction;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/common/hash/SipHashFunction;->k0:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/common/hash/SipHashFunction;->k1:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
