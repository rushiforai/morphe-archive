.class public final Lpoc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljnc;

.field public final c:J


# direct methods
.method public constructor <init>(JLjnc;J)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lpoc;->a:J

    iput-object p3, p0, Lpoc;->b:Ljnc;

    iput-wide p4, p0, Lpoc;->c:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lpoc;

    if-eqz v0, :cond_1e

    check-cast p1, Lpoc;

    iget-wide v0, p0, Lpoc;->a:J

    iget-wide v2, p1, Lpoc;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1e

    iget-object v0, p0, Lpoc;->b:Ljnc;

    iget-object v1, p1, Lpoc;->b:Ljnc;

    if-ne v0, v1, :cond_1e

    iget-wide v0, p0, Lpoc;->c:J

    iget-wide p0, p1, Lpoc;->c:J

    cmp-long p0, v0, p0

    if-eqz p0, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lpoc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lpoc;->b:Ljnc;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-wide v2, p0, Lpoc;->c:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
