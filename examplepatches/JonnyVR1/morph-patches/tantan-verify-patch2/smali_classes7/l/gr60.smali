.class public Ll/gr60;
.super Ll/xrq0;
.source "SourceFile"


# instance fields
.field public h:I

.field public i:J

.field public j:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/xrq0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/gr60;->i:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/gr60;->j:J

    .line 9
    .line 10
    return-void
.end method

.method public static e()Ll/gr60;
    .locals 1

    .line 1
    new-instance v0, Ll/gr60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gr60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public c()Lorg/json/JSONObject;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/xrq0;->c()Lorg/json/JSONObject;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string v2, "code"

    .line 10
    .line 11
    iget v3, p0, Ll/gr60;->h:I

    .line 12
    .line 13
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string v2, "perfCounts"

    .line 17
    .line 18
    iget-wide v3, p0, Ll/gr60;->i:J

    .line 19
    .line 20
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string v2, "perfLatencies"

    .line 24
    .line 25
    iget-wide v3, p0, Ll/gr60;->j:J

    .line 26
    .line 27
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-object v1

    .line 31
    :catch_0
    move-exception p0

    .line 32
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/xrq0;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
