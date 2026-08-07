.class Lcom/p1/mobile/putong/live/base/data/BLiveData$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveData$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    sparse-switch p0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string p0, "skinList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x130

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "voiceRoomInProfile"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x12f

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "bossCall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x12e

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "heatVoiceRoomTasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x12d

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "backGroundPicSetting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x12c

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "multiCallSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x12b

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "voiceKTVOrders"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x12a

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "givenGiftRemindStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x129

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "voiceChatGroup"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x128

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "voiceSettles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x127

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "dailyPayment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x126

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "videoChatSquareSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x125

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "familyShareInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x124

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "showSideBarConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x123

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "cpRecommendUserList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x122

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "voiceLiveHeartBeat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x121

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "medalWall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x120

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "voiceLiveActivityMoment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x11f

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "voiceLiveAssert"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x11e

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "firstChargeCampaigns"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x11d

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "videoLiveBulletCommentTypes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x11c

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "teenagerLives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x11b

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "multiPkPanel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x11a

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "storeBackgroundPics"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x119

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "userLiveRightResources"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x118

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "voiceFanbaseLbs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x117

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "multiPkAsset"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x116

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "signInPrizes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x115

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "grabHatCps"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0x114

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "momentConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0x113

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "voiceLiveAuctionAsset"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0x112

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "accompanyTaskProgress"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0x111

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "missedCalls"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x110

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "voiceChatGroupApplies"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x10f

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "liveStickerTemplatesMetadata"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x10e

    goto/16 :goto_0

    :sswitch_23
    const-string p0, "voiceLeaderboardEntrances"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v2, 0x10d

    goto/16 :goto_0

    :sswitch_24
    const-string p0, "liveTopChatMessage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v2, 0x10c

    goto/16 :goto_0

    :sswitch_25
    const-string p0, "voiceCpHouseList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v2, 0x10b

    goto/16 :goto_0

    :sswitch_26
    const-string p0, "voiceCpHouseInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v2, 0x10a

    goto/16 :goto_0

    :sswitch_27
    const-string p0, "chestRewardInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v2, 0x109

    goto/16 :goto_0

    :sswitch_28
    const-string p0, "bagpackItem"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v2, 0x108

    goto/16 :goto_0

    :sswitch_29
    const-string p0, "liveChatMessages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v2, 0x107

    goto/16 :goto_0

    :sswitch_2a
    const-string p0, "multiCallInvites"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v2, 0x106

    goto/16 :goto_0

    :sswitch_2b
    const-string p0, "followships"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v2, 0x105

    goto/16 :goto_0

    :sswitch_2c
    const-string p0, "givenGiftRemindConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v2, 0x104

    goto/16 :goto_0

    :sswitch_2d
    const-string p0, "chatTopic"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v2, 0x103

    goto/16 :goto_0

    :sswitch_2e
    const-string p0, "officialShowCurrentAnchorInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v2, 0x102

    goto/16 :goto_0

    :sswitch_2f
    const-string p0, "voiceLivePopUpGuild"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v2, 0x101

    goto/16 :goto_0

    :sswitch_30
    const-string p0, "userRealVoiceLive"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v2, 0x100

    goto/16 :goto_0

    :sswitch_31
    const-string p0, "callInvites"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v2, 0xff

    goto/16 :goto_0

    :sswitch_32
    const-string p0, "voiceLivesSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v2, 0xfe

    goto/16 :goto_0

    :sswitch_33
    const-string p0, "intlLiveFramesMetadata"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v2, 0xfd

    goto/16 :goto_0

    :sswitch_34
    const-string p0, "voiceManagers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v2, 0xfc

    goto/16 :goto_0

    :sswitch_35
    const-string p0, "auctionApplies"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v2, 0xfb

    goto/16 :goto_0

    :sswitch_36
    const-string p0, "emojiPlayMenu"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v2, 0xfa

    goto/16 :goto_0

    :sswitch_37
    const-string p0, "myJoins"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v2, 0xf9

    goto/16 :goto_0

    :sswitch_38
    const-string p0, "voiceLiveUserHeartbeatRewardList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v2, 0xf8

    goto/16 :goto_0

    :sswitch_39
    const-string p0, "activitySuggests"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v2, 0xf7

    goto/16 :goto_0

    :sswitch_3a
    const-string p0, "liveActivities"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v2, 0xf6

    goto/16 :goto_0

    :sswitch_3b
    const-string p0, "privacyPrivilege"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v2, 0xf5

    goto/16 :goto_0

    :sswitch_3c
    const-string p0, "voiceLiveGames"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto/16 :goto_0

    :cond_3c
    const/16 v2, 0xf4

    goto/16 :goto_0

    :sswitch_3d
    const-string p0, "chatTips"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3d

    goto/16 :goto_0

    :cond_3d
    const/16 v2, 0xf3

    goto/16 :goto_0

    :sswitch_3e
    const-string p0, "multiPk"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    goto/16 :goto_0

    :cond_3e
    const/16 v2, 0xf2

    goto/16 :goto_0

    :sswitch_3f
    const-string p0, "voiceGiftWallBriefInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3f

    goto/16 :goto_0

    :cond_3f
    const/16 v2, 0xf1

    goto/16 :goto_0

    :sswitch_40
    const-string p0, "anchorKnightInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_40

    goto/16 :goto_0

    :cond_40
    const/16 v2, 0xf0

    goto/16 :goto_0

    :sswitch_41
    const-string p0, "memberLbs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_41

    goto/16 :goto_0

    :cond_41
    const/16 v2, 0xef

    goto/16 :goto_0

    :sswitch_42
    const-string p0, "videoChat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    goto/16 :goto_0

    :cond_42
    const/16 v2, 0xee

    goto/16 :goto_0

    :sswitch_43
    const-string p0, "complexCardList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    goto/16 :goto_0

    :cond_43
    const/16 v2, 0xed

    goto/16 :goto_0

    :sswitch_44
    const-string p0, "giftLeaderboard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_44

    goto/16 :goto_0

    :cond_44
    const/16 v2, 0xec

    goto/16 :goto_0

    :sswitch_45
    const-string p0, "multiCallAsset"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_45

    goto/16 :goto_0

    :cond_45
    const/16 v2, 0xeb

    goto/16 :goto_0

    :sswitch_46
    const-string p0, "givenGiftRes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_46

    goto/16 :goto_0

    :cond_46
    const/16 v2, 0xea

    goto/16 :goto_0

    :sswitch_47
    const-string p0, "pkItemCardsDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_47

    goto/16 :goto_0

    :cond_47
    const/16 v2, 0xe9

    goto/16 :goto_0

    :sswitch_48
    const-string p0, "verifications"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    goto/16 :goto_0

    :cond_48
    const/16 v2, 0xe8

    goto/16 :goto_0

    :sswitch_49
    const-string p0, "multiCalls"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_49

    goto/16 :goto_0

    :cond_49
    const/16 v2, 0xe7

    goto/16 :goto_0

    :sswitch_4a
    const-string p0, "voiceLiveUserFeedList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4a

    goto/16 :goto_0

    :cond_4a
    const/16 v2, 0xe6

    goto/16 :goto_0

    :sswitch_4b
    const-string p0, "funFairBottomEntrance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4b

    goto/16 :goto_0

    :cond_4b
    const/16 v2, 0xe5

    goto/16 :goto_0

    :sswitch_4c
    const-string p0, "starRedPackets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4c

    goto/16 :goto_0

    :cond_4c
    const/16 v2, 0xe4

    goto/16 :goto_0

    :sswitch_4d
    const-string p0, "firstRechargeStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4d

    goto/16 :goto_0

    :cond_4d
    const/16 v2, 0xe3

    goto/16 :goto_0

    :sswitch_4e
    const-string p0, "userKnightInfosSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4e

    goto/16 :goto_0

    :cond_4e
    const/16 v2, 0xe2

    goto/16 :goto_0

    :sswitch_4f
    const-string p0, "mutexMode"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4f

    goto/16 :goto_0

    :cond_4f
    const/16 v2, 0xe1

    goto/16 :goto_0

    :sswitch_50
    const-string p0, "videoChatLive"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_50

    goto/16 :goto_0

    :cond_50
    const/16 v2, 0xe0

    goto/16 :goto_0

    :sswitch_51
    const-string p0, "hierarchies"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_51

    goto/16 :goto_0

    :cond_51
    const/16 v2, 0xdf

    goto/16 :goto_0

    :sswitch_52
    const-string p0, "luckyParadiseBottomEntrance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_52

    goto/16 :goto_0

    :cond_52
    const/16 v2, 0xde

    goto/16 :goto_0

    :sswitch_53
    const-string p0, "voiceAdminPanelCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    goto/16 :goto_0

    :cond_53
    const/16 v2, 0xdd

    goto/16 :goto_0

    :sswitch_54
    const-string p0, "superChatDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_54

    goto/16 :goto_0

    :cond_54
    const/16 v2, 0xdc

    goto/16 :goto_0

    :sswitch_55
    const-string p0, "records"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    goto/16 :goto_0

    :cond_55
    const/16 v2, 0xdb

    goto/16 :goto_0

    :sswitch_56
    const-string p0, "needTitle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    goto/16 :goto_0

    :cond_56
    const/16 v2, 0xda

    goto/16 :goto_0

    :sswitch_57
    const-string p0, "liveHierarchyGrades"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_57

    goto/16 :goto_0

    :cond_57
    const/16 v2, 0xd9

    goto/16 :goto_0

    :sswitch_58
    const-string p0, "liveCampaigns"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_58

    goto/16 :goto_0

    :cond_58
    const/16 v2, 0xd8

    goto/16 :goto_0

    :sswitch_59
    const-string p0, "shareRoomConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_59

    goto/16 :goto_0

    :cond_59
    const/16 v2, 0xd7

    goto/16 :goto_0

    :sswitch_5a
    const-string p0, "voiceLivePopsTotal"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5a

    goto/16 :goto_0

    :cond_5a
    const/16 v2, 0xd6

    goto/16 :goto_0

    :sswitch_5b
    const-string p0, "modelDescribe"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5b

    goto/16 :goto_0

    :cond_5b
    const/16 v2, 0xd5

    goto/16 :goto_0

    :sswitch_5c
    const-string p0, "gameAsset"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5c

    goto/16 :goto_0

    :cond_5c
    const/16 v2, 0xd4

    goto/16 :goto_0

    :sswitch_5d
    const-string p0, "giftWallV3Briefs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5d

    goto/16 :goto_0

    :cond_5d
    const/16 v2, 0xd3

    goto/16 :goto_0

    :sswitch_5e
    const-string p0, "members"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5e

    goto/16 :goto_0

    :cond_5e
    const/16 v2, 0xd2

    goto/16 :goto_0

    :sswitch_5f
    const-string p0, "voiceUserFeedInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5f

    goto/16 :goto_0

    :cond_5f
    const/16 v2, 0xd1

    goto/16 :goto_0

    :sswitch_60
    const-string p0, "liveMedalCDN"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_60

    goto/16 :goto_0

    :cond_60
    const/16 v2, 0xd0

    goto/16 :goto_0

    :sswitch_61
    const-string p0, "voiceLiveBulletCommentTypes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_61

    goto/16 :goto_0

    :cond_61
    const/16 v2, 0xcf

    goto/16 :goto_0

    :sswitch_62
    const-string p0, "giftStar"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_62

    goto/16 :goto_0

    :cond_62
    const/16 v2, 0xce

    goto/16 :goto_0

    :sswitch_63
    const-string p0, "fanbases"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_63

    goto/16 :goto_0

    :cond_63
    const/16 v2, 0xcd

    goto/16 :goto_0

    :sswitch_64
    const-string p0, "grabHatGame"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    goto/16 :goto_0

    :cond_64
    const/16 v2, 0xcc

    goto/16 :goto_0

    :sswitch_65
    const-string p0, "livePushes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_65

    goto/16 :goto_0

    :cond_65
    const/16 v2, 0xcb

    goto/16 :goto_0

    :sswitch_66
    const-string p0, "liveResourcesCDN"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_66

    goto/16 :goto_0

    :cond_66
    const/16 v2, 0xca

    goto/16 :goto_0

    :sswitch_67
    const-string p0, "firstRechargeDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_67

    goto/16 :goto_0

    :cond_67
    const/16 v2, 0xc9

    goto/16 :goto_0

    :sswitch_68
    const-string p0, "liveSchemas"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_68

    goto/16 :goto_0

    :cond_68
    const/16 v2, 0xc8

    goto/16 :goto_0

    :sswitch_69
    const-string p0, "fakeUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_69

    goto/16 :goto_0

    :cond_69
    const/16 v2, 0xc7

    goto/16 :goto_0

    :sswitch_6a
    const-string p0, "userLiveHierarchy"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6a

    goto/16 :goto_0

    :cond_6a
    const/16 v2, 0xc6

    goto/16 :goto_0

    :sswitch_6b
    const-string p0, "userLivePush"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6b

    goto/16 :goto_0

    :cond_6b
    const/16 v2, 0xc5

    goto/16 :goto_0

    :sswitch_6c
    const-string p0, "accompanyTasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6c

    goto/16 :goto_0

    :cond_6c
    const/16 v2, 0xc4

    goto/16 :goto_0

    :sswitch_6d
    const-string p0, "auctionRelationCards"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6d

    goto/16 :goto_0

    :cond_6d
    const/16 v2, 0xc3

    goto/16 :goto_0

    :sswitch_6e
    const-string p0, "rtcTokens"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6e

    goto/16 :goto_0

    :cond_6e
    const/16 v2, 0xc2

    goto/16 :goto_0

    :sswitch_6f
    const-string p0, "intlVoiceLiveCampaigns"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6f

    goto/16 :goto_0

    :cond_6f
    const/16 v2, 0xc1

    goto/16 :goto_0

    :sswitch_70
    const-string p0, "liveStickerTemplatesGifts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_70

    goto/16 :goto_0

    :cond_70
    const/16 v2, 0xc0

    goto/16 :goto_0

    :sswitch_71
    const-string p0, "pkInvites"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_71

    goto/16 :goto_0

    :cond_71
    const/16 v2, 0xbf

    goto/16 :goto_0

    :sswitch_72
    const-string p0, "giftItemCDN"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_72

    goto/16 :goto_0

    :cond_72
    const/16 v2, 0xbe

    goto/16 :goto_0

    :sswitch_73
    const-string p0, "signInAchievementMedals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_73

    goto/16 :goto_0

    :cond_73
    const/16 v2, 0xbd

    goto/16 :goto_0

    :sswitch_74
    const-string p0, "leaderboardUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_74

    goto/16 :goto_0

    :cond_74
    const/16 v2, 0xbc

    goto/16 :goto_0

    :sswitch_75
    const-string p0, "relationships"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_75

    goto/16 :goto_0

    :cond_75
    const/16 v2, 0xbb

    goto/16 :goto_0

    :sswitch_76
    const-string p0, "liveRoomTabGifts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_76

    goto/16 :goto_0

    :cond_76
    const/16 v2, 0xba

    goto/16 :goto_0

    :sswitch_77
    const-string p0, "voiceGiftWallList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_77

    goto/16 :goto_0

    :cond_77
    const/16 v2, 0xb9

    goto/16 :goto_0

    :sswitch_78
    const-string p0, "userEnterRoomEffects"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_78

    goto/16 :goto_0

    :cond_78
    const/16 v2, 0xb8

    goto/16 :goto_0

    :sswitch_79
    const-string p0, "giftSetInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_79

    goto/16 :goto_0

    :cond_79
    const/16 v2, 0xb7

    goto/16 :goto_0

    :sswitch_7a
    const-string p0, "anchorFanbaseMedal"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7a

    goto/16 :goto_0

    :cond_7a
    const/16 v2, 0xb6

    goto/16 :goto_0

    :sswitch_7b
    const-string p0, "liveAssets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7b

    goto/16 :goto_0

    :cond_7b
    const/16 v2, 0xb5

    goto/16 :goto_0

    :sswitch_7c
    const-string p0, "anchorGuildCheck"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7c

    goto/16 :goto_0

    :cond_7c
    const/16 v2, 0xb4

    goto/16 :goto_0

    :sswitch_7d
    const-string p0, "version"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7d

    goto/16 :goto_0

    :cond_7d
    const/16 v2, 0xb3

    goto/16 :goto_0

    :sswitch_7e
    const-string p0, "suggestedLives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7e

    goto/16 :goto_0

    :cond_7e
    const/16 v2, 0xb2

    goto/16 :goto_0

    :sswitch_7f
    const-string p0, "videoLiveBulletComment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7f

    goto/16 :goto_0

    :cond_7f
    const/16 v2, 0xb1

    goto/16 :goto_0

    :sswitch_80
    const-string p0, "giftSkinPanel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_80

    goto/16 :goto_0

    :cond_80
    const/16 v2, 0xb0

    goto/16 :goto_0

    :sswitch_81
    const-string p0, "voiceWeekLeaderboards"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_81

    goto/16 :goto_0

    :cond_81
    const/16 v2, 0xaf

    goto/16 :goto_0

    :sswitch_82
    const-string p0, "bigTVLives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_82

    goto/16 :goto_0

    :cond_82
    const/16 v2, 0xae

    goto/16 :goto_0

    :sswitch_83
    const-string p0, "pkSummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_83

    goto/16 :goto_0

    :cond_83
    const/16 v2, 0xad

    goto/16 :goto_0

    :sswitch_84
    const-string p0, "userProfileConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_84

    goto/16 :goto_0

    :cond_84
    const/16 v2, 0xac

    goto/16 :goto_0

    :sswitch_85
    const-string p0, "fakeUserProfiles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_85

    goto/16 :goto_0

    :cond_85
    const/16 v2, 0xab

    goto/16 :goto_0

    :sswitch_86
    const-string p0, "monetizationConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    goto/16 :goto_0

    :cond_86
    const/16 v2, 0xaa

    goto/16 :goto_0

    :sswitch_87
    const-string p0, "userCompliance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_87

    goto/16 :goto_0

    :cond_87
    const/16 v2, 0xa9

    goto/16 :goto_0

    :sswitch_88
    const-string p0, "userLeaderboard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_88

    goto/16 :goto_0

    :cond_88
    const/16 v2, 0xa8

    goto/16 :goto_0

    :sswitch_89
    const-string p0, "octopusUrl"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_89

    goto/16 :goto_0

    :cond_89
    const/16 v2, 0xa7

    goto/16 :goto_0

    :sswitch_8a
    const-string p0, "voiceHouseRankUpgradeInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8a

    goto/16 :goto_0

    :cond_8a
    const/16 v2, 0xa6

    goto/16 :goto_0

    :sswitch_8b
    const-string p0, "complexCardConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8b

    goto/16 :goto_0

    :cond_8b
    const/16 v2, 0xa5

    goto/16 :goto_0

    :sswitch_8c
    const-string p0, "gamePanelMenus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8c

    goto/16 :goto_0

    :cond_8c
    const/16 v2, 0xa4

    goto/16 :goto_0

    :sswitch_8d
    const-string p0, "managers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8d

    goto/16 :goto_0

    :cond_8d
    const/16 v2, 0xa3

    goto/16 :goto_0

    :sswitch_8e
    const-string p0, "auctionCandidates"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    goto/16 :goto_0

    :cond_8e
    const/16 v2, 0xa2

    goto/16 :goto_0

    :sswitch_8f
    const-string p0, "users"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8f

    goto/16 :goto_0

    :cond_8f
    const/16 v2, 0xa1

    goto/16 :goto_0

    :sswitch_90
    const-string p0, "tasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_90

    goto/16 :goto_0

    :cond_90
    const/16 v2, 0xa0

    goto/16 :goto_0

    :sswitch_91
    const-string p0, "skins"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_91

    goto/16 :goto_0

    :cond_91
    const/16 v2, 0x9f

    goto/16 :goto_0

    :sswitch_92
    const-string p0, "rooms"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_92

    goto/16 :goto_0

    :cond_92
    const/16 v2, 0x9e

    goto/16 :goto_0

    :sswitch_93
    const-string p0, "right"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_93

    goto/16 :goto_0

    :cond_93
    const/16 v2, 0x9d

    goto/16 :goto_0

    :sswitch_94
    const-string p0, "media"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_94

    goto/16 :goto_0

    :cond_94
    const/16 v2, 0x9c

    goto/16 :goto_0

    :sswitch_95
    const-string p0, "masks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_95

    goto/16 :goto_0

    :cond_95
    const/16 v2, 0x9b

    goto/16 :goto_0

    :sswitch_96
    const-string p0, "lives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_96

    goto/16 :goto_0

    :cond_96
    const/16 v2, 0x9a

    goto/16 :goto_0

    :sswitch_97
    const-string p0, "guard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_97

    goto/16 :goto_0

    :cond_97
    const/16 v2, 0x99

    goto/16 :goto_0

    :sswitch_98
    const-string p0, "cells"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_98

    goto/16 :goto_0

    :cond_98
    const/16 v2, 0x98

    goto/16 :goto_0

    :sswitch_99
    const-string p0, "calls"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_99

    goto/16 :goto_0

    :cond_99
    const/16 v2, 0x97

    goto/16 :goto_0

    :sswitch_9a
    const-string p0, "pkAssets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9a

    goto/16 :goto_0

    :cond_9a
    const/16 v2, 0x96

    goto/16 :goto_0

    :sswitch_9b
    const-string p0, "voiceCpHouseTaskInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9b

    goto/16 :goto_0

    :cond_9b
    const/16 v2, 0x95

    goto/16 :goto_0

    :sswitch_9c
    const-string p0, "advancedTasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9c

    goto/16 :goto_0

    :cond_9c
    const/16 v2, 0x94

    goto/16 :goto_0

    :sswitch_9d
    const-string p0, "taskSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9d

    goto/16 :goto_0

    :cond_9d
    const/16 v2, 0x93

    goto/16 :goto_0

    :sswitch_9e
    const-string p0, "voiceRoomTagInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9e

    goto/16 :goto_0

    :cond_9e
    const/16 v2, 0x92

    goto/16 :goto_0

    :sswitch_9f
    const-string p0, "scrapTabs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9f

    goto/16 :goto_0

    :cond_9f
    const/16 v2, 0x91

    goto/16 :goto_0

    :sswitch_a0
    const-string p0, "game"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a0

    goto/16 :goto_0

    :cond_a0
    const/16 v2, 0x90

    goto/16 :goto_0

    :sswitch_a1
    const-string p0, "code"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a1

    goto/16 :goto_0

    :cond_a1
    const/16 v2, 0x8f

    goto/16 :goto_0

    :sswitch_a2
    const-string p0, "pks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a2

    goto/16 :goto_0

    :cond_a2
    const/16 v2, 0x8e

    goto/16 :goto_0

    :sswitch_a3
    const-string p0, "giftDetails"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a3

    goto/16 :goto_0

    :cond_a3
    const/16 v2, 0x8d

    goto/16 :goto_0

    :sswitch_a4
    const-string p0, "mysteryConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a4

    goto/16 :goto_0

    :cond_a4
    const/16 v2, 0x8c

    goto/16 :goto_0

    :sswitch_a5
    const-string p0, "auctionInvites"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a5

    goto/16 :goto_0

    :cond_a5
    const/16 v2, 0x8b

    goto/16 :goto_0

    :sswitch_a6
    const-string p0, "voiceCallSummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a6

    goto/16 :goto_0

    :cond_a6
    const/16 v2, 0x8a

    goto/16 :goto_0

    :sswitch_a7
    const-string p0, "voiceLiveAuctions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a7

    goto/16 :goto_0

    :cond_a7
    const/16 v2, 0x89

    goto/16 :goto_0

    :sswitch_a8
    const-string p0, "roomAnnouncement"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a8

    goto/16 :goto_0

    :cond_a8
    const/16 v2, 0x88

    goto/16 :goto_0

    :sswitch_a9
    const-string p0, "voicePkInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a9

    goto/16 :goto_0

    :cond_a9
    const/16 v2, 0x87

    goto/16 :goto_0

    :sswitch_aa
    const-string p0, "guardRecords"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_aa

    goto/16 :goto_0

    :cond_aa
    const/16 v2, 0x86

    goto/16 :goto_0

    :sswitch_ab
    const-string p0, "voiceRoomSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ab

    goto/16 :goto_0

    :cond_ab
    const/16 v2, 0x85

    goto/16 :goto_0

    :sswitch_ac
    const-string p0, "fanbaseRelations"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ac

    goto/16 :goto_0

    :cond_ac
    const/16 v2, 0x84

    goto/16 :goto_0

    :sswitch_ad
    const-string p0, "scoreSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ad

    goto/16 :goto_0

    :cond_ad
    const/16 v2, 0x83

    goto/16 :goto_0

    :sswitch_ae
    const-string p0, "videoChatSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ae

    goto/16 :goto_0

    :cond_ae
    const/16 v2, 0x82

    goto/16 :goto_0

    :sswitch_af
    const-string p0, "liveStickerTemplates"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_af

    goto/16 :goto_0

    :cond_af
    const/16 v2, 0x81

    goto/16 :goto_0

    :sswitch_b0
    const-string p0, "accompanyUserRanking"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b0

    goto/16 :goto_0

    :cond_b0
    const/16 v2, 0x80

    goto/16 :goto_0

    :sswitch_b1
    const-string p0, "videoChatRandomMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b1

    goto/16 :goto_0

    :cond_b1
    const/16 v2, 0x7f

    goto/16 :goto_0

    :sswitch_b2
    const-string p0, "chatMsgLiveInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b2

    goto/16 :goto_0

    :cond_b2
    const/16 v2, 0x7e

    goto/16 :goto_0

    :sswitch_b3
    const-string p0, "chatTopicAsset"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b3

    goto/16 :goto_0

    :cond_b3
    const/16 v2, 0x7d

    goto/16 :goto_0

    :sswitch_b4
    const-string p0, "missedCallCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b4

    goto/16 :goto_0

    :cond_b4
    const/16 v2, 0x7c

    goto/16 :goto_0

    :sswitch_b5
    const-string p0, "voiceLiveBanners"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b5

    goto/16 :goto_0

    :cond_b5
    const/16 v2, 0x7b

    goto/16 :goto_0

    :sswitch_b6
    const-string p0, "dragonScourgeDisplayChatMessage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b6

    goto/16 :goto_0

    :cond_b6
    const/16 v2, 0x7a

    goto/16 :goto_0

    :sswitch_b7
    const-string p0, "pkSeeks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b7

    goto/16 :goto_0

    :cond_b7
    const/16 v2, 0x79

    goto/16 :goto_0

    :sswitch_b8
    const-string p0, "exchangeTTCRedpoint"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b8

    goto/16 :goto_0

    :cond_b8
    const/16 v2, 0x78

    goto/16 :goto_0

    :sswitch_b9
    const-string p0, "voiceRoomLevelDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b9

    goto/16 :goto_0

    :cond_b9
    const/16 v2, 0x77

    goto/16 :goto_0

    :sswitch_ba
    const-string p0, "connector"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ba

    goto/16 :goto_0

    :cond_ba
    const/16 v2, 0x76

    goto/16 :goto_0

    :sswitch_bb
    const-string p0, "hourLeaderboard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bb

    goto/16 :goto_0

    :cond_bb
    const/16 v2, 0x75

    goto/16 :goto_0

    :sswitch_bc
    const-string p0, "multiCallSwitchToLeadRoleInvite"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bc

    goto/16 :goto_0

    :cond_bc
    const/16 v2, 0x74

    goto/16 :goto_0

    :sswitch_bd
    const-string p0, "voiceRoomFeeds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bd

    goto/16 :goto_0

    :cond_bd
    const/16 v2, 0x73

    goto/16 :goto_0

    :sswitch_be
    const-string p0, "voiceRoomAsset"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_be

    goto/16 :goto_0

    :cond_be
    const/16 v2, 0x72

    goto/16 :goto_0

    :sswitch_bf
    const-string p0, "callSummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bf

    goto/16 :goto_0

    :cond_bf
    const/16 v2, 0x71

    goto/16 :goto_0

    :sswitch_c0
    const-string p0, "giftShowcaseItems"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c0

    goto/16 :goto_0

    :cond_c0
    const/16 v2, 0x70

    goto/16 :goto_0

    :sswitch_c1
    const-string p0, "voiceFanbaseMedals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c1

    goto/16 :goto_0

    :cond_c1
    const/16 v2, 0x6f

    goto/16 :goto_0

    :sswitch_c2
    const-string p0, "signInDetails"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c2

    goto/16 :goto_0

    :cond_c2
    const/16 v2, 0x6e

    goto/16 :goto_0

    :sswitch_c3
    const-string p0, "nobleNiceNumberList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c3

    goto/16 :goto_0

    :cond_c3
    const/16 v2, 0x6d

    goto/16 :goto_0

    :sswitch_c4
    const-string p0, "anchorLeaderboard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c4

    goto/16 :goto_0

    :cond_c4
    const/16 v2, 0x6c

    goto/16 :goto_0

    :sswitch_c5
    const-string p0, "fanbaseRedPacketEventCounters"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c5

    goto/16 :goto_0

    :cond_c5
    const/16 v2, 0x6b

    goto/16 :goto_0

    :sswitch_c6
    const-string p0, "isAnchor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c6

    goto/16 :goto_0

    :cond_c6
    const/16 v2, 0x6a

    goto/16 :goto_0

    :sswitch_c7
    const-string p0, "gameOperationPositions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c7

    goto/16 :goto_0

    :cond_c7
    const/16 v2, 0x69

    goto/16 :goto_0

    :sswitch_c8
    const-string p0, "liveBeautyConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c8

    goto/16 :goto_0

    :cond_c8
    const/16 v2, 0x68

    goto/16 :goto_0

    :sswitch_c9
    const-string p0, "multiPkLeaderboard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c9

    goto/16 :goto_0

    :cond_c9
    const/16 v2, 0x67

    goto/16 :goto_0

    :sswitch_ca
    const-string p0, "liveSquareSummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ca

    goto/16 :goto_0

    :cond_ca
    const/16 v2, 0x66

    goto/16 :goto_0

    :sswitch_cb
    const-string p0, "sparkletProgress"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cb

    goto/16 :goto_0

    :cond_cb
    const/16 v2, 0x65

    goto/16 :goto_0

    :sswitch_cc
    const-string p0, "heatBoxEntrance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cc

    goto/16 :goto_0

    :cond_cc
    const/16 v2, 0x64

    goto/16 :goto_0

    :sswitch_cd
    const-string p0, "livePopUpGuild"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cd

    goto/16 :goto_0

    :cond_cd
    const/16 v2, 0x63

    goto/16 :goto_0

    :sswitch_ce
    const-string p0, "gameInfoResponse"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ce

    goto/16 :goto_0

    :cond_ce
    const/16 v2, 0x62

    goto/16 :goto_0

    :sswitch_cf
    const-string p0, "knightsRuleInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cf

    goto/16 :goto_0

    :cond_cf
    const/16 v2, 0x61

    goto/16 :goto_0

    :sswitch_d0
    const-string p0, "randomMatchCouponDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d0

    goto/16 :goto_0

    :cond_d0
    const/16 v2, 0x60

    goto/16 :goto_0

    :sswitch_d1
    const-string p0, "anchors"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d1

    goto/16 :goto_0

    :cond_d1
    const/16 v2, 0x5f

    goto/16 :goto_0

    :sswitch_d2
    const-string p0, "anchorHierarchyGrades"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d2

    goto/16 :goto_0

    :cond_d2
    const/16 v2, 0x5e

    goto/16 :goto_0

    :sswitch_d3
    const-string p0, "topics"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d3

    goto/16 :goto_0

    :cond_d3
    const/16 v2, 0x5d

    goto/16 :goto_0

    :sswitch_d4
    const-string p0, "liveResources"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d4

    goto/16 :goto_0

    :cond_d4
    const/16 v2, 0x5c

    goto/16 :goto_0

    :sswitch_d5
    const-string p0, "schema"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d5

    goto/16 :goto_0

    :cond_d5
    const/16 v2, 0x5b

    goto/16 :goto_0

    :sswitch_d6
    const-string p0, "liveStickers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d6

    goto/16 :goto_0

    :cond_d6
    const/16 v2, 0x5a

    goto/16 :goto_0

    :sswitch_d7
    const-string p0, "videoQualities"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d7

    goto/16 :goto_0

    :cond_d7
    const/16 v2, 0x59

    goto/16 :goto_0

    :sswitch_d8
    const-string p0, "rights"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d8

    goto/16 :goto_0

    :cond_d8
    const/16 v2, 0x58

    goto/16 :goto_0

    :sswitch_d9
    const-string p0, "videoChatAssets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d9

    goto/16 :goto_0

    :cond_d9
    const/16 v2, 0x57

    goto/16 :goto_0

    :sswitch_da
    const-string p0, "anchorDailyTasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_da

    goto/16 :goto_0

    :cond_da
    const/16 v2, 0x56

    goto/16 :goto_0

    :sswitch_db
    const-string p0, "voiceFanbaseDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_db

    goto/16 :goto_0

    :cond_db
    const/16 v2, 0x55

    goto/16 :goto_0

    :sswitch_dc
    const-string p0, "voiceCpLeaderBoards"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_dc

    goto/16 :goto_0

    :cond_dc
    const/16 v2, 0x54

    goto/16 :goto_0

    :sswitch_dd
    const-string p0, "liveClarityLevelInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_dd

    goto/16 :goto_0

    :cond_dd
    const/16 v2, 0x53

    goto/16 :goto_0

    :sswitch_de
    const-string p0, "videoChatAttendeeCallInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_de

    goto/16 :goto_0

    :cond_de
    const/16 v2, 0x52

    goto/16 :goto_0

    :sswitch_df
    const-string p0, "intlConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_df

    goto/16 :goto_0

    :cond_df
    const/16 v2, 0x51

    goto/16 :goto_0

    :sswitch_e0
    const-string p0, "voiceTabs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e0

    goto/16 :goto_0

    :cond_e0
    const/16 v2, 0x50

    goto/16 :goto_0

    :sswitch_e1
    const-string p0, "auctionCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e1

    goto/16 :goto_0

    :cond_e1
    const/16 v2, 0x4f

    goto/16 :goto_0

    :sswitch_e2
    const-string p0, "voiceFanbase"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e2

    goto/16 :goto_0

    :cond_e2
    const/16 v2, 0x4e

    goto/16 :goto_0

    :sswitch_e3
    const-string p0, "touchMeDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e3

    goto/16 :goto_0

    :cond_e3
    const/16 v2, 0x4d

    goto/16 :goto_0

    :sswitch_e4
    const-string p0, "superUserBirthdayDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e4

    goto/16 :goto_0

    :cond_e4
    const/16 v2, 0x4c

    goto/16 :goto_0

    :sswitch_e5
    const-string p0, "voiceLiveSummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e5

    goto/16 :goto_0

    :cond_e5
    const/16 v2, 0x4b

    goto/16 :goto_0

    :sswitch_e6
    const-string p0, "voiceSquareButtons"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e6

    goto/16 :goto_0

    :cond_e6
    const/16 v2, 0x4a

    goto/16 :goto_0

    :sswitch_e7
    const-string p0, "accompanyTaskSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e7

    goto/16 :goto_0

    :cond_e7
    const/16 v2, 0x49

    goto/16 :goto_0

    :sswitch_e8
    const-string p0, "medals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e8

    goto/16 :goto_0

    :cond_e8
    const/16 v2, 0x48

    goto/16 :goto_0

    :sswitch_e9
    const-string p0, "startLivePageCampaigns"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e9

    goto/16 :goto_0

    :cond_e9
    const/16 v2, 0x47

    goto/16 :goto_0

    :sswitch_ea
    const-string p0, "voiceUserLeaderboards"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ea

    goto/16 :goto_0

    :cond_ea
    const/16 v2, 0x46

    goto/16 :goto_0

    :sswitch_eb
    const-string p0, "slotInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_eb

    goto/16 :goto_0

    :cond_eb
    const/16 v2, 0x45

    goto/16 :goto_0

    :sswitch_ec
    const-string p0, "voiceUserGiftItems"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ec

    goto/16 :goto_0

    :cond_ec
    const/16 v2, 0x44

    goto/16 :goto_0

    :sswitch_ed
    const-string p0, "squareEntranceSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ed

    goto/16 :goto_0

    :cond_ed
    const/16 v2, 0x43

    goto/16 :goto_0

    :sswitch_ee
    const-string p0, "fanbaseRecall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ee

    goto/16 :goto_0

    :cond_ee
    const/16 v2, 0x42

    goto/16 :goto_0

    :sswitch_ef
    const-string p0, "auctionPlatformLeaderboardInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ef

    goto/16 :goto_0

    :cond_ef
    const/16 v2, 0x41

    goto/16 :goto_0

    :sswitch_f0
    const-string p0, "voiceUserProfileConfigs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f0

    goto/16 :goto_0

    :cond_f0
    const/16 v2, 0x40

    goto/16 :goto_0

    :sswitch_f1
    const-string p0, "voiceManagerInvites"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f1

    goto/16 :goto_0

    :cond_f1
    const/16 v2, 0x3f

    goto/16 :goto_0

    :sswitch_f2
    const-string p0, "bossGiftRecord"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f2

    goto/16 :goto_0

    :cond_f2
    const/16 v2, 0x3e

    goto/16 :goto_0

    :sswitch_f3
    const-string p0, "turboCardInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f3

    goto/16 :goto_0

    :cond_f3
    const/16 v2, 0x3d

    goto/16 :goto_0

    :sswitch_f4
    const-string p0, "stormComment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f4

    goto/16 :goto_0

    :cond_f4
    const/16 v2, 0x3c

    goto/16 :goto_0

    :sswitch_f5
    const-string p0, "virtualVoiceCard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f5

    goto/16 :goto_0

    :cond_f5
    const/16 v2, 0x3b

    goto/16 :goto_0

    :sswitch_f6
    const-string p0, "previews"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f6

    goto/16 :goto_0

    :cond_f6
    const/16 v2, 0x3a

    goto/16 :goto_0

    :sswitch_f7
    const-string p0, "memberActivityList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f7

    goto/16 :goto_0

    :cond_f7
    const/16 v2, 0x39

    goto/16 :goto_0

    :sswitch_f8
    const-string p0, "family"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f8

    goto/16 :goto_0

    :cond_f8
    const/16 v2, 0x38

    goto/16 :goto_0

    :sswitch_f9
    const-string p0, "voiceKTVGame"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f9

    goto/16 :goto_0

    :cond_f9
    const/16 v2, 0x37

    goto/16 :goto_0

    :sswitch_fa
    const-string p0, "anchorCall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fa

    goto/16 :goto_0

    :cond_fa
    const/16 v2, 0x36

    goto/16 :goto_0

    :sswitch_fb
    const-string p0, "voiceGiftWallBookDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fb

    goto/16 :goto_0

    :cond_fb
    const/16 v2, 0x35

    goto/16 :goto_0

    :sswitch_fc
    const-string p0, "voiceKTVSongs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fc

    goto/16 :goto_0

    :cond_fc
    const/16 v2, 0x34

    goto/16 :goto_0

    :sswitch_fd
    const-string p0, "fanbaseMedals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fd

    goto/16 :goto_0

    :cond_fd
    const/16 v2, 0x33

    goto/16 :goto_0

    :sswitch_fe
    const-string p0, "leaderboards"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fe

    goto/16 :goto_0

    :cond_fe
    const/16 v2, 0x32

    goto/16 :goto_0

    :sswitch_ff
    const-string p0, "redPacketGrabResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ff

    goto/16 :goto_0

    :cond_ff
    const/16 v2, 0x31

    goto/16 :goto_0

    :sswitch_100
    const-string p0, "treasureBox"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_100

    goto/16 :goto_0

    :cond_100
    const/16 v2, 0x30

    goto/16 :goto_0

    :sswitch_101
    const-string p0, "knightsInfosSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_101

    goto/16 :goto_0

    :cond_101
    const/16 v2, 0x2f

    goto/16 :goto_0

    :sswitch_102
    const-string p0, "familyMedals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_102

    goto/16 :goto_0

    :cond_102
    const/16 v2, 0x2e

    goto/16 :goto_0

    :sswitch_103
    const-string p0, "liveQuitPopup"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_103

    goto/16 :goto_0

    :cond_103
    const/16 v2, 0x2d

    goto/16 :goto_0

    :sswitch_104
    const-string p0, "voiceLivePush"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_104

    goto/16 :goto_0

    :cond_104
    const/16 v2, 0x2c

    goto/16 :goto_0

    :sswitch_105
    const-string p0, "lovePlanet"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_105

    goto/16 :goto_0

    :cond_105
    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_106
    const-string p0, "voiceRooms"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_106

    goto/16 :goto_0

    :cond_106
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_107
    const-string p0, "voiceLives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_107

    goto/16 :goto_0

    :cond_107
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_108
    const-string p0, "voiceCalls"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_108

    goto/16 :goto_0

    :cond_108
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_109
    const-string p0, "liveOperation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_109

    goto/16 :goto_0

    :cond_109
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_10a
    const-string p0, "menuItems"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10a

    goto/16 :goto_0

    :cond_10a
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_10b
    const-string p0, "siteWideBroadcastFinder"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10b

    goto/16 :goto_0

    :cond_10b
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_10c
    const-string p0, "pkSuggestedAnchors"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10c

    goto/16 :goto_0

    :cond_10c
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_10d
    const-string p0, "fanbaseHierarchies"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10d

    goto/16 :goto_0

    :cond_10d
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_10e
    const-string p0, "rightBindAnchors"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10e

    goto/16 :goto_0

    :cond_10e
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_10f
    const-string p0, "multiCallExtends"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10f

    goto/16 :goto_0

    :cond_10f
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_110
    const-string p0, "weekCpInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_110

    goto/16 :goto_0

    :cond_110
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_111
    const-string p0, "liveRoomInProfile"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_111

    goto/16 :goto_0

    :cond_111
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_112
    const-string p0, "userLiveHierarchyProgress"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_112

    goto/16 :goto_0

    :cond_112
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_113
    const-string p0, "voiceLiveBulletComment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_113

    goto/16 :goto_0

    :cond_113
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_114
    const-string p0, "voiceFollowships"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_114

    goto/16 :goto_0

    :cond_114
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_115
    const-string p0, "bottomMenu"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_115

    goto/16 :goto_0

    :cond_115
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_116
    const-string p0, "liveSummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_116

    goto/16 :goto_0

    :cond_116
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_117
    const-string p0, "voiceCallInvites"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_117

    goto/16 :goto_0

    :cond_117
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_118
    const-string p0, "guardAnchorRankInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_118

    goto/16 :goto_0

    :cond_118
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_119
    const-string p0, "fanbaseMedalPanel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_119

    goto/16 :goto_0

    :cond_119
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_11a
    const-string p0, "liveActivitySummaries"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11a

    goto/16 :goto_0

    :cond_11a
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_11b
    const-string p0, "shareItems"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11b

    goto/16 :goto_0

    :cond_11b
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_11c
    const-string p0, "flameCoinMarket"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11c

    goto/16 :goto_0

    :cond_11c
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_11d
    const-string p0, "starlightHierarchies"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11d

    goto/16 :goto_0

    :cond_11d
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_11e
    const-string p0, "intlMedalWall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11e

    goto/16 :goto_0

    :cond_11e
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_11f
    const-string p0, "fanbaseDetails"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11f

    goto/16 :goto_0

    :cond_11f
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_120
    const-string p0, "voiceRoomClasses"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_120

    goto/16 :goto_0

    :cond_120
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_121
    const-string p0, "chatSettings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_121

    goto/16 :goto_0

    :cond_121
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_122
    const-string p0, "voicePayGuideUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_122

    goto/16 :goto_0

    :cond_122
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_123
    const-string p0, "voiceMedalWall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_123

    goto/16 :goto_0

    :cond_123
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_124
    const-string p0, "userPushSwitch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_124

    goto/16 :goto_0

    :cond_124
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_125
    const-string p0, "nobleNiceNumberDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_125

    goto/16 :goto_0

    :cond_125
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_126
    const-string p0, "canJoinGame"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_126

    goto/16 :goto_0

    :cond_126
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_127
    const-string p0, "userDailyTasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_127

    goto/16 :goto_0

    :cond_127
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_128
    const-string p0, "userWeekLeaderboard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_128

    goto/16 :goto_0

    :cond_128
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_129
    const-string p0, "voiceGiftWall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_129

    goto :goto_0

    :cond_129
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_12a
    const-string p0, "liveAnchors"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12a

    goto :goto_0

    :cond_12a
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_12b
    const-string p0, "officialShowUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12b

    goto :goto_0

    :cond_12b
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_12c
    const-string p0, "officialShowList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12c

    goto :goto_0

    :cond_12c
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_12d
    const-string p0, "voiceUserMessageRemind"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12d

    goto :goto_0

    :cond_12d
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_12e
    const-string p0, "cpInviteRecords"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12e

    goto :goto_0

    :cond_12e
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_12f
    const-string p0, "grabRedPacketInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12f

    goto :goto_0

    :cond_12f
    move v2, v1

    goto :goto_0

    :sswitch_130
    const-string p0, "equippedGift"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_130

    goto :goto_0

    :cond_130
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    return v1

    .line 4
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 5
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    return v1

    .line 6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    return v1

    .line 8
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    return v1

    .line 10
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 11
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    return v1

    .line 12
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    return v1

    .line 14
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    return v1

    .line 16
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 17
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    return v1

    .line 18
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    return v1

    .line 20
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    return v1

    .line 22
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    return v1

    .line 24
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    return v1

    .line 26
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    return v1

    .line 28
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    return v1

    .line 30
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 31
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    return v1

    .line 32
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    return v1

    .line 34
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    return v1

    .line 36
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    return v1

    .line 38
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    return v1

    .line 40
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    return v1

    .line 42
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 43
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    return v1

    .line 44
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    return v1

    .line 46
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    return v1

    .line 48
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    return v1

    .line 50
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 51
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    return v1

    .line 52
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 53
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    return v1

    .line 54
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    return v1

    .line 56
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    return v1

    .line 58
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 59
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    return v1

    .line 60
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    return v1

    .line 62
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    return v1

    .line 64
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 65
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    return v1

    .line 66
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 67
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    return v1

    .line 68
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    return v1

    .line 70
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    return v1

    .line 72
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 73
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    return v1

    .line 74
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 75
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    return v1

    .line 76
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 77
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    return v1

    .line 78
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 79
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    return v1

    .line 80
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 81
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    return v1

    .line 82
    :pswitch_28
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 83
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    return v1

    .line 84
    :pswitch_29
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    return v1

    .line 86
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    return v1

    .line 88
    :pswitch_2b
    sget-object p0, Lcom/p1/mobile/putong/data/Followship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 89
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    return v1

    .line 90
    :pswitch_2c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 91
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    return v1

    .line 92
    :pswitch_2d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 93
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    return v1

    .line 94
    :pswitch_2e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 95
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    return v1

    .line 96
    :pswitch_2f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 97
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    return v1

    .line 98
    :pswitch_30
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 99
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    return v1

    .line 100
    :pswitch_31
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    return v1

    .line 102
    :pswitch_32
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    return v1

    .line 104
    :pswitch_33
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 105
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    return v1

    .line 106
    :pswitch_34
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 107
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    return v1

    .line 108
    :pswitch_35
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 109
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    return v1

    .line 110
    :pswitch_36
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 111
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    return v1

    .line 112
    :pswitch_37
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 113
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    return v1

    .line 114
    :pswitch_38
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 115
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    return v1

    .line 116
    :pswitch_39
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    return v1

    .line 118
    :pswitch_3a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 119
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    return v1

    .line 120
    :pswitch_3b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 121
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    return v1

    .line 122
    :pswitch_3c
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 123
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    return v1

    .line 124
    :pswitch_3d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 125
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    return v1

    .line 126
    :pswitch_3e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 127
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    return v1

    .line 128
    :pswitch_3f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 129
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    return v1

    .line 130
    :pswitch_40
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 131
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    return v1

    .line 132
    :pswitch_41
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 133
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    return v1

    .line 134
    :pswitch_42
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 135
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    return v1

    .line 136
    :pswitch_43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 137
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    return v1

    .line 138
    :pswitch_44
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 139
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    return v1

    .line 140
    :pswitch_45
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 141
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    return v1

    .line 142
    :pswitch_46
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 143
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    return v1

    .line 144
    :pswitch_47
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 145
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    return v1

    .line 146
    :pswitch_48
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 147
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    return v1

    .line 148
    :pswitch_49
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 149
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    return v1

    .line 150
    :pswitch_4a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 151
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    return v1

    .line 152
    :pswitch_4b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 153
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    return v1

    .line 154
    :pswitch_4c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 155
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    return v1

    .line 156
    :pswitch_4d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 157
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    return v1

    .line 158
    :pswitch_4e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 159
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    return v1

    .line 160
    :pswitch_4f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 161
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    return v1

    .line 162
    :pswitch_50
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 163
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    return v1

    .line 164
    :pswitch_51
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    return v1

    .line 166
    :pswitch_52
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 167
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    return v1

    .line 168
    :pswitch_53
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 169
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    return v1

    .line 170
    :pswitch_54
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 171
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    return v1

    .line 172
    :pswitch_55
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 173
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    return v1

    .line 174
    :pswitch_56
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    return v1

    .line 175
    :pswitch_57
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 176
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    return v1

    .line 177
    :pswitch_58
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 178
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    return v1

    .line 179
    :pswitch_59
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 180
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    return v1

    .line 181
    :pswitch_5a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 182
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    return v1

    .line 183
    :pswitch_5b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 184
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    return v1

    .line 185
    :pswitch_5c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 186
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    return v1

    .line 187
    :pswitch_5d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    return v1

    .line 189
    :pswitch_5e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 190
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    return v1

    .line 191
    :pswitch_5f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 192
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    return v1

    .line 193
    :pswitch_60
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 194
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    return v1

    .line 195
    :pswitch_61
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 196
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    return v1

    .line 197
    :pswitch_62
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 198
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    return v1

    .line 199
    :pswitch_63
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    return v1

    .line 201
    :pswitch_64
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 202
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    return v1

    .line 203
    :pswitch_65
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePush;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 204
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    return v1

    .line 205
    :pswitch_66
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 206
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    return v1

    .line 207
    :pswitch_67
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 208
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    return v1

    .line 209
    :pswitch_68
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 210
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    return v1

    .line 211
    :pswitch_69
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 212
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    return v1

    .line 213
    :pswitch_6a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 214
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    return v1

    .line 215
    :pswitch_6b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePush;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 216
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePush;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    return v1

    .line 217
    :pswitch_6c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 218
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    return v1

    .line 219
    :pswitch_6d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    return v1

    .line 221
    :pswitch_6e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 222
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    return v1

    .line 223
    :pswitch_6f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 224
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    return v1

    .line 225
    :pswitch_70
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 226
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    return v1

    .line 227
    :pswitch_71
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 228
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    return v1

    .line 229
    :pswitch_72
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 230
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    return v1

    .line 231
    :pswitch_73
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 232
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    return v1

    .line 233
    :pswitch_74
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 234
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    return v1

    .line 235
    :pswitch_75
    sget-object p0, Lcom/p1/mobile/putong/data/Relationship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 236
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    return v1

    .line 237
    :pswitch_76
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 238
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    return v1

    .line 239
    :pswitch_77
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 240
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    return v1

    .line 241
    :pswitch_78
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 242
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    return v1

    .line 243
    :pswitch_79
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 244
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    return v1

    .line 245
    :pswitch_7a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 246
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    return v1

    .line 247
    :pswitch_7b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 248
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    return v1

    .line 249
    :pswitch_7c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 250
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    return v1

    .line 251
    :pswitch_7d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    return v1

    .line 252
    :pswitch_7e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 253
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    return v1

    .line 254
    :pswitch_7f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 255
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    return v1

    .line 256
    :pswitch_80
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 257
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    return v1

    .line 258
    :pswitch_81
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    return v1

    .line 260
    :pswitch_82
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 261
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    return v1

    .line 262
    :pswitch_83
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 263
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    return v1

    .line 264
    :pswitch_84
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 265
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    return v1

    .line 266
    :pswitch_85
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 267
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    return v1

    .line 268
    :pswitch_86
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 269
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    return v1

    .line 270
    :pswitch_87
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 271
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    return v1

    .line 272
    :pswitch_88
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 273
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    return v1

    .line 274
    :pswitch_89
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    return v1

    .line 275
    :pswitch_8a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 276
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    return v1

    .line 277
    :pswitch_8b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 278
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    return v1

    .line 279
    :pswitch_8c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 280
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    return v1

    .line 281
    :pswitch_8d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 282
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    return v1

    .line 283
    :pswitch_8e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 284
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    return v1

    .line 285
    :pswitch_8f
    sget-object p0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 286
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    return v1

    .line 287
    :pswitch_90
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 288
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    return v1

    .line 289
    :pswitch_91
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 290
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    return v1

    .line 291
    :pswitch_92
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 292
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    return v1

    .line 293
    :pswitch_93
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 294
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    return v1

    .line 295
    :pswitch_94
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 296
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    return v1

    .line 297
    :pswitch_95
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 298
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    return v1

    .line 299
    :pswitch_96
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 300
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    return v1

    .line 301
    :pswitch_97
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 302
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    return v1

    .line 303
    :pswitch_98
    sget-object p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    return v1

    .line 305
    :pswitch_99
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 306
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    return v1

    .line 307
    :pswitch_9a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 308
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    return v1

    .line 309
    :pswitch_9b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 310
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    return v1

    .line 311
    :pswitch_9c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 312
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    return v1

    .line 313
    :pswitch_9d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 314
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    return v1

    .line 315
    :pswitch_9e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 316
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    return v1

    .line 317
    :pswitch_9f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 318
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    return v1

    .line 319
    :pswitch_a0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 320
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    return v1

    .line 321
    :pswitch_a1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    return v1

    .line 322
    :pswitch_a2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 323
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    return v1

    .line 324
    :pswitch_a3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 325
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    return v1

    .line 326
    :pswitch_a4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 327
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    return v1

    .line 328
    :pswitch_a5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 329
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    return v1

    .line 330
    :pswitch_a6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 331
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    return v1

    .line 332
    :pswitch_a7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 333
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    return v1

    .line 334
    :pswitch_a8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 335
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    return v1

    .line 336
    :pswitch_a9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 337
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    return v1

    .line 338
    :pswitch_aa
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    return v1

    .line 340
    :pswitch_ab
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 341
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    return v1

    .line 342
    :pswitch_ac
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 343
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    return v1

    .line 344
    :pswitch_ad
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 345
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    return v1

    .line 346
    :pswitch_ae
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 347
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    return v1

    .line 348
    :pswitch_af
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 349
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    return v1

    .line 350
    :pswitch_b0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 351
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    return v1

    .line 352
    :pswitch_b1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 353
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    return v1

    .line 354
    :pswitch_b2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 355
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    return v1

    .line 356
    :pswitch_b3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 357
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    return v1

    .line 358
    :pswitch_b4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    return v1

    .line 359
    :pswitch_b5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 360
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    return v1

    .line 361
    :pswitch_b6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 362
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    return v1

    .line 363
    :pswitch_b7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 364
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    return v1

    .line 365
    :pswitch_b8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    return v1

    .line 366
    :pswitch_b9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 367
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    return v1

    .line 368
    :pswitch_ba
    sget-object p0, Lcom/p1/mobile/putong/data/Connector;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 369
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/Connector;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    return v1

    .line 370
    :pswitch_bb
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 371
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    return v1

    .line 372
    :pswitch_bc
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 373
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    return v1

    .line 374
    :pswitch_bd
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 375
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    return v1

    .line 376
    :pswitch_be
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 377
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    return v1

    .line 378
    :pswitch_bf
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 379
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    return v1

    .line 380
    :pswitch_c0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 381
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    return v1

    .line 382
    :pswitch_c1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 383
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    return v1

    .line 384
    :pswitch_c2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 385
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    return v1

    .line 386
    :pswitch_c3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 387
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    return v1

    .line 388
    :pswitch_c4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 389
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    return v1

    .line 390
    :pswitch_c5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 391
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    return v1

    .line 392
    :pswitch_c6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    return v1

    .line 393
    :pswitch_c7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 394
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    return v1

    .line 395
    :pswitch_c8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 396
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    return v1

    .line 397
    :pswitch_c9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 398
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    return v1

    .line 399
    :pswitch_ca
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 400
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    return v1

    .line 401
    :pswitch_cb
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 402
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    return v1

    .line 403
    :pswitch_cc
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 404
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    return v1

    .line 405
    :pswitch_cd
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 406
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    return v1

    .line 407
    :pswitch_ce
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    return v1

    .line 408
    :pswitch_cf
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 409
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    return v1

    .line 410
    :pswitch_d0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 411
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    return v1

    .line 412
    :pswitch_d1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 413
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    return v1

    .line 414
    :pswitch_d2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 415
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    return v1

    .line 416
    :pswitch_d3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 417
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    return v1

    .line 418
    :pswitch_d4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 419
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    return v1

    .line 420
    :pswitch_d5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    return v1

    .line 421
    :pswitch_d6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 422
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    return v1

    .line 423
    :pswitch_d7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 424
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    return v1

    .line 425
    :pswitch_d8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 426
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    return v1

    .line 427
    :pswitch_d9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 428
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    return v1

    .line 429
    :pswitch_da
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 430
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    return v1

    .line 431
    :pswitch_db
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 432
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    return v1

    .line 433
    :pswitch_dc
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 434
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    return v1

    .line 435
    :pswitch_dd
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 436
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    return v1

    .line 437
    :pswitch_de
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 438
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    return v1

    .line 439
    :pswitch_df
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 440
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    return v1

    .line 441
    :pswitch_e0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 442
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    return v1

    .line 443
    :pswitch_e1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 444
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    return v1

    .line 445
    :pswitch_e2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 446
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    return v1

    .line 447
    :pswitch_e3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 448
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    return v1

    .line 449
    :pswitch_e4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 450
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    return v1

    .line 451
    :pswitch_e5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 452
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    return v1

    .line 453
    :pswitch_e6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 454
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    return v1

    .line 455
    :pswitch_e7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 456
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    return v1

    .line 457
    :pswitch_e8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 458
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    return v1

    .line 459
    :pswitch_e9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 460
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    return v1

    .line 461
    :pswitch_ea
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 462
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    return v1

    .line 463
    :pswitch_eb
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 464
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    return v1

    .line 465
    :pswitch_ec
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 466
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    return v1

    .line 467
    :pswitch_ed
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 468
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    return v1

    .line 469
    :pswitch_ee
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 470
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    return v1

    .line 471
    :pswitch_ef
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 472
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    return v1

    .line 473
    :pswitch_f0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 474
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    return v1

    .line 475
    :pswitch_f1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 476
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    return v1

    .line 477
    :pswitch_f2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 478
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    return v1

    .line 479
    :pswitch_f3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 480
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    return v1

    .line 481
    :pswitch_f4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 482
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    return v1

    .line 483
    :pswitch_f5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 484
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    return v1

    .line 485
    :pswitch_f6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 486
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    return v1

    .line 487
    :pswitch_f7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 488
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    return v1

    .line 489
    :pswitch_f8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 490
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    return v1

    .line 491
    :pswitch_f9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 492
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    return v1

    .line 493
    :pswitch_fa
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 494
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    return v1

    .line 495
    :pswitch_fb
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 496
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    return v1

    .line 497
    :pswitch_fc
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 498
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    return v1

    .line 499
    :pswitch_fd
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 500
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    return v1

    .line 501
    :pswitch_fe
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 502
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    return v1

    .line 503
    :pswitch_ff
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 504
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    return v1

    .line 505
    :pswitch_100
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 506
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    return v1

    .line 507
    :pswitch_101
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 508
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    return v1

    .line 509
    :pswitch_102
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 510
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    return v1

    .line 511
    :pswitch_103
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 512
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    return v1

    .line 513
    :pswitch_104
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 514
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    return v1

    .line 515
    :pswitch_105
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 516
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    return v1

    .line 517
    :pswitch_106
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 518
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    return v1

    .line 519
    :pswitch_107
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 520
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    return v1

    .line 521
    :pswitch_108
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 522
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    return v1

    .line 523
    :pswitch_109
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 524
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    return v1

    .line 525
    :pswitch_10a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 526
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    return v1

    .line 527
    :pswitch_10b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 528
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    return v1

    .line 529
    :pswitch_10c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 530
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    return v1

    .line 531
    :pswitch_10d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 532
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    return v1

    .line 533
    :pswitch_10e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 534
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    return v1

    .line 535
    :pswitch_10f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 536
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    return v1

    .line 537
    :pswitch_110
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 538
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    return v1

    .line 539
    :pswitch_111
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 540
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    return v1

    .line 541
    :pswitch_112
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 542
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    return v1

    .line 543
    :pswitch_113
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 544
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    return v1

    .line 545
    :pswitch_114
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 546
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    return v1

    .line 547
    :pswitch_115
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 548
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    return v1

    .line 549
    :pswitch_116
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 550
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    return v1

    .line 551
    :pswitch_117
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 552
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    return v1

    .line 553
    :pswitch_118
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 554
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    return v1

    .line 555
    :pswitch_119
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 556
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    return v1

    .line 557
    :pswitch_11a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 558
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    return v1

    .line 559
    :pswitch_11b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 560
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    return v1

    .line 561
    :pswitch_11c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 562
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    return v1

    .line 563
    :pswitch_11d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 564
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    return v1

    .line 565
    :pswitch_11e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 566
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    return v1

    .line 567
    :pswitch_11f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 568
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    return v1

    .line 569
    :pswitch_120
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 570
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    return v1

    .line 571
    :pswitch_121
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 572
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    return v1

    .line 573
    :pswitch_122
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 574
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    return v1

    .line 575
    :pswitch_123
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 576
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    return v1

    .line 577
    :pswitch_124
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 578
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    return v1

    .line 579
    :pswitch_125
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 580
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    return v1

    .line 581
    :pswitch_126
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 582
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    return v1

    .line 583
    :pswitch_127
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 584
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    return v1

    .line 585
    :pswitch_128
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 586
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    return v1

    .line 587
    :pswitch_129
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 588
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    return v1

    .line 589
    :pswitch_12a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 590
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    return v1

    .line 591
    :pswitch_12b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 592
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    return v1

    .line 593
    :pswitch_12c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 594
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    return v1

    .line 595
    :pswitch_12d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 596
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    return v1

    .line 597
    :pswitch_12e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 598
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    return v1

    .line 599
    :pswitch_12f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 600
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    return v1

    .line 601
    :pswitch_130
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 602
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7f1a8f51 -> :sswitch_130
        -0x7d34ca25 -> :sswitch_12f
        -0x7b494874 -> :sswitch_12e
        -0x7aaee531 -> :sswitch_12d
        -0x7a60e2ba -> :sswitch_12c
        -0x7a5ca78d -> :sswitch_12b
        -0x7a35262e -> :sswitch_12a
        -0x79e4b594 -> :sswitch_129
        -0x78e2f462 -> :sswitch_128
        -0x78a4a4e0 -> :sswitch_127
        -0x760bf3d4 -> :sswitch_126
        -0x752096ef -> :sswitch_125
        -0x738f22e7 -> :sswitch_124
        -0x71b167b1 -> :sswitch_123
        -0x716e9c8f -> :sswitch_122
        -0x71312465 -> :sswitch_121
        -0x6f27d9c7 -> :sswitch_120
        -0x6da0bec2 -> :sswitch_11f
        -0x6d544c7c -> :sswitch_11e
        -0x6c8eab11 -> :sswitch_11d
        -0x6c601a40 -> :sswitch_11c
        -0x6bc844df -> :sswitch_11b
        -0x69cba717 -> :sswitch_11a
        -0x6907132f -> :sswitch_119
        -0x686cdbe1 -> :sswitch_118
        -0x674e8246 -> :sswitch_117
        -0x64cb20c8 -> :sswitch_116
        -0x644ce9d6 -> :sswitch_115
        -0x633eb3ec -> :sswitch_114
        -0x62fb1da1 -> :sswitch_113
        -0x62bb0715 -> :sswitch_112
        -0x62654b63 -> :sswitch_111
        -0x62295431 -> :sswitch_110
        -0x61ddfe9e -> :sswitch_10f
        -0x61d60a5b -> :sswitch_10e
        -0x60bae571 -> :sswitch_10d
        -0x5ec9c02a -> :sswitch_10c
        -0x5d09e1d3 -> :sswitch_10b
        -0x5c369a5f -> :sswitch_10a
        -0x5beb7225 -> :sswitch_109
        -0x5bde103d -> :sswitch_108
        -0x5b5b750b -> :sswitch_107
        -0x5b04471a -> :sswitch_106
        -0x5814b856 -> :sswitch_105
        -0x58078e88 -> :sswitch_104
        -0x55ebcfef -> :sswitch_103
        -0x54456320 -> :sswitch_102
        -0x53bca2f9 -> :sswitch_101
        -0x52cfcf64 -> :sswitch_100
        -0x513fd11e -> :sswitch_ff
        -0x5062776a -> :sswitch_fe
        -0x4f0bae20 -> :sswitch_fd
        -0x4e5656dd -> :sswitch_fc
        -0x4e3643da -> :sswitch_fb
        -0x4d57b14d -> :sswitch_fa
        -0x4cdf27d3 -> :sswitch_f9
        -0x4c67a49c -> :sswitch_f8
        -0x4c0d3ff9 -> :sswitch_f7
        -0x4bec6a55 -> :sswitch_f6
        -0x4b215b69 -> :sswitch_f5
        -0x4a819aca -> :sswitch_f4
        -0x4977bfe4 -> :sswitch_f3
        -0x48996f12 -> :sswitch_f2
        -0x4859a411 -> :sswitch_f1
        -0x480f5efb -> :sswitch_f0
        -0x46ca2ceb -> :sswitch_ef
        -0x4683e76b -> :sswitch_ee
        -0x459542cd -> :sswitch_ed
        -0x446f9b2d -> :sswitch_ec
        -0x40c86c34 -> :sswitch_eb
        -0x40c00ead -> :sswitch_ea
        -0x4043c63a -> :sswitch_e9
        -0x40418fa4 -> :sswitch_e8
        -0x401792ba -> :sswitch_e7
        -0x3fc1bc6e -> :sswitch_e6
        -0x3f17d0da -> :sswitch_e5
        -0x3ec80f4c -> :sswitch_e4
        -0x3e81eb98 -> :sswitch_e3
        -0x3dd0d52e -> :sswitch_e2
        -0x3ce3f1c7 -> :sswitch_e1
        -0x3cbd6030 -> :sswitch_e0
        -0x3cab2401 -> :sswitch_df
        -0x3afbd067 -> :sswitch_de
        -0x3ad44ff7 -> :sswitch_dd
        -0x3a63b86b -> :sswitch_dc
        -0x38acb63d -> :sswitch_db
        -0x3860ea76 -> :sswitch_da
        -0x38571c2a -> :sswitch_d9
        -0x377f7e29 -> :sswitch_d8
        -0x3779cc5e -> :sswitch_d7
        -0x3740781e -> :sswitch_d6
        -0x361eca5f -> :sswitch_d5
        -0x35398967 -> :sswitch_d4
        -0x33bd26dc -> :sswitch_d3
        -0x3386ed64 -> :sswitch_d2
        -0x336a6ba2 -> :sswitch_d1
        -0x32fe9007 -> :sswitch_d0
        -0x32bf84fd -> :sswitch_cf
        -0x329e6bdf -> :sswitch_ce
        -0x31c1ab6d -> :sswitch_cd
        -0x3050ca6f -> :sswitch_cc
        -0x3031f195 -> :sswitch_cb
        -0x2db69065 -> :sswitch_ca
        -0x2d679a37 -> :sswitch_c9
        -0x2ceaca16 -> :sswitch_c8
        -0x2c5455ab -> :sswitch_c7
        -0x2c104b81 -> :sswitch_c6
        -0x2c0da3c4 -> :sswitch_c5
        -0x2b5d0678 -> :sswitch_c4
        -0x2abacea2 -> :sswitch_c3
        -0x295e3fe0 -> :sswitch_c2
        -0x29585e32 -> :sswitch_c1
        -0x282a9f3d -> :sswitch_c0
        -0x27e069fa -> :sswitch_bf
        -0x2581be3d -> :sswitch_be
        -0x2541da98 -> :sswitch_bd
        -0x2405c99f -> :sswitch_bc
        -0x22fbbd07 -> :sswitch_bb
        -0x22860bb3 -> :sswitch_ba
        -0x225d6678 -> :sswitch_b9
        -0x222f2b81 -> :sswitch_b8
        -0x1fee7840 -> :sswitch_b7
        -0x1f0608ec -> :sswitch_b6
        -0x1e5de057 -> :sswitch_b5
        -0x1d7c530a -> :sswitch_b4
        -0x1c9ecb87 -> :sswitch_b3
        -0x1c41c41d -> :sswitch_b2
        -0x1ae8adb1 -> :sswitch_b1
        -0x19989f30 -> :sswitch_b0
        -0x187a7478 -> :sswitch_af
        -0x1743be4d -> :sswitch_ae
        -0x141a274c -> :sswitch_ad
        -0x13463a0d -> :sswitch_ac
        -0x10c26a47 -> :sswitch_ab
        -0xcfe3c23 -> :sswitch_aa
        -0x937eee5 -> :sswitch_a9
        -0x6d04e3e -> :sswitch_a8
        -0x5b1b212 -> :sswitch_a7
        -0x22d1a0c -> :sswitch_a6
        -0x1279539 -> :sswitch_a5
        -0x7f4a9f -> :sswitch_a4
        -0x7e950e -> :sswitch_a3
        0x1b1d8 -> :sswitch_a2
        0x2eaded -> :sswitch_a1
        0x304bf2 -> :sswitch_a0
        0x1309eef -> :sswitch_9f
        0x19e297b -> :sswitch_9e
        0x1cfba61 -> :sswitch_9d
        0x20be88c -> :sswitch_9c
        0x342aadf -> :sswitch_9b
        0x433c55e -> :sswitch_9a
        0x5a0d1d5 -> :sswitch_99
        0x5a2a351 -> :sswitch_98
        0x5e21ea5 -> :sswitch_97
        0x6236d07 -> :sswitch_96
        0x62dd707 -> :sswitch_95
        0x62f6fe4 -> :sswitch_94
        0x677c21c -> :sswitch_93
        0x67a9af8 -> :sswitch_92
        0x686ca96 -> :sswitch_91
        0x6907b8e -> :sswitch_90
        0x6a68e08 -> :sswitch_8f
        0x71d1df3 -> :sswitch_8e
        0x758e666 -> :sswitch_8d
        0x7efa0e2 -> :sswitch_8c
        0x8f58342 -> :sswitch_8b
        0x995a230 -> :sswitch_8a
        0x9f01790 -> :sswitch_89
        0xc6f66b2 -> :sswitch_88
        0xce67646 -> :sswitch_87
        0xd1d7feb -> :sswitch_86
        0xdeed4ca -> :sswitch_85
        0xf825c40 -> :sswitch_84
        0x106dc309 -> :sswitch_83
        0x127496a5 -> :sswitch_82
        0x12ceaffc -> :sswitch_81
        0x13012737 -> :sswitch_80
        0x144d8a36 -> :sswitch_7f
        0x149b4fa4 -> :sswitch_7e
        0x14f51cd8 -> :sswitch_7d
        0x1511b96a -> :sswitch_7c
        0x1522af8f -> :sswitch_7b
        0x15d3fc48 -> :sswitch_7a
        0x18f40ce0 -> :sswitch_79
        0x1927979a -> :sswitch_78
        0x197c592a -> :sswitch_77
        0x19f45fb5 -> :sswitch_76
        0x1c2a513b -> :sswitch_75
        0x1c6a5c8b -> :sswitch_74
        0x1c6b1cc9 -> :sswitch_73
        0x20cac4ca -> :sswitch_72
        0x211a9c0f -> :sswitch_71
        0x2166369b -> :sswitch_70
        0x21b14f02 -> :sswitch_6f
        0x23301f5b -> :sswitch_6e
        0x25f9b144 -> :sswitch_6d
        0x264e7e33 -> :sswitch_6c
        0x26b8d311 -> :sswitch_6b
        0x2929509e -> :sswitch_6a
        0x2b4284c0 -> :sswitch_69
        0x2b7ac466 -> :sswitch_68
        0x2d32d4a8 -> :sswitch_67
        0x2d645ad4 -> :sswitch_66
        0x2ed79954 -> :sswitch_65
        0x2fa4ad41 -> :sswitch_64
        0x303c3c8f -> :sswitch_63
        0x329fcba2 -> :sswitch_62
        0x33ad295a -> :sswitch_61
        0x375686c2 -> :sswitch_60
        0x3790c6ea -> :sswitch_5f
        0x388ec919 -> :sswitch_5e
        0x38e81150 -> :sswitch_5d
        0x3a05561e -> :sswitch_5c
        0x3b89dd14 -> :sswitch_5b
        0x3d0b3484 -> :sswitch_5a
        0x3d26c13c -> :sswitch_59
        0x3e70d9d7 -> :sswitch_58
        0x3ec60f85 -> :sswitch_57
        0x3f899762 -> :sswitch_56
        0x40871e42 -> :sswitch_55
        0x41a823a4 -> :sswitch_54
        0x429ed935 -> :sswitch_53
        0x4389c860 -> :sswitch_52
        0x43b6a993 -> :sswitch_51
        0x45c119ff -> :sswitch_50
        0x4678c7c2 -> :sswitch_4f
        0x475f80b9 -> :sswitch_4e
        0x47968c49 -> :sswitch_4d
        0x47c1330c -> :sswitch_4c
        0x48070a24 -> :sswitch_4b
        0x48c8e4a5 -> :sswitch_4a
        0x48e8681c -> :sswitch_49
        0x4934edb8 -> :sswitch_48
        0x4a07bd06 -> :sswitch_47
        0x4abcb313 -> :sswitch_46
        0x4d7465f9 -> :sswitch_45
        0x4dac082d -> :sswitch_44
        0x4f68b09e -> :sswitch_43
        0x4f6b6673 -> :sswitch_42
        0x500060c3 -> :sswitch_41
        0x50d5f503 -> :sswitch_40
        0x5266433c -> :sswitch_3f
        0x53d67514 -> :sswitch_3e
        0x55aceeb0 -> :sswitch_3d
        0x568dbc23 -> :sswitch_3c
        0x56c76c09 -> :sswitch_3b
        0x585891f9 -> :sswitch_3a
        0x5884599e -> :sswitch_39
        0x58c335a0 -> :sswitch_38
        0x58c8763d -> :sswitch_37
        0x59cb9919 -> :sswitch_36
        0x5abce8c9 -> :sswitch_35
        0x5ad2d9b8 -> :sswitch_34
        0x5afef33e -> :sswitch_33
        0x5c0b66f1 -> :sswitch_32
        0x5c2f0a4c -> :sswitch_31
        0x5de0db35 -> :sswitch_30
        0x5ef50265 -> :sswitch_2f
        0x5fa873b4 -> :sswitch_2e
        0x5ff3a0b7 -> :sswitch_2d
        0x5ffdcf94 -> :sswitch_2c
        0x603ed8a6 -> :sswitch_2b
        0x60c88f53 -> :sswitch_2a
        0x620123d0 -> :sswitch_29
        0x639f90d4 -> :sswitch_28
        0x63aeae5e -> :sswitch_27
        0x661f416f -> :sswitch_26
        0x66208d5f -> :sswitch_25
        0x671db106 -> :sswitch_24
        0x67a729d2 -> :sswitch_23
        0x682d62d7 -> :sswitch_22
        0x686679d7 -> :sswitch_21
        0x69bc67fa -> :sswitch_20
        0x69ebb08d -> :sswitch_1f
        0x6aef12cb -> :sswitch_1e
        0x6bca7162 -> :sswitch_1d
        0x6ce43a77 -> :sswitch_1c
        0x6eadcd03 -> :sswitch_1b
        0x6ed5923c -> :sswitch_1a
        0x6ee9358b -> :sswitch_19
        0x6f0696a0 -> :sswitch_18
        0x6f2c29b8 -> :sswitch_17
        0x6fa0b150 -> :sswitch_16
        0x7183c3da -> :sswitch_15
        0x7196cfe3 -> :sswitch_14
        0x71ea183f -> :sswitch_13
        0x71ed1624 -> :sswitch_12
        0x71ee7ecd -> :sswitch_11
        0x728a2161 -> :sswitch_10
        0x7297ed7e -> :sswitch_f
        0x759726f8 -> :sswitch_e
        0x77957da1 -> :sswitch_d
        0x786f7629 -> :sswitch_c
        0x7879f816 -> :sswitch_b
        0x78cd8dad -> :sswitch_a
        0x791072f6 -> :sswitch_9
        0x7b0240f5 -> :sswitch_8
        0x7b8c1c44 -> :sswitch_7
        0x7cddcc60 -> :sswitch_6
        0x7d3b846f -> :sswitch_5
        0x7d7f5954 -> :sswitch_4
        0x7dc24871 -> :sswitch_3
        0x7eb8ab6b -> :sswitch_2
        0x7f8da617 -> :sswitch_1
        0x7fc103bb -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_130
        :pswitch_12f
        :pswitch_12e
        :pswitch_12d
        :pswitch_12c
        :pswitch_12b
        :pswitch_12a
        :pswitch_129
        :pswitch_128
        :pswitch_127
        :pswitch_126
        :pswitch_125
        :pswitch_124
        :pswitch_123
        :pswitch_122
        :pswitch_121
        :pswitch_120
        :pswitch_11f
        :pswitch_11e
        :pswitch_11d
        :pswitch_11c
        :pswitch_11b
        :pswitch_11a
        :pswitch_119
        :pswitch_118
        :pswitch_117
        :pswitch_116
        :pswitch_115
        :pswitch_114
        :pswitch_113
        :pswitch_112
        :pswitch_111
        :pswitch_110
        :pswitch_10f
        :pswitch_10e
        :pswitch_10d
        :pswitch_10c
        :pswitch_10b
        :pswitch_10a
        :pswitch_109
        :pswitch_108
        :pswitch_107
        :pswitch_106
        :pswitch_105
        :pswitch_104
        :pswitch_103
        :pswitch_102
        :pswitch_101
        :pswitch_100
        :pswitch_ff
        :pswitch_fe
        :pswitch_fd
        :pswitch_fc
        :pswitch_fb
        :pswitch_fa
        :pswitch_f9
        :pswitch_f8
        :pswitch_f7
        :pswitch_f6
        :pswitch_f5
        :pswitch_f4
        :pswitch_f3
        :pswitch_f2
        :pswitch_f1
        :pswitch_f0
        :pswitch_ef
        :pswitch_ee
        :pswitch_ed
        :pswitch_ec
        :pswitch_eb
        :pswitch_ea
        :pswitch_e9
        :pswitch_e8
        :pswitch_e7
        :pswitch_e6
        :pswitch_e5
        :pswitch_e4
        :pswitch_e3
        :pswitch_e2
        :pswitch_e1
        :pswitch_e0
        :pswitch_df
        :pswitch_de
        :pswitch_dd
        :pswitch_dc
        :pswitch_db
        :pswitch_da
        :pswitch_d9
        :pswitch_d8
        :pswitch_d7
        :pswitch_d6
        :pswitch_d5
        :pswitch_d4
        :pswitch_d3
        :pswitch_d2
        :pswitch_d1
        :pswitch_d0
        :pswitch_cf
        :pswitch_ce
        :pswitch_cd
        :pswitch_cc
        :pswitch_cb
        :pswitch_ca
        :pswitch_c9
        :pswitch_c8
        :pswitch_c7
        :pswitch_c6
        :pswitch_c5
        :pswitch_c4
        :pswitch_c3
        :pswitch_c2
        :pswitch_c1
        :pswitch_c0
        :pswitch_bf
        :pswitch_be
        :pswitch_bd
        :pswitch_bc
        :pswitch_bb
        :pswitch_ba
        :pswitch_b9
        :pswitch_b8
        :pswitch_b7
        :pswitch_b6
        :pswitch_b5
        :pswitch_b4
        :pswitch_b3
        :pswitch_b2
        :pswitch_b1
        :pswitch_b0
        :pswitch_af
        :pswitch_ae
        :pswitch_ad
        :pswitch_ac
        :pswitch_ab
        :pswitch_aa
        :pswitch_a9
        :pswitch_a8
        :pswitch_a7
        :pswitch_a6
        :pswitch_a5
        :pswitch_a4
        :pswitch_a3
        :pswitch_a2
        :pswitch_a1
        :pswitch_a0
        :pswitch_9f
        :pswitch_9e
        :pswitch_9d
        :pswitch_9c
        :pswitch_9b
        :pswitch_9a
        :pswitch_99
        :pswitch_98
        :pswitch_97
        :pswitch_96
        :pswitch_95
        :pswitch_94
        :pswitch_93
        :pswitch_92
        :pswitch_91
        :pswitch_90
        :pswitch_8f
        :pswitch_8e
        :pswitch_8d
        :pswitch_8c
        :pswitch_8b
        :pswitch_8a
        :pswitch_89
        :pswitch_88
        :pswitch_87
        :pswitch_86
        :pswitch_85
        :pswitch_84
        :pswitch_83
        :pswitch_82
        :pswitch_81
        :pswitch_80
        :pswitch_7f
        :pswitch_7e
        :pswitch_7d
        :pswitch_7c
        :pswitch_7b
        :pswitch_7a
        :pswitch_79
        :pswitch_78
        :pswitch_77
        :pswitch_76
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
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

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 603
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveData$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    if-eqz p0, :cond_0

    .line 2
    const-string p0, "users"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    if-eqz p0, :cond_1

    .line 5
    const-string p0, "relationships"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/data/Relationship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 7
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    if-eqz p0, :cond_2

    .line 8
    const-string p0, "verifications"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    const/4 v0, 0x1

    if-eqz p0, :cond_3

    .line 11
    const-string p0, "monetizationConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 13
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    if-eqz p0, :cond_4

    .line 14
    const-string p0, "members"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 16
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    if-eqz p0, :cond_5

    .line 17
    const-string p0, "anchors"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 19
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    if-eqz p0, :cond_6

    .line 20
    const-string p0, "rooms"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 22
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    if-eqz p0, :cond_7

    .line 23
    const-string p0, "lives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 25
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    if-eqz p0, :cond_8

    .line 26
    const-string p0, "liveSummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 28
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    if-eqz p0, :cond_9

    .line 29
    const-string p0, "givenGiftRes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 30
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 31
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    if-eqz p0, :cond_a

    .line 32
    const-string p0, "liveChatMessages"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 34
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    if-eqz p0, :cond_b

    .line 35
    const-string p0, "liveSquareSummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 37
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    if-eqz p0, :cond_c

    .line 38
    const-string p0, "liveActivitySummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 40
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    if-eqz p0, :cond_d

    .line 41
    const-string p0, "liveActivities"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 43
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    if-eqz p0, :cond_e

    .line 44
    const-string p0, "managers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 46
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    if-eqz p0, :cond_f

    .line 47
    const-string p0, "menuItems"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 48
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 49
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    if-eqz p0, :cond_10

    .line 50
    const-string p0, "liveCampaigns"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 52
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    if-eqz p0, :cond_11

    .line 53
    const-string p0, "liveHierarchyGrades"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 55
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    if-eqz p0, :cond_12

    .line 56
    const-string p0, "chatTips"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 58
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    if-eqz p0, :cond_13

    .line 59
    const-string p0, "livePushes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePush;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 61
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    if-eqz p0, :cond_14

    .line 62
    const-string p0, "giftItemCDN"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 63
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    if-eqz p0, :cond_15

    .line 65
    const-string p0, "liveRoomTabGifts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 67
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    if-eqz p0, :cond_16

    .line 68
    const-string p0, "followships"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/Followship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 70
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    if-eqz p0, :cond_17

    .line 71
    const-string p0, "firstChargeCampaigns"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 72
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 73
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    if-eqz p0, :cond_18

    .line 74
    const-string p0, "leaderboards"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 76
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    if-eqz p0, :cond_19

    .line 77
    const-string p0, "startLivePageCampaigns"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 78
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 79
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    if-eqz p0, :cond_1a

    .line 80
    const-string p0, "hourLeaderboard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 81
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 82
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    if-eqz p0, :cond_1b

    .line 83
    const-string p0, "momentConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 85
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    if-eqz p0, :cond_1c

    .line 86
    const-string p0, "treasureBox"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 87
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 88
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    if-eqz p0, :cond_1d

    .line 89
    const-string p0, "videoQualities"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 91
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    if-eqz p0, :cond_1e

    .line 92
    const-string p0, "liveAssets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 93
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 94
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    if-eqz p0, :cond_1f

    .line 95
    const-string p0, "anchorHierarchyGrades"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 96
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 97
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    if-eqz p0, :cond_20

    .line 98
    const-string p0, "givenGiftRemindConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 99
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 100
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    if-eqz p0, :cond_21

    .line 101
    const-string p0, "liveStickerTemplatesMetadata"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 102
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 103
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    if-eqz p0, :cond_22

    .line 104
    const-string p0, "liveStickerTemplates"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 106
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    if-eqz p0, :cond_23

    .line 107
    const-string p0, "liveStickers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 108
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 109
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    if-eqz p0, :cond_24

    .line 110
    const-string p0, "pkSeeks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 112
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    if-eqz p0, :cond_25

    .line 113
    const-string p0, "pkInvites"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 115
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    if-eqz p0, :cond_26

    .line 116
    const-string p0, "pks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 117
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 118
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    if-eqz p0, :cond_27

    .line 119
    const-string p0, "liveResources"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 120
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 121
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    if-eqz p0, :cond_28

    .line 122
    const-string p0, "fanbases"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 124
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    if-eqz p0, :cond_29

    .line 125
    const-string p0, "fanbaseDetails"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 126
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 127
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    if-eqz p0, :cond_2a

    .line 128
    const-string p0, "tasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 129
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 130
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    if-eqz p0, :cond_2b

    .line 131
    const-string p0, "taskSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 132
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 133
    :cond_2b
    const-string p0, "version"

    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 134
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    if-eqz p0, :cond_2c

    .line 135
    const-string p0, "fanbaseMedalPanel"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 136
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 137
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    if-eqz p0, :cond_2d

    .line 138
    const-string p0, "grabRedPacketInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 139
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 140
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    if-eqz p0, :cond_2e

    .line 141
    const-string p0, "redPacketGrabResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 142
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 143
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    if-eqz p0, :cond_2f

    .line 144
    const-string p0, "fanbaseRelations"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 145
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 146
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    if-eqz p0, :cond_30

    .line 147
    const-string p0, "fanbaseHierarchies"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 148
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 149
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    if-eqz p0, :cond_31

    .line 150
    const-string p0, "fanbaseMedals"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 151
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 152
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    if-eqz p0, :cond_32

    .line 153
    const-string p0, "records"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 154
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 155
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz p0, :cond_33

    .line 156
    const-string p0, "anchorFanbaseMedal"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 157
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 158
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    if-eqz p0, :cond_34

    .line 159
    const-string p0, "medals"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 160
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 161
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    if-eqz p0, :cond_35

    .line 162
    const-string p0, "leaderboardUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 163
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 164
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    if-eqz p0, :cond_36

    .line 165
    const-string p0, "fanbaseRedPacketEventCounters"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 166
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 167
    :cond_36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    if-eqz p0, :cond_37

    .line 168
    const-string p0, "calls"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 170
    :cond_37
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    if-eqz p0, :cond_38

    .line 171
    const-string p0, "callInvites"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 172
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 173
    :cond_38
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    if-eqz p0, :cond_39

    .line 174
    const-string p0, "rtcTokens"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 175
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 176
    :cond_39
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    if-eqz p0, :cond_3a

    .line 177
    const-string p0, "callSummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 179
    :cond_3a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    if-eqz p0, :cond_3b

    .line 180
    const-string p0, "hierarchies"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 181
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 182
    :cond_3b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    if-eqz p0, :cond_3c

    .line 183
    const-string p0, "userEnterRoomEffects"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 184
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 185
    :cond_3c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    if-eqz p0, :cond_3d

    .line 186
    const-string p0, "bottomMenu"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 187
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 188
    :cond_3d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    if-eqz p0, :cond_3e

    .line 189
    const-string p0, "connector"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 190
    sget-object p0, Lcom/p1/mobile/putong/data/Connector;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 191
    :cond_3e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    if-eqz p0, :cond_3f

    .line 192
    const-string p0, "userProfileConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 193
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 194
    :cond_3f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    if-eqz p0, :cond_40

    .line 195
    const-string p0, "turboCardInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 196
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 197
    :cond_40
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    if-eqz p0, :cond_41

    .line 198
    const-string p0, "voiceCalls"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 199
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 200
    :cond_41
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    if-eqz p0, :cond_42

    .line 201
    const-string p0, "voiceCallInvites"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 202
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 203
    :cond_42
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    if-eqz p0, :cond_43

    .line 204
    const-string p0, "voiceCallSummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 205
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 206
    :cond_43
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    if-eqz p0, :cond_44

    .line 207
    const-string p0, "voiceRooms"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 208
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 209
    :cond_44
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    if-eqz p0, :cond_45

    .line 210
    const-string p0, "voiceLives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 211
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 212
    :cond_45
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    if-eqz p0, :cond_46

    .line 213
    const-string p0, "topics"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 214
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 215
    :cond_46
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    if-eqz p0, :cond_47

    .line 216
    const-string p0, "voiceLiveSummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 217
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 218
    :cond_47
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    if-eqz p0, :cond_48

    .line 219
    const-string p0, "right"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 220
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 221
    :cond_48
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    if-eqz p0, :cond_49

    .line 222
    const-string p0, "rightBindAnchors"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 223
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 224
    :cond_49
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    if-eqz p0, :cond_4a

    .line 225
    const-string p0, "liveOperation"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 226
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 227
    :cond_4a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    if-eqz p0, :cond_4b

    .line 228
    const-string p0, "voiceLivesSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 229
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 230
    :cond_4b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    if-eqz p0, :cond_4c

    .line 231
    const-string p0, "voiceRoomTagInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 232
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 233
    :cond_4c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    if-eqz p0, :cond_4d

    .line 234
    const-string p0, "giftStar"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 235
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 236
    :cond_4d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    if-eqz p0, :cond_4e

    .line 237
    const-string p0, "advancedTasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 238
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 239
    :cond_4e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    if-eqz p0, :cond_4f

    .line 240
    const-string p0, "knightsInfosSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 241
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 242
    :cond_4f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    if-eqz p0, :cond_50

    .line 243
    const-string p0, "userKnightInfosSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 244
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 245
    :cond_50
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    if-eqz p0, :cond_51

    .line 246
    const-string p0, "knightsRuleInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 247
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 248
    :cond_51
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    if-eqz p0, :cond_52

    .line 249
    const-string p0, "anchorKnightInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 250
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 251
    :cond_52
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    if-eqz p0, :cond_53

    .line 252
    const-string p0, "slotInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 253
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 254
    :cond_53
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    if-eqz p0, :cond_54

    .line 255
    const-string p0, "equippedGift"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 256
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 257
    :cond_54
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    if-eqz p0, :cond_55

    .line 258
    const-string p0, "masks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 259
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 260
    :cond_55
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    if-eqz p0, :cond_56

    .line 261
    const-string p0, "chatSettings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 262
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 263
    :cond_56
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    if-eqz p0, :cond_57

    .line 264
    const-string p0, "voiceLiveGames"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 265
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 266
    :cond_57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    if-eqz p0, :cond_58

    .line 267
    const-string p0, "pkAssets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 268
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 269
    :cond_58
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    if-eqz p0, :cond_59

    .line 270
    const-string p0, "privacyPrivilege"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 271
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 272
    :cond_59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    if-eqz p0, :cond_5a

    .line 273
    const-string p0, "fakeUser"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 274
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 275
    :cond_5a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    if-eqz p0, :cond_5b

    .line 276
    const-string p0, "mysteryConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 277
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 278
    :cond_5b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    if-eqz p0, :cond_5c

    .line 279
    const-string p0, "fakeUserProfiles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 280
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 281
    :cond_5c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    if-eqz p0, :cond_5d

    .line 282
    const-string p0, "pkSummaries"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 283
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 284
    :cond_5d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    if-eqz p0, :cond_5e

    .line 285
    const-string p0, "previews"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 286
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 287
    :cond_5e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    if-eqz p0, :cond_5f

    .line 288
    const-string p0, "videoLiveBulletCommentTypes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 289
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 290
    :cond_5f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-eqz p0, :cond_60

    .line 291
    const-string p0, "videoLiveBulletComment"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 292
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 293
    :cond_60
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    if-eqz p0, :cond_61

    .line 294
    const-string p0, "userLiveRightResources"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 295
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 296
    :cond_61
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    if-eqz p0, :cond_62

    .line 297
    const-string p0, "voiceUserProfileConfigs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 298
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 299
    :cond_62
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    if-eqz p0, :cond_63

    .line 300
    const-string p0, "giftShowcaseItems"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 301
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 302
    :cond_63
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    if-eqz p0, :cond_64

    .line 303
    const-string p0, "accompanyTaskSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 304
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 305
    :cond_64
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    if-eqz p0, :cond_65

    .line 306
    const-string p0, "accompanyTasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 307
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 308
    :cond_65
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    if-eqz p0, :cond_66

    .line 309
    const-string p0, "accompanyTaskProgress"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 310
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 311
    :cond_66
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    if-eqz p0, :cond_67

    .line 312
    const-string p0, "giftSetInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 313
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 314
    :cond_67
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    if-eqz p0, :cond_68

    .line 315
    const-string p0, "scrapTabs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 316
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 317
    :cond_68
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    if-eqz p0, :cond_69

    .line 318
    const-string p0, "givenGiftRemindStatus"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 319
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 320
    :cond_69
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    if-eqz p0, :cond_6a

    .line 321
    const-string p0, "userLiveHierarchy"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 322
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 323
    :cond_6a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    if-eqz p0, :cond_6b

    .line 324
    const-string p0, "chestRewardInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 325
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 326
    :cond_6b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    if-eqz p0, :cond_6c

    .line 327
    const-string p0, "signInDetails"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 328
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 329
    :cond_6c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    if-eqz p0, :cond_6d

    .line 330
    const-string p0, "signInPrizes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 331
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 332
    :cond_6d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    if-eqz p0, :cond_6e

    .line 333
    const-string p0, "liveBeautyConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 334
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 335
    :cond_6e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    if-eqz p0, :cond_6f

    .line 336
    const-string p0, "voiceUserFeedInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 337
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 338
    :cond_6f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    if-eqz p0, :cond_70

    .line 339
    const-string p0, "userLiveHierarchyProgress"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 340
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 341
    :cond_70
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    if-eqz p0, :cond_71

    .line 342
    const-string p0, "teenagerLives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 343
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 344
    :cond_71
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    if-eqz p0, :cond_72

    .line 345
    const-string v1, "gameInfoResponse"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    :cond_72
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    if-eqz p0, :cond_73

    .line 347
    const-string p0, "signInAchievementMedals"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 348
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 349
    :cond_73
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    if-eqz p0, :cond_74

    .line 350
    const-string p0, "guardAnchorRankInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 351
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 352
    :cond_74
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    if-eqz p0, :cond_75

    .line 353
    const-string p0, "guardRecords"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 354
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 355
    :cond_75
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    if-eqz p0, :cond_76

    .line 356
    const-string p0, "userDailyTasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 357
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 358
    :cond_76
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    if-eqz p0, :cond_77

    .line 359
    const-string p0, "anchorDailyTasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 360
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 361
    :cond_77
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    if-eqz p0, :cond_78

    .line 362
    const-string p0, "stormComment"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 363
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 364
    :cond_78
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    if-eqz p0, :cond_79

    .line 365
    const-string p0, "liveResourcesCDN"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 366
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 367
    :cond_79
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    if-eqz p0, :cond_7a

    .line 368
    const-string p0, "voiceLiveAssert"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 369
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 370
    :cond_7a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    if-eqz p0, :cond_7b

    .line 371
    const-string p0, "firstRechargeStatus"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 372
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 373
    :cond_7b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    if-eqz p0, :cond_7c

    .line 374
    const-string p0, "firstRechargeDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 375
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 376
    :cond_7c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    if-eqz p0, :cond_7d

    .line 377
    const-string p0, "voiceTabs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 378
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 379
    :cond_7d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    if-eqz p0, :cond_7e

    .line 380
    const-string p0, "shareItems"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 381
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 382
    :cond_7e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    if-eqz p0, :cond_7f

    .line 383
    const-string p0, "voiceRoomFeeds"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 384
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 385
    :cond_7f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    if-eqz p0, :cond_80

    .line 386
    const-string p0, "skins"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 387
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 388
    :cond_80
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    if-eqz p0, :cond_81

    .line 389
    const-string p0, "voiceChatGroup"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 390
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 391
    :cond_81
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    if-eqz p0, :cond_82

    .line 392
    const-string p0, "voiceChatGroupApplies"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 393
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 394
    :cond_82
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    if-eqz p0, :cond_83

    .line 395
    const-string p0, "voiceManagerInvites"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 396
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 397
    :cond_83
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    if-eqz p0, :cond_84

    .line 398
    const-string p0, "voiceManagers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 399
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 400
    :cond_84
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    if-eqz p0, :cond_85

    .line 401
    const-string p0, "multiCalls"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 402
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 403
    :cond_85
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    if-eqz p0, :cond_86

    .line 404
    const-string p0, "multiCallAsset"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 405
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 406
    :cond_86
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    if-eqz p0, :cond_87

    .line 407
    const-string p0, "multiCallInvites"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 408
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 409
    :cond_87
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    if-eqz p0, :cond_88

    .line 410
    const-string p0, "multiCallSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 411
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 412
    :cond_88
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    if-eqz p0, :cond_89

    .line 413
    const-string p0, "activitySuggests"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 414
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 415
    :cond_89
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    if-eqz p0, :cond_8a

    .line 416
    const-string p0, "fanbaseRecall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 417
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 418
    :cond_8a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    if-eqz p0, :cond_8b

    .line 419
    const-string p0, "accompanyUserRanking"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 420
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 421
    :cond_8b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    if-eqz p0, :cond_8c

    .line 422
    const-string p0, "sparkletProgress"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 423
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 424
    :cond_8c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    if-eqz p0, :cond_8d

    .line 425
    const-string p0, "liveAnchors"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 426
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 427
    :cond_8d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    if-eqz p0, :cond_8e

    .line 428
    const-string p0, "suggestedLives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 429
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 430
    :cond_8e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    if-eqz p0, :cond_8f

    .line 431
    const-string p0, "liveSchemas"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 432
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 433
    :cond_8f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    if-eqz p0, :cond_90

    .line 434
    const-string p0, "userLivePush"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 435
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePush;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 436
    :cond_90
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    if-eqz p0, :cond_91

    .line 437
    const-string p0, "touchMeDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 438
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 439
    :cond_91
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    if-eqz p0, :cond_92

    .line 440
    const-string p0, "multiCallSwitchToLeadRoleInvite"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 441
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 442
    :cond_92
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    if-eqz p0, :cond_93

    .line 443
    const-string p0, "multiCallExtends"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 444
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 445
    :cond_93
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz p0, :cond_94

    .line 446
    const-string p0, "scoreSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 447
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 448
    :cond_94
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    if-eqz p0, :cond_95

    .line 449
    const-string p0, "liveTopChatMessage"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 450
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 451
    :cond_95
    const-string p0, "needTitle"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 452
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    if-eqz p0, :cond_96

    .line 453
    const-string p0, "squareEntranceSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 454
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 455
    :cond_96
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    if-eqz p0, :cond_97

    .line 456
    const-string p0, "memberActivityList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 457
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 458
    :cond_97
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    if-eqz p0, :cond_98

    .line 459
    const-string p0, "voiceLiveActivityMoment"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 460
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 461
    :cond_98
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    if-eqz p0, :cond_99

    .line 462
    const-string p0, "roomAnnouncement"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 463
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 464
    :cond_99
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    if-eqz p0, :cond_9a

    .line 465
    const-string p0, "voiceLiveUserHeartbeatRewardList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 466
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 467
    :cond_9a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    if-eqz p0, :cond_9b

    .line 468
    const-string p0, "voiceLiveHeartBeat"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 469
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 470
    :cond_9b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    if-eqz p0, :cond_9c

    .line 471
    const-string p0, "liveStickerTemplatesGifts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 472
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 473
    :cond_9c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    if-eqz p0, :cond_9d

    .line 474
    const-string p0, "voiceLivePopsTotal"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 475
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 476
    :cond_9d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    if-eqz p0, :cond_9e

    .line 477
    const-string p0, "grabHatGame"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 478
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 479
    :cond_9e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    if-eqz p0, :cond_9f

    .line 480
    const-string p0, "grabHatCps"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 481
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 482
    :cond_9f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    if-eqz p0, :cond_a0

    .line 483
    const-string p0, "voiceLiveAuctions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 484
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 485
    :cond_a0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    if-eqz p0, :cond_a1

    .line 486
    const-string p0, "cpRecommendUserList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 487
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 488
    :cond_a1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    if-eqz p0, :cond_a2

    .line 489
    const-string p0, "voiceCpLeaderBoards"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 490
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 491
    :cond_a2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    if-eqz p0, :cond_a3

    .line 492
    const-string p0, "voiceCpHouseTaskInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 493
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 494
    :cond_a3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    if-eqz p0, :cond_a4

    .line 495
    const-string p0, "voiceCpHouseInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 496
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 497
    :cond_a4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    if-eqz p0, :cond_a5

    .line 498
    const-string p0, "voiceCpHouseList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 499
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 500
    :cond_a5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    if-eqz p0, :cond_a6

    .line 501
    const-string p0, "voiceHouseRankUpgradeInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 502
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 503
    :cond_a6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    if-eqz p0, :cond_a7

    .line 504
    const-string p0, "backGroundPicSetting"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 505
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 506
    :cond_a7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    if-eqz p0, :cond_a8

    .line 507
    const-string p0, "dailyPayment"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 508
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 509
    :cond_a8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    if-eqz p0, :cond_a9

    .line 510
    const-string p0, "intlVoiceLiveCampaigns"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 511
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 512
    :cond_a9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    if-eqz p0, :cond_aa

    .line 513
    const-string p0, "complexCardList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 514
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 515
    :cond_aa
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    if-eqz p0, :cond_ab

    .line 516
    const-string p0, "voiceGiftWallList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 517
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 518
    :cond_ab
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    if-eqz p0, :cond_ac

    .line 519
    const-string p0, "voiceGiftWallBriefInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 520
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 521
    :cond_ac
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    if-eqz p0, :cond_ad

    .line 522
    const-string p0, "voiceGiftWallBookDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 523
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 524
    :cond_ad
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    if-eqz p0, :cond_ae

    .line 525
    const-string p0, "voiceFollowships"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 526
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 527
    :cond_ae
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    if-eqz p0, :cond_af

    .line 528
    const-string p0, "voiceUserGiftItems"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 529
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 530
    :cond_af
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    if-eqz p0, :cond_b0

    .line 531
    const-string p0, "flameCoinMarket"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 532
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 533
    :cond_b0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    if-eqz p0, :cond_b1

    .line 534
    const-string p0, "virtualVoiceCard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 535
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 536
    :cond_b1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    if-eqz p0, :cond_b2

    .line 537
    const-string p0, "chatMsgLiveInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 538
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 539
    :cond_b2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    if-eqz p0, :cond_b3

    .line 540
    const-string p0, "voiceKTVGame"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 541
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 542
    :cond_b3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    if-eqz p0, :cond_b4

    .line 543
    const-string p0, "voiceKTVSongs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 544
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 545
    :cond_b4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    if-eqz p0, :cond_b5

    .line 546
    const-string p0, "voiceKTVOrders"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 547
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 548
    :cond_b5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    if-eqz p0, :cond_b6

    .line 549
    const-string p0, "complexCardConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 550
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 551
    :cond_b6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    if-eqz p0, :cond_b7

    .line 552
    const-string p0, "familyMedals"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 553
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 554
    :cond_b7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    if-eqz p0, :cond_b8

    const-string v1, "schema"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 555
    :cond_b8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    if-eqz p0, :cond_b9

    .line 556
    const-string p0, "cells"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 557
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 558
    :cond_b9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    if-eqz p0, :cond_ba

    .line 559
    const-string p0, "voiceSettles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 560
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 561
    :cond_ba
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    if-eqz p0, :cond_bb

    .line 562
    const-string p0, "voiceLivePush"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 563
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 564
    :cond_bb
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    if-eqz p0, :cond_bc

    .line 565
    const-string p0, "voiceAdminPanelCounter"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 566
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 567
    :cond_bc
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    if-eqz p0, :cond_bd

    .line 568
    const-string p0, "voiceUserMessageRemind"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 569
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 570
    :cond_bd
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    if-eqz p0, :cond_be

    .line 571
    const-string p0, "shareRoomConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 572
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 573
    :cond_be
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    if-eqz p0, :cond_bf

    .line 574
    const-string p0, "nobleNiceNumberDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 575
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 576
    :cond_bf
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    if-eqz p0, :cond_c0

    .line 577
    const-string p0, "nobleNiceNumberList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 578
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 579
    :cond_c0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    if-eqz p0, :cond_c1

    .line 580
    const-string p0, "heatVoiceRoomTasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 581
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 582
    :cond_c1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    if-eqz p0, :cond_c2

    .line 583
    const-string p0, "liveRoomInProfile"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 584
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 585
    :cond_c2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    if-eqz p0, :cond_c3

    .line 586
    const-string p0, "voiceRoomInProfile"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 587
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 588
    :cond_c3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    if-eqz p0, :cond_c4

    .line 589
    const-string p0, "voiceGiftWall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 590
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 591
    :cond_c4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    if-eqz p0, :cond_c5

    .line 592
    const-string p0, "voiceMedalWall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 593
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 594
    :cond_c5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    if-eqz p0, :cond_c6

    .line 595
    const-string p0, "voiceWeekLeaderboards"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 596
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 597
    :cond_c6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    if-eqz p0, :cond_c7

    .line 598
    const-string p0, "voiceRoomLevelDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 599
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 600
    :cond_c7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    if-eqz p0, :cond_c8

    .line 601
    const-string p0, "voiceRoomSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 602
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 603
    :cond_c8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    if-eqz p0, :cond_c9

    .line 604
    const-string p0, "starRedPackets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 605
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 606
    :cond_c9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    if-eqz p0, :cond_ca

    .line 607
    const-string p0, "showSideBarConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 608
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 609
    :cond_ca
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    if-eqz p0, :cond_cb

    .line 610
    const-string p0, "voiceLiveBanners"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 611
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 612
    :cond_cb
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    if-eqz p0, :cond_cc

    .line 613
    const-string p0, "multiPk"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 614
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 615
    :cond_cc
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    if-eqz p0, :cond_cd

    .line 616
    const-string p0, "multiPkPanel"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 617
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 618
    :cond_cd
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    if-eqz p0, :cond_ce

    .line 619
    const-string p0, "multiPkAsset"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 620
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 621
    :cond_ce
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    if-eqz p0, :cond_cf

    .line 622
    const-string p0, "multiPkLeaderboard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 623
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 624
    :cond_cf
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    if-eqz p0, :cond_d0

    .line 625
    const-string p0, "voiceRoomClasses"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 626
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 627
    :cond_d0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    if-eqz p0, :cond_d1

    .line 628
    const-string p0, "chatTopicAsset"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 629
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 630
    :cond_d1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    if-eqz p0, :cond_d2

    .line 631
    const-string p0, "chatTopic"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 632
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 633
    :cond_d2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    if-eqz p0, :cond_d3

    .line 634
    const-string p0, "mutexMode"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 635
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 636
    :cond_d3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    if-eqz p0, :cond_d4

    .line 637
    const-string p0, "modelDescribe"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 638
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 639
    :cond_d4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    if-eqz p0, :cond_d5

    .line 640
    const-string p0, "liveMedalCDN"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 641
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 642
    :cond_d5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    if-eqz p0, :cond_d6

    .line 643
    const-string p0, "voiceLiveUserFeedList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 644
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 645
    :cond_d6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    if-eqz p0, :cond_d7

    .line 646
    const-string p0, "userRealVoiceLive"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 647
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 648
    :cond_d7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-eqz p0, :cond_d8

    .line 649
    const-string p0, "userLeaderboard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 650
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 651
    :cond_d8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    if-eqz p0, :cond_d9

    .line 652
    const-string p0, "anchorLeaderboard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 653
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 654
    :cond_d9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-eqz p0, :cond_da

    .line 655
    const-string p0, "userWeekLeaderboard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 656
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 657
    :cond_da
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    if-eqz p0, :cond_db

    .line 658
    const-string p0, "weekCpInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 659
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 660
    :cond_db
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    if-eqz p0, :cond_dc

    .line 661
    const-string p0, "auctionCandidates"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 662
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 663
    :cond_dc
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    if-eqz p0, :cond_dd

    .line 664
    const-string p0, "auctionApplies"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 665
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 666
    :cond_dd
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    if-eqz p0, :cond_de

    .line 667
    const-string p0, "auctionInvites"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 668
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 669
    :cond_de
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    if-eqz p0, :cond_df

    .line 670
    const-string p0, "voiceLiveAuctionAsset"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 671
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 672
    :cond_df
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    if-eqz p0, :cond_e0

    .line 673
    const-string p0, "auctionRelationCards"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 674
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 675
    :cond_e0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    if-eqz p0, :cond_e1

    .line 676
    const-string p0, "bigTVLives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 677
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 678
    :cond_e1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    if-eqz p0, :cond_e2

    .line 679
    const-string p0, "giftLeaderboard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 680
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 681
    :cond_e2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    if-eqz p0, :cond_e3

    .line 682
    const-string p0, "liveClarityLevelInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 683
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 684
    :cond_e3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    if-eqz p0, :cond_e4

    .line 685
    const-string p0, "voiceUserLeaderboards"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 686
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 687
    :cond_e4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    if-eqz p0, :cond_e5

    .line 688
    const-string p0, "pkSuggestedAnchors"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 689
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 690
    :cond_e5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    if-eqz p0, :cond_e6

    .line 691
    const-string p0, "liveQuitPopup"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 692
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 693
    :cond_e6
    const-string p0, "exchangeTTCRedpoint"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 694
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    if-eqz p0, :cond_e7

    .line 695
    const-string p0, "voiceRoomAsset"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 696
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 697
    :cond_e7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    if-eqz p0, :cond_e8

    .line 698
    const-string p0, "family"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 699
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 700
    :cond_e8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    if-eqz p0, :cond_e9

    .line 701
    const-string p0, "familyShareInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 702
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 703
    :cond_e9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    if-eqz p0, :cond_ea

    .line 704
    const-string p0, "userPushSwitch"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 705
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 706
    :cond_ea
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    if-eqz p0, :cond_eb

    .line 707
    const-string p0, "officialShowCurrentAnchorInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 708
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 709
    :cond_eb
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    if-eqz p0, :cond_ec

    .line 710
    const-string p0, "officialShowList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 711
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 712
    :cond_ec
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    if-eqz p0, :cond_ed

    .line 713
    const-string p0, "officialShowUser"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 714
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 715
    :cond_ed
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    if-eqz p0, :cond_ee

    .line 716
    const-string p0, "dragonScourgeDisplayChatMessage"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 717
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 718
    :cond_ee
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    if-eqz p0, :cond_ef

    .line 719
    const-string p0, "rights"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 720
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 721
    :cond_ef
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    if-eqz p0, :cond_f0

    .line 722
    const-string p0, "auctionPlatformLeaderboardInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 723
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 724
    :cond_f0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    if-eqz p0, :cond_f1

    .line 725
    const-string p0, "auctionCounter"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 726
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 727
    :cond_f1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    if-eqz p0, :cond_f2

    .line 728
    const-string p0, "bagpackItem"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 729
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 730
    :cond_f2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    if-eqz p0, :cond_f3

    .line 731
    const-string p0, "giftDetails"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 732
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 733
    :cond_f3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-eqz p0, :cond_f4

    .line 734
    const-string p0, "luckyParadiseBottomEntrance"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 735
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 736
    :cond_f4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    if-eqz p0, :cond_f5

    .line 737
    const-string p0, "intlLiveFramesMetadata"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 738
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 739
    :cond_f5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    if-eqz p0, :cond_f6

    .line 740
    const-string p0, "media"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 741
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 742
    :cond_f6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    if-eqz p0, :cond_f7

    .line 743
    const-string p0, "lovePlanet"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 744
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 745
    :cond_f7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    if-eqz p0, :cond_f8

    .line 746
    const-string p0, "storeBackgroundPics"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 747
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 748
    :cond_f8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    if-eqz p0, :cond_f9

    .line 749
    const-string p0, "livePopUpGuild"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 750
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 751
    :cond_f9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    if-eqz p0, :cond_fa

    .line 752
    const-string p0, "voiceLivePopUpGuild"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 753
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 754
    :cond_fa
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    if-eqz p0, :cond_fb

    .line 755
    const-string p0, "giftSkinPanel"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 756
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 757
    :cond_fb
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    if-eqz p0, :cond_fc

    .line 758
    const-string p0, "emojiPlayMenu"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 759
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 760
    :cond_fc
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    if-eqz p0, :cond_fd

    .line 761
    const-string p0, "voicePayGuideUser"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 762
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 763
    :cond_fd
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    if-eqz p0, :cond_fe

    .line 764
    const-string p0, "anchorGuildCheck"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 765
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 766
    :cond_fe
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    if-eqz p0, :cond_ff

    .line 767
    const-string p0, "cpInviteRecords"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 768
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 769
    :cond_ff
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    if-eqz p0, :cond_100

    .line 770
    const-string p0, "siteWideBroadcastFinder"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 771
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 772
    :cond_100
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    if-eqz p0, :cond_101

    .line 773
    const-string p0, "gameOperationPositions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 774
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 775
    :cond_101
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    if-eqz p0, :cond_102

    .line 776
    const-string p0, "videoChatLive"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 777
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 778
    :cond_102
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    if-eqz p0, :cond_103

    .line 779
    const-string p0, "videoChat"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 780
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 781
    :cond_103
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    if-eqz p0, :cond_104

    .line 782
    const-string p0, "videoChatSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 783
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 784
    :cond_104
    const-string p0, "isAnchor"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 785
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    if-eqz p0, :cond_105

    .line 786
    const-string p0, "superUserBirthdayDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 787
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 788
    :cond_105
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    if-eqz p0, :cond_106

    .line 789
    const-string p0, "missedCalls"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 790
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 791
    :cond_106
    const-string p0, "missedCallCount"

    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 792
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    if-eqz p0, :cond_107

    .line 793
    const-string p0, "anchorCall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 794
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 795
    :cond_107
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    if-eqz p0, :cond_108

    .line 796
    const-string p0, "videoChatAssets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 797
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 798
    :cond_108
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    if-eqz p0, :cond_109

    .line 799
    const-string p0, "videoChatSquareSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 800
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 801
    :cond_109
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    if-eqz p0, :cond_10a

    .line 802
    const-string p0, "videoChatAttendeeCallInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 803
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 804
    :cond_10a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    if-eqz p0, :cond_10b

    .line 805
    const-string p0, "randomMatchCouponDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 806
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 807
    :cond_10b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    if-eqz p0, :cond_10c

    .line 808
    const-string p0, "videoChatRandomMatch"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 809
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 810
    :cond_10c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    if-eqz p0, :cond_10d

    const-string v1, "code"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 811
    :cond_10d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    if-eqz p0, :cond_10e

    .line 812
    const-string p0, "userCompliance"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 813
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 814
    :cond_10e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    if-eqz p0, :cond_10f

    .line 815
    const-string p0, "gamePanelMenus"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 816
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 817
    :cond_10f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-eqz p0, :cond_110

    .line 818
    const-string p0, "funFairBottomEntrance"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 819
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 820
    :cond_110
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    if-eqz p0, :cond_111

    .line 821
    const-string p0, "voiceSquareButtons"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 822
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 823
    :cond_111
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    if-eqz p0, :cond_112

    .line 824
    const-string p0, "superChatDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 825
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 826
    :cond_112
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    if-eqz p0, :cond_113

    .line 827
    const-string p0, "voiceLeaderboardEntrances"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 828
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 829
    :cond_113
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    if-eqz p0, :cond_114

    .line 830
    const-string p0, "skinList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 831
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 832
    :cond_114
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    if-eqz p0, :cond_115

    .line 833
    const-string p0, "starlightHierarchies"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 834
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 835
    :cond_115
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    if-eqz p0, :cond_116

    .line 836
    const-string p0, "pkItemCardsDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 837
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 838
    :cond_116
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    if-eqz p0, :cond_117

    .line 839
    const-string v1, "octopusUrl"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    :cond_117
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    if-eqz p0, :cond_118

    .line 841
    const-string p0, "intlConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 842
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 843
    :cond_118
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    if-eqz p0, :cond_119

    .line 844
    const-string p0, "intlMedalWall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 845
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 846
    :cond_119
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    if-eqz p0, :cond_11a

    .line 847
    const-string p0, "medalWall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 848
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 849
    :cond_11a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    if-eqz p0, :cond_11b

    .line 850
    const-string p0, "gameAsset"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 851
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 852
    :cond_11b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    if-eqz p0, :cond_11c

    .line 853
    const-string p0, "game"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 854
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 855
    :cond_11c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    if-eqz p0, :cond_11d

    .line 856
    const-string p0, "canJoinGame"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 857
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 858
    :cond_11d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    if-eqz p0, :cond_11e

    .line 859
    const-string p0, "voiceFanbase"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 860
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 861
    :cond_11e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    if-eqz p0, :cond_11f

    .line 862
    const-string p0, "voiceFanbaseDetail"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 863
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 864
    :cond_11f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    if-eqz p0, :cond_120

    .line 865
    const-string p0, "memberLbs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 866
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 867
    :cond_120
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    if-eqz p0, :cond_121

    .line 868
    const-string p0, "voiceFanbaseLbs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 869
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 870
    :cond_121
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    if-eqz p0, :cond_122

    .line 871
    const-string p0, "myJoins"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 872
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 873
    :cond_122
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    if-eqz p0, :cond_123

    .line 874
    const-string p0, "voiceFanbaseMedals"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 875
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 876
    :cond_123
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    if-eqz p0, :cond_124

    .line 877
    const-string p0, "heatBoxEntrance"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 878
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 879
    :cond_124
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    if-eqz p0, :cond_125

    .line 880
    const-string p0, "voicePkInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 881
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 882
    :cond_125
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    if-eqz p0, :cond_126

    .line 883
    const-string p0, "guard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 884
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 885
    :cond_126
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    if-eqz p0, :cond_127

    .line 886
    const-string p0, "bossCall"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 887
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 888
    :cond_127
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    if-eqz p0, :cond_128

    .line 889
    const-string p0, "bossGiftRecord"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 890
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 891
    :cond_128
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    if-eqz p0, :cond_129

    .line 892
    const-string p0, "giftWallV3Briefs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 893
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 894
    :cond_129
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    if-eqz p0, :cond_12a

    .line 895
    const-string p0, "voiceLiveBulletCommentTypes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 896
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 897
    :cond_12a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-eqz p0, :cond_12b

    .line 898
    const-string p0, "voiceLiveBulletComment"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 899
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    :cond_12b
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 900
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveData$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
