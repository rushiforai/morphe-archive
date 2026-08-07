.class public Lcom/cosmos/photon/push/notification/NotificationBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEFAULT_NONE:I = -0x37


# instance fields
.field private builder:Landroid/app/Notification$Builder;

.field private channelId:Ljava/lang/String;

.field private mAudioStreamType:I

.field private mContentIntent:Landroid/app/PendingIntent;

.field private mContentText:Ljava/lang/CharSequence;

.field private mContentTitle:Ljava/lang/CharSequence;

.field private mContext:Landroid/content/Context;

.field private mDefaults:I

.field private mFlags:I

.field private mIcon:I

.field private mLargeIcon:Landroid/graphics/Bitmap;

.field private mLedArgb:I

.field private mLedOffMs:I

.field private mLedOnMs:I

.field private mNumber:I

.field private mSound:Landroid/net/Uri;

.field private mSoundStr:Ljava/lang/String;

.field private mTickerText:Ljava/lang/CharSequence;

.field private mVibrate:[J

.field private mWhen:J

.field private popNotify:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mNumber:I

    .line 6
    .line 7
    const/16 v0, -0x37

    .line 8
    .line 9
    iput v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mDefaults:I

    .line 10
    .line 11
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mWhen:J

    .line 18
    .line 19
    return-void
.end method

.method private setFlag(IZ)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 1

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mFlags:I

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    or-int/2addr p1, v0

    .line 6
    iput p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mFlags:I

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    not-int p1, p1

    .line 10
    and-int/2addr p1, v0

    .line 11
    iput p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mFlags:I

    .line 12
    .line 13
    return-object p0
.end method


# virtual methods
.method public getNotification()Landroid/app/Notification;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Lcom/cosmos/photon/push/PhotonPushManager;->CHANNEL_MODE:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v1, 0x1a

    .line 12
    .line 13
    if-lt v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/my40;->a()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->channelId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/ly40;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance v0, Landroid/app/Notification$Builder;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    invoke-direct {v0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 37
    .line 38
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 39
    .line 40
    iget-wide v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mWhen:J

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 46
    .line 47
    iget v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mNumber:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentIntent:Landroid/app/PendingIntent;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->popNotify:Z

    .line 62
    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    const/4 v1, 0x2

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    const/4 v1, 0x0

    .line 68
    :goto_1
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mTickerText:Ljava/lang/CharSequence;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLargeIcon:Landroid/graphics/Bitmap;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mSound:Landroid/net/Uri;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mVibrate:[J

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 100
    .line 101
    iget v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedArgb:I

    .line 102
    .line 103
    iget v2, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedOnMs:I

    .line 104
    .line 105
    iget v3, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedOffMs:I

    .line 106
    .line 107
    invoke-virtual {v0, v1, v2, v3}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    .line 108
    .line 109
    .line 110
    iget v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mDefaults:I

    .line 111
    .line 112
    const/16 v1, -0x37

    .line 113
    .line 114
    if-eq v0, v1, :cond_3

    .line 115
    .line 116
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 119
    .line 120
    .line 121
    :cond_3
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 122
    .line 123
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentTitle:Ljava/lang/CharSequence;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentText:Ljava/lang/CharSequence;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 136
    .line 137
    iget v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mIcon:I

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 140
    .line 141
    .line 142
    new-instance v0, Landroid/app/Notification$BigTextStyle;

    .line 143
    .line 144
    invoke-direct {v0}, Landroid/app/Notification$BigTextStyle;-><init>()V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentText:Ljava/lang/CharSequence;

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 153
    .line 154
    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->builder:Landroid/app/Notification$Builder;

    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget v1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mFlags:I

    .line 164
    .line 165
    iput v1, v0, Landroid/app/Notification;->flags:I

    .line 166
    .line 167
    iget v2, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedOnMs:I

    .line 168
    .line 169
    if-eqz v2, :cond_4

    .line 170
    .line 171
    iget v2, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedOffMs:I

    .line 172
    .line 173
    if-eqz v2, :cond_4

    .line 174
    .line 175
    or-int/lit8 v1, v1, 0x1

    .line 176
    .line 177
    iput v1, v0, Landroid/app/Notification;->flags:I

    .line 178
    .line 179
    :cond_4
    iget p0, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mDefaults:I

    .line 180
    .line 181
    and-int/lit8 p0, p0, 0x4

    .line 182
    .line 183
    if-eqz p0, :cond_5

    .line 184
    .line 185
    iget p0, v0, Landroid/app/Notification;->flags:I

    .line 186
    .line 187
    or-int/lit8 p0, p0, 0x1

    .line 188
    .line 189
    iput p0, v0, Landroid/app/Notification;->flags:I

    .line 190
    .line 191
    :cond_5
    return-object v0
.end method

.method public setAutoCancel(Z)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setFlag(IZ)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setChannelId(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->channelId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setContentIntent(Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-void
.end method

.method public setContentText(Ljava/lang/CharSequence;)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentText:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public setContentTitle(Ljava/lang/CharSequence;)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mContentTitle:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDefaults(I)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mDefaults:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setIcon(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mIcon:I

    .line 2
    .line 3
    return-void
.end method

.method public setLargeIcon(Landroid/graphics/Bitmap;)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLargeIcon:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLights(III)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedArgb:I

    .line 2
    .line 3
    iput p2, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedOnMs:I

    .line 4
    .line 5
    iput p3, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mLedOffMs:I

    .line 6
    .line 7
    return-object p0
.end method

.method public setNumber(I)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mNumber:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setPopNotify(Z)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->popNotify:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setRuning(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0, p1}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setFlag(IZ)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setSound(Landroid/net/Uri;Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mSound:Landroid/net/Uri;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mSoundStr:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public setTicker(Ljava/lang/CharSequence;)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mTickerText:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVibrate([J)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mVibrate:[J

    .line 2
    .line 3
    return-object p0
.end method

.method public setWhen(J)Lcom/cosmos/photon/push/notification/NotificationBuilder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/cosmos/photon/push/notification/NotificationBuilder;->mWhen:J

    .line 2
    .line 3
    return-object p0
.end method
