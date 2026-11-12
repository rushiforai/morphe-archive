.class public final Lju4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lju4;->a:J

    return-void
.end method

.method public static a(JLjava/lang/Object;)Z
    .registers 7

    instance-of v0, p2, Lju4;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p2, Lju4;

    iget-wide v2, p2, Lju4;->a:J

    cmp-long p0, p0, v2

    if-eqz p0, :cond_f

    return v1

    :cond_f
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-wide v0, p0, Lju4;->a:J

    invoke-static {v0, v1, p1}, Lju4;->a(JLjava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lju4;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    const-string v0, "ChatId(raw="

    const-string v1, ")"

    iget-wide v2, p0, Lju4;->a:J

    invoke-static {v2, v3, v0, v1}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
