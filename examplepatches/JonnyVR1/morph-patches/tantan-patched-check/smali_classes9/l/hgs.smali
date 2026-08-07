.class public Ll/hgs;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "live"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->scenario:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->roomId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->liveId:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->anchorId:Ljava/lang/String;

    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->giftId:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->tradeNo:Ljava/lang/String;

    .line 32
    .line 33
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p2, "url"

    .line 9
    .line 10
    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 14
    :try_start_1
    const-string v2, "params"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 20
    :try_start_2
    new-instance v2, Lorg/json/JSONObject;

    .line 21
    .line 22
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string v3, "gameInfoExt"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 31
    goto :goto_1

    .line 32
    :catch_0
    move-exception v2

    .line 33
    goto :goto_0

    .line 34
    :catch_1
    move-exception v2

    .line 35
    move-object v1, v0

    .line 36
    goto :goto_0

    .line 37
    :catch_2
    move-exception v2

    .line 38
    move-object p2, v0

    .line 39
    move-object v1, p2

    .line 40
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :goto_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    :cond_0
    const-string v1, "\u4e0a\u62a5\u7684 url \u6216\u8005\u53c2\u6570 params \u4e3a\u7a7a\u4e86\u3002 \u9519\u8bef"

    .line 56
    .line 57
    invoke-static {v1}, Ll/clj;->o(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0, p1}, Ll/hgs;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;->gameInfoExt:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p2, p0}, Ll/aiv;->u1(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGameInfoReq;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method
