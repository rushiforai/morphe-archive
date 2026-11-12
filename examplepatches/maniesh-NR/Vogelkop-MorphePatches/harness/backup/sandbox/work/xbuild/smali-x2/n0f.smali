.class public final Ln0f;
.super Lj14;
.source "SourceFile"


# instance fields
.field public final A:Ljava/lang/String;

.field public final B:Ljava/lang/String;

.field public final C:Ljava/lang/String;

.field public final D:Ljava/lang/String;

.field public final E:Lm0f;

.field public final F:Lm0f;

.field public final G:Z

.field public final y:Ljava/lang/String;

.field public final z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lm0f;Lm0f;Z)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln0f;->y:Ljava/lang/String;

    iput-object p2, p0, Ln0f;->z:Ljava/lang/String;

    iput-object p3, p0, Ln0f;->A:Ljava/lang/String;

    iput-object p4, p0, Ln0f;->B:Ljava/lang/String;

    iput-object p5, p0, Ln0f;->C:Ljava/lang/String;

    iput-object p6, p0, Ln0f;->D:Ljava/lang/String;

    iput-object p7, p0, Ln0f;->E:Lm0f;

    iput-object p8, p0, Ln0f;->F:Lm0f;

    iput-boolean p9, p0, Ln0f;->G:Z

    return-void
.end method


# virtual methods
.method public final Q()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ln0f;->y:Ljava/lang/String;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_60

    instance-of v0, p1, Ln0f;

    if-eqz v0, :cond_5e

    check-cast p1, Ln0f;

    iget-object v0, p0, Ln0f;->y:Ljava/lang/String;

    iget-object v1, p1, Ln0f;->y:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->z:Ljava/lang/String;

    iget-object v1, p1, Ln0f;->z:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->A:Ljava/lang/String;

    iget-object v1, p1, Ln0f;->A:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->B:Ljava/lang/String;

    iget-object v1, p1, Ln0f;->B:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->C:Ljava/lang/String;

    iget-object v1, p1, Ln0f;->C:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->D:Ljava/lang/String;

    iget-object v1, p1, Ln0f;->D:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->E:Lm0f;

    iget-object v1, p1, Ln0f;->E:Lm0f;

    invoke-virtual {v0, v1}, Lm0f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Ln0f;->F:Lm0f;

    iget-object v1, p1, Ln0f;->F:Lm0f;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-boolean p0, p0, Ln0f;->G:Z

    iget-boolean p1, p1, Ln0f;->G:Z

    if-eq p0, p1, :cond_60

    :cond_5e
    const/4 p0, 0x0

    return p0

    :cond_60
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ln0f;->y:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ln0f;->z:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ln0f;->A:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Ln0f;->B:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ln0f;->C:Ljava/lang/String;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ln0f;->D:Ljava/lang/String;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ln0f;->E:Lm0f;

    invoke-virtual {v3}, Lm0f;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Ln0f;->F:Lm0f;

    if-eqz v0, :cond_4a

    invoke-virtual {v0}, Lm0f;->hashCode()I

    move-result v2

    :cond_4a
    add-int/2addr v3, v2

    mul-int/2addr v3, v1

    iget-boolean p0, p0, Ln0f;->G:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v3

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, ", title="

    const-string v1, ", message="

    const-string v2, "InApp(id="

    iget-object v3, p0, Ln0f;->y:Ljava/lang/String;

    iget-object v4, p0, Ln0f;->z:Ljava/lang/String;

    invoke-static {v2, v3, v0, v4, v1}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", image="

    const-string v2, ", bigImage="

    iget-object v3, p0, Ln0f;->A:Ljava/lang/String;

    iget-object v4, p0, Ln0f;->B:Ljava/lang/String;

    invoke-static {v0, v3, v1, v4, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", rewardMessage="

    const-string v2, ", primaryButton="

    iget-object v3, p0, Ln0f;->C:Ljava/lang/String;

    iget-object v4, p0, Ln0f;->D:Ljava/lang/String;

    invoke-static {v0, v3, v1, v4, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Ln0f;->E:Lm0f;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", secondaryButton="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ln0f;->F:Lm0f;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", fallbackToSystemNotification="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    iget-boolean p0, p0, Ln0f;->G:Z

    invoke-static {v0, p0, v1}, Lz1m;->m(Ljava/lang/StringBuilder;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
