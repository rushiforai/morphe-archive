.class public final Ljth;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:Ljava/lang/Long;

.field public final d:Lorb;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/Long;Lorb;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljth;->a:Ljava/lang/String;

    iput-wide p2, p0, Ljth;->b:J

    iput-object p4, p0, Ljth;->c:Ljava/lang/Long;

    iput-object p5, p0, Ljth;->d:Lorb;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_30

    instance-of v0, p1, Ljth;

    if-eqz v0, :cond_2e

    check-cast p1, Ljth;

    iget-object v0, p0, Ljth;->a:Ljava/lang/String;

    iget-object v1, p1, Ljth;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-wide v0, p0, Ljth;->b:J

    iget-wide v2, p1, Ljth;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2e

    iget-object v0, p0, Ljth;->c:Ljava/lang/Long;

    iget-object v1, p1, Ljth;->c:Ljava/lang/Long;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object p0, p0, Ljth;->d:Lorb;

    iget-object p1, p1, Ljth;->d:Lorb;

    invoke-virtual {p0, p1}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30

    :cond_2e
    const/4 p0, 0x0

    return p0

    :cond_30
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ljth;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Ljth;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v2, p0, Ljth;->c:Ljava/lang/Long;

    if-nez v2, :cond_15

    const/4 v2, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_19
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Ljth;->d:Lorb;

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

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
