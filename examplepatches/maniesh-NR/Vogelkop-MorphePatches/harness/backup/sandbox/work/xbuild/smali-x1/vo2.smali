.class public final Lvo2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lvtk;


# direct methods
.method public constructor <init>(Lvtk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvo2;->a:Lvtk;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lvo2;

    const/4 v2, 0x0

    if-eqz v1, :cond_13

    check-cast p1, Lvo2;

    iget-object p0, p0, Lvo2;->a:Lvtk;

    iget-object p1, p1, Lvo2;->a:Lvtk;

    if-eq p0, p1, :cond_12

    return v2

    :cond_12
    return v0

    :cond_13
    return v2
.end method

.method public final hashCode()I
    .registers 2

    iget-object p0, p0, Lvo2;->a:Lvtk;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    const v0, -0x2aff6277

    xor-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Event{eventCode=0, surfaceOutput="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lvo2;->a:Lvtk;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
