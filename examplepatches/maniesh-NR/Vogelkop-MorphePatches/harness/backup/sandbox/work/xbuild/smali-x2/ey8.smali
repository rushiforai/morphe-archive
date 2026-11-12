.class public final Ley8;
.super Lzx8;
.source "SourceFile"


# instance fields
.field public final m:J

.field public n:D


# direct methods
.method public constructor <init>(Lmsh;)V
    .registers 4

    .line 30
    const-string v0, "impression"

    const/4 v1, 0x0

    .line 31
    invoke-direct {p0, p1, v0, v1}, Lzx8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 32
    iput-wide v0, p0, Ley8;->n:D

    .line 33
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Ley8;->m:J

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 7

    const-string v0, "impression"

    invoke-direct {p0, p1, v0}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Ley8;->n:D

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v2, "start_uptime"

    const-wide/16 v3, -0x1

    invoke-virtual {p1, v2, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Ley8;->m:J

    const-string v2, "duration"

    invoke-virtual {p1, v2, v0, v1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    iput-wide v0, p0, Ley8;->n:D

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 6

    invoke-super {p0, p1}, Lzx8;->a(Lorb;)V

    const-string v0, "start_uptime"

    iget-wide v1, p0, Ley8;->m:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    iget-wide v0, p0, Ley8;->n:D

    const-wide/16 v2, 0x0

    cmpl-double p0, v0, v2

    if-ltz p0, :cond_17

    const-string p0, "duration"

    invoke-virtual {p1, p0, v0, v1}, Lorb;->q(Ljava/lang/String;D)V

    :cond_17
    return-void
.end method
