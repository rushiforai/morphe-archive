.class public final Lkqc;
.super Ltc2;
.source "SourceFile"


# instance fields
.field public final b:J

.field public final c:Z


# direct methods
.method public constructor <init>(JZ)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ltc2;-><init>(Z)V

    iput-wide p1, p0, Lkqc;->b:J

    iput-boolean p3, p0, Lkqc;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lkqc;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lkqc;

    iget-wide v3, p0, Lkqc;->b:J

    iget-wide v5, p1, Lkqc;->b:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_15

    return v2

    :cond_15
    iget-boolean p0, p0, Lkqc;->c:Z

    iget-boolean p1, p1, Lkqc;->c:Z

    if-eq p0, p1, :cond_1c

    return v2

    :cond_1c
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lkqc;->b:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lkqc;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
