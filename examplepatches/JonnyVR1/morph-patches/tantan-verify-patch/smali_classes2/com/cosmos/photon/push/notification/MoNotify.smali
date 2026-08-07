.class public Lcom/cosmos/photon/push/notification/MoNotify;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final INTENT_ACTION_FCM_POSTFIX:Ljava/lang/String; = "end"

.field private static final INTENT_ACTION_FCM_PREFIX:Ljava/lang/String; = "#Intent"

.field private static final INTENT_ACTION_FCM_PUSHTYPE:Ljava/lang/String; = "i.pushType=105"

.field private static final serialVersionUID:J = -0x5693f63b667da034L


# instance fields
.field public action:Ljava/lang/String;

.field public actionType:I

.field public autoCancel:Z

.field public backgroundShow:I

.field public channelId:Ljava/lang/String;

.field public data:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public dataMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public desc:Ljava/lang/String;

.field public fromFcm:Z

.field public icon:Ljava/lang/String;

.field public id:Ljava/lang/String;

.field public light:I

.field public logType:I

.field public multi:I

.field public popNotify:Z

.field public showExpire:J

.field public showTime:J

.field public sound:I

.field public soundType:Ljava/lang/String;

.field public time:J

.field public title:Ljava/lang/String;

.field public toPkg:Ljava/lang/String;

.field public type:Ljava/lang/String;

.field public vibrate:I


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

.method private static assembleNotifyInfo(Lcom/cosmos/photon/push/notification/MoNotify;Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getTitle()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getDesc()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getAction()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getActionType()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getIcon()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getSound()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->sound:I

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getSoundType()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->soundType:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getVibrate()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->vibrate:I

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getLight()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->light:I

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getBackgroundShow()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->backgroundShow:I

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getDataMap()Ljava/util/Map;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    if-nez v0, :cond_0

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getDataMap()Ljava/util/Map;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getShowTime()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    iput-wide v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getShowExpire()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    iput-wide v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showExpire:J

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getPopNotify()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-boolean v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->popNotify:Z

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/immomo/push/pb/NotifyInfo;->getAutoCancel()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iput-boolean p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->autoCancel:Z

    .line 109
    .line 110
    iget-object p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 111
    .line 112
    if-eqz p1, :cond_2

    .line 113
    .line 114
    const-string v0, "ext_d"

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_1

    .line 127
    .line 128
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 129
    .line 130
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    const-string p1, "ci"

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->channelId:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :catch_0
    move-exception p1

    .line 143
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 144
    .line 145
    .line 146
    :cond_1
    :goto_1
    :try_start_1
    iget-object p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 147
    .line 148
    const-string v0, "ins_log"

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    iput p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 161
    .line 162
    :catch_1
    :try_start_2
    iget-object p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 163
    .line 164
    const-string v0, "multi"

    .line 165
    .line 166
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    iput p1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->multi:I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 177
    .line 178
    :catch_2
    :cond_2
    return-void
.end method

.method public static create(Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;)Lcom/cosmos/photon/push/notification/MoNotify;
    .locals 5

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/notification/MoNotify;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/push/notification/MoNotify;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->title:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->body:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->imageUrl:Landroid/net/Uri;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->channelId:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->channelId:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->clickAction:Ljava/lang/String;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    iput v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v3, 0x2

    .line 38
    iput v3, v0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 39
    .line 40
    const-string v3, "action=%s"

    .line 41
    .line 42
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    iput-boolean v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->fromFcm:Z

    .line 51
    .line 52
    iget-object v3, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->tag:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v3, v0, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 57
    .line 58
    const-string v4, "i.pushType=105"

    .line 59
    .line 60
    filled-new-array {v4}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-static {v3, v4}, Lcom/cosmos/photon/push/notification/MoNotify;->handleAction(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iput-object v3, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 69
    .line 70
    filled-new-array {v1}, [Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {v3, v1}, Lcom/cosmos/photon/push/notification/MoNotify;->handleAction(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->sound:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_2

    .line 87
    .line 88
    iput v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->sound:I

    .line 89
    .line 90
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->sound:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->soundType:Ljava/lang/String;

    .line 93
    .line 94
    :cond_2
    iget-object v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->dataMap:Ljava/util/Map;

    .line 95
    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    move-object v3, v1

    .line 99
    check-cast v3, Ljava/util/HashMap;

    .line 100
    .line 101
    iput-object v3, v0, Lcom/cosmos/photon/push/notification/MoNotify;->dataMap:Ljava/util/HashMap;

    .line 102
    .line 103
    const-string v3, "_ext"

    .line 104
    .line 105
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1}, Lcom/cosmos/photon/push/notification/MoNotify;->getMapForJson(Ljava/lang/String;)Ljava/util/HashMap;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 116
    .line 117
    iget-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v4, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->dataMap:Ljava/util/Map;

    .line 120
    .line 121
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    const-string v4, "S._ext=%s"

    .line 130
    .line 131
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    filled-new-array {v3}, [Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-static {v1, v3}, Lcom/cosmos/photon/push/notification/MoNotify;->handleAction(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 146
    .line 147
    if-eqz v1, :cond_3

    .line 148
    .line 149
    :try_start_0
    const-string v3, "ins_log"

    .line 150
    .line 151
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    check-cast v1, Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    iput v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->insLog:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :catch_0
    move-exception v1

    .line 169
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 170
    .line 171
    .line 172
    :cond_3
    :goto_1
    iget v1, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->insLog:I

    .line 173
    .line 174
    iput v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 175
    .line 176
    :try_start_1
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;->dataMap:Ljava/util/Map;

    .line 177
    .line 178
    const-string v1, "showOnlyBackStage"

    .line 179
    .line 180
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    check-cast p0, Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->backgroundShow:I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 195
    .line 196
    :catch_1
    :cond_4
    iput-boolean v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->autoCancel:Z

    .line 197
    .line 198
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-eqz p0, :cond_5

    .line 205
    .line 206
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 211
    .line 212
    :cond_5
    iget-wide v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 213
    .line 214
    const-wide/16 v3, 0x0

    .line 215
    .line 216
    cmp-long p0, v1, v3

    .line 217
    .line 218
    if-nez p0, :cond_6

    .line 219
    .line 220
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 221
    .line 222
    .line 223
    move-result-wide v1

    .line 224
    iput-wide v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 225
    .line 226
    :cond_6
    return-object v0
.end method

.method public static create(Lcom/immomo/push/pb/Notify;)Lcom/cosmos/photon/push/notification/MoNotify;
    .locals 3

    .line 233
    new-instance v0, Lcom/cosmos/photon/push/notification/MoNotify;

    invoke-direct {v0}, Lcom/cosmos/photon/push/notification/MoNotify;-><init>()V

    .line 234
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 235
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getToPkg()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 236
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 237
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getInfo()Lcom/immomo/push/pb/NotifyInfo;

    move-result-object p0

    .line 238
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/notification/MoNotify;->assembleNotifyInfo(Lcom/cosmos/photon/push/notification/MoNotify;Lcom/immomo/push/pb/NotifyInfo;)V

    return-object v0
.end method

.method public static create(Lcom/immomo/push/pb/NotifyV2;)Lcom/cosmos/photon/push/notification/MoNotify;
    .locals 3

    .line 227
    new-instance v0, Lcom/cosmos/photon/push/notification/MoNotify;

    invoke-direct {v0}, Lcom/cosmos/photon/push/notification/MoNotify;-><init>()V

    .line 228
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyV2;->getId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 229
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyV2;->getToPkg()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 230
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyV2;->getTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 231
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyV2;->getInfo()Lcom/immomo/push/pb/NotifyInfo;

    move-result-object p0

    .line 232
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/notification/MoNotify;->assembleNotifyInfo(Lcom/cosmos/photon/push/notification/MoNotify;Lcom/immomo/push/pb/NotifyInfo;)V

    return-object v0
.end method

.method public static fromJson(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/MoNotify;
    .locals 6

    .line 1
    :try_start_0
    new-instance v0, Lcom/cosmos/photon/push/notification/MoNotify;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/push/notification/MoNotify;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "id"

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string p0, "tpg"

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 26
    .line 27
    const-string p0, "type"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 34
    .line 35
    const-string p0, "title"

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    .line 42
    .line 43
    const-string p0, "desc"

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    .line 50
    .line 51
    const-string p0, "action"

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 58
    .line 59
    const-string p0, "at"

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 66
    .line 67
    const-string p0, "icon"

    .line 68
    .line 69
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    .line 74
    .line 75
    const-string p0, "sound"

    .line 76
    .line 77
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->sound:I

    .line 82
    .line 83
    const-string p0, "st"

    .line 84
    .line 85
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->soundType:Ljava/lang/String;

    .line 90
    .line 91
    const-string p0, "bs"

    .line 92
    .line 93
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->backgroundShow:I

    .line 98
    .line 99
    const-string p0, "vibrate"

    .line 100
    .line 101
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->vibrate:I

    .line 106
    .line 107
    const-string p0, "light"

    .line 108
    .line 109
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->light:I

    .line 114
    .line 115
    const-string p0, "time"

    .line 116
    .line 117
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 118
    .line 119
    .line 120
    move-result-wide v2

    .line 121
    iput-wide v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 122
    .line 123
    const-string p0, "d"

    .line 124
    .line 125
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    new-instance v2, Ljava/util/HashMap;

    .line 130
    .line 131
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 132
    .line 133
    .line 134
    if-eqz p0, :cond_0

    .line 135
    .line 136
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    if-eqz v4, :cond_0

    .line 145
    .line 146
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    check-cast v4, Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_0
    iput-object v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 161
    .line 162
    const-string p0, "showTime"

    .line 163
    .line 164
    const-wide/16 v2, 0x0

    .line 165
    .line 166
    invoke-virtual {v1, p0, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 167
    .line 168
    .line 169
    move-result-wide v4

    .line 170
    iput-wide v4, v0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 171
    .line 172
    const-string p0, "showExpire"

    .line 173
    .line 174
    invoke-virtual {v1, p0, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 175
    .line 176
    .line 177
    move-result-wide v2

    .line 178
    iput-wide v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->showExpire:J

    .line 179
    .line 180
    const-string p0, "popNotify"

    .line 181
    .line 182
    const/4 v2, 0x0

    .line 183
    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    iput-boolean p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->popNotify:Z

    .line 188
    .line 189
    const-string p0, "autoCancel"

    .line 190
    .line 191
    const/4 v3, 0x1

    .line 192
    invoke-virtual {v1, p0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    iput-boolean p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->autoCancel:Z

    .line 197
    .line 198
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 199
    .line 200
    if-eqz p0, :cond_1

    .line 201
    .line 202
    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    .line 203
    .line 204
    .line 205
    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_4

    .line 206
    if-eqz p0, :cond_3

    .line 207
    .line 208
    :cond_1
    :try_start_1
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {p0, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    const-string v1, "_ext"

    .line 215
    .line 216
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_3

    .line 225
    .line 226
    new-instance v1, Lorg/json/JSONObject;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 232
    .line 233
    if-nez p0, :cond_2

    .line 234
    .line 235
    new-instance p0, Ljava/util/HashMap;

    .line 236
    .line 237
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 238
    .line 239
    .line 240
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 241
    .line 242
    goto :goto_1

    .line 243
    :catch_0
    move-exception p0

    .line 244
    goto :goto_3

    .line 245
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-eqz v2, :cond_3

    .line 254
    .line 255
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    check-cast v2, Ljava/lang/String;

    .line 260
    .line 261
    iget-object v3, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 262
    .line 263
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 268
    .line 269
    .line 270
    goto :goto_2

    .line 271
    :goto_3
    :try_start_2
    const-string v1, "MOMOIM_PUSH"

    .line 272
    .line 273
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 274
    .line 275
    .line 276
    :cond_3
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 277
    .line 278
    if-eqz p0, :cond_5

    .line 279
    .line 280
    const-string v1, "ext_d"

    .line 281
    .line 282
    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    check-cast p0, Ljava/lang/String;

    .line 287
    .line 288
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v1
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_4

    .line 292
    if-nez v1, :cond_4

    .line 293
    .line 294
    :try_start_3
    new-instance v1, Lorg/json/JSONObject;

    .line 295
    .line 296
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    const-string p0, "ci"

    .line 300
    .line 301
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    iput-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->channelId:Ljava/lang/String;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 306
    .line 307
    goto :goto_4

    .line 308
    :catch_1
    move-exception p0

    .line 309
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 310
    .line 311
    .line 312
    :cond_4
    :goto_4
    :try_start_5
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 313
    .line 314
    const-string v1, "ins_log"

    .line 315
    .line 316
    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object p0

    .line 320
    check-cast p0, Ljava/lang/String;

    .line 321
    .line 322
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 323
    .line 324
    .line 325
    move-result p0

    .line 326
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_4

    .line 327
    .line 328
    :catch_2
    :try_start_6
    iget-object p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 329
    .line 330
    const-string v1, "multi"

    .line 331
    .line 332
    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object p0

    .line 336
    check-cast p0, Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 339
    .line 340
    .line 341
    move-result p0

    .line 342
    iput p0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->multi:I
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_4

    .line 343
    .line 344
    :catch_3
    :cond_5
    return-object v0

    .line 345
    :catch_4
    const/4 p0, 0x0

    .line 346
    return-object p0
.end method

.method public static getMapForJson(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v1, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object v1

    .line 40
    :catch_0
    move-exception p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method private static varargs handleAction(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_2

    .line 7
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "end"

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, ";%s"

    .line 18
    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "#Intent"

    .line 32
    .line 33
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v3, "%s;"

    .line 38
    .line 39
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v0, "#Intent;"

    .line 50
    .line 51
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    const-string v3, ";"

    .line 59
    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    :cond_2
    array-length v0, p1

    .line 69
    const/4 v2, 0x0

    .line 70
    :goto_0
    if-ge v2, v0, :cond_4

    .line 71
    .line 72
    aget-object v4, p1, v2

    .line 73
    .line 74
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v5, :cond_3

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    :cond_5
    :goto_2
    return-object p0
.end method


# virtual methods
.method public toJson()Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    const-string v2, "id"

    .line 9
    .line 10
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v2, "tpg"

    .line 16
    .line 17
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    const-string v2, "type"

    .line 23
    .line 24
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    const-string v2, "title"

    .line 30
    .line 31
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    const-string v2, "desc"

    .line 37
    .line 38
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    const-string v2, "action"

    .line 44
    .line 45
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    const-string v2, "at"

    .line 51
    .line 52
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 53
    .line 54
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 55
    .line 56
    .line 57
    const-string v2, "icon"

    .line 58
    .line 59
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    const-string v2, "sound"

    .line 65
    .line 66
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->sound:I

    .line 67
    .line 68
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    const-string v2, "st"

    .line 72
    .line 73
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->soundType:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    const-string v2, "bs"

    .line 79
    .line 80
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->backgroundShow:I

    .line 81
    .line 82
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 83
    .line 84
    .line 85
    const-string v2, "vibrate"

    .line 86
    .line 87
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->vibrate:I

    .line 88
    .line 89
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    const-string v2, "light"

    .line 93
    .line 94
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->light:I

    .line 95
    .line 96
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    const-string v2, "time"

    .line 100
    .line 101
    iget-wide v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 102
    .line 103
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 107
    .line 108
    if-nez v2, :cond_0

    .line 109
    .line 110
    new-instance v2, Ljava/util/HashMap;

    .line 111
    .line 112
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 116
    .line 117
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->channelId:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-nez v2, :cond_1

    .line 124
    .line 125
    new-instance v2, Lorg/json/JSONObject;

    .line 126
    .line 127
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v3, "ci"

    .line 131
    .line 132
    iget-object v4, p0, Lcom/cosmos/photon/push/notification/MoNotify;->channelId:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 138
    .line 139
    const-string v4, "ext_d"

    .line 140
    .line 141
    new-instance v5, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 158
    .line 159
    .line 160
    :catch_0
    :cond_1
    :try_start_2
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 161
    .line 162
    const-string v3, "logType"

    .line 163
    .line 164
    new-instance v4, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget v5, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 170
    .line 171
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 182
    .line 183
    const-string v3, "multi"

    .line 184
    .line 185
    new-instance v4, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->multi:I

    .line 191
    .line 192
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    const-string v0, "d"

    .line 203
    .line 204
    new-instance v2, Lorg/json/JSONObject;

    .line 205
    .line 206
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 207
    .line 208
    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    .line 213
    .line 214
    const-string v0, "showTime"

    .line 215
    .line 216
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 217
    .line 218
    invoke-virtual {v1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 219
    .line 220
    .line 221
    const-string v0, "showExpire"

    .line 222
    .line 223
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showExpire:J

    .line 224
    .line 225
    invoke-virtual {v1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 226
    .line 227
    .line 228
    const-string v0, "popNotify"

    .line 229
    .line 230
    iget-boolean v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->popNotify:Z

    .line 231
    .line 232
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 233
    .line 234
    .line 235
    const-string v0, "autoCancel"

    .line 236
    .line 237
    iget-boolean p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->autoCancel:Z

    .line 238
    .line 239
    invoke-virtual {v1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 240
    .line 241
    .line 242
    :catch_1
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MoNotify{id=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', toPkg=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', type=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', title=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', desc=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', action=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', actionType="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", icon=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', sound="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->sound:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", soundType=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->soundType:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', vibrate="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->vibrate:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", light="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->light:I

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const/16 p0, 0x7d

    .line 124
    .line 125
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method
