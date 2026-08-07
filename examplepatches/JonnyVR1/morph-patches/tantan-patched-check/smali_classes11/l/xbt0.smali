.class public final Ll/xbt0;
.super Ll/bmt0;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Z

.field public final e:Lcom/google/android/gms/internal/measurement/zzco;

.field public final f:Lcom/google/android/gms/internal/measurement/zzcn;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLcom/google/android/gms/internal/measurement/zzco;Ll/h9t0;Ll/d8t0;Lcom/google/android/gms/internal/measurement/zzcn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bmt0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xbt0;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/xbt0;->d:Z

    .line 7
    .line 8
    iput-object p3, p0, Ll/xbt0;->e:Lcom/google/android/gms/internal/measurement/zzco;

    .line 9
    .line 10
    iput-object p6, p0, Ll/xbt0;->f:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ZLcom/google/android/gms/internal/measurement/zzco;Ll/h9t0;Ll/d8t0;Lcom/google/android/gms/internal/measurement/zzcn;Ll/let0;)V
    .locals 0

    const/4 p4, 0x0

    const/4 p5, 0x0

    const/4 p2, 0x0

    .line 13
    invoke-direct/range {p0 .. p6}, Ll/xbt0;-><init>(Ljava/lang/String;ZLcom/google/android/gms/internal/measurement/zzco;Ll/h9t0;Ll/d8t0;Lcom/google/android/gms/internal/measurement/zzcn;)V

    return-void
.end method


# virtual methods
.method public final a()Ll/h9t0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final b()Ll/d8t0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final c()Lcom/google/android/gms/internal/measurement/zzco;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xbt0;->e:Lcom/google/android/gms/internal/measurement/zzco;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Lcom/google/android/gms/internal/measurement/zzcn;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xbt0;->f:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xbt0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/bmt0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast p1, Ll/bmt0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/xbt0;->c:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/bmt0;->e()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-boolean v1, p0, Ll/xbt0;->d:Z

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/bmt0;->f()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-ne v1, v3, :cond_1

    .line 31
    .line 32
    iget-object v1, p0, Ll/xbt0;->e:Lcom/google/android/gms/internal/measurement/zzco;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/bmt0;->c()Lcom/google/android/gms/internal/measurement/zzco;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/bmt0;->a()Ll/h9t0;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/bmt0;->b()Ll/d8t0;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/xbt0;->f:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/bmt0;->d()Lcom/google/android/gms/internal/measurement/zzcn;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    return v0

    .line 63
    :cond_1
    return v2
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xbt0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xbt0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const v1, 0xf4243

    .line 8
    .line 9
    .line 10
    xor-int/2addr v0, v1

    .line 11
    mul-int/2addr v0, v1

    .line 12
    iget-boolean v2, p0, Ll/xbt0;->d:Z

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const/16 v2, 0x4cf

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 v2, 0x4d5

    .line 20
    .line 21
    :goto_0
    xor-int/2addr v0, v2

    .line 22
    mul-int/2addr v0, v1

    .line 23
    iget-object v1, p0, Ll/xbt0;->e:Lcom/google/android/gms/internal/measurement/zzco;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    xor-int/2addr v0, v1

    .line 30
    const v1, 0x22cd8cdb

    .line 31
    .line 32
    .line 33
    mul-int/2addr v0, v1

    .line 34
    iget-object p0, p0, Ll/xbt0;->f:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    xor-int/2addr p0, v0

    .line 41
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xbt0;->c:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/xbt0;->d:Z

    .line 4
    .line 5
    iget-object v2, p0, Ll/xbt0;->e:Lcom/google/android/gms/internal/measurement/zzco;

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object p0, p0, Ll/xbt0;->f:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v4, "FileComplianceOptions{fileOwner="

    .line 20
    .line 21
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, ", hasDifferentDmaOwner="

    .line 28
    .line 29
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, ", fileChecks="

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, ", dataForwardingNotAllowedResolver=null, multipleProductIdGroupsResolver=null, filePurpose="

    .line 44
    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "}"

    .line 52
    .line 53
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method
