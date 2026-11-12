.class public final Lgp9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:D

.field public final c:J

.field public final d:Ljava/lang/Long;

.field public final e:Ljava/lang/Double;

.field public final f:Ljava/lang/Boolean;

.field public final g:Ljava/lang/String;

.field public final h:Lip9;


# direct methods
.method public constructor <init>(Ljava/lang/String;DJLjava/lang/Long;Ljava/lang/Double;Ljava/lang/Boolean;Ljava/lang/String;Lip9;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgp9;->a:Ljava/lang/String;

    iput-wide p2, p0, Lgp9;->b:D

    iput-wide p4, p0, Lgp9;->c:J

    iput-object p6, p0, Lgp9;->d:Ljava/lang/Long;

    iput-object p7, p0, Lgp9;->e:Ljava/lang/Double;

    iput-object p8, p0, Lgp9;->f:Ljava/lang/Boolean;

    iput-object p9, p0, Lgp9;->g:Ljava/lang/String;

    iput-object p10, p0, Lgp9;->h:Lip9;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_54

    instance-of v0, p1, Lgp9;

    if-eqz v0, :cond_52

    check-cast p1, Lgp9;

    iget-object v0, p0, Lgp9;->a:Ljava/lang/String;

    iget-object v1, p1, Lgp9;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-wide v0, p0, Lgp9;->b:D

    iget-wide v2, p1, Lgp9;->b:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-nez v0, :cond_52

    iget-wide v0, p0, Lgp9;->c:J

    iget-wide v2, p1, Lgp9;->c:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_52

    iget-object v0, p0, Lgp9;->d:Ljava/lang/Long;

    iget-object v1, p1, Lgp9;->d:Ljava/lang/Long;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lgp9;->e:Ljava/lang/Double;

    iget-object v1, p1, Lgp9;->e:Ljava/lang/Double;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lgp9;->f:Ljava/lang/Boolean;

    iget-object v1, p1, Lgp9;->f:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lgp9;->g:Ljava/lang/String;

    iget-object v1, p1, Lgp9;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object p0, p0, Lgp9;->h:Lip9;

    iget-object p1, p1, Lgp9;->h:Lip9;

    if-eq p0, p1, :cond_54

    :cond_52
    const/4 p0, 0x0

    return p0

    :cond_54
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget-object v0, p0, Lgp9;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lgp9;->b:D

    invoke-static {v2, v3}, Ljava/lang/Double;->hashCode(D)I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-wide v3, p0, Lgp9;->c:J

    invoke-static {v2, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lgp9;->d:Ljava/lang/Long;

    if-nez v3, :cond_1e

    move v3, v2

    goto :goto_22

    :cond_1e
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_22
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgp9;->e:Ljava/lang/Double;

    if-nez v3, :cond_2a

    move v3, v2

    goto :goto_2e

    :cond_2a
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_2e
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgp9;->f:Ljava/lang/Boolean;

    if-nez v3, :cond_36

    move v3, v2

    goto :goto_3a

    :cond_36
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_3a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgp9;->g:Ljava/lang/String;

    if-eqz v3, :cond_44

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_44
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lgp9;->h:Lip9;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FreePlan(iso3="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lgp9;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", dataAmount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lgp9;->b:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", duration="

    const-string v2, ", activationTime="

    iget-wide v3, p0, Lgp9;->c:J

    invoke-static {v0, v1, v3, v4, v2}, Lp3p;->u(Ljava/lang/StringBuilder;Ljava/lang/String;JLjava/lang/String;)V

    iget-object v1, p0, Lgp9;->d:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", usedDataAmount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgp9;->e:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isFreePlan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgp9;->f:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", externalId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgp9;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lgp9;->h:Lip9;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
