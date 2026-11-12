.class public final Lc98;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:D

.field public final c:J

.field public final d:Ly98;

.field public final e:Ljava/lang/Long;

.field public final f:Ljava/lang/Double;

.field public final g:Ljava/lang/Boolean;

.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;DJLy98;Ljava/lang/Long;Ljava/lang/Double;Ljava/lang/Boolean;Ljava/lang/String;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc98;->a:Ljava/lang/String;

    iput-wide p2, p0, Lc98;->b:D

    iput-wide p4, p0, Lc98;->c:J

    iput-object p6, p0, Lc98;->d:Ly98;

    iput-object p7, p0, Lc98;->e:Ljava/lang/Long;

    iput-object p8, p0, Lc98;->f:Ljava/lang/Double;

    iput-object p9, p0, Lc98;->g:Ljava/lang/Boolean;

    iput-object p10, p0, Lc98;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_54

    instance-of v0, p1, Lc98;

    if-eqz v0, :cond_52

    check-cast p1, Lc98;

    iget-object v0, p0, Lc98;->a:Ljava/lang/String;

    iget-object v1, p1, Lc98;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-wide v0, p0, Lc98;->b:D

    iget-wide v2, p1, Lc98;->b:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-nez v0, :cond_52

    iget-wide v0, p0, Lc98;->c:J

    iget-wide v2, p1, Lc98;->c:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_52

    iget-object v0, p0, Lc98;->d:Ly98;

    iget-object v1, p1, Lc98;->d:Ly98;

    if-ne v0, v1, :cond_52

    iget-object v0, p0, Lc98;->e:Ljava/lang/Long;

    iget-object v1, p1, Lc98;->e:Ljava/lang/Long;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lc98;->f:Ljava/lang/Double;

    iget-object v1, p1, Lc98;->f:Ljava/lang/Double;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lc98;->g:Ljava/lang/Boolean;

    iget-object v1, p1, Lc98;->g:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object p0, p0, Lc98;->h:Ljava/lang/String;

    iget-object p1, p1, Lc98;->h:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_54

    :cond_52
    const/4 p0, 0x0

    return p0

    :cond_54
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget-object v0, p0, Lc98;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lc98;->b:D

    invoke-static {v2, v3}, Ljava/lang/Double;->hashCode(D)I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-wide v3, p0, Lc98;->c:J

    invoke-static {v2, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v2, p0, Lc98;->d:Ly98;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    const/4 v0, 0x0

    iget-object v3, p0, Lc98;->e:Ljava/lang/Long;

    if-nez v3, :cond_26

    move v3, v0

    goto :goto_2a

    :cond_26
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_2a
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Lc98;->f:Ljava/lang/Double;

    if-nez v3, :cond_32

    move v3, v0

    goto :goto_36

    :cond_32
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_36
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Lc98;->g:Ljava/lang/Boolean;

    if-nez v3, :cond_3e

    move v3, v0

    goto :goto_42

    :cond_3e
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_42
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object p0, p0, Lc98;->h:Ljava/lang/String;

    if-eqz p0, :cond_4c

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :cond_4c
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "EsimPlan(iso3="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lc98;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", dataAmount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lc98;->b:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", duration="

    const-string v2, ", status="

    iget-wide v3, p0, Lc98;->c:J

    invoke-static {v0, v1, v3, v4, v2}, Lp3p;->u(Ljava/lang/StringBuilder;Ljava/lang/String;JLjava/lang/String;)V

    iget-object v1, p0, Lc98;->d:Ly98;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", activationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc98;->e:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", usedDataAmount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc98;->f:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isFreePlan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc98;->g:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", externalId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    iget-object p0, p0, Lc98;->h:Ljava/lang/String;

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
