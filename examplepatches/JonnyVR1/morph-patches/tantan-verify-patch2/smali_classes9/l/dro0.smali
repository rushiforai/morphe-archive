.class public Ll/dro0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/dro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dro0;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;)V

    return-void
.end method


# virtual methods
.method public final synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "reportType"

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->reportType:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "roomType"

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->roomType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string p1, "voiceLiveId"

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    const-string p1, "roomId"

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    :catch_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o6(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o6(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p0
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->k6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->delaySecond:I

    .line 15
    .line 16
    int-to-long v1, v1

    .line 17
    new-instance v3, Ll/cro0;

    .line 18
    .line 19
    invoke-direct {v3, p0, v0}, Ll/cro0;-><init>(Ll/dro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 23
    .line 24
    invoke-virtual {p0, v1, v2, v0, v3}, Ll/i6t;->B3(JLjava/util/concurrent/TimeUnit;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
