.class public final Lqs1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Z

.field public final d:Z

.field public final e:J


# direct methods
.method public constructor <init>(IIZZJ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lqs1;->a:I

    iput p2, p0, Lqs1;->b:I

    iput-boolean p3, p0, Lqs1;->c:Z

    iput-boolean p4, p0, Lqs1;->d:Z

    iput-wide p5, p0, Lqs1;->e:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lqs1;

    if-eqz v0, :cond_28

    check-cast p1, Lqs1;

    iget v0, p0, Lqs1;->a:I

    iget v1, p1, Lqs1;->a:I

    if-ne v0, v1, :cond_28

    iget v0, p0, Lqs1;->b:I

    iget v1, p1, Lqs1;->b:I

    if-ne v0, v1, :cond_28

    iget-boolean v0, p0, Lqs1;->c:Z

    iget-boolean v1, p1, Lqs1;->c:Z

    if-ne v0, v1, :cond_28

    iget-boolean v0, p0, Lqs1;->d:Z

    iget-boolean v1, p1, Lqs1;->d:Z

    if-ne v0, v1, :cond_28

    iget-wide v0, p0, Lqs1;->e:J

    iget-wide p0, p1, Lqs1;->e:J

    cmp-long p0, v0, p0

    if-eqz p0, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lqs1;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lqs1;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Lqs1;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lqs1;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-wide v1, p0, Lqs1;->e:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
