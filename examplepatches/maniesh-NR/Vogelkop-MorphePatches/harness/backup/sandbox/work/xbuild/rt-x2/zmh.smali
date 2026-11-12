.class public final Lzmh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsmh;


# instance fields
.field public final a:Lenh;

.field public final b:J


# direct methods
.method public constructor <init>(Lenh;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzmh;->a:Lenh;

    iget p1, p1, Lenh;->c:I

    sget-object v0, Ldgm;->b:Lcgm;

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    iput-wide v0, p0, Lzmh;->b:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lzmh;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lzmh;

    iget-object p0, p0, Lzmh;->a:Lenh;

    iget-object p1, p1, Lzmh;->a:Lenh;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    return v2

    :cond_17
    return v0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lzmh;->b:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lzmh;->a:Lenh;

    invoke-virtual {p0}, Lenh;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
