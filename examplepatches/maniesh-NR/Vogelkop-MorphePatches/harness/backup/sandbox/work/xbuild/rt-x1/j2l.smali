.class public final Lj2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm2l;


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public constructor <init>(I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lj2l;->a:I

    sget-object v0, Ldgm;->b:Lcgm;

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    sget-object p1, Ljgm;->b:Ligm;

    const-wide v2, 0x4000000000L

    or-long/2addr v0, v2

    iput-wide v0, p0, Lj2l;->b:J

    return-void
.end method


# virtual methods
.method public final b()La26;
    .registers 1

    sget-object p0, Lg4a;->o:Lg4a;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lj2l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lj2l;

    iget p0, p0, Lj2l;->a:I

    iget p1, p1, Lj2l;->a:I

    if-eq p0, p1, :cond_13

    return v2

    :cond_13
    return v0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lj2l;->b:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 1

    iget p0, p0, Lj2l;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
