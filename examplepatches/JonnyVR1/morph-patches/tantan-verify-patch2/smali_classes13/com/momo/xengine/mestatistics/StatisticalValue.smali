.class public Lcom/momo/xengine/mestatistics/StatisticalValue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private extend:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final type:Lcom/momo/xengine/mestatistics/ReportType;

.field private final value:J


# direct methods
.method public constructor <init>(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->extend:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->name:Ljava/lang/String;

    .line 8
    .line 9
    iput-wide p3, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->value:J

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->type:Lcom/momo/xengine/mestatistics/ReportType;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getExtend()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->extend:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setExtend(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->extend:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "type"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->type:Lcom/momo/xengine/mestatistics/ReportType;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/momo/xengine/mestatistics/ReportType;->getValue()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    const-string v1, "name"

    .line 18
    .line 19
    iget-object v2, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v1, "value"

    .line 25
    .line 26
    iget-wide v2, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->value:J

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/StatisticalValue;->extend:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const-string v1, "extend"

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :cond_0
    return-object v0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method
