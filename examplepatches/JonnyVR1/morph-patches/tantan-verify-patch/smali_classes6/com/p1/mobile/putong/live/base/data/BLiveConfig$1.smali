.class Lcom/p1/mobile/putong/live/base/data/BLiveConfig$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveConfig;",
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
    const-string p0, "pushMaxTimes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x43

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "multiCallConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x42

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "activitySummaryRegularUnread"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x41

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "anchorsSearch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x40

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "followGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x3f

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "signInConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x3e

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "showMomentLikesAndComments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x3d

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "recallFansLimitToast"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x3c

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "inRoomSideBarEntrance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x3b

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "bulletCommentConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x3a

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "activityOngoingAdditionCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x39

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "inAppPushHideConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x38

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "pullStreamConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x37

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "quitLiveStayConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x36

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "isMagicGestureOpened"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x35

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "fakeAlert"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x34

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "userStatusInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x33

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "liveSquareRefreshStateInterval"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x32

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "notifyFollowers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x31

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "unreadType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x30

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "guardConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x2f

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "enableFriendsLiveStartEntrance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x2e

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "followRateConfigV2"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x2d

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "videoQuality"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x2c

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "liveStreamEventConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "entertainmentTabText"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "roomManagerCountMax"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "discover"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "liveTab"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "leaderboardCollection"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "license"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "hideLiveTab"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "chat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "call"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "pk"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_23
    const-string p0, "roomAnnouncement"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_24
    const-string p0, "giftConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_25
    const-string p0, "intlFeedbackConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_26
    const-string p0, "liveLeaderboardConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_27
    const-string p0, "liveBreakingLeaderboardConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_28
    const-string p0, "msgSameLocationLimit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_29
    const-string p0, "nobleConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_2a
    const-string p0, "smallWindow"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_2b
    const-string p0, "showDebugInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_2c
    const-string p0, "square"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_2d
    const-string p0, "managerRights"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_2e
    const-string p0, "roomSlide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_2f
    const-string p0, "fanbase"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_30
    const-string p0, "cardOnLiveText"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_31
    const-string p0, "liveHierarchy"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_32
    const-string p0, "pushStreamConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_33
    const-string p0, "blackListConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_34
    const-string p0, "verificationConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_35
    const-string p0, "suggestedTabAnimation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_36
    const-string p0, "memberListMax"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_37
    const-string p0, "followSetting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_38
    const-string p0, "swipeLiveCardConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_39
    const-string p0, "toStartLiveConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_3a
    const-string p0, "profileConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_3b
    const-string p0, "teenMode"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_3c
    const-string p0, "vipReportGrade"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto :goto_0

    :cond_3c
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_3d
    const-string p0, "obsLive"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3d

    goto :goto_0

    :cond_3d
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_3e
    const-string p0, "stealthPrivilege"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    goto :goto_0

    :cond_3e
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_3f
    const-string p0, "stormCommentConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3f

    goto :goto_0

    :cond_3f
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_40
    const-string p0, "swipeCardUnlimit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_40

    goto :goto_0

    :cond_40
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_41
    const-string p0, "liveSquareRefreshListInterval"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_41

    goto :goto_0

    :cond_41
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_42
    const-string p0, "reportFeedback"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    goto :goto_0

    :cond_42
    move v2, v1

    goto :goto_0

    :sswitch_43
    const-string p0, "enterRoomEffect"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    goto :goto_0

    :cond_43
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    return v1

    .line 3
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    return v1

    .line 5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    return v1

    .line 7
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    return v1

    .line 9
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    return v1

    .line 11
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    return v1

    .line 13
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    return v1

    .line 14
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    return v1

    .line 15
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    return v1

    .line 17
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    return v1

    .line 19
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    return v1

    .line 20
    :pswitch_b
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    return v1

    .line 22
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    return v1

    .line 24
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    return v1

    .line 26
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    return v1

    .line 27
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    return v1

    .line 29
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    return v1

    .line 31
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    return v1

    .line 32
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    return v1

    .line 34
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    return v1

    .line 36
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    return v1

    .line 38
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    return v1

    .line 39
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 40
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    return v1

    .line 41
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 42
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    return v1

    .line 43
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    return v1

    .line 45
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    return v1

    .line 46
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    return v1

    .line 47
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    return v1

    .line 49
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    return v1

    .line 51
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    return v1

    .line 53
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 54
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    return v1

    .line 55
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    return v1

    .line 56
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    return v1

    .line 58
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 59
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    return v1

    .line 60
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    return v1

    .line 62
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    return v1

    .line 64
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 65
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    return v1

    .line 66
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 67
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    return v1

    .line 68
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    return v1

    .line 70
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    return v1

    .line 72
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    return v1

    .line 73
    :pswitch_29
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 74
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    return v1

    .line 75
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    return v1

    .line 77
    :pswitch_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    return v1

    .line 78
    :pswitch_2c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 79
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    return v1

    .line 80
    :pswitch_2d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 81
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    return v1

    .line 82
    :pswitch_2e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 83
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    return v1

    .line 84
    :pswitch_2f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    return v1

    .line 86
    :pswitch_30
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    return v1

    .line 87
    :pswitch_31
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 88
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    return v1

    .line 89
    :pswitch_32
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 90
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    return v1

    .line 91
    :pswitch_33
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    return v1

    .line 93
    :pswitch_34
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    return v1

    .line 95
    :pswitch_35
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 96
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    return v1

    .line 97
    :pswitch_36
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    return v1

    .line 98
    :pswitch_37
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 99
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    return v1

    .line 100
    :pswitch_38
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    return v1

    .line 102
    :pswitch_39
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    return v1

    .line 104
    :pswitch_3a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 105
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    return v1

    .line 106
    :pswitch_3b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 107
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    return v1

    .line 108
    :pswitch_3c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p0

    sget-object p2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne p0, p2, :cond_44

    const/4 p0, 0x0

    goto :goto_1

    .line 109
    :cond_44
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    return v1

    .line 110
    :pswitch_3d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 111
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    return v1

    .line 112
    :pswitch_3e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 113
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    return v1

    .line 114
    :pswitch_3f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 115
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    return v1

    .line 116
    :pswitch_40
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    return v1

    .line 118
    :pswitch_41
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    return v1

    .line 119
    :pswitch_42
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    return v1

    .line 120
    :pswitch_43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 121
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    return v1

    :sswitch_data_0
    .sparse-switch
        -0x7f6df4bc -> :sswitch_43
        -0x7481cf27 -> :sswitch_42
        -0x6d36a5eb -> :sswitch_41
        -0x6bb28008 -> :sswitch_40
        -0x6a6c6be8 -> :sswitch_3f
        -0x6a115e12 -> :sswitch_3e
        -0x6278adf4 -> :sswitch_3d
        -0x5eeac95a -> :sswitch_3c
        -0x5c960c63 -> :sswitch_3b
        -0x5a9aa9b5 -> :sswitch_3a
        -0x569faeab -> :sswitch_39
        -0x55e56da8 -> :sswitch_38
        -0x555deea1 -> :sswitch_37
        -0x504be414 -> :sswitch_36
        -0x4e4069ce -> :sswitch_35
        -0x4dc5fac3 -> :sswitch_34
        -0x4a839521 -> :sswitch_33
        -0x4a1fb4e4 -> :sswitch_32
        -0x40f3b557 -> :sswitch_31
        -0x40b80598 -> :sswitch_30
        -0x40822f9c -> :sswitch_2f
        -0x404be26a -> :sswitch_2e
        -0x3a02b81c -> :sswitch_2d
        -0x3553a6e3 -> :sswitch_2c
        -0x320fa0dc -> :sswitch_2b
        -0x2d7fc429 -> :sswitch_2a
        -0x2d37e824 -> :sswitch_29
        -0x241e8b41 -> :sswitch_28
        -0x23201eb0 -> :sswitch_27
        -0x1746766d -> :sswitch_26
        -0x16c1d11c -> :sswitch_25
        -0x11b2cb6e -> :sswitch_24
        -0x6d04e3e -> :sswitch_23
        0xdfb -> :sswitch_22
        0x2e7a5e -> :sswitch_21
        0x2e9358 -> :sswitch_20
        0x3ce8b67 -> :sswitch_1f
        0x9f08441 -> :sswitch_1e
        0xa2d79fb -> :sswitch_1d
        0xafbdf09 -> :sswitch_1c
        0x104877e9 -> :sswitch_1b
        0x15ac8a47 -> :sswitch_1a
        0x1d13b5ba -> :sswitch_19
        0x1de0b350 -> :sswitch_18
        0x1e0b5404 -> :sswitch_17
        0x1f1024af -> :sswitch_16
        0x2006f33a -> :sswitch_15
        0x205c3e47 -> :sswitch_14
        0x27430789 -> :sswitch_13
        0x359c8ecc -> :sswitch_12
        0x37efe024 -> :sswitch_11
        0x3bbc25eb -> :sswitch_10
        0x3bf10f07 -> :sswitch_f
        0x3f98312f -> :sswitch_e
        0x42941d36 -> :sswitch_d
        0x42dbe1c7 -> :sswitch_c
        0x4591bfba -> :sswitch_b
        0x498c5567 -> :sswitch_a
        0x4cd8589f -> :sswitch_9
        0x4d862252 -> :sswitch_8
        0x527b4c7d -> :sswitch_7
        0x571b2d0c -> :sswitch_6
        0x585681a4 -> :sswitch_5
        0x5dd8b5cb -> :sswitch_4
        0x62ffa7a6 -> :sswitch_3
        0x640b0a14 -> :sswitch_2
        0x64476959 -> :sswitch_1
        0x7e96897c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 122
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "memberListMax"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "license"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 21
    .line 22
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const-string p0, "pushMaxTimes"

    .line 26
    .line 27
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 28
    .line 29
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    const-string p0, "liveSquareRefreshStateInterval"

    .line 33
    .line 34
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    const-string p0, "liveSquareRefreshListInterval"

    .line 40
    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 42
    .line 43
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    const-string p0, "smallWindow"

    .line 51
    .line 52
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    .line 57
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 58
    .line 59
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 63
    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    const-string p0, "followGuide"

    .line 67
    .line 68
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 72
    .line 73
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 74
    .line 75
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 79
    .line 80
    if-eqz p0, :cond_3

    .line 81
    .line 82
    const-string p0, "managerRights"

    .line 83
    .line 84
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 88
    .line 89
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 90
    .line 91
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 95
    .line 96
    if-eqz p0, :cond_4

    .line 97
    .line 98
    const-string p0, "followSetting"

    .line 99
    .line 100
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 104
    .line 105
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 106
    .line 107
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 108
    .line 109
    .line 110
    :cond_4
    const-string p0, "showMomentLikesAndComments"

    .line 111
    .line 112
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 113
    .line 114
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 115
    .line 116
    .line 117
    const-string p0, "roomManagerCountMax"

    .line 118
    .line 119
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 120
    .line 121
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 125
    .line 126
    if-eqz p0, :cond_5

    .line 127
    .line 128
    const-string p0, "liveHierarchy"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 136
    .line 137
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 138
    .line 139
    .line 140
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz p0, :cond_6

    .line 143
    .line 144
    const-string v1, "reportFeedback"

    .line 145
    .line 146
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz p0, :cond_7

    .line 152
    .line 153
    const-string v1, "recallFansLimitToast"

    .line 154
    .line 155
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_7
    const-string p0, "isMagicGestureOpened"

    .line 159
    .line 160
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 161
    .line 162
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz p0, :cond_8

    .line 168
    .line 169
    const-string v1, "cardOnLiveText"

    .line 170
    .line 171
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 175
    .line 176
    if-eqz p0, :cond_9

    .line 177
    .line 178
    const-string p0, "teenMode"

    .line 179
    .line 180
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 184
    .line 185
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 186
    .line 187
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 188
    .line 189
    .line 190
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 191
    .line 192
    if-eqz p0, :cond_a

    .line 193
    .line 194
    const-string p0, "videoQuality"

    .line 195
    .line 196
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 202
    .line 203
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 204
    .line 205
    .line 206
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 207
    .line 208
    if-eqz p0, :cond_b

    .line 209
    .line 210
    const-string p0, "liveBreakingLeaderboardConfig"

    .line 211
    .line 212
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 216
    .line 217
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 218
    .line 219
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 220
    .line 221
    .line 222
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 223
    .line 224
    if-eqz p0, :cond_c

    .line 225
    .line 226
    const-string p0, "square"

    .line 227
    .line 228
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 232
    .line 233
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 234
    .line 235
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 236
    .line 237
    .line 238
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 239
    .line 240
    if-eqz p0, :cond_d

    .line 241
    .line 242
    const-string p0, "chat"

    .line 243
    .line 244
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 248
    .line 249
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 250
    .line 251
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 252
    .line 253
    .line 254
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 255
    .line 256
    if-eqz p0, :cond_e

    .line 257
    .line 258
    const-string p0, "pushStreamConfig"

    .line 259
    .line 260
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 264
    .line 265
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 266
    .line 267
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 268
    .line 269
    .line 270
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 271
    .line 272
    if-eqz p0, :cond_f

    .line 273
    .line 274
    const-string p0, "discover"

    .line 275
    .line 276
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 280
    .line 281
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 282
    .line 283
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 284
    .line 285
    .line 286
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 287
    .line 288
    if-eqz p0, :cond_10

    .line 289
    .line 290
    const-string p0, "inRoomSideBarEntrance"

    .line 291
    .line 292
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 296
    .line 297
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 298
    .line 299
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 300
    .line 301
    .line 302
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 303
    .line 304
    if-eqz p0, :cond_11

    .line 305
    .line 306
    const-string p0, "liveTab"

    .line 307
    .line 308
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 312
    .line 313
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 314
    .line 315
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 316
    .line 317
    .line 318
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 319
    .line 320
    if-eqz p0, :cond_12

    .line 321
    .line 322
    const-string p0, "unreadType"

    .line 323
    .line 324
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 328
    .line 329
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 330
    .line 331
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 332
    .line 333
    .line 334
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 335
    .line 336
    if-eqz p0, :cond_13

    .line 337
    .line 338
    const-string p0, "activitySummaryRegularUnread"

    .line 339
    .line 340
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 344
    .line 345
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 346
    .line 347
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 348
    .line 349
    .line 350
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 351
    .line 352
    if-eqz p0, :cond_14

    .line 353
    .line 354
    const-string p0, "roomSlide"

    .line 355
    .line 356
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 360
    .line 361
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 362
    .line 363
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 364
    .line 365
    .line 366
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 367
    .line 368
    if-eqz p0, :cond_15

    .line 369
    .line 370
    const-string p0, "followRateConfigV2"

    .line 371
    .line 372
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 376
    .line 377
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 378
    .line 379
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 380
    .line 381
    .line 382
    :cond_15
    const-string p0, "msgSameLocationLimit"

    .line 383
    .line 384
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 385
    .line 386
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 387
    .line 388
    .line 389
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 390
    .line 391
    if-eqz p0, :cond_16

    .line 392
    .line 393
    const-string p0, "notifyFollowers"

    .line 394
    .line 395
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 399
    .line 400
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 401
    .line 402
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 403
    .line 404
    .line 405
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 406
    .line 407
    if-eqz p0, :cond_17

    .line 408
    .line 409
    const-string p0, "anchorsSearch"

    .line 410
    .line 411
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 415
    .line 416
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 417
    .line 418
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 419
    .line 420
    .line 421
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 422
    .line 423
    if-eqz p0, :cond_18

    .line 424
    .line 425
    const-string p0, "pk"

    .line 426
    .line 427
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 431
    .line 432
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 433
    .line 434
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 435
    .line 436
    .line 437
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 438
    .line 439
    if-eqz p0, :cond_19

    .line 440
    .line 441
    const-string p0, "fakeAlert"

    .line 442
    .line 443
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 447
    .line 448
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 449
    .line 450
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 451
    .line 452
    .line 453
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 454
    .line 455
    if-eqz p0, :cond_1a

    .line 456
    .line 457
    const-string p0, "fanbase"

    .line 458
    .line 459
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 463
    .line 464
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 465
    .line 466
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 467
    .line 468
    .line 469
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 470
    .line 471
    if-eqz p0, :cond_1b

    .line 472
    .line 473
    const-string p0, "call"

    .line 474
    .line 475
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 479
    .line 480
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 481
    .line 482
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 483
    .line 484
    .line 485
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 486
    .line 487
    if-eqz p0, :cond_1c

    .line 488
    .line 489
    const-string p0, "enterRoomEffect"

    .line 490
    .line 491
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 492
    .line 493
    .line 494
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 495
    .line 496
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 497
    .line 498
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 499
    .line 500
    .line 501
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 502
    .line 503
    if-eqz p0, :cond_1d

    .line 504
    .line 505
    const-string p0, "giftConfig"

    .line 506
    .line 507
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 508
    .line 509
    .line 510
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 511
    .line 512
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 513
    .line 514
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 515
    .line 516
    .line 517
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 518
    .line 519
    if-eqz p0, :cond_1e

    .line 520
    .line 521
    const-string v1, "vipReportGrade"

    .line 522
    .line 523
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 524
    .line 525
    .line 526
    move-result-wide v2

    .line 527
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 528
    .line 529
    .line 530
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 531
    .line 532
    if-eqz p0, :cond_1f

    .line 533
    .line 534
    const-string p0, "guardConfig"

    .line 535
    .line 536
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 537
    .line 538
    .line 539
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 540
    .line 541
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 542
    .line 543
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 544
    .line 545
    .line 546
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 547
    .line 548
    if-eqz p0, :cond_20

    .line 549
    .line 550
    const-string p0, "stealthPrivilege"

    .line 551
    .line 552
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 556
    .line 557
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 558
    .line 559
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 560
    .line 561
    .line 562
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 563
    .line 564
    if-eqz p0, :cond_21

    .line 565
    .line 566
    const-string p0, "bulletCommentConfig"

    .line 567
    .line 568
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 572
    .line 573
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 574
    .line 575
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 576
    .line 577
    .line 578
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 579
    .line 580
    if-eqz p0, :cond_22

    .line 581
    .line 582
    const-string p0, "profileConfig"

    .line 583
    .line 584
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 588
    .line 589
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 590
    .line 591
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 592
    .line 593
    .line 594
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 595
    .line 596
    if-eqz p0, :cond_23

    .line 597
    .line 598
    const-string p0, "swipeCardUnlimit"

    .line 599
    .line 600
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 601
    .line 602
    .line 603
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 604
    .line 605
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 606
    .line 607
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 608
    .line 609
    .line 610
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 611
    .line 612
    if-eqz p0, :cond_24

    .line 613
    .line 614
    const-string p0, "signInConfig"

    .line 615
    .line 616
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 620
    .line 621
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 622
    .line 623
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 624
    .line 625
    .line 626
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 627
    .line 628
    if-eqz p0, :cond_25

    .line 629
    .line 630
    const-string p0, "verificationConfig"

    .line 631
    .line 632
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 633
    .line 634
    .line 635
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 636
    .line 637
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 638
    .line 639
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 640
    .line 641
    .line 642
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 643
    .line 644
    if-eqz p0, :cond_26

    .line 645
    .line 646
    const-string p0, "stormCommentConfig"

    .line 647
    .line 648
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 649
    .line 650
    .line 651
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 652
    .line 653
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 654
    .line 655
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 656
    .line 657
    .line 658
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 659
    .line 660
    if-eqz p0, :cond_27

    .line 661
    .line 662
    const-string p0, "multiCallConfig"

    .line 663
    .line 664
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 665
    .line 666
    .line 667
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 668
    .line 669
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 670
    .line 671
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 672
    .line 673
    .line 674
    :cond_27
    const-string p0, "activityOngoingAdditionCount"

    .line 675
    .line 676
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 677
    .line 678
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 679
    .line 680
    .line 681
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 682
    .line 683
    if-eqz p0, :cond_28

    .line 684
    .line 685
    const-string p0, "obsLive"

    .line 686
    .line 687
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 688
    .line 689
    .line 690
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 691
    .line 692
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 693
    .line 694
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 695
    .line 696
    .line 697
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 698
    .line 699
    if-eqz p0, :cond_29

    .line 700
    .line 701
    const-string p0, "suggestedTabAnimation"

    .line 702
    .line 703
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 704
    .line 705
    .line 706
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 707
    .line 708
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 709
    .line 710
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 711
    .line 712
    .line 713
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 714
    .line 715
    if-eqz p0, :cond_2a

    .line 716
    .line 717
    const-string p0, "quitLiveStayConfig"

    .line 718
    .line 719
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 720
    .line 721
    .line 722
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 723
    .line 724
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 725
    .line 726
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 727
    .line 728
    .line 729
    :cond_2a
    const-string p0, "showDebugInfo"

    .line 730
    .line 731
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 732
    .line 733
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 734
    .line 735
    .line 736
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 737
    .line 738
    if-eqz p0, :cond_2b

    .line 739
    .line 740
    const-string p0, "toStartLiveConfig"

    .line 741
    .line 742
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 743
    .line 744
    .line 745
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 746
    .line 747
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 748
    .line 749
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 750
    .line 751
    .line 752
    :cond_2b
    const-string p0, "enableFriendsLiveStartEntrance"

    .line 753
    .line 754
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 755
    .line 756
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 757
    .line 758
    .line 759
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 760
    .line 761
    if-eqz p0, :cond_2c

    .line 762
    .line 763
    const-string p0, "roomAnnouncement"

    .line 764
    .line 765
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 766
    .line 767
    .line 768
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 769
    .line 770
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 771
    .line 772
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 773
    .line 774
    .line 775
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 776
    .line 777
    if-eqz p0, :cond_2d

    .line 778
    .line 779
    const-string p0, "inAppPushHideConfig"

    .line 780
    .line 781
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 782
    .line 783
    .line 784
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 785
    .line 786
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 787
    .line 788
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 789
    .line 790
    .line 791
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 792
    .line 793
    if-eqz p0, :cond_2e

    .line 794
    .line 795
    const-string p0, "blackListConfig"

    .line 796
    .line 797
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 798
    .line 799
    .line 800
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 801
    .line 802
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 803
    .line 804
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 805
    .line 806
    .line 807
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 808
    .line 809
    if-eqz p0, :cond_2f

    .line 810
    .line 811
    const-string v1, "entertainmentTabText"

    .line 812
    .line 813
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 814
    .line 815
    .line 816
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 817
    .line 818
    if-eqz p0, :cond_30

    .line 819
    .line 820
    const-string p0, "nobleConfig"

    .line 821
    .line 822
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 823
    .line 824
    .line 825
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 826
    .line 827
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 828
    .line 829
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 830
    .line 831
    .line 832
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 833
    .line 834
    if-eqz p0, :cond_31

    .line 835
    .line 836
    const-string p0, "leaderboardCollection"

    .line 837
    .line 838
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 839
    .line 840
    .line 841
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 842
    .line 843
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 844
    .line 845
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 846
    .line 847
    .line 848
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 849
    .line 850
    if-eqz p0, :cond_32

    .line 851
    .line 852
    const-string p0, "pullStreamConfig"

    .line 853
    .line 854
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 855
    .line 856
    .line 857
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 858
    .line 859
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 860
    .line 861
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 862
    .line 863
    .line 864
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 865
    .line 866
    if-eqz p0, :cond_33

    .line 867
    .line 868
    const-string p0, "swipeLiveCardConfig"

    .line 869
    .line 870
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 871
    .line 872
    .line 873
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 874
    .line 875
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 876
    .line 877
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 878
    .line 879
    .line 880
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 881
    .line 882
    if-eqz p0, :cond_34

    .line 883
    .line 884
    const-string p0, "liveLeaderboardConfig"

    .line 885
    .line 886
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 887
    .line 888
    .line 889
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 890
    .line 891
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 892
    .line 893
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 894
    .line 895
    .line 896
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 897
    .line 898
    if-eqz p0, :cond_35

    .line 899
    .line 900
    const-string p0, "userStatusInfo"

    .line 901
    .line 902
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 903
    .line 904
    .line 905
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 906
    .line 907
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 908
    .line 909
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 910
    .line 911
    .line 912
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 913
    .line 914
    if-eqz p0, :cond_36

    .line 915
    .line 916
    const-string p0, "intlFeedbackConfig"

    .line 917
    .line 918
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 919
    .line 920
    .line 921
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 922
    .line 923
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 924
    .line 925
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 926
    .line 927
    .line 928
    :cond_36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 929
    .line 930
    if-eqz p0, :cond_37

    .line 931
    .line 932
    const-string p0, "liveStreamEventConfig"

    .line 933
    .line 934
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 935
    .line 936
    .line 937
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 938
    .line 939
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 940
    .line 941
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 942
    .line 943
    .line 944
    :cond_37
    const-string p0, "hideLiveTab"

    .line 945
    .line 946
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    .line 947
    .line 948
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 949
    .line 950
    .line 951
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 952
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
