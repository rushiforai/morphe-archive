.class public final Lyc6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:J

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIJZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p5, p0, Lyc6;->a:Z

    iput-wide p3, p0, Lyc6;->b:J

    iput p1, p0, Lyc6;->c:I

    iput p2, p0, Lyc6;->d:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lyc6;

    if-eqz v0, :cond_22

    check-cast p1, Lyc6;

    iget-boolean v0, p0, Lyc6;->a:Z

    iget-boolean v1, p1, Lyc6;->a:Z

    if-ne v0, v1, :cond_22

    iget-wide v0, p0, Lyc6;->b:J

    iget-wide v2, p1, Lyc6;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_22

    iget v0, p0, Lyc6;->c:I

    iget v1, p1, Lyc6;->c:I

    if-ne v0, v1, :cond_22

    iget p0, p0, Lyc6;->d:I

    iget p1, p1, Lyc6;->d:I

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-boolean v0, p0, Lyc6;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lyc6;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget v2, p0, Lyc6;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lyc6;->d:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
