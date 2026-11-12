.class public final Lry8;
.super Lzx8;
.source "SourceFile"


# instance fields
.field public final m:J

.field public final n:J

.field public final o:F


# direct methods
.method public constructor <init>(Lmsh;JJF)V
    .registers 9

    .line 33
    const-string v0, "stay"

    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, p1, v0, v1}, Lzx8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    iput-wide p2, p0, Lry8;->m:J

    .line 36
    iput-wide p4, p0, Lry8;->n:J

    .line 37
    iput p6, p0, Lry8;->o:F

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 4

    const-string v0, "stay"

    invoke-direct {p0, p1, v0}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v0, "start_ts"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lry8;->m:J

    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lry8;->n:J

    const-string v0, "percent"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    double-to-float p1, v0

    iput p1, p0, Lry8;->o:F

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 5

    invoke-super {p0, p1}, Lzx8;->a(Lorb;)V

    const-string v0, "start_ts"

    iget-wide v1, p0, Lry8;->m:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "duration"

    iget-wide v1, p0, Lry8;->n:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    iget p0, p0, Lry8;->o:F

    float-to-double v0, p0

    const-string p0, "percent"

    invoke-virtual {p1, p0, v0, v1}, Lorb;->q(Ljava/lang/String;D)V

    return-void
.end method
