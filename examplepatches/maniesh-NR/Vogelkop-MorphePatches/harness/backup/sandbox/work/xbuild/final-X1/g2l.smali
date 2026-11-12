.class public final Lg2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm2l;
.implements Lt2l;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:I

.field public final c:J


# direct methods
.method public constructor <init>(Ljava/util/List;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg2l;->a:Ljava/util/List;

    iput p2, p0, Lg2l;->b:I

    sget-object p1, Ldgm;->b:Lcgm;

    int-to-long p1, p2

    const-wide v0, 0xffffffffL

    and-long/2addr p1, v0

    sget-object v0, Ljgm;->b:Ligm;

    const-wide v0, 0x200000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lg2l;->c:J

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lg2l;->a:Ljava/util/List;

    return-object p0
.end method

.method public final b()La26;
    .registers 1

    sget-object p0, Lg4a;->p:Lg4a;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lg2l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lg2l;

    iget-object v1, p0, Lg2l;->a:Ljava/util/List;

    iget-object v3, p1, Lg2l;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget p0, p0, Lg2l;->b:I

    iget p1, p1, Lg2l;->b:I

    if-eq p0, p1, :cond_1e

    return v2

    :cond_1e
    return v0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lg2l;->c:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lg2l;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lg2l;->b:I

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
