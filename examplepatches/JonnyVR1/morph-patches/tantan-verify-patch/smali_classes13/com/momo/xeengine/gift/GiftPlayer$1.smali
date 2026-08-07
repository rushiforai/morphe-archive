.class Lcom/momo/xeengine/gift/GiftPlayer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/GameDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/GiftPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/gift/GiftPlayer;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftView;->stop()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1200(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/gift/GiftPlayer$1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, p0, v1}, Lcom/momo/xeengine/gift/VideoGiftProgressListener;->onVideoGiftStopPlaying(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;Lcom/momo/xeengine/gift/GiftPlayerEventListener;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xeengine/gift/GiftPlayerEvent;

    .line 5
    .line 6
    sget-object v1, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->Goto:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Lcom/momo/xeengine/gift/GiftPlayerEvent;-><init>(Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 12
    .line 13
    invoke-interface {p2, p0, v0}, Lcom/momo/xeengine/gift/GiftPlayerEventListener;->onReceiveEvent(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftPlayerEvent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic d(Lcom/momo/xeengine/gift/GiftPlayer$1;ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xeengine/gift/GiftPlayerEvent;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->fromValue(I)Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {v0, p1, p2}, Lcom/momo/xeengine/gift/GiftPlayerEvent;-><init>(Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$300(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 20
    .line 21
    invoke-interface {p1, p0, v0}, Lcom/momo/xeengine/gift/GiftPlayerEventListener;->onReceiveEvent(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftPlayerEvent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e(Lcom/momo/xeengine/gift/GiftPlayer$1;Lcom/momo/xeengine/gift/GiftProgress;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftProgress;->getCurrentTime()D

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftProgress;->getTotalTime()D

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    invoke-interface/range {v1 .. v7}, Lcom/momo/xeengine/gift/VideoGiftProgressListener;->onVideoGiftProgressUpdate(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;DD)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$000(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1000(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->stop()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftView;->stop()V

    .line 24
    .line 25
    .line 26
    :goto_0
    const/16 v0, 0x190

    .line 27
    .line 28
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p1, "ec"

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const-string p1, "em"

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    goto :goto_1

    .line 46
    :catch_0
    const-string p1, "Unknown error"

    .line 47
    .line 48
    :goto_1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 49
    .line 50
    invoke-static {p0, v0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1100(Lcom/momo/xeengine/gift/GiftPlayer;ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic g(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$000(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftView;->clearValidTouchAreas()V

    .line 26
    .line 27
    .line 28
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p1, "areas"

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-ge v0, v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "left"

    .line 53
    .line 54
    const-wide/16 v3, 0x0

    .line 55
    .line 56
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 57
    .line 58
    .line 59
    move-result-wide v5

    .line 60
    double-to-float v2, v5

    .line 61
    const-string v5, "top"

    .line 62
    .line 63
    invoke-virtual {v1, v5, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 64
    .line 65
    .line 66
    move-result-wide v5

    .line 67
    double-to-float v5, v5

    .line 68
    const-string v6, "right"

    .line 69
    .line 70
    invoke-virtual {v1, v6, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 71
    .line 72
    .line 73
    move-result-wide v6

    .line 74
    double-to-float v6, v6

    .line 75
    const-string v7, "bottom"

    .line 76
    .line 77
    invoke-virtual {v1, v7, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 78
    .line 79
    .line 80
    move-result-wide v3

    .line 81
    double-to-float v1, v3

    .line 82
    iget-object v3, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 83
    .line 84
    invoke-static {v3}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    new-instance v4, Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-direct {v4, v2, v5, v6, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, v4}, Lcom/momo/xeengine/gift/GiftView;->addValidTouchArea(Landroid/graphics/RectF;)V

    .line 94
    .line 95
    .line 96
    add-int/lit8 v0, v0, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :catch_0
    move-exception p1

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$700(Lcom/momo/xeengine/gift/GiftPlayer;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :goto_1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 108
    .line 109
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$700(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_2

    .line 114
    .line 115
    new-instance p0, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v0, "setValidTouchAreas parse error: "

    .line 118
    .line 119
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const-string p1, "[XENGINE]"

    .line 134
    .line 135
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    :cond_2
    :goto_2
    return-void
.end method

.method public static synthetic h(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1000(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->stop()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1200(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic i(Lcom/momo/xeengine/gift/GiftPlayer$1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, p0, v1}, Lcom/momo/xeengine/gift/VideoGiftProgressListener;->onVideoGiftStartPlaying(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method


# virtual methods
.method public getGameExtendParams(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$400(Lcom/momo/xeengine/gift/GiftPlayer;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "sys_mute"

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$500(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string v0, "sys_volume"

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$600(Lcom/momo/xeengine/gift/GiftPlayer;)F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    float-to-double v1, v1

    .line 32
    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    return-object p0

    .line 41
    :catch_0
    move-exception p1

    .line 42
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$700(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    :cond_0
    const/4 p0, 0x0

    .line 54
    return-object p0
.end method

.method public onGameError(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/gift/k;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/gift/k;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onGameFinished(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$000(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/momo/xeengine/gift/g;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/gift/g;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Lcom/momo/xeengine/gift/h;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/gift/h;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onGotoEvent(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$300(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 18
    .line 19
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Lcom/momo/xeengine/gift/m;

    .line 24
    .line 25
    invoke-direct {v3, p0, p1, v0}, Lcom/momo/xeengine/gift/m;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;Lcom/momo/xeengine/gift/GiftPlayerEventListener;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-object v1
.end method

.method public onReceivedEvent(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p1, "ec"

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const-string v3, "em"

    .line 34
    .line 35
    const-string v4, ""

    .line 36
    .line 37
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    sget-object v3, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->Downgrade:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->getValue()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-ne p1, v3, :cond_1

    .line 48
    .line 49
    const-string v3, "3"

    .line 50
    .line 51
    invoke-static {v0, v3, v2, v1}, Lcom/momo/xeengine/gift/GiftLogEvent;->createEvent(Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;ILjava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {}, Lcom/momo/xeengine/gift/GiftLogUploader;->getInstance()Lcom/momo/xeengine/gift/GiftLogUploader;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2, v0}, Lcom/momo/xeengine/gift/GiftLogUploader;->addEvent(Lcom/momo/xeengine/gift/GiftLogEvent;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$300(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v2, Lcom/momo/xeengine/gift/f;

    .line 77
    .line 78
    invoke-direct {v2, p0, p1, v1}, Lcom/momo/xeengine/gift/f;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 82
    .line 83
    .line 84
    :catch_0
    :cond_2
    return-void
.end method

.method public onVideoProgress(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftProgress;->fromJson(Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftProgress;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/momo/xeengine/gift/l;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/gift/l;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Lcom/momo/xeengine/gift/GiftProgress;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public onVideoStart(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Lcom/momo/xeengine/gift/j;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/momo/xeengine/gift/j;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public onVideoStop(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Lcom/momo/xeengine/gift/i;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/momo/xeengine/gift/i;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public setValidTouchAreas(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$1;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/gift/e;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/gift/e;-><init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method
