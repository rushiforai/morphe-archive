.class public final Lkpc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lapc;


# direct methods
.method public constructor <init>(JLapc;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lkpc;->a:J

    iput-object p3, p0, Lkpc;->b:Lapc;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_18

    instance-of v0, p1, Lkpc;

    if-eqz v0, :cond_16

    check-cast p1, Lkpc;

    iget-wide v0, p0, Lkpc;->a:J

    iget-wide v2, p1, Lkpc;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_16

    iget-object p0, p0, Lkpc;->b:Lapc;

    iget-object p1, p1, Lkpc;->b:Lapc;

    if-eq p0, p1, :cond_18

    :cond_16
    const/4 p0, 0x0

    return p0

    :cond_18
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lkpc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lkpc;->b:Lapc;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
