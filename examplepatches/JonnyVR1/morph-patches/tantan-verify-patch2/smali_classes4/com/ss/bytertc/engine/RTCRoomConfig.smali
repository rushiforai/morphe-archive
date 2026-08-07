.class public Lcom/ss/bytertc/engine/RTCRoomConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public isAutoSubscribeAudio:Z

.field public isAutoSubscribeVideo:Z

.field public isPublishAudio:Z

.field public isPublishVideo:Z

.field public profile:Lcom/ss/bytertc/engine/type/ChannelProfile;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/ChannelProfile;ZZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->profile:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isPublishAudio:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isPublishVideo:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isAutoSubscribeAudio:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isAutoSubscribeVideo:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getProfile()I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/RTCRoomConfig$1;->$SwitchMap$com$ss$bytertc$engine$type$ChannelProfile:[I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->profile:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v0, p0

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :pswitch_0
    const/16 p0, 0x14

    .line 17
    .line 18
    return p0

    .line 19
    :pswitch_1
    const/16 p0, 0x13

    .line 20
    .line 21
    return p0

    .line 22
    :pswitch_2
    const/16 p0, 0x12

    .line 23
    .line 24
    return p0

    .line 25
    :pswitch_3
    const/16 p0, 0x11

    .line 26
    .line 27
    return p0

    .line 28
    :pswitch_4
    const/16 p0, 0x10

    .line 29
    .line 30
    return p0

    .line 31
    :pswitch_5
    const/16 p0, 0xe

    .line 32
    .line 33
    return p0

    .line 34
    :pswitch_6
    const/16 p0, 0xc

    .line 35
    .line 36
    return p0

    .line 37
    :pswitch_7
    const/16 p0, 0xa

    .line 38
    .line 39
    return p0

    .line 40
    :pswitch_8
    const/4 p0, 0x6

    .line 41
    return p0

    .line 42
    :pswitch_9
    const/4 p0, 0x4

    .line 43
    return p0

    .line 44
    :pswitch_a
    const/4 p0, 0x2

    .line 45
    return p0

    .line 46
    :pswitch_b
    const/4 p0, 0x3

    .line 47
    return p0

    .line 48
    nop

    .line 49
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isAutoSubscribeAudio()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isAutoSubscribeAudio:Z

    .line 2
    .line 3
    return p0
.end method

.method public isAutoSubscribeVideo()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isAutoSubscribeVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPublishAudio()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isPublishAudio:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPublishVideo()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isPublishVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RTCRoomConfig{profile="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->profile:Lcom/ss/bytertc/engine/type/ChannelProfile;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", isPublishAudio="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isPublishAudio:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", isPublishVideo="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isPublishVideo:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", isAutoSubscribeAudio="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isAutoSubscribeAudio:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", isAutoSubscribeVideo="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCRoomConfig;->isAutoSubscribeVideo:Z

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
