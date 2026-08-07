.class public Lcom/momo/xeengine/gift/GiftProgress;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private currentTime:D

.field private totalTime:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-wide p1, p0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 13
    iput-wide p3, p0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D

    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftProgress;
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/xeengine/gift/GiftProgress;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/gift/GiftProgress;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-wide/16 v1, 0x0

    .line 20
    .line 21
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v3, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "currentTime"

    .line 27
    .line 28
    invoke-virtual {v3, p0, v1, v2}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 29
    .line 30
    .line 31
    move-result-wide v4

    .line 32
    iput-wide v4, v0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 33
    .line 34
    const-string p0, "totalTime"

    .line 35
    .line 36
    invoke-virtual {v3, p0, v1, v2}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    iput-wide v3, v0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    return-object v0

    .line 43
    :catch_0
    iput-wide v1, v0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 44
    .line 45
    iput-wide v1, v0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D

    .line 46
    .line 47
    :cond_1
    :goto_0
    return-object v0
.end method


# virtual methods
.method public getCurrentTime()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTotalTime()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public setCurrentTime(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 2
    .line 3
    return-void
.end method

.method public setTotalTime(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GiftProgress{currentTime="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/momo/xeengine/gift/GiftProgress;->currentTime:D

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", totalTime="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/momo/xeengine/gift/GiftProgress;->totalTime:D

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
