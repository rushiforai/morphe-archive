.class public final Lbn2;
.super Lc06;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lt55;

.field public final c:Lt55;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lt55;Lt55;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p1, :cond_27

    iput-object p1, p0, Lbn2;->a:Landroid/content/Context;

    if-eqz p2, :cond_21

    iput-object p2, p0, Lbn2;->b:Lt55;

    if-eqz p3, :cond_1b

    iput-object p3, p0, Lbn2;->c:Lt55;

    if-eqz p4, :cond_15

    iput-object p4, p0, Lbn2;->d:Ljava/lang/String;

    return-void

    :cond_15
    const-string p0, "Null backendName"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0

    :cond_1b
    const-string p0, "Null monotonicClock"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0

    :cond_21
    const-string p0, "Null wallClock"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0

    :cond_27
    const-string p0, "Null applicationContext"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lc06;

    const/4 v2, 0x0

    if-eqz v1, :cond_36

    check-cast p1, Lc06;

    check-cast p1, Lbn2;

    iget-object v1, p1, Lbn2;->a:Landroid/content/Context;

    iget-object v3, p0, Lbn2;->a:Landroid/content/Context;

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v1, p0, Lbn2;->b:Lt55;

    iget-object v3, p1, Lbn2;->b:Lt55;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v1, p0, Lbn2;->c:Lt55;

    iget-object v3, p1, Lbn2;->c:Lt55;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object p0, p0, Lbn2;->d:Ljava/lang/String;

    iget-object p1, p1, Lbn2;->d:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_36

    return v0

    :cond_36
    return v2
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lbn2;->a:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-object v2, p0, Lbn2;->b:Lt55;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lbn2;->c:Lt55;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lbn2;->d:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    xor-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CreationContext{applicationContext="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lbn2;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", wallClock="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbn2;->b:Lt55;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", monotonicClock="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbn2;->c:Lt55;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", backendName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lbn2;->d:Ljava/lang/String;

    const-string v1, "}"

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
