.class public final Lrkm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:J

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lrkm;->a:Ljava/lang/String;

    iput-wide p1, p0, Lrkm;->b:J

    iput-wide p3, p0, Lrkm;->c:J

    iput-object p6, p0, Lrkm;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_2e

    instance-of v0, p1, Lrkm;

    if-eqz v0, :cond_2c

    check-cast p1, Lrkm;

    iget-object v0, p0, Lrkm;->a:Ljava/lang/String;

    iget-object v1, p1, Lrkm;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-wide v0, p0, Lrkm;->b:J

    iget-wide v2, p1, Lrkm;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2c

    iget-wide v0, p0, Lrkm;->c:J

    iget-wide v2, p1, Lrkm;->c:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2c

    iget-object p0, p0, Lrkm;->d:Ljava/lang/String;

    iget-object p1, p1, Lrkm;->d:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    :cond_2c
    const/4 p0, 0x0

    return p0

    :cond_2e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lrkm;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lrkm;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lrkm;->c:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Lrkm;->d:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
