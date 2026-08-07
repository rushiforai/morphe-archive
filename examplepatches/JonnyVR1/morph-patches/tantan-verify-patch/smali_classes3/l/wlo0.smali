.class public final Ll/wlo0;
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

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p0, :cond_7

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->getCallPlaceResource()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_6

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getAddUrl()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 32
    .line 33
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getBgUrl()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getBgUrl()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->bgUrl:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getAddUrl()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getAddUrl()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->addUrl:Ljava/lang/String;

    .line 66
    .line 67
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getBossUrl()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getBossUrl()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->bossUrl:Ljava/lang/String;

    .line 82
    .line 83
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getIndexColor()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_7

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomCallPlaceResource;->getIndexColor()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->indexColor:Ljava/lang/String;

    .line 98
    .line 99
    return-void

    .line 100
    :cond_6
    :goto_0
    const/4 p1, 0x0

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 102
    .line 103
    :cond_7
    :goto_1
    return-void
.end method
