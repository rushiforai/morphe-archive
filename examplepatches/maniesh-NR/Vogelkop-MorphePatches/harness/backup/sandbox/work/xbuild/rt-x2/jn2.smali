.class public final Ljn2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/Integer;

.field public final c:Lr18;

.field public final d:J

.field public final e:J

.field public final f:Ljava/util/HashMap;

.field public final g:Ljava/lang/Integer;

.field public final h:Ljava/lang/String;

.field public final i:[B

.field public final j:[B

.field public final k:Ljava/util/ArrayList;

.field public final l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Lr18;JJLjava/util/HashMap;Ljava/lang/Integer;Ljava/lang/String;[B[BLjava/util/ArrayList;Ljava/lang/String;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljn2;->a:Ljava/lang/String;

    iput-object p2, p0, Ljn2;->b:Ljava/lang/Integer;

    iput-object p3, p0, Ljn2;->c:Lr18;

    iput-wide p4, p0, Ljn2;->d:J

    iput-wide p6, p0, Ljn2;->e:J

    iput-object p8, p0, Ljn2;->f:Ljava/util/HashMap;

    iput-object p9, p0, Ljn2;->g:Ljava/lang/Integer;

    iput-object p10, p0, Ljn2;->h:Ljava/lang/String;

    iput-object p11, p0, Ljn2;->i:[B

    iput-object p12, p0, Ljn2;->j:[B

    iput-object p13, p0, Ljn2;->k:Ljava/util/ArrayList;

    iput-object p14, p0, Ljn2;->l:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Ljn2;->f:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final b(Ljava/lang/String;)I
    .registers 2

    iget-object p0, p0, Ljn2;->f:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public final c()Lala;
    .registers 4

    new-instance v0, Lala;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    iget-object v2, p0, Ljn2;->a:Ljava/lang/String;

    if-eqz v2, :cond_4e

    iput-object v2, v0, Lala;->a:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->b:Ljava/lang/Integer;

    iput-object v2, v0, Lala;->b:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->g:Ljava/lang/Integer;

    iput-object v2, v0, Lala;->g:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->h:Ljava/lang/String;

    iput-object v2, v0, Lala;->h:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->i:[B

    iput-object v2, v0, Lala;->i:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->j:[B

    iput-object v2, v0, Lala;->j:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->k:Ljava/util/ArrayList;

    iput-object v2, v0, Lala;->k:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->l:Ljava/lang/String;

    iput-object v2, v0, Lala;->l:Ljava/lang/Object;

    iget-object v2, p0, Ljn2;->c:Lr18;

    if-eqz v2, :cond_48

    iput-object v2, v0, Lala;->c:Ljava/lang/Object;

    iget-wide v1, p0, Ljn2;->d:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lala;->d:Ljava/lang/Object;

    iget-wide v1, p0, Ljn2;->e:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lala;->e:Ljava/lang/Object;

    new-instance v1, Ljava/util/HashMap;

    iget-object p0, p0, Ljn2;->f:Ljava/util/HashMap;

    invoke-direct {v1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v1, v0, Lala;->f:Ljava/lang/Object;

    return-object v0

    :cond_48
    const-string p0, "Null encodedPayload"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1

    :cond_4e
    const-string p0, "Null transportName"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p1, p0, :cond_95

    instance-of v0, p1, Ljn2;

    if-eqz v0, :cond_97

    check-cast p1, Ljn2;

    iget-object v0, p0, Ljn2;->a:Ljava/lang/String;

    iget-object v1, p1, Ljn2;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    iget-object v0, p1, Ljn2;->b:Ljava/lang/Integer;

    iget-object v1, p0, Ljn2;->b:Ljava/lang/Integer;

    if-nez v1, :cond_1b

    if-nez v0, :cond_97

    goto :goto_21

    :cond_1b
    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    :goto_21
    iget-object v0, p0, Ljn2;->c:Lr18;

    iget-object v1, p1, Ljn2;->c:Lr18;

    invoke-virtual {v0, v1}, Lr18;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    iget-wide v0, p0, Ljn2;->d:J

    iget-wide v2, p1, Ljn2;->d:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_97

    iget-wide v0, p0, Ljn2;->e:J

    iget-wide v2, p1, Ljn2;->e:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_97

    iget-object v0, p0, Ljn2;->f:Ljava/util/HashMap;

    iget-object v1, p1, Ljn2;->f:Ljava/util/HashMap;

    invoke-interface {v0, v1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    iget-object v0, p1, Ljn2;->g:Ljava/lang/Integer;

    iget-object v1, p0, Ljn2;->g:Ljava/lang/Integer;

    if-nez v1, :cond_4e

    if-nez v0, :cond_97

    goto :goto_54

    :cond_4e
    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    :goto_54
    iget-object v0, p1, Ljn2;->h:Ljava/lang/String;

    iget-object v1, p0, Ljn2;->h:Ljava/lang/String;

    if-nez v1, :cond_5d

    if-nez v0, :cond_97

    goto :goto_63

    :cond_5d
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    :goto_63
    iget-object v0, p0, Ljn2;->i:[B

    iget-object v1, p1, Ljn2;->i:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_97

    iget-object v0, p0, Ljn2;->j:[B

    iget-object v1, p1, Ljn2;->j:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_97

    iget-object v0, p1, Ljn2;->k:Ljava/util/ArrayList;

    iget-object v1, p0, Ljn2;->k:Ljava/util/ArrayList;

    if-nez v1, :cond_80

    if-nez v0, :cond_97

    goto :goto_86

    :cond_80
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_97

    :goto_86
    iget-object p1, p1, Ljn2;->l:Ljava/lang/String;

    iget-object p0, p0, Ljn2;->l:Ljava/lang/String;

    if-nez p0, :cond_8f

    if-nez p1, :cond_97

    goto :goto_95

    :cond_8f
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_97

    :cond_95
    :goto_95
    const/4 p0, 0x1

    return p0

    :cond_97
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 9

    iget-object v0, p0, Ljn2;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Ljn2;->b:Ljava/lang/Integer;

    if-nez v3, :cond_12

    move v3, v2

    goto :goto_16

    :cond_12
    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_16
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->c:Lr18;

    invoke-virtual {v3}, Lr18;->hashCode()I

    move-result v3

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Ljn2;->d:J

    const/16 v5, 0x20

    ushr-long v6, v3, v5

    xor-long/2addr v6, v3

    long-to-int v3, v6

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Ljn2;->e:J

    ushr-long v5, v3, v5

    xor-long/2addr v5, v3

    long-to-int v3, v5

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->f:Ljava/util/HashMap;

    invoke-interface {v3}, Ljava/util/Map;->hashCode()I

    move-result v3

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->g:Ljava/lang/Integer;

    if-nez v3, :cond_40

    move v3, v2

    goto :goto_44

    :cond_40
    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_44
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->h:Ljava/lang/String;

    if-nez v3, :cond_4c

    move v3, v2

    goto :goto_50

    :cond_4c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_50
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->i:[B

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([B)I

    move-result v3

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->j:[B

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([B)I

    move-result v3

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljn2;->k:Ljava/util/ArrayList;

    if-nez v3, :cond_68

    move v3, v2

    goto :goto_6c

    :cond_68
    invoke-virtual {v3}, Ljava/util/ArrayList;->hashCode()I

    move-result v3

    :goto_6c
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Ljn2;->l:Ljava/lang/String;

    if-eqz p0, :cond_76

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_76
    xor-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "EventInternal{transportName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ljn2;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->b:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", encodedPayload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->c:Lr18;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", eventMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Ljn2;->d:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", uptimeMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Ljn2;->e:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", autoMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->f:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", productId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->g:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", pseudonymousId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", experimentIdsClear="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->i:[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", experimentIdsEncrypted="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->j:[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", experimentIdsEncryptedList="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljn2;->k:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", pseudonymousIdUpdateReceiverClassName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ljn2;->l:Ljava/lang/String;

    const-string v1, "}"

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
