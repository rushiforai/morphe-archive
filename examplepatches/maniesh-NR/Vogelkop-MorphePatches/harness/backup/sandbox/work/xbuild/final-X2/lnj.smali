.class public final Llnj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lmnj;

.field public final b:J


# direct methods
.method public constructor <init>(Lmnj;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llnj;->a:Lmnj;

    iput-wide p2, p0, Llnj;->b:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_18

    instance-of v0, p1, Llnj;

    if-eqz v0, :cond_16

    check-cast p1, Llnj;

    iget-object v0, p0, Llnj;->a:Lmnj;

    iget-object v1, p1, Llnj;->a:Lmnj;

    if-ne v0, v1, :cond_16

    iget-wide v0, p0, Llnj;->b:J

    iget-wide p0, p1, Llnj;->b:J

    cmp-long p0, v0, p0

    if-eqz p0, :cond_18

    :cond_16
    const/4 p0, 0x0

    return p0

    :cond_18
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Llnj;->a:Lmnj;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Llnj;->b:J

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
