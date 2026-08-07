.class Lcom/p1/mobile/putong/core/data/CoreData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreData;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/CoreData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreData$2;->newInstance()Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/CoreData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
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
    const-string p0, "growthMesInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x12c

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "speedUpCard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x12b

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "unReadUserIds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x12a

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "mkt_activity_flash"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x129

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "greetings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x128

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "shareId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x127

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "intlInsertCardSets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x126

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "scoreThresholdOther"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x125

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "realPicturesBanner"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x124

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "heartbeats"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x123

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "idealDetails"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x122

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "fakePhotoFeedback"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x121

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "chatPartnersSignals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x120

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "schools"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x11f

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "instantMatchUserInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x11e

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "recallMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x11d

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "aiChatAnalysis"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x11c

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "monetizationConfiguration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x11b

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "notificationCounters"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x11a

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "boostStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x119

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "accountRecords"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x118

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "userFeedbackInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x117

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "literatures"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x116

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "showOnlineForWhoIMeet"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x115

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "intlVisitorInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x114

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "diamond"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x113

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "analysisGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x112

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "cityCConfig"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x111

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "chatHeats"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0x110

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "groupAttributes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0x10f

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "swipeUpperLimit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0x10e

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "cityCBanner"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0x10d

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "details"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x10c

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "audioTexts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x10b

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "stickers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x10a

    goto/16 :goto_0

    :sswitch_23
    const-string p0, "cardsIcons"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v2, 0x109

    goto/16 :goto_0

    :sswitch_24
    const-string p0, "heartbeatMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v2, 0x108

    goto/16 :goto_0

    :sswitch_25
    const-string p0, "jmpTarget"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v2, 0x107

    goto/16 :goto_0

    :sswitch_26
    const-string p0, "liveActivities"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v2, 0x106

    goto/16 :goto_0

    :sswitch_27
    const-string p0, "conversations"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v2, 0x105

    goto/16 :goto_0

    :sswitch_28
    const-string p0, "recommended"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v2, 0x104

    goto/16 :goto_0

    :sswitch_29
    const-string p0, "chatPage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v2, 0x103

    goto/16 :goto_0

    :sswitch_2a
    const-string p0, "nextTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v2, 0x102

    goto/16 :goto_0

    :sswitch_2b
    const-string p0, "couponBag"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v2, 0x101

    goto/16 :goto_0

    :sswitch_2c
    const-string p0, "verificationLowLabels"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v2, 0x100

    goto/16 :goto_0

    :sswitch_2d
    const-string p0, "extraPrivileges"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v2, 0xff

    goto/16 :goto_0

    :sswitch_2e
    const-string p0, "ipRegion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v2, 0xfe

    goto/16 :goto_0

    :sswitch_2f
    const-string p0, "msgData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v2, 0xfd

    goto/16 :goto_0

    :sswitch_30
    const-string p0, "seePortraits"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v2, 0xfc

    goto/16 :goto_0

    :sswitch_31
    const-string p0, "seeTrialStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v2, 0xfb

    goto/16 :goto_0

    :sswitch_32
    const-string p0, "faceidTokens"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v2, 0xfa

    goto/16 :goto_0

    :sswitch_33
    const-string p0, "visitorHiddens"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v2, 0xf9

    goto/16 :goto_0

    :sswitch_34
    const-string p0, "loveLetterGroup"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v2, 0xf8

    goto/16 :goto_0

    :sswitch_35
    const-string p0, "monetizationPromotions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v2, 0xf7

    goto/16 :goto_0

    :sswitch_36
    const-string p0, "counterVerification"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v2, 0xf6

    goto/16 :goto_0

    :sswitch_37
    const-string p0, "moments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v2, 0xf5

    goto/16 :goto_0

    :sswitch_38
    const-string p0, "verifications"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v2, 0xf4

    goto/16 :goto_0

    :sswitch_39
    const-string p0, "literaturesComments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v2, 0xf3

    goto/16 :goto_0

    :sswitch_3a
    const-string p0, "evaluationReports"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v2, 0xf2

    goto/16 :goto_0

    :sswitch_3b
    const-string p0, "profileGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v2, 0xf1

    goto/16 :goto_0

    :sswitch_3c
    const-string p0, "giftWallRankInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto/16 :goto_0

    :cond_3c
    const/16 v2, 0xf0

    goto/16 :goto_0

    :sswitch_3d
    const-string p0, "invitation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3d

    goto/16 :goto_0

    :cond_3d
    const/16 v2, 0xef

    goto/16 :goto_0

    :sswitch_3e
    const-string p0, "buzzUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    goto/16 :goto_0

    :cond_3e
    const/16 v2, 0xee

    goto/16 :goto_0

    :sswitch_3f
    const-string p0, "greetingNewPeople"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3f

    goto/16 :goto_0

    :cond_3f
    const/16 v2, 0xed

    goto/16 :goto_0

    :sswitch_40
    const-string p0, "todayMatchInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_40

    goto/16 :goto_0

    :cond_40
    const/16 v2, 0xec

    goto/16 :goto_0

    :sswitch_41
    const-string p0, "likedMes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_41

    goto/16 :goto_0

    :cond_41
    const/16 v2, 0xeb

    goto/16 :goto_0

    :sswitch_42
    const-string p0, "reminders"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    goto/16 :goto_0

    :cond_42
    const/16 v2, 0xea

    goto/16 :goto_0

    :sswitch_43
    const-string p0, "refundDetails"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    goto/16 :goto_0

    :cond_43
    const/16 v2, 0xe9

    goto/16 :goto_0

    :sswitch_44
    const-string p0, "realFeelInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_44

    goto/16 :goto_0

    :cond_44
    const/16 v2, 0xe8

    goto/16 :goto_0

    :sswitch_45
    const-string p0, "userAudits"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_45

    goto/16 :goto_0

    :cond_45
    const/16 v2, 0xe7

    goto/16 :goto_0

    :sswitch_46
    const-string p0, "complimentTexts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_46

    goto/16 :goto_0

    :cond_46
    const/16 v2, 0xe6

    goto/16 :goto_0

    :sswitch_47
    const-string p0, "countdownLikes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_47

    goto/16 :goto_0

    :cond_47
    const/16 v2, 0xe5

    goto/16 :goto_0

    :sswitch_48
    const-string p0, "pictureVerifyRightedInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    goto/16 :goto_0

    :cond_48
    const/16 v2, 0xe4

    goto/16 :goto_0

    :sswitch_49
    const-string p0, "repeatPictureResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_49

    goto/16 :goto_0

    :cond_49
    const/16 v2, 0xe3

    goto/16 :goto_0

    :sswitch_4a
    const-string p0, "promotions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4a

    goto/16 :goto_0

    :cond_4a
    const/16 v2, 0xe2

    goto/16 :goto_0

    :sswitch_4b
    const-string p0, "descriptionRisk"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4b

    goto/16 :goto_0

    :cond_4b
    const/16 v2, 0xe1

    goto/16 :goto_0

    :sswitch_4c
    const-string p0, "seeInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4c

    goto/16 :goto_0

    :cond_4c
    const/16 v2, 0xe0

    goto/16 :goto_0

    :sswitch_4d
    const-string p0, "coupons"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4d

    goto/16 :goto_0

    :cond_4d
    const/16 v2, 0xdf

    goto/16 :goto_0

    :sswitch_4e
    const-string p0, "newGiftWalls"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4e

    goto/16 :goto_0

    :cond_4e
    const/16 v2, 0xde

    goto/16 :goto_0

    :sswitch_4f
    const-string p0, "visitorAllCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4f

    goto/16 :goto_0

    :cond_4f
    const/16 v2, 0xdd

    goto/16 :goto_0

    :sswitch_50
    const-string p0, "evaluation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_50

    goto/16 :goto_0

    :cond_50
    const/16 v2, 0xdc

    goto/16 :goto_0

    :sswitch_51
    const-string p0, "summarizedPrivilegePrices"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_51

    goto/16 :goto_0

    :cond_51
    const/16 v2, 0xdb

    goto/16 :goto_0

    :sswitch_52
    const-string p0, "evaluations"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_52

    goto/16 :goto_0

    :cond_52
    const/16 v2, 0xda

    goto/16 :goto_0

    :sswitch_53
    const-string p0, "freeTrialOperateResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    goto/16 :goto_0

    :cond_53
    const/16 v2, 0xd9

    goto/16 :goto_0

    :sswitch_54
    const-string p0, "seePortraitCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_54

    goto/16 :goto_0

    :cond_54
    const/16 v2, 0xd8

    goto/16 :goto_0

    :sswitch_55
    const-string p0, "purchaseSavePop"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    goto/16 :goto_0

    :cond_55
    const/16 v2, 0xd7

    goto/16 :goto_0

    :sswitch_56
    const-string p0, "privateCustomResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    goto/16 :goto_0

    :cond_56
    const/16 v2, 0xd6

    goto/16 :goto_0

    :sswitch_57
    const-string p0, "groupNotifications"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_57

    goto/16 :goto_0

    :cond_57
    const/16 v2, 0xd5

    goto/16 :goto_0

    :sswitch_58
    const-string p0, "userStickers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_58

    goto/16 :goto_0

    :cond_58
    const/16 v2, 0xd4

    goto/16 :goto_0

    :sswitch_59
    const-string p0, "thirdPartyInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_59

    goto/16 :goto_0

    :cond_59
    const/16 v2, 0xd3

    goto/16 :goto_0

    :sswitch_5a
    const-string p0, "packages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5a

    goto/16 :goto_0

    :cond_5a
    const/16 v2, 0xd2

    goto/16 :goto_0

    :sswitch_5b
    const-string p0, "mkt_activity_regular"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5b

    goto/16 :goto_0

    :cond_5b
    const/16 v2, 0xd1

    goto/16 :goto_0

    :sswitch_5c
    const-string p0, "auditPictureTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5c

    goto/16 :goto_0

    :cond_5c
    const/16 v2, 0xd0

    goto/16 :goto_0

    :sswitch_5d
    const-string p0, "orderInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5d

    goto/16 :goto_0

    :cond_5d
    const/16 v2, 0xcf

    goto/16 :goto_0

    :sswitch_5e
    const-string p0, "liveSchemas"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5e

    goto/16 :goto_0

    :cond_5e
    const/16 v2, 0xce

    goto/16 :goto_0

    :sswitch_5f
    const-string p0, "userActivityInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5f

    goto/16 :goto_0

    :cond_5f
    const/16 v2, 0xcd

    goto/16 :goto_0

    :sswitch_60
    const-string p0, "giftWallTitles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_60

    goto/16 :goto_0

    :cond_60
    const/16 v2, 0xcc

    goto/16 :goto_0

    :sswitch_61
    const-string p0, "summarizedPrivileges"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_61

    goto/16 :goto_0

    :cond_61
    const/16 v2, 0xcb

    goto/16 :goto_0

    :sswitch_62
    const-string p0, "liveLabels"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_62

    goto/16 :goto_0

    :cond_62
    const/16 v2, 0xca

    goto/16 :goto_0

    :sswitch_63
    const-string p0, "cardStyles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_63

    goto/16 :goto_0

    :cond_63
    const/16 v2, 0xc9

    goto/16 :goto_0

    :sswitch_64
    const-string p0, "popGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    goto/16 :goto_0

    :cond_64
    const/16 v2, 0xc8

    goto/16 :goto_0

    :sswitch_65
    const-string p0, "netPictureResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_65

    goto/16 :goto_0

    :cond_65
    const/16 v2, 0xc7

    goto/16 :goto_0

    :sswitch_66
    const-string p0, "invitationInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_66

    goto/16 :goto_0

    :cond_66
    const/16 v2, 0xc6

    goto/16 :goto_0

    :sswitch_67
    const-string p0, "merchandises"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_67

    goto/16 :goto_0

    :cond_67
    const/16 v2, 0xc5

    goto/16 :goto_0

    :sswitch_68
    const-string p0, "iceBreakings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_68

    goto/16 :goto_0

    :cond_68
    const/16 v2, 0xc4

    goto/16 :goto_0

    :sswitch_69
    const-string p0, "superlikeByCounts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_69

    goto/16 :goto_0

    :cond_69
    const/16 v2, 0xc3

    goto/16 :goto_0

    :sswitch_6a
    const-string p0, "boostResultEntry"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6a

    goto/16 :goto_0

    :cond_6a
    const/16 v2, 0xc2

    goto/16 :goto_0

    :sswitch_6b
    const-string p0, "giftPanel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6b

    goto/16 :goto_0

    :cond_6b
    const/16 v2, 0xc1

    goto/16 :goto_0

    :sswitch_6c
    const-string p0, "giftInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6c

    goto/16 :goto_0

    :cond_6c
    const/16 v2, 0xc0

    goto/16 :goto_0

    :sswitch_6d
    const-string p0, "camping"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6d

    goto/16 :goto_0

    :cond_6d
    const/16 v2, 0xbf

    goto/16 :goto_0

    :sswitch_6e
    const-string p0, "giftGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6e

    goto/16 :goto_0

    :cond_6e
    const/16 v2, 0xbe

    goto/16 :goto_0

    :sswitch_6f
    const-string p0, "keywords"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6f

    goto/16 :goto_0

    :cond_6f
    const/16 v2, 0xbd

    goto/16 :goto_0

    :sswitch_70
    const-string p0, "compliments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_70

    goto/16 :goto_0

    :cond_70
    const/16 v2, 0xbc

    goto/16 :goto_0

    :sswitch_71
    const-string p0, "membershipUpgradeInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_71

    goto/16 :goto_0

    :cond_71
    const/16 v2, 0xbb

    goto/16 :goto_0

    :sswitch_72
    const-string p0, "cardModels"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_72

    goto/16 :goto_0

    :cond_72
    const/16 v2, 0xba

    goto/16 :goto_0

    :sswitch_73
    const-string p0, "relationships"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_73

    goto/16 :goto_0

    :cond_73
    const/16 v2, 0xb9

    goto/16 :goto_0

    :sswitch_74
    const-string p0, "myMeetListV3"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_74

    goto/16 :goto_0

    :cond_74
    const/16 v2, 0xb8

    goto/16 :goto_0

    :sswitch_75
    const-string p0, "officialAccounts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_75

    goto/16 :goto_0

    :cond_75
    const/16 v2, 0xb7

    goto/16 :goto_0

    :sswitch_76
    const-string p0, "fateRadar"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_76

    goto/16 :goto_0

    :cond_76
    const/16 v2, 0xb6

    goto/16 :goto_0

    :sswitch_77
    const-string p0, "privateQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_77

    goto/16 :goto_0

    :cond_77
    const/16 v2, 0xb5

    goto/16 :goto_0

    :sswitch_78
    const-string p0, "monetizationMsg"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_78

    goto/16 :goto_0

    :cond_78
    const/16 v2, 0xb4

    goto/16 :goto_0

    :sswitch_79
    const-string p0, "love520"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_79

    goto/16 :goto_0

    :cond_79
    const/16 v2, 0xb3

    goto/16 :goto_0

    :sswitch_7a
    const-string p0, "membershipRecommendUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7a

    goto/16 :goto_0

    :cond_7a
    const/16 v2, 0xb2

    goto/16 :goto_0

    :sswitch_7b
    const-string p0, "visitorDoorInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7b

    goto/16 :goto_0

    :cond_7b
    const/16 v2, 0xb1

    goto/16 :goto_0

    :sswitch_7c
    const-string p0, "dynamicLabels"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7c

    goto/16 :goto_0

    :cond_7c
    const/16 v2, 0xb0

    goto/16 :goto_0

    :sswitch_7d
    const-string p0, "chatHeatPermissions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7d

    goto/16 :goto_0

    :cond_7d
    const/16 v2, 0xaf

    goto/16 :goto_0

    :sswitch_7e
    const-string p0, "redPackets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7e

    goto/16 :goto_0

    :cond_7e
    const/16 v2, 0xae

    goto/16 :goto_0

    :sswitch_7f
    const-string p0, "dislikedUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7f

    goto/16 :goto_0

    :cond_7f
    const/16 v2, 0xad

    goto/16 :goto_0

    :sswitch_80
    const-string p0, "bundles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_80

    goto/16 :goto_0

    :cond_80
    const/16 v2, 0xac

    goto/16 :goto_0

    :sswitch_81
    const-string p0, "vipSettings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_81

    goto/16 :goto_0

    :cond_81
    const/16 v2, 0xab

    goto/16 :goto_0

    :sswitch_82
    const-string p0, "campaignPage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_82

    goto/16 :goto_0

    :cond_82
    const/16 v2, 0xaa

    goto/16 :goto_0

    :sswitch_83
    const-string p0, "autoDeducts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_83

    goto/16 :goto_0

    :cond_83
    const/16 v2, 0xa9

    goto/16 :goto_0

    :sswitch_84
    const-string p0, "greetingNewPeopleMessage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_84

    goto/16 :goto_0

    :cond_84
    const/16 v2, 0xa8

    goto/16 :goto_0

    :sswitch_85
    const-string p0, "score"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_85

    goto/16 :goto_0

    :cond_85
    const/16 v2, 0xa7

    goto/16 :goto_0

    :sswitch_86
    const-string p0, "sames"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    goto/16 :goto_0

    :cond_86
    const/16 v2, 0xa6

    goto/16 :goto_0

    :sswitch_87
    const-string p0, "risks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_87

    goto/16 :goto_0

    :cond_87
    const/16 v2, 0xa5

    goto/16 :goto_0

    :sswitch_88
    const-string p0, "picks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_88

    goto/16 :goto_0

    :cond_88
    const/16 v2, 0xa4

    goto/16 :goto_0

    :sswitch_89
    const-string p0, "menus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_89

    goto/16 :goto_0

    :cond_89
    const/16 v2, 0xa3

    goto/16 :goto_0

    :sswitch_8a
    const-string p0, "lives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8a

    goto/16 :goto_0

    :cond_8a
    const/16 v2, 0xa2

    goto/16 :goto_0

    :sswitch_8b
    const-string p0, "links"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8b

    goto/16 :goto_0

    :cond_8b
    const/16 v2, 0xa1

    goto/16 :goto_0

    :sswitch_8c
    const-string p0, "level"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8c

    goto/16 :goto_0

    :cond_8c
    const/16 v2, 0xa0

    goto/16 :goto_0

    :sswitch_8d
    const-string p0, "layer"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8d

    goto/16 :goto_0

    :cond_8d
    const/16 v2, 0x9f

    goto/16 :goto_0

    :sswitch_8e
    const-string p0, "isHit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    goto/16 :goto_0

    :cond_8e
    const/16 v2, 0x9e

    goto/16 :goto_0

    :sswitch_8f
    const-string p0, "count"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8f

    goto/16 :goto_0

    :cond_8f
    const/16 v2, 0x9d

    goto/16 :goto_0

    :sswitch_90
    const-string p0, "coins"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_90

    goto/16 :goto_0

    :cond_90
    const/16 v2, 0x9c

    goto/16 :goto_0

    :sswitch_91
    const-string p0, "calls"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_91

    goto/16 :goto_0

    :cond_91
    const/16 v2, 0x9b

    goto/16 :goto_0

    :sswitch_92
    const-string p0, "tagLoadStrategy"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_92

    goto/16 :goto_0

    :cond_92
    const/16 v2, 0x9a

    goto/16 :goto_0

    :sswitch_93
    const-string p0, "pendingPaymentGuidance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_93

    goto/16 :goto_0

    :cond_93
    const/16 v2, 0x99

    goto/16 :goto_0

    :sswitch_94
    const-string p0, "videoChatSecondFloorSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_94

    goto/16 :goto_0

    :cond_94
    const/16 v2, 0x98

    goto/16 :goto_0

    :sswitch_95
    const-string p0, "user"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_95

    goto/16 :goto_0

    :cond_95
    const/16 v2, 0x97

    goto/16 :goto_0

    :sswitch_96
    const-string p0, "tags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_96

    goto/16 :goto_0

    :cond_96
    const/16 v2, 0x96

    goto/16 :goto_0

    :sswitch_97
    const-string p0, "next"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_97

    goto/16 :goto_0

    :cond_97
    const/16 v2, 0x95

    goto/16 :goto_0

    :sswitch_98
    const-string p0, "link"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_98

    goto/16 :goto_0

    :cond_98
    const/16 v2, 0x94

    goto/16 :goto_0

    :sswitch_99
    const-string p0, "hint"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_99

    goto/16 :goto_0

    :cond_99
    const/16 v2, 0x93

    goto/16 :goto_0

    :sswitch_9a
    const-string p0, "card"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9a

    goto/16 :goto_0

    :cond_9a
    const/16 v2, 0x92

    goto/16 :goto_0

    :sswitch_9b
    const-string p0, "bell"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9b

    goto/16 :goto_0

    :cond_9b
    const/16 v2, 0x91

    goto/16 :goto_0

    :sswitch_9c
    const-string p0, "tab"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9c

    goto/16 :goto_0

    :cond_9c
    const/16 v2, 0x90

    goto/16 :goto_0

    :sswitch_9d
    const-string p0, "ids"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9d

    goto/16 :goto_0

    :cond_9d
    const/16 v2, 0x8f

    goto/16 :goto_0

    :sswitch_9e
    const-string p0, "userStrategyConfiguration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9e

    goto/16 :goto_0

    :cond_9e
    const/16 v2, 0x8e

    goto/16 :goto_0

    :sswitch_9f
    const-string p0, "surpriseGiftExpirationTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9f

    goto/16 :goto_0

    :cond_9f
    const/16 v2, 0x8d

    goto/16 :goto_0

    :sswitch_a0
    const-string p0, "greetingSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a0

    goto/16 :goto_0

    :cond_a0
    const/16 v2, 0x8c

    goto/16 :goto_0

    :sswitch_a1
    const-string p0, "chatProfiles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a1

    goto/16 :goto_0

    :cond_a1
    const/16 v2, 0x8b

    goto/16 :goto_0

    :sswitch_a2
    const-string p0, "suggestUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a2

    goto/16 :goto_0

    :cond_a2
    const/16 v2, 0x8a

    goto/16 :goto_0

    :sswitch_a3
    const-string p0, "conversationDiff"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a3

    goto/16 :goto_0

    :cond_a3
    const/16 v2, 0x89

    goto/16 :goto_0

    :sswitch_a4
    const-string p0, "realPicturesInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a4

    goto/16 :goto_0

    :cond_a4
    const/16 v2, 0x88

    goto/16 :goto_0

    :sswitch_a5
    const-string p0, "recommendMessages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a5

    goto/16 :goto_0

    :cond_a5
    const/16 v2, 0x87

    goto/16 :goto_0

    :sswitch_a6
    const-string p0, "urlTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a6

    goto/16 :goto_0

    :cond_a6
    const/16 v2, 0x86

    goto/16 :goto_0

    :sswitch_a7
    const-string p0, "likeUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a7

    goto/16 :goto_0

    :cond_a7
    const/16 v2, 0x85

    goto/16 :goto_0

    :sswitch_a8
    const-string p0, "likedByToday"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a8

    goto/16 :goto_0

    :cond_a8
    const/16 v2, 0x84

    goto/16 :goto_0

    :sswitch_a9
    const-string p0, "advancedSearchSettings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a9

    goto/16 :goto_0

    :cond_a9
    const/16 v2, 0x83

    goto/16 :goto_0

    :sswitch_aa
    const-string p0, "cardExtraInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_aa

    goto/16 :goto_0

    :cond_aa
    const/16 v2, 0x82

    goto/16 :goto_0

    :sswitch_ab
    const-string p0, "aiChatAdvice"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ab

    goto/16 :goto_0

    :cond_ab
    const/16 v2, 0x81

    goto/16 :goto_0

    :sswitch_ac
    const-string p0, "cardInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ac

    goto/16 :goto_0

    :cond_ac
    const/16 v2, 0x80

    goto/16 :goto_0

    :sswitch_ad
    const-string p0, "userRisk"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ad

    goto/16 :goto_0

    :cond_ad
    const/16 v2, 0x7f

    goto/16 :goto_0

    :sswitch_ae
    const-string p0, "myMeetEntryV3"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ae

    goto/16 :goto_0

    :cond_ae
    const/16 v2, 0x7e

    goto/16 :goto_0

    :sswitch_af
    const-string p0, "features"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_af

    goto/16 :goto_0

    :cond_af
    const/16 v2, 0x7d

    goto/16 :goto_0

    :sswitch_b0
    const-string p0, "idealInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b0

    goto/16 :goto_0

    :cond_b0
    const/16 v2, 0x7c

    goto/16 :goto_0

    :sswitch_b1
    const-string p0, "appealInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b1

    goto/16 :goto_0

    :cond_b1
    const/16 v2, 0x7b

    goto/16 :goto_0

    :sswitch_b2
    const-string p0, "mkt_activity_quiz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b2

    goto/16 :goto_0

    :cond_b2
    const/16 v2, 0x7a

    goto/16 :goto_0

    :sswitch_b3
    const-string p0, "lowPhotoResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b3

    goto/16 :goto_0

    :cond_b3
    const/16 v2, 0x79

    goto/16 :goto_0

    :sswitch_b4
    const-string p0, "privateCustomSetting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b4

    goto/16 :goto_0

    :cond_b4
    const/16 v2, 0x78

    goto/16 :goto_0

    :sswitch_b5
    const-string p0, "priorityLike"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b5

    goto/16 :goto_0

    :cond_b5
    const/16 v2, 0x77

    goto/16 :goto_0

    :sswitch_b6
    const-string p0, "surpriseGift"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b6

    goto/16 :goto_0

    :cond_b6
    const/16 v2, 0x76

    goto/16 :goto_0

    :sswitch_b7
    const-string p0, "canChange"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b7

    goto/16 :goto_0

    :cond_b7
    const/16 v2, 0x75

    goto/16 :goto_0

    :sswitch_b8
    const-string p0, "myTabTasks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b8

    goto/16 :goto_0

    :cond_b8
    const/16 v2, 0x74

    goto/16 :goto_0

    :sswitch_b9
    const-string p0, "messages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b9

    goto/16 :goto_0

    :cond_b9
    const/16 v2, 0x73

    goto/16 :goto_0

    :sswitch_ba
    const-string p0, "myTabGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ba

    goto/16 :goto_0

    :cond_ba
    const/16 v2, 0x72

    goto/16 :goto_0

    :sswitch_bb
    const-string p0, "profileLikesComments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bb

    goto/16 :goto_0

    :cond_bb
    const/16 v2, 0x71

    goto/16 :goto_0

    :sswitch_bc
    const-string p0, "greetingSetting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bc

    goto/16 :goto_0

    :cond_bc
    const/16 v2, 0x70

    goto/16 :goto_0

    :sswitch_bd
    const-string p0, "feedbackRemainedNum"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bd

    goto/16 :goto_0

    :cond_bd
    const/16 v2, 0x6f

    goto/16 :goto_0

    :sswitch_be
    const-string p0, "extremePickByList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_be

    goto/16 :goto_0

    :cond_be
    const/16 v2, 0x6e

    goto/16 :goto_0

    :sswitch_bf
    const-string p0, "idealInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bf

    goto/16 :goto_0

    :cond_bf
    const/16 v2, 0x6d

    goto/16 :goto_0

    :sswitch_c0
    const-string p0, "contractInfos"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c0

    goto/16 :goto_0

    :cond_c0
    const/16 v2, 0x6c

    goto/16 :goto_0

    :sswitch_c1
    const-string p0, "compliment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c1

    goto/16 :goto_0

    :cond_c1
    const/16 v2, 0x6b

    goto/16 :goto_0

    :sswitch_c2
    const-string p0, "contract"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c2

    goto/16 :goto_0

    :cond_c2
    const/16 v2, 0x6a

    goto/16 :goto_0

    :sswitch_c3
    const-string p0, "contacts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c3

    goto/16 :goto_0

    :cond_c3
    const/16 v2, 0x69

    goto/16 :goto_0

    :sswitch_c4
    const-string p0, "onlineLiveChatPair"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c4

    goto/16 :goto_0

    :cond_c4
    const/16 v2, 0x68

    goto/16 :goto_0

    :sswitch_c5
    const-string p0, "greetingResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c5

    goto/16 :goto_0

    :cond_c5
    const/16 v2, 0x67

    goto/16 :goto_0

    :sswitch_c6
    const-string p0, "complain"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c6

    goto/16 :goto_0

    :cond_c6
    const/16 v2, 0x66

    goto/16 :goto_0

    :sswitch_c7
    const-string p0, "friends"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c7

    goto/16 :goto_0

    :cond_c7
    const/16 v2, 0x65

    goto/16 :goto_0

    :sswitch_c8
    const-string p0, "freeTrialInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c8

    goto/16 :goto_0

    :cond_c8
    const/16 v2, 0x64

    goto/16 :goto_0

    :sswitch_c9
    const-string p0, "notVerificationResultData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c9

    goto/16 :goto_0

    :cond_c9
    const/16 v2, 0x63

    goto/16 :goto_0

    :sswitch_ca
    const-string p0, "likedUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ca

    goto/16 :goto_0

    :cond_ca
    const/16 v2, 0x62

    goto/16 :goto_0

    :sswitch_cb
    const-string p0, "svipWeeklyReport"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cb

    goto/16 :goto_0

    :cond_cb
    const/16 v2, 0x61

    goto/16 :goto_0

    :sswitch_cc
    const-string p0, "anonymousSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cc

    goto/16 :goto_0

    :cond_cc
    const/16 v2, 0x60

    goto/16 :goto_0

    :sswitch_cd
    const-string p0, "monetizationChatSeeUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cd

    goto/16 :goto_0

    :cond_cd
    const/16 v2, 0x5f

    goto/16 :goto_0

    :sswitch_ce
    const-string p0, "barLoverPlaces"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ce

    goto/16 :goto_0

    :cond_ce
    const/16 v2, 0x5e

    goto/16 :goto_0

    :sswitch_cf
    const-string p0, "scoreThreshold"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_cf

    goto/16 :goto_0

    :cond_cf
    const/16 v2, 0x5d

    goto/16 :goto_0

    :sswitch_d0
    const-string p0, "iceBreakQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d0

    goto/16 :goto_0

    :cond_d0
    const/16 v2, 0x5c

    goto/16 :goto_0

    :sswitch_d1
    const-string p0, "payWill"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d1

    goto/16 :goto_0

    :cond_d1
    const/16 v2, 0x5b

    goto/16 :goto_0

    :sswitch_d2
    const-string p0, "wechat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d2

    goto/16 :goto_0

    :cond_d2
    const/16 v2, 0x5a

    goto/16 :goto_0

    :sswitch_d3
    const-string p0, "partner"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d3

    goto/16 :goto_0

    :cond_d3
    const/16 v2, 0x59

    goto/16 :goto_0

    :sswitch_d4
    const-string p0, "wallet"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d4

    goto/16 :goto_0

    :cond_d4
    const/16 v2, 0x58

    goto/16 :goto_0

    :sswitch_d5
    const-string p0, "interestedGroups"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d5

    goto/16 :goto_0

    :cond_d5
    const/16 v2, 0x57

    goto/16 :goto_0

    :sswitch_d6
    const-string p0, "groupSettings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d6

    goto/16 :goto_0

    :cond_d6
    const/16 v2, 0x56

    goto/16 :goto_0

    :sswitch_d7
    const-string p0, "chatGameInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d7

    goto/16 :goto_0

    :cond_d7
    const/16 v2, 0x55

    goto/16 :goto_0

    :sswitch_d8
    const-string p0, "recentConversations"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d8

    goto/16 :goto_0

    :cond_d8
    const/16 v2, 0x54

    goto/16 :goto_0

    :sswitch_d9
    const-string p0, "voices"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d9

    goto/16 :goto_0

    :cond_d9
    const/16 v2, 0x53

    goto/16 :goto_0

    :sswitch_da
    const-string p0, "verificationTokens"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_da

    goto/16 :goto_0

    :cond_da
    const/16 v2, 0x52

    goto/16 :goto_0

    :sswitch_db
    const-string p0, "blindbox"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_db

    goto/16 :goto_0

    :cond_db
    const/16 v2, 0x51

    goto/16 :goto_0

    :sswitch_dc
    const-string p0, "prologues"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_dc

    goto/16 :goto_0

    :cond_dc
    const/16 v2, 0x50

    goto/16 :goto_0

    :sswitch_dd
    const-string p0, "seeTrialEligible"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_dd

    goto/16 :goto_0

    :cond_dd
    const/16 v2, 0x4f

    goto/16 :goto_0

    :sswitch_de
    const-string p0, "figures"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_de

    goto/16 :goto_0

    :cond_de
    const/16 v2, 0x4e

    goto/16 :goto_0

    :sswitch_df
    const-string p0, "fakeSuggest"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_df

    goto/16 :goto_0

    :cond_df
    const/16 v2, 0x4d

    goto/16 :goto_0

    :sswitch_e0
    const-string p0, "odiamondList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e0

    goto/16 :goto_0

    :cond_e0
    const/16 v2, 0x4c

    goto/16 :goto_0

    :sswitch_e1
    const-string p0, "states"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e1

    goto/16 :goto_0

    :cond_e1
    const/16 v2, 0x4b

    goto/16 :goto_0

    :sswitch_e2
    const-string p0, "profileLikeCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e2

    goto/16 :goto_0

    :cond_e2
    const/16 v2, 0x4a

    goto/16 :goto_0

    :sswitch_e3
    const-string p0, "superLikeCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e3

    goto/16 :goto_0

    :cond_e3
    const/16 v2, 0x49

    goto/16 :goto_0

    :sswitch_e4
    const-string p0, "instantMatchGiveCountInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e4

    goto/16 :goto_0

    :cond_e4
    const/16 v2, 0x48

    goto/16 :goto_0

    :sswitch_e5
    const-string p0, "visitorInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e5

    goto/16 :goto_0

    :cond_e5
    const/16 v2, 0x47

    goto/16 :goto_0

    :sswitch_e6
    const-string p0, "feedbackQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e6

    goto/16 :goto_0

    :cond_e6
    const/16 v2, 0x46

    goto/16 :goto_0

    :sswitch_e7
    const-string p0, "orders"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e7

    goto/16 :goto_0

    :cond_e7
    const/16 v2, 0x45

    goto/16 :goto_0

    :sswitch_e8
    const-string p0, "questionnaire"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e8

    goto/16 :goto_0

    :cond_e8
    const/16 v2, 0x44

    goto/16 :goto_0

    :sswitch_e9
    const-string p0, "voicechat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e9

    goto/16 :goto_0

    :cond_e9
    const/16 v2, 0x43

    goto/16 :goto_0

    :sswitch_ea
    const-string p0, "giftWallSocials"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ea

    goto/16 :goto_0

    :cond_ea
    const/16 v2, 0x42

    goto/16 :goto_0

    :sswitch_eb
    const-string p0, "intlBubble"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_eb

    goto/16 :goto_0

    :cond_eb
    const/16 v2, 0x41

    goto/16 :goto_0

    :sswitch_ec
    const-string p0, "picksUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ec

    goto/16 :goto_0

    :cond_ec
    const/16 v2, 0x40

    goto/16 :goto_0

    :sswitch_ed
    const-string p0, "myMeet"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ed

    goto/16 :goto_0

    :cond_ed
    const/16 v2, 0x3f

    goto/16 :goto_0

    :sswitch_ee
    const-string p0, "cardCornerMarks"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ee

    goto/16 :goto_0

    :cond_ee
    const/16 v2, 0x3e

    goto/16 :goto_0

    :sswitch_ef
    const-string p0, "isRecallUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ef

    goto/16 :goto_0

    :cond_ef
    const/16 v2, 0x3d

    goto/16 :goto_0

    :sswitch_f0
    const-string p0, "barLoverCities"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f0

    goto/16 :goto_0

    :cond_f0
    const/16 v2, 0x3c

    goto/16 :goto_0

    :sswitch_f1
    const-string p0, "greetingHotLevelInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f1

    goto/16 :goto_0

    :cond_f1
    const/16 v2, 0x3b

    goto/16 :goto_0

    :sswitch_f2
    const-string p0, "cityCData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f2

    goto/16 :goto_0

    :cond_f2
    const/16 v2, 0x3a

    goto/16 :goto_0

    :sswitch_f3
    const-string p0, "recommendList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f3

    goto/16 :goto_0

    :cond_f3
    const/16 v2, 0x39

    goto/16 :goto_0

    :sswitch_f4
    const-string p0, "groupApplies"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f4

    goto/16 :goto_0

    :cond_f4
    const/16 v2, 0x38

    goto/16 :goto_0

    :sswitch_f5
    const-string p0, "latestMoments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f5

    goto/16 :goto_0

    :cond_f5
    const/16 v2, 0x37

    goto/16 :goto_0

    :sswitch_f6
    const-string p0, "loveLetterContent"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f6

    goto/16 :goto_0

    :cond_f6
    const/16 v2, 0x36

    goto/16 :goto_0

    :sswitch_f7
    const-string p0, "actives"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f7

    goto/16 :goto_0

    :cond_f7
    const/16 v2, 0x35

    goto/16 :goto_0

    :sswitch_f8
    const-string p0, "creditScores"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f8

    goto/16 :goto_0

    :cond_f8
    const/16 v2, 0x34

    goto/16 :goto_0

    :sswitch_f9
    const-string p0, "tacitTest"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f9

    goto/16 :goto_0

    :cond_f9
    const/16 v2, 0x33

    goto/16 :goto_0

    :sswitch_fa
    const-string p0, "ttcToDiamondRate"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fa

    goto/16 :goto_0

    :cond_fa
    const/16 v2, 0x32

    goto/16 :goto_0

    :sswitch_fb
    const-string p0, "greets"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fb

    goto/16 :goto_0

    :cond_fb
    const/16 v2, 0x31

    goto/16 :goto_0

    :sswitch_fc
    const-string p0, "userMomentSetting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fc

    goto/16 :goto_0

    :cond_fc
    const/16 v2, 0x30

    goto/16 :goto_0

    :sswitch_fd
    const-string p0, "privateCustomResults"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fd

    goto/16 :goto_0

    :cond_fd
    const/16 v2, 0x2f

    goto/16 :goto_0

    :sswitch_fe
    const-string p0, "floats"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_fe

    goto/16 :goto_0

    :cond_fe
    const/16 v2, 0x2e

    goto/16 :goto_0

    :sswitch_ff
    const-string p0, "pictureTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ff

    goto/16 :goto_0

    :cond_ff
    const/16 v2, 0x2d

    goto/16 :goto_0

    :sswitch_100
    const-string p0, "marriageGuide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_100

    goto/16 :goto_0

    :cond_100
    const/16 v2, 0x2c

    goto/16 :goto_0

    :sswitch_101
    const-string p0, "explore"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_101

    goto/16 :goto_0

    :cond_101
    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_102
    const-string p0, "oneside"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_102

    goto/16 :goto_0

    :cond_102
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_103
    const-string p0, "greetingPermissions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_103

    goto/16 :goto_0

    :cond_103
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_104
    const-string p0, "tickles"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_104

    goto/16 :goto_0

    :cond_104
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_105
    const-string p0, "avatar"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_105

    goto/16 :goto_0

    :cond_105
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_106
    const-string p0, "picksInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_106

    goto/16 :goto_0

    :cond_106
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_107
    const-string p0, "action"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_107

    goto/16 :goto_0

    :cond_107
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_108
    const-string p0, "tagCategories"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_108

    goto/16 :goto_0

    :cond_108
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_109
    const-string p0, "stateEmotion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_109

    goto/16 :goto_0

    :cond_109
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_10a
    const-string p0, "groupTabs"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10a

    goto/16 :goto_0

    :cond_10a
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_10b
    const-string p0, "selectedQuestion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10b

    goto/16 :goto_0

    :cond_10b
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_10c
    const-string p0, "greetingCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10c

    goto/16 :goto_0

    :cond_10c
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_10d
    const-string p0, "literatureConfigInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10d

    goto/16 :goto_0

    :cond_10d
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_10e
    const-string p0, "profileCounts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10e

    goto/16 :goto_0

    :cond_10e
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_10f
    const-string p0, "comStatusAwards"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10f

    goto/16 :goto_0

    :cond_10f
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_110
    const-string p0, "cipherId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_110

    goto/16 :goto_0

    :cond_110
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_111
    const-string p0, "loveLetter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_111

    goto/16 :goto_0

    :cond_111
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_112
    const-string p0, "selectionUserInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_112

    goto/16 :goto_0

    :cond_112
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_113
    const-string p0, "tagUserCounts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_113

    goto/16 :goto_0

    :cond_113
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_114
    const-string p0, "aiPictureAuth"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_114

    goto/16 :goto_0

    :cond_114
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_115
    const-string p0, "exposureInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_115

    goto/16 :goto_0

    :cond_115
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_116
    const-string p0, "seeExposedUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_116

    goto/16 :goto_0

    :cond_116
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_117
    const-string p0, "tagCategoryStrategy"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_117

    goto/16 :goto_0

    :cond_117
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_118
    const-string p0, "chatAssistantQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_118

    goto/16 :goto_0

    :cond_118
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_119
    const-string p0, "tagPictureStrategy"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_119

    goto/16 :goto_0

    :cond_119
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_11a
    const-string p0, "questions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11a

    goto/16 :goto_0

    :cond_11a
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_11b
    const-string p0, "privacySettings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11b

    goto/16 :goto_0

    :cond_11b
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_11c
    const-string p0, "ultraRightsUpgradeInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11c

    goto/16 :goto_0

    :cond_11c
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_11d
    const-string p0, "chatGroupMembers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11d

    goto/16 :goto_0

    :cond_11d
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_11e
    const-string p0, "settingGroups"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11e

    goto/16 :goto_0

    :cond_11e
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_11f
    const-string p0, "surveys"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11f

    goto/16 :goto_0

    :cond_11f
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_120
    const-string p0, "systemQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_120

    goto/16 :goto_0

    :cond_120
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_121
    const-string p0, "readMessages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_121

    goto/16 :goto_0

    :cond_121
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_122
    const-string p0, "acceleratePairing"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_122

    goto/16 :goto_0

    :cond_122
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_123
    const-string p0, "fakeGuideData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_123

    goto/16 :goto_0

    :cond_123
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_124
    const-string p0, "resources"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_124

    goto/16 :goto_0

    :cond_124
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_125
    const-string p0, "purchaseDialogConf"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_125

    goto :goto_0

    :cond_125
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_126
    const-string p0, "extremeQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_126

    goto :goto_0

    :cond_126
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_127
    const-string p0, "chatGroups"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_127

    goto :goto_0

    :cond_127
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_128
    const-string p0, "privilegeGifts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_128

    goto :goto_0

    :cond_128
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_129
    const-string p0, "instantChat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_129

    goto :goto_0

    :cond_129
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_12a
    const-string p0, "walletAccounts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12a

    goto :goto_0

    :cond_12a
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_12b
    const-string p0, "selectionUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12b

    goto :goto_0

    :cond_12b
    move v2, v1

    goto :goto_0

    :sswitch_12c
    const-string p0, "chatPartners"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12c

    goto :goto_0

    :cond_12c
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    return v1

    .line 4
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Note;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 5
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Note;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    return v1

    .line 6
    :pswitch_2
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    return v1

    .line 8
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    return v1

    .line 10
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/Greeting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 11
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    return v1

    .line 12
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/core/data/ShareId;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ShareId;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    return v1

    .line 14
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/InsertCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    return v1

    .line 16
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    return v1

    .line 17
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    return v1

    .line 19
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/core/data/HeartBeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    return v1

    .line 21
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/data/IdealTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 22
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    return v1

    .line 23
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    return v1

    .line 25
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    return v1

    .line 27
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/core/data/School;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    return v1

    .line 29
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    return v1

    .line 31
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/core/data/RecallMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 32
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RecallMatch;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    return v1

    .line 33
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 34
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    return v1

    .line 35
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 36
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    return v1

    .line 37
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/NotificationCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    return v1

    .line 39
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/BoostStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 40
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    return v1

    .line 41
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/core/data/AccountRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 42
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    return v1

    .line 43
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    return v1

    .line 45
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/core/data/Literatures;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    return v1

    .line 47
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    return v1

    .line 49
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlVisitor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    return v1

    .line 51
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    return v1

    .line 53
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 54
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    return v1

    .line 55
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/core/data/CityCConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CityCConfig;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    return v1

    .line 57
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 58
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    return v1

    .line 59
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupAttribute;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    return v1

    .line 61
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    return v1

    .line 63
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/core/data/CityCBanner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 64
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CityCBanner;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    return v1

    .line 65
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/data/DetectText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 66
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    return v1

    .line 67
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/core/data/AudioText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 68
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    return v1

    .line 69
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/core/data/Sticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 70
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    return v1

    .line 71
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardsIcons;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 72
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    return v1

    .line 73
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 74
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    return v1

    .line 75
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/core/data/JmpTarget;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/JmpTarget;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    return v1

    .line 77
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    return v1

    .line 79
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/core/data/Conversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 80
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    return v1

    .line 81
    :pswitch_28
    sget-object p0, Lcom/p1/mobile/putong/core/data/Recommended;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 82
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    return v1

    .line 83
    :pswitch_29
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 84
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatPage;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    return v1

    .line 85
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    return v1

    .line 86
    :pswitch_2b
    sget-object p0, Lcom/p1/mobile/putong/core/data/Couponbag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Couponbag;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    return v1

    .line 88
    :pswitch_2c
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 89
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    return v1

    .line 90
    :pswitch_2d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 91
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    return v1

    .line 92
    :pswitch_2e
    sget-object p0, Lcom/p1/mobile/putong/core/data/IPRegion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 93
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    return v1

    .line 94
    :pswitch_2f
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 95
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    return v1

    .line 96
    :pswitch_30
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeePortrait;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 97
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    return v1

    .line 98
    :pswitch_31
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 99
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    return v1

    .line 100
    :pswitch_32
    sget-object p0, Lcom/p1/mobile/putong/core/data/FaceidToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    return v1

    .line 102
    :pswitch_33
    sget-object p0, Lcom/p1/mobile/putong/core/data/VisitorHidden;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    return v1

    .line 104
    :pswitch_34
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 105
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    return v1

    .line 106
    :pswitch_35
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 107
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    return v1

    .line 108
    :pswitch_36
    sget-object p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 109
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CounterVerification;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    return v1

    .line 110
    :pswitch_37
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 111
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    return v1

    .line 112
    :pswitch_38
    sget-object p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 113
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    return v1

    .line 114
    :pswitch_39
    sget-object p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 115
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    return v1

    .line 116
    :pswitch_3a
    sget-object p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    return v1

    .line 118
    :pswitch_3b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    return v1

    .line 119
    :pswitch_3c
    sget-object p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 120
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    return v1

    .line 121
    :pswitch_3d
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 122
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    return v1

    .line 123
    :pswitch_3e
    sget-object p0, Lcom/p1/mobile/putong/core/data/BuzzUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 124
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    return v1

    .line 125
    :pswitch_3f
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserIdType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    return v1

    .line 127
    :pswitch_40
    sget-object p0, Lcom/p1/mobile/putong/core/data/MatchInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 128
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MatchInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    return v1

    .line 129
    :pswitch_41
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 130
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    return v1

    .line 131
    :pswitch_42
    sget-object p0, Lcom/p1/mobile/putong/core/data/Reminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 132
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    return v1

    .line 133
    :pswitch_43
    sget-object p0, Lcom/p1/mobile/putong/core/data/RefundDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 134
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    return v1

    .line 135
    :pswitch_44
    sget-object p0, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 136
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    return v1

    .line 137
    :pswitch_45
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserAudits;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 138
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    return v1

    .line 139
    :pswitch_46
    sget-object p0, Lcom/p1/mobile/putong/core/data/ComplimentText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 140
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    return v1

    .line 141
    :pswitch_47
    sget-object p0, Lcom/p1/mobile/putong/core/data/CountdownItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    return v1

    .line 143
    :pswitch_48
    sget-object p0, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 144
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    return v1

    .line 145
    :pswitch_49
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 146
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    return v1

    .line 147
    :pswitch_4a
    sget-object p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 148
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    return v1

    .line 149
    :pswitch_4b
    sget-object p0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 150
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RiskOtherData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    return v1

    .line 151
    :pswitch_4c
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 152
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    return v1

    .line 153
    :pswitch_4d
    sget-object p0, Lcom/p1/mobile/putong/core/data/Coupon;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 154
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    return v1

    .line 155
    :pswitch_4e
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 156
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    return v1

    .line 157
    :pswitch_4f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    return v1

    .line 158
    :pswitch_50
    sget-object p0, Lcom/p1/mobile/putong/core/data/Evaluation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 159
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Evaluation;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    return v1

    .line 160
    :pswitch_51
    sget-object p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 161
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    return v1

    .line 162
    :pswitch_52
    sget-object p0, Lcom/p1/mobile/putong/core/data/Evaluation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 163
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    return v1

    .line 164
    :pswitch_53
    sget-object p0, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    return v1

    .line 166
    :pswitch_54
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 167
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    return v1

    .line 168
    :pswitch_55
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 169
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    return v1

    .line 170
    :pswitch_56
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 171
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    return v1

    .line 172
    :pswitch_57
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupNotification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 173
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    return v1

    .line 174
    :pswitch_58
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserSticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 175
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    return v1

    .line 176
    :pswitch_59
    sget-object p0, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 177
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    return v1

    .line 178
    :pswitch_5a
    sget-object p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 179
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    return v1

    .line 180
    :pswitch_5b
    sget-object p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    return v1

    .line 182
    :pswitch_5c
    sget-object p0, Lcom/p1/mobile/putong/core/data/AuditPictureTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 183
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    return v1

    .line 184
    :pswitch_5d
    sget-object p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 185
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    return v1

    .line 186
    :pswitch_5e
    sget-object p0, Lcom/p1/mobile/putong/core/data/LiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 187
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    return v1

    .line 188
    :pswitch_5f
    sget-object p0, Lcom/p1/mobile/putong/data/UserActivityInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 189
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    return v1

    .line 190
    :pswitch_60
    sget-object p0, Lcom/p1/mobile/putong/core/data/GiftWallTitle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 191
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    return v1

    .line 192
    :pswitch_61
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 193
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    return v1

    .line 194
    :pswitch_62
    sget-object p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 195
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    return v1

    .line 196
    :pswitch_63
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 197
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    return v1

    .line 198
    :pswitch_64
    sget-object p0, Lcom/p1/mobile/putong/core/data/PopGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 199
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PopGuide;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    return v1

    .line 200
    :pswitch_65
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 201
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    return v1

    .line 202
    :pswitch_66
    sget-object p0, Lcom/p1/mobile/putong/core/data/InvitationInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 203
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/InvitationInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    return v1

    .line 204
    :pswitch_67
    sget-object p0, Lcom/p1/mobile/putong/core/data/Merchandise;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 205
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    return v1

    .line 206
    :pswitch_68
    sget-object p0, Lcom/p1/mobile/putong/core/data/BreakIce;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 207
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    return v1

    .line 208
    :pswitch_69
    sget-object p0, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 209
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    return v1

    .line 210
    :pswitch_6a
    sget-object p0, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 211
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    return v1

    .line 212
    :pswitch_6b
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 213
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    return v1

    .line 214
    :pswitch_6c
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 215
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    return v1

    .line 216
    :pswitch_6d
    sget-object p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 217
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    return v1

    .line 218
    :pswitch_6e
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 219
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    return v1

    .line 220
    :pswitch_6f
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 221
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    return v1

    .line 222
    :pswitch_70
    sget-object p0, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 223
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    return v1

    .line 224
    :pswitch_71
    sget-object p0, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 225
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    return v1

    .line 226
    :pswitch_72
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 227
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    return v1

    .line 228
    :pswitch_73
    sget-object p0, Lcom/p1/mobile/putong/data/Relationship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 229
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    return v1

    .line 230
    :pswitch_74
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 231
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    return v1

    .line 232
    :pswitch_75
    sget-object p0, Lcom/p1/mobile/putong/core/data/OfficialAccount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 233
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    return v1

    .line 234
    :pswitch_76
    sget-object p0, Lcom/p1/mobile/putong/core/data/FateRadar;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 235
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FateRadar;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    return v1

    .line 236
    :pswitch_77
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 237
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    return v1

    .line 238
    :pswitch_78
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 239
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    return v1

    .line 240
    :pswitch_79
    sget-object p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 241
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    return v1

    .line 242
    :pswitch_7a
    sget-object p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 243
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    return v1

    .line 244
    :pswitch_7b
    sget-object p0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 245
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    return v1

    .line 246
    :pswitch_7c
    sget-object p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 247
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    return v1

    .line 248
    :pswitch_7d
    sget-object p0, Lcom/p1/mobile/putong/core/data/PermissionsItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 249
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    return v1

    .line 250
    :pswitch_7e
    sget-object p0, Lcom/p1/mobile/putong/core/data/RedPacket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 251
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    return v1

    .line 252
    :pswitch_7f
    sget-object p0, Lcom/p1/mobile/putong/core/data/DislikedUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 253
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    return v1

    .line 254
    :pswitch_80
    sget-object p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 255
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    return v1

    .line 256
    :pswitch_81
    sget-object p0, Lcom/p1/mobile/putong/core/data/VipSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 257
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/VipSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    return v1

    .line 258
    :pswitch_82
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    return v1

    .line 260
    :pswitch_83
    sget-object p0, Lcom/p1/mobile/putong/core/data/AutoDeducts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 261
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    return v1

    .line 262
    :pswitch_84
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 263
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    return v1

    .line 264
    :pswitch_85
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    return v1

    .line 265
    :pswitch_86
    sget-object p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 266
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    return v1

    .line 267
    :pswitch_87
    sget-object p0, Lcom/p1/mobile/putong/core/data/RiskSelfData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 268
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    return v1

    .line 269
    :pswitch_88
    sget-object p0, Lcom/p1/mobile/putong/core/data/Picks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 270
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Picks;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    return v1

    .line 271
    :pswitch_89
    sget-object p0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 272
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    return v1

    .line 273
    :pswitch_8a
    sget-object p0, Lcom/p1/mobile/putong/data/Live;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 274
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    return v1

    .line 275
    :pswitch_8b
    sget-object p0, Lcom/p1/mobile/putong/data/Link;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 276
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    return v1

    .line 277
    :pswitch_8c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    return v1

    .line 278
    :pswitch_8d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 279
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    return v1

    .line 280
    :pswitch_8e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    return v1

    .line 281
    :pswitch_8f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    return v1

    .line 282
    :pswitch_90
    sget-object p0, Lcom/p1/mobile/putong/core/data/Coin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 283
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Coin;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    return v1

    .line 284
    :pswitch_91
    sget-object p0, Lcom/p1/mobile/putong/core/data/VoiceCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 285
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    return v1

    .line 286
    :pswitch_92
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 287
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TagStrategy;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    return v1

    .line 288
    :pswitch_93
    sget-object p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 289
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    return v1

    .line 290
    :pswitch_94
    sget-object p0, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 291
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    return v1

    .line 292
    :pswitch_95
    sget-object p0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 293
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/User;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    return v1

    .line 294
    :pswitch_96
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 295
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    return v1

    .line 296
    :pswitch_97
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    return v1

    .line 297
    :pswitch_98
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    return v1

    .line 298
    :pswitch_99
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    return v1

    .line 299
    :pswitch_9a
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 300
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    return v1

    .line 301
    :pswitch_9b
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 302
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    return v1

    .line 303
    :pswitch_9c
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    return v1

    .line 305
    :pswitch_9d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 306
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    return v1

    .line 307
    :pswitch_9e
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 308
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    return v1

    .line 309
    :pswitch_9f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    return v1

    .line 310
    :pswitch_a0
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 311
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    return v1

    .line 312
    :pswitch_a1
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 313
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    return v1

    .line 314
    :pswitch_a2
    sget-object p0, Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 315
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    return v1

    .line 316
    :pswitch_a3
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationDiff;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 317
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationDiff;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    return v1

    .line 318
    :pswitch_a4
    sget-object p0, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 319
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    return v1

    .line 320
    :pswitch_a5
    sget-object p0, Lcom/p1/mobile/putong/data/RecommendMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 321
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    return v1

    .line 322
    :pswitch_a6
    sget-object p0, Lcom/p1/mobile/putong/core/data/UrlTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 323
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    return v1

    .line 324
    :pswitch_a7
    sget-object p0, Lcom/p1/mobile/putong/core/data/LikeUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 325
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    return v1

    .line 326
    :pswitch_a8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    return v1

    .line 327
    :pswitch_a9
    sget-object p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 328
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    return v1

    .line 329
    :pswitch_aa
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 330
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    return v1

    .line 331
    :pswitch_ab
    sget-object p0, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 332
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    return v1

    .line 333
    :pswitch_ac
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 334
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    return v1

    .line 335
    :pswitch_ad
    sget-object p0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 336
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RiskOtherData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    return v1

    .line 337
    :pswitch_ae
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 338
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    return v1

    .line 339
    :pswitch_af
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 340
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    return v1

    .line 341
    :pswitch_b0
    sget-object p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 342
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/IdealInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    return v1

    .line 343
    :pswitch_b1
    sget-object p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 344
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    return v1

    .line 345
    :pswitch_b2
    sget-object p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 346
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    return v1

    .line 347
    :pswitch_b3
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 348
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    return v1

    .line 349
    :pswitch_b4
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    return v1

    .line 351
    :pswitch_b5
    sget-object p0, Lcom/p1/mobile/putong/core/data/PriorityLike;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 352
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PriorityLike;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    return v1

    .line 353
    :pswitch_b6
    sget-object p0, Lcom/p1/mobile/putong/core/data/SurpriseGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 354
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SurpriseGift;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    return v1

    .line 355
    :pswitch_b7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    return v1

    .line 356
    :pswitch_b8
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 357
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    return v1

    .line 358
    :pswitch_b9
    sget-object p0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 359
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    return v1

    .line 360
    :pswitch_ba
    sget-object p0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 361
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/DatingGuideData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    return v1

    .line 362
    :pswitch_bb
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 363
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    return v1

    .line 364
    :pswitch_bc
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 365
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    return v1

    .line 366
    :pswitch_bd
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    return v1

    .line 367
    :pswitch_be
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExtremePickItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 368
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    return v1

    .line 369
    :pswitch_bf
    sget-object p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 370
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    return v1

    .line 371
    :pswitch_c0
    sget-object p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 372
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    return v1

    .line 373
    :pswitch_c1
    sget-object p0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 374
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    return v1

    .line 375
    :pswitch_c2
    sget-object p0, Lcom/p1/mobile/putong/data/Contract;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 376
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/Contract;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    return v1

    .line 377
    :pswitch_c3
    sget-object p0, Lcom/p1/mobile/putong/data/Contact;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 378
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    return v1

    .line 379
    :pswitch_c4
    sget-object p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 380
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    return v1

    .line 381
    :pswitch_c5
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 382
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingResult;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    return v1

    .line 383
    :pswitch_c6
    sget-object p0, Lcom/p1/mobile/putong/core/data/Complain;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 384
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    return v1

    .line 385
    :pswitch_c7
    sget-object p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 386
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    return v1

    .line 387
    :pswitch_c8
    sget-object p0, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 388
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    return v1

    .line 389
    :pswitch_c9
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 390
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    return v1

    .line 391
    :pswitch_ca
    sget-object p0, Lcom/p1/mobile/putong/core/data/LikedUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 392
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    return v1

    .line 393
    :pswitch_cb
    sget-object p0, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 394
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    return v1

    .line 395
    :pswitch_cc
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 396
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    return v1

    .line 397
    :pswitch_cd
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 398
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    return v1

    .line 399
    :pswitch_ce
    sget-object p0, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 400
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    return v1

    .line 401
    :pswitch_cf
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    return v1

    .line 402
    :pswitch_d0
    sget-object p0, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 403
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    return v1

    .line 404
    :pswitch_d1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    return v1

    .line 405
    :pswitch_d2
    sget-object p0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 406
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    return v1

    .line 407
    :pswitch_d3
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthPartner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 408
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthPartner;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    return v1

    .line 409
    :pswitch_d4
    sget-object p0, Lcom/p1/mobile/putong/core/data/Wallet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 410
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Wallet;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    return v1

    .line 411
    :pswitch_d5
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 412
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    return v1

    .line 413
    :pswitch_d6
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 414
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    return v1

    .line 415
    :pswitch_d7
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 416
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    return v1

    .line 417
    :pswitch_d8
    sget-object p0, Lcom/p1/mobile/putong/core/data/RecentConversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 418
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    return v1

    .line 419
    :pswitch_d9
    sget-object p0, Lcom/p1/mobile/putong/core/data/Voice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 420
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    return v1

    .line 421
    :pswitch_da
    sget-object p0, Lcom/p1/mobile/putong/data/VerificationToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 422
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    return v1

    .line 423
    :pswitch_db
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 424
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    return v1

    .line 425
    :pswitch_dc
    sget-object p0, Lcom/p1/mobile/putong/core/data/Prologue;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 426
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    return v1

    .line 427
    :pswitch_dd
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 428
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    return v1

    .line 429
    :pswitch_de
    sget-object p0, Lcom/p1/mobile/putong/core/data/Figure;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 430
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    return v1

    .line 431
    :pswitch_df
    sget-object p0, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 432
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    return v1

    .line 433
    :pswitch_e0
    sget-object p0, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 434
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    return v1

    .line 435
    :pswitch_e1
    sget-object p0, Lcom/p1/mobile/putong/data/BubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 436
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    return v1

    .line 437
    :pswitch_e2
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 438
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    return v1

    .line 439
    :pswitch_e3
    sget-object p0, Lcom/p1/mobile/putong/core/data/SuperLikeCount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 440
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    return v1

    .line 441
    :pswitch_e4
    sget-object p0, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 442
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    return v1

    .line 443
    :pswitch_e5
    sget-object p0, Lcom/p1/mobile/putong/core/data/VisitorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 444
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    return v1

    .line 445
    :pswitch_e6
    sget-object p0, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 446
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    return v1

    .line 447
    :pswitch_e7
    sget-object p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 448
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    return v1

    .line 449
    :pswitch_e8
    sget-object p0, Lcom/p1/mobile/putong/core/data/Questionnaire;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 450
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Questionnaire;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    return v1

    .line 451
    :pswitch_e9
    sget-object p0, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 452
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    return v1

    .line 453
    :pswitch_ea
    sget-object p0, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 454
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    return v1

    .line 455
    :pswitch_eb
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 456
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    return v1

    .line 457
    :pswitch_ec
    sget-object p0, Lcom/p1/mobile/putong/core/data/PicksUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 458
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    return v1

    .line 459
    :pswitch_ed
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 460
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    return v1

    .line 461
    :pswitch_ee
    sget-object p0, Lcom/p1/mobile/putong/core/data/CardCornerMark;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 462
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    return v1

    .line 463
    :pswitch_ef
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    return v1

    .line 464
    :pswitch_f0
    sget-object p0, Lcom/p1/mobile/putong/core/data/BarLoverCitys;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 465
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    return v1

    .line 466
    :pswitch_f1
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 467
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    return v1

    .line 468
    :pswitch_f2
    sget-object p0, Lcom/p1/mobile/putong/core/data/CityCData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 469
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    return v1

    .line 470
    :pswitch_f3
    sget-object p0, Lcom/p1/mobile/putong/core/data/TribeSubset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 471
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    return v1

    .line 472
    :pswitch_f4
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupApply;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 473
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    return v1

    .line 474
    :pswitch_f5
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 475
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    return v1

    .line 476
    :pswitch_f6
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 477
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    return v1

    .line 478
    :pswitch_f7
    sget-object p0, Lcom/p1/mobile/putong/core/data/Active;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 479
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    return v1

    .line 480
    :pswitch_f8
    sget-object p0, Lcom/p1/mobile/putong/core/data/CreditScoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 481
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    return v1

    .line 482
    :pswitch_f9
    sget-object p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 483
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    return v1

    .line 484
    :pswitch_fa
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    return v1

    .line 485
    :pswitch_fb
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserGreetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 486
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    return v1

    .line 487
    :pswitch_fc
    sget-object p0, Lcom/p1/mobile/putong/core/data/VisitorSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 488
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/VisitorSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    return v1

    .line 489
    :pswitch_fd
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 490
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    return v1

    .line 491
    :pswitch_fe
    sget-object p0, Lcom/p1/mobile/putong/core/data/FloatsCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 492
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    return v1

    .line 493
    :pswitch_ff
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 494
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    return v1

    .line 495
    :pswitch_100
    sget-object p0, Lcom/p1/mobile/putong/core/data/MarriageGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 496
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MarriageGuide;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    return v1

    .line 497
    :pswitch_101
    sget-object p0, Lcom/p1/mobile/putong/core/data/Explore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 498
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Explore;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    return v1

    .line 499
    :pswitch_102
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 500
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    return v1

    .line 501
    :pswitch_103
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingPermission;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 502
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    return v1

    .line 503
    :pswitch_104
    sget-object p0, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 504
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    return v1

    .line 505
    :pswitch_105
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    return v1

    .line 506
    :pswitch_106
    sget-object p0, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 507
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    return v1

    .line 508
    :pswitch_107
    sget-object p0, Lcom/p1/mobile/putong/core/data/ActionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 509
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ActionData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    return v1

    .line 510
    :pswitch_108
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagCategories;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 511
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    return v1

    .line 512
    :pswitch_109
    sget-object p0, Lcom/p1/mobile/putong/data/StateEmotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 513
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    return v1

    .line 514
    :pswitch_10a
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 515
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    return v1

    .line 516
    :pswitch_10b
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 517
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    return v1

    .line 518
    :pswitch_10c
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 519
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    return v1

    .line 520
    :pswitch_10d
    sget-object p0, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 521
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    return v1

    .line 522
    :pswitch_10e
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 523
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    return v1

    .line 524
    :pswitch_10f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 525
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    return v1

    .line 526
    :pswitch_110
    sget-object p0, Lcom/p1/mobile/putong/core/data/CipherId;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 527
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CipherId;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    return v1

    .line 528
    :pswitch_111
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 529
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    return v1

    .line 530
    :pswitch_112
    sget-object p0, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 531
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    return v1

    .line 532
    :pswitch_113
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagUserCounts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 533
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    return v1

    .line 534
    :pswitch_114
    sget-object p0, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 535
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    return v1

    .line 536
    :pswitch_115
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 537
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    return v1

    .line 538
    :pswitch_116
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 539
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    return v1

    .line 540
    :pswitch_117
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 541
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TagStrategy;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    return v1

    .line 542
    :pswitch_118
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 543
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    return v1

    .line 544
    :pswitch_119
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 545
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TagStrategy;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    return v1

    .line 546
    :pswitch_11a
    sget-object p0, Lcom/p1/mobile/putong/core/data/Question;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 547
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    return v1

    .line 548
    :pswitch_11b
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 549
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    return v1

    .line 550
    :pswitch_11c
    sget-object p0, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 551
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    return v1

    .line 552
    :pswitch_11d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 553
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    return v1

    .line 554
    :pswitch_11e
    sget-object p0, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 555
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    return v1

    .line 556
    :pswitch_11f
    sget-object p0, Lcom/p1/mobile/putong/core/data/Surveys;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 557
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    return v1

    .line 558
    :pswitch_120
    sget-object p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 559
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    return v1

    .line 560
    :pswitch_121
    sget-object p0, Lcom/p1/mobile/putong/core/data/ReadMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 561
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    return v1

    .line 562
    :pswitch_122
    sget-object p0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 563
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    return v1

    .line 564
    :pswitch_123
    sget-object p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 565
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    return v1

    .line 566
    :pswitch_124
    sget-object p0, Lcom/p1/mobile/putong/core/data/ResourceTriggers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 567
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    return v1

    .line 568
    :pswitch_125
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 569
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    return v1

    .line 570
    :pswitch_126
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 571
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    return v1

    .line 572
    :pswitch_127
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 573
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    return v1

    .line 574
    :pswitch_128
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 575
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    return v1

    .line 576
    :pswitch_129
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 577
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    return v1

    .line 578
    :pswitch_12a
    sget-object p0, Lcom/p1/mobile/putong/core/data/WalletAccount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 579
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    return v1

    .line 580
    :pswitch_12b
    sget-object p0, Lcom/p1/mobile/putong/core/data/SelectionUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 581
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    return v1

    .line 582
    :pswitch_12c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPartners;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 583
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatPartners;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7fd523dd -> :sswitch_12c
        -0x7f4fbc24 -> :sswitch_12b
        -0x7e609501 -> :sswitch_12a
        -0x7c69ab27 -> :sswitch_129
        -0x7b6da2ee -> :sswitch_128
        -0x778488b4 -> :sswitch_127
        -0x771a09ff -> :sswitch_126
        -0x76b86f93 -> :sswitch_125
        -0x763341db -> :sswitch_124
        -0x7544870f -> :sswitch_123
        -0x738856d5 -> :sswitch_122
        -0x71cb36fe -> :sswitch_121
        -0x70890c22 -> :sswitch_120
        -0x6e6ebba7 -> :sswitch_11f
        -0x6e0e27bc -> :sswitch_11e
        -0x6d856eee -> :sswitch_11d
        -0x6ba11bb9 -> :sswitch_11c
        -0x6ad9c435 -> :sswitch_11b
        -0x6a3abeb3 -> :sswitch_11a
        -0x6780e869 -> :sswitch_119
        -0x64ac8e79 -> :sswitch_118
        -0x649189b5 -> :sswitch_117
        -0x6482c148 -> :sswitch_116
        -0x624d85ab -> :sswitch_115
        -0x60f70d82 -> :sswitch_114
        -0x602837d7 -> :sswitch_113
        -0x5fe88f3b -> :sswitch_112
        -0x5f4205c8 -> :sswitch_111
        -0x5c75677a -> :sswitch_110
        -0x5b261397 -> :sswitch_10f
        -0x5a975bb3 -> :sswitch_10e
        -0x5a8c14bf -> :sswitch_10d
        -0x5a1b947d -> :sswitch_10c
        -0x5940385f -> :sswitch_10b
        -0x5864b963 -> :sswitch_10a
        -0x56842176 -> :sswitch_109
        -0x563456aa -> :sswitch_108
        -0x54d081ca -> :sswitch_107
        -0x549d2bc0 -> :sswitch_106
        -0x53cd3ea7 -> :sswitch_105
        -0x4edaf0a3 -> :sswitch_104
        -0x4ec41175 -> :sswitch_103
        -0x4eb21743 -> :sswitch_102
        -0x4e08056d -> :sswitch_101
        -0x4bdc77ae -> :sswitch_100
        -0x4bdaa9c9 -> :sswitch_ff
        -0x4bcbd669 -> :sswitch_fe
        -0x4b4ff17e -> :sswitch_fd
        -0x4ab115db -> :sswitch_fc
        -0x49c6ed76 -> :sswitch_fb
        -0x47d3c24a -> :sswitch_fa
        -0x45eb908d -> :sswitch_f9
        -0x45c8b386 -> :sswitch_f8
        -0x453f9dd3 -> :sswitch_f7
        -0x44599cdf -> :sswitch_f6
        -0x442f6f14 -> :sswitch_f5
        -0x441baaf3 -> :sswitch_f4
        -0x44148886 -> :sswitch_f3
        -0x438fe3fe -> :sswitch_f2
        -0x433894a2 -> :sswitch_f1
        -0x425faf6a -> :sswitch_f0
        -0x412a5cba -> :sswitch_ef
        -0x40a8bf3f -> :sswitch_ee
        -0x3f321fed -> :sswitch_ed
        -0x3e5cef4a -> :sswitch_ec
        -0x3e10f2b7 -> :sswitch_eb
        -0x3cef39d4 -> :sswitch_ea
        -0x3cb67476 -> :sswitch_e9
        -0x3c9ef25d -> :sswitch_e8
        -0x3c209d1b -> :sswitch_e7
        -0x3abe64b8 -> :sswitch_e6
        -0x3a36d9c4 -> :sswitch_e5
        -0x370fb3b8 -> :sswitch_e4
        -0x36b03d83 -> :sswitch_e3
        -0x35c27f04 -> :sswitch_e2
        -0x353231fe -> :sswitch_e1
        -0x3487cfbd -> :sswitch_e0
        -0x3473c991 -> :sswitch_df
        -0x33352df1 -> :sswitch_de
        -0x32f27686 -> :sswitch_dd
        -0x315d98f4 -> :sswitch_dc
        -0x3141edaa -> :sswitch_db
        -0x30c4f86b -> :sswitch_da
        -0x3056ba7f -> :sswitch_d9
        -0x3050f64b -> :sswitch_d8
        -0x302c04c8 -> :sswitch_d7
        -0x3024d83e -> :sswitch_d6
        -0x2ff48383 -> :sswitch_d5
        -0x2f65ac07 -> :sswitch_d4
        -0x2f432338 -> :sswitch_d3
        -0x2f3174da -> :sswitch_d2
        -0x2eedbf66 -> :sswitch_d1
        -0x2e2bb587 -> :sswitch_d0
        -0x2c86f607 -> :sswitch_cf
        -0x2c0f2267 -> :sswitch_ce
        -0x2b29aec3 -> :sswitch_cd
        -0x29df9987 -> :sswitch_cc
        -0x285bdf01 -> :sswitch_cb
        -0x277761a5 -> :sswitch_ca
        -0x2549f76b -> :sswitch_c9
        -0x24b81028 -> :sswitch_c8
        -0x23c4b66b -> :sswitch_c7
        -0x23badf17 -> :sswitch_c6
        -0x23ab9a4a -> :sswitch_c5
        -0x235172af -> :sswitch_c4
        -0x21d29fad -> :sswitch_c3
        -0x21caeeee -> :sswitch_c2
        -0x200cfbd6 -> :sswitch_c1
        -0x1fc2f46d -> :sswitch_c0
        -0x1f8e71d0 -> :sswitch_bf
        -0x1f1ae11e -> :sswitch_be
        -0x1e0a694a -> :sswitch_bd
        -0x1cd3dc29 -> :sswitch_bc
        -0x1c7a9559 -> :sswitch_bb
        -0x1be8f9cd -> :sswitch_ba
        -0x1b8afeb4 -> :sswitch_b9
        -0x1b3ab93b -> :sswitch_b8
        -0x1a0d9c60 -> :sswitch_b7
        -0x19655847 -> :sswitch_b6
        -0x1730d4a5 -> :sswitch_b5
        -0x165c1f24 -> :sswitch_b4
        -0x15829305 -> :sswitch_b3
        -0x14be4c64 -> :sswitch_b2
        -0x13af6aca -> :sswitch_b1
        -0x1188b95d -> :sswitch_b0
        -0x11531bc3 -> :sswitch_af
        -0x10183504 -> :sswitch_ae
        -0xfe312c6 -> :sswitch_ad
        -0xfd3cfab -> :sswitch_ac
        -0xf950f48 -> :sswitch_ab
        -0xef7857b -> :sswitch_aa
        -0xe785153 -> :sswitch_a9
        -0xaeff743 -> :sswitch_a8
        -0xa4deb4f -> :sswitch_a7
        -0xa24e1d8 -> :sswitch_a6
        -0x98905d8 -> :sswitch_a5
        -0x92f55bf -> :sswitch_a4
        -0x6d99cd8 -> :sswitch_a3
        -0x37ebf1c -> :sswitch_a2
        -0x271349e -> :sswitch_a1
        -0x1ec42d3 -> :sswitch_a0
        -0x94e1cb -> :sswitch_9f
        -0x944ac8 -> :sswitch_9e
        0x196b8 -> :sswitch_9d
        0x1bf95 -> :sswitch_9c
        0x2e1503 -> :sswitch_9b
        0x2e7b10 -> :sswitch_9a
        0x30de87 -> :sswitch_99
        0x32affa -> :sswitch_98
        0x338af3 -> :sswitch_97
        0x363419 -> :sswitch_96
        0x36ebcb -> :sswitch_95
        0xd7cc61 -> :sswitch_94
        0x1f608e7 -> :sswitch_93
        0x40d0333 -> :sswitch_92
        0x5a0d1d5 -> :sswitch_91
        0x5a72402 -> :sswitch_90
        0x5a7510f -> :sswitch_8f
        0x5fd0609 -> :sswitch_8e
        0x61fd551 -> :sswitch_8d
        0x6219b84 -> :sswitch_8c
        0x6234fb9 -> :sswitch_8b
        0x6236d07 -> :sswitch_8a
        0x62f96f4 -> :sswitch_89
        0x65b8472 -> :sswitch_88
        0x677ef84 -> :sswitch_87
        0x6824ccd -> :sswitch_86
        0x6833e92 -> :sswitch_85
        0x7589311 -> :sswitch_84
        0x9164361 -> :sswitch_83
        0xa47cfbf -> :sswitch_82
        0xad77b60 -> :sswitch_81
        0xe06e031 -> :sswitch_80
        0xe504969 -> :sswitch_7f
        0xec78f1a -> :sswitch_7e
        0xff4c1fc -> :sswitch_7d
        0x10fb411e -> :sswitch_7c
        0x113cc00a -> :sswitch_7b
        0x121d8822 -> :sswitch_7a
        0x15387881 -> :sswitch_79
        0x17781378 -> :sswitch_78
        0x1804bf0a -> :sswitch_77
        0x18f3adfa -> :sswitch_76
        0x1a729ff1 -> :sswitch_75
        0x1baa3dae -> :sswitch_74
        0x1c2a513b -> :sswitch_73
        0x1c3a459a -> :sswitch_72
        0x1deb0334 -> :sswitch_71
        0x1e6d8189 -> :sswitch_70
        0x1f2e9faa -> :sswitch_6f
        0x20b11fac -> :sswitch_6e
        0x20c381c1 -> :sswitch_6d
        0x20ca1635 -> :sswitch_6c
        0x2126eeb4 -> :sswitch_6b
        0x2274cab2 -> :sswitch_6a
        0x22c9882d -> :sswitch_69
        0x23a2dc05 -> :sswitch_68
        0x2427a510 -> :sswitch_67
        0x253adbe7 -> :sswitch_66
        0x2559a81e -> :sswitch_65
        0x2595632b -> :sswitch_64
        0x26c77412 -> :sswitch_63
        0x26e29c0b -> :sswitch_62
        0x2807c385 -> :sswitch_61
        0x28bb30d5 -> :sswitch_60
        0x2b21e5ab -> :sswitch_5f
        0x2b7ac466 -> :sswitch_5e
        0x2bdd1ad7 -> :sswitch_5d
        0x2bfafb5c -> :sswitch_5c
        0x2c4034f5 -> :sswitch_5b
        0x2cc154ed -> :sswitch_5a
        0x2d17cf0d -> :sswitch_59
        0x2d8673c1 -> :sswitch_58
        0x2e5b94a9 -> :sswitch_57
        0x2f1e7411 -> :sswitch_56
        0x3091cb53 -> :sswitch_55
        0x31c2690e -> :sswitch_54
        0x3217eed7 -> :sswitch_53
        0x3254e0b7 -> :sswitch_52
        0x330cbc98 -> :sswitch_51
        0x332c073c -> :sswitch_50
        0x33430e7c -> :sswitch_4f
        0x33aed6d9 -> :sswitch_4e
        0x39182d0d -> :sswitch_4d
        0x398e40f2 -> :sswitch_4c
        0x3ac204eb -> :sswitch_4b
        0x3b429830 -> :sswitch_4a
        0x3d8a10e0 -> :sswitch_49
        0x3d9b4372 -> :sswitch_48
        0x3fca340b -> :sswitch_47
        0x3fca76dc -> :sswitch_46
        0x403673a3 -> :sswitch_45
        0x40debb32 -> :sswitch_44
        0x418dd3aa -> :sswitch_43
        0x41c14e41 -> :sswitch_42
        0x41c1aeee -> :sswitch_41
        0x421861d2 -> :sswitch_40
        0x4468e016 -> :sswitch_3f
        0x46e716f5 -> :sswitch_3e
        0x473f7799 -> :sswitch_3d
        0x475fd6bf -> :sswitch_3c
        0x47a162d3 -> :sswitch_3b
        0x48cb86e3 -> :sswitch_3a
        0x490bb556 -> :sswitch_39
        0x4934edb8 -> :sswitch_38
        0x49a0be73 -> :sswitch_37
        0x4a0b6637 -> :sswitch_36
        0x4b101859 -> :sswitch_35
        0x4c9baf27 -> :sswitch_34
        0x4d6a43bb -> :sswitch_33
        0x4dc627f2 -> :sswitch_32
        0x4edfac55 -> :sswitch_31
        0x4ef34925 -> :sswitch_30
        0x501062cb -> :sswitch_2f
        0x51c266fb -> :sswitch_2e
        0x52df7c12 -> :sswitch_2d
        0x53981898 -> :sswitch_2c
        0x53c07202 -> :sswitch_2b
        0x54e6a060 -> :sswitch_2a
        0x55aafe07 -> :sswitch_29
        0x55b4de5b -> :sswitch_28
        0x579db450 -> :sswitch_27
        0x585891f9 -> :sswitch_26
        0x58d35b7e -> :sswitch_25
        0x58dcb629 -> :sswitch_24
        0x5afaa177 -> :sswitch_23
        0x5b4c1ed6 -> :sswitch_22
        0x5bb7cab0 -> :sswitch_21
        0x5cd8f242 -> :sswitch_20
        0x5d6cf584 -> :sswitch_1f
        0x5deef313 -> :sswitch_1e
        0x5e19a936 -> :sswitch_1d
        0x5f45c40b -> :sswitch_1c
        0x5fe6f99a -> :sswitch_1b
        0x60e88180 -> :sswitch_1a
        0x62a62154 -> :sswitch_19
        0x63cebb9f -> :sswitch_18
        0x67a61d4b -> :sswitch_17
        0x6819d542 -> :sswitch_16
        0x6afd613e -> :sswitch_15
        0x6b51cf55 -> :sswitch_14
        0x6bbd5975 -> :sswitch_13
        0x6cf23c02 -> :sswitch_12
        0x6e88982d -> :sswitch_11
        0x6eceb69c -> :sswitch_10
        0x6f717534 -> :sswitch_f
        0x6fa4ef9d -> :sswitch_e
        0x724a137f -> :sswitch_d
        0x729fc528 -> :sswitch_c
        0x72d3e682 -> :sswitch_b
        0x732ad02d -> :sswitch_a
        0x7334aef7 -> :sswitch_9
        0x78a9abff -> :sswitch_8
        0x793ad897 -> :sswitch_7
        0x7a226117 -> :sswitch_6
        0x7a70dd5a -> :sswitch_5
        0x7b91875a -> :sswitch_4
        0x7c558789 -> :sswitch_3
        0x7ec8b41e -> :sswitch_2
        0x7ef99372 -> :sswitch_1
        0x7fad9162 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 584
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CoreData$2;->parseField(Lcom/p1/mobile/putong/core/data/CoreData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/CoreData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
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

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "growthMesInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x12c

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "speedUpCard"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x12b

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "unReadUserIds"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x12a

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "mkt_activity_flash"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x129

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "greetings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x128

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "shareId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x127

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "intlInsertCardSets"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x126

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "scoreThresholdOther"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x125

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "realPicturesBanner"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x124

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "heartbeats"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x123

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "idealDetails"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x122

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "fakePhotoFeedback"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x121

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "chatPartnersSignals"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x120

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "schools"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x11f

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "instantMatchUserInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x11e

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "recallMatch"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x11d

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "aiChatAnalysis"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x11c

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "monetizationConfiguration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x11b

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "notificationCounters"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x11a

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "boostStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x119

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "accountRecords"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x118

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "userFeedbackInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x117

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "literatures"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x116

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "showOnlineForWhoIMeet"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x115

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "intlVisitorInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x114

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "diamond"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x113

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "analysisGuide"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x112

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "cityCConfig"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x111

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "chatHeats"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0x110

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "groupAttributes"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0x10f

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "swipeUpperLimit"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0x10e

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "cityCBanner"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0x10d

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "details"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x10c

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "audioTexts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x10b

    goto/16 :goto_0

    :sswitch_22
    const-string v0, "stickers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x10a

    goto/16 :goto_0

    :sswitch_23
    const-string v0, "cardsIcons"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v2, 0x109

    goto/16 :goto_0

    :sswitch_24
    const-string v0, "heartbeatMatch"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v2, 0x108

    goto/16 :goto_0

    :sswitch_25
    const-string v0, "jmpTarget"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v2, 0x107

    goto/16 :goto_0

    :sswitch_26
    const-string v0, "liveActivities"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v2, 0x106

    goto/16 :goto_0

    :sswitch_27
    const-string v0, "conversations"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v2, 0x105

    goto/16 :goto_0

    :sswitch_28
    const-string v0, "recommended"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v2, 0x104

    goto/16 :goto_0

    :sswitch_29
    const-string v0, "chatPage"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v2, 0x103

    goto/16 :goto_0

    :sswitch_2a
    const-string v0, "nextTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v2, 0x102

    goto/16 :goto_0

    :sswitch_2b
    const-string v0, "couponBag"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v2, 0x101

    goto/16 :goto_0

    :sswitch_2c
    const-string v0, "verificationLowLabels"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v2, 0x100

    goto/16 :goto_0

    :sswitch_2d
    const-string v0, "extraPrivileges"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v2, 0xff

    goto/16 :goto_0

    :sswitch_2e
    const-string v0, "ipRegion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v2, 0xfe

    goto/16 :goto_0

    :sswitch_2f
    const-string v0, "msgData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v2, 0xfd

    goto/16 :goto_0

    :sswitch_30
    const-string v0, "seePortraits"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v2, 0xfc

    goto/16 :goto_0

    :sswitch_31
    const-string v0, "seeTrialStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v2, 0xfb

    goto/16 :goto_0

    :sswitch_32
    const-string v0, "faceidTokens"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v2, 0xfa

    goto/16 :goto_0

    :sswitch_33
    const-string v0, "visitorHiddens"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v2, 0xf9

    goto/16 :goto_0

    :sswitch_34
    const-string v0, "loveLetterGroup"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v2, 0xf8

    goto/16 :goto_0

    :sswitch_35
    const-string v0, "monetizationPromotions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v2, 0xf7

    goto/16 :goto_0

    :sswitch_36
    const-string v0, "counterVerification"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v2, 0xf6

    goto/16 :goto_0

    :sswitch_37
    const-string v0, "moments"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v2, 0xf5

    goto/16 :goto_0

    :sswitch_38
    const-string v0, "verifications"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v2, 0xf4

    goto/16 :goto_0

    :sswitch_39
    const-string v0, "literaturesComments"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v2, 0xf3

    goto/16 :goto_0

    :sswitch_3a
    const-string v0, "evaluationReports"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v2, 0xf2

    goto/16 :goto_0

    :sswitch_3b
    const-string v0, "profileGuide"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v2, 0xf1

    goto/16 :goto_0

    :sswitch_3c
    const-string v0, "giftWallRankInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3c

    goto/16 :goto_0

    :cond_3c
    const/16 v2, 0xf0

    goto/16 :goto_0

    :sswitch_3d
    const-string v0, "invitation"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d

    goto/16 :goto_0

    :cond_3d
    const/16 v2, 0xef

    goto/16 :goto_0

    :sswitch_3e
    const-string v0, "buzzUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3e

    goto/16 :goto_0

    :cond_3e
    const/16 v2, 0xee

    goto/16 :goto_0

    :sswitch_3f
    const-string v0, "greetingNewPeople"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    goto/16 :goto_0

    :cond_3f
    const/16 v2, 0xed

    goto/16 :goto_0

    :sswitch_40
    const-string v0, "todayMatchInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    goto/16 :goto_0

    :cond_40
    const/16 v2, 0xec

    goto/16 :goto_0

    :sswitch_41
    const-string v0, "likedMes"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_41

    goto/16 :goto_0

    :cond_41
    const/16 v2, 0xeb

    goto/16 :goto_0

    :sswitch_42
    const-string v0, "reminders"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    goto/16 :goto_0

    :cond_42
    const/16 v2, 0xea

    goto/16 :goto_0

    :sswitch_43
    const-string v0, "refundDetails"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    goto/16 :goto_0

    :cond_43
    const/16 v2, 0xe9

    goto/16 :goto_0

    :sswitch_44
    const-string v0, "realFeelInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44

    goto/16 :goto_0

    :cond_44
    const/16 v2, 0xe8

    goto/16 :goto_0

    :sswitch_45
    const-string v0, "userAudits"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_45

    goto/16 :goto_0

    :cond_45
    const/16 v2, 0xe7

    goto/16 :goto_0

    :sswitch_46
    const-string v0, "complimentTexts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    goto/16 :goto_0

    :cond_46
    const/16 v2, 0xe6

    goto/16 :goto_0

    :sswitch_47
    const-string v0, "countdownLikes"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_47

    goto/16 :goto_0

    :cond_47
    const/16 v2, 0xe5

    goto/16 :goto_0

    :sswitch_48
    const-string v0, "pictureVerifyRightedInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_48

    goto/16 :goto_0

    :cond_48
    const/16 v2, 0xe4

    goto/16 :goto_0

    :sswitch_49
    const-string v0, "repeatPictureResult"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    goto/16 :goto_0

    :cond_49
    const/16 v2, 0xe3

    goto/16 :goto_0

    :sswitch_4a
    const-string v0, "promotions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4a

    goto/16 :goto_0

    :cond_4a
    const/16 v2, 0xe2

    goto/16 :goto_0

    :sswitch_4b
    const-string v0, "descriptionRisk"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b

    goto/16 :goto_0

    :cond_4b
    const/16 v2, 0xe1

    goto/16 :goto_0

    :sswitch_4c
    const-string v0, "seeInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4c

    goto/16 :goto_0

    :cond_4c
    const/16 v2, 0xe0

    goto/16 :goto_0

    :sswitch_4d
    const-string v0, "coupons"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d

    goto/16 :goto_0

    :cond_4d
    const/16 v2, 0xdf

    goto/16 :goto_0

    :sswitch_4e
    const-string v0, "newGiftWalls"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4e

    goto/16 :goto_0

    :cond_4e
    const/16 v2, 0xde

    goto/16 :goto_0

    :sswitch_4f
    const-string v0, "visitorAllCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4f

    goto/16 :goto_0

    :cond_4f
    const/16 v2, 0xdd

    goto/16 :goto_0

    :sswitch_50
    const-string v0, "evaluation"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_50

    goto/16 :goto_0

    :cond_50
    const/16 v2, 0xdc

    goto/16 :goto_0

    :sswitch_51
    const-string v0, "summarizedPrivilegePrices"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_51

    goto/16 :goto_0

    :cond_51
    const/16 v2, 0xdb

    goto/16 :goto_0

    :sswitch_52
    const-string v0, "evaluations"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    goto/16 :goto_0

    :cond_52
    const/16 v2, 0xda

    goto/16 :goto_0

    :sswitch_53
    const-string v0, "freeTrialOperateResult"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_53

    goto/16 :goto_0

    :cond_53
    const/16 v2, 0xd9

    goto/16 :goto_0

    :sswitch_54
    const-string v0, "seePortraitCounter"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    goto/16 :goto_0

    :cond_54
    const/16 v2, 0xd8

    goto/16 :goto_0

    :sswitch_55
    const-string v0, "purchaseSavePop"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    goto/16 :goto_0

    :cond_55
    const/16 v2, 0xd7

    goto/16 :goto_0

    :sswitch_56
    const-string v0, "privateCustomResult"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_56

    goto/16 :goto_0

    :cond_56
    const/16 v2, 0xd6

    goto/16 :goto_0

    :sswitch_57
    const-string v0, "groupNotifications"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_57

    goto/16 :goto_0

    :cond_57
    const/16 v2, 0xd5

    goto/16 :goto_0

    :sswitch_58
    const-string v0, "userStickers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_58

    goto/16 :goto_0

    :cond_58
    const/16 v2, 0xd4

    goto/16 :goto_0

    :sswitch_59
    const-string v0, "thirdPartyInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    goto/16 :goto_0

    :cond_59
    const/16 v2, 0xd3

    goto/16 :goto_0

    :sswitch_5a
    const-string v0, "packages"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5a

    goto/16 :goto_0

    :cond_5a
    const/16 v2, 0xd2

    goto/16 :goto_0

    :sswitch_5b
    const-string v0, "mkt_activity_regular"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5b

    goto/16 :goto_0

    :cond_5b
    const/16 v2, 0xd1

    goto/16 :goto_0

    :sswitch_5c
    const-string v0, "auditPictureTags"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5c

    goto/16 :goto_0

    :cond_5c
    const/16 v2, 0xd0

    goto/16 :goto_0

    :sswitch_5d
    const-string v0, "orderInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5d

    goto/16 :goto_0

    :cond_5d
    const/16 v2, 0xcf

    goto/16 :goto_0

    :sswitch_5e
    const-string v0, "liveSchemas"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5e

    goto/16 :goto_0

    :cond_5e
    const/16 v2, 0xce

    goto/16 :goto_0

    :sswitch_5f
    const-string v0, "userActivityInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5f

    goto/16 :goto_0

    :cond_5f
    const/16 v2, 0xcd

    goto/16 :goto_0

    :sswitch_60
    const-string v0, "giftWallTitles"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_60

    goto/16 :goto_0

    :cond_60
    const/16 v2, 0xcc

    goto/16 :goto_0

    :sswitch_61
    const-string v0, "summarizedPrivileges"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_61

    goto/16 :goto_0

    :cond_61
    const/16 v2, 0xcb

    goto/16 :goto_0

    :sswitch_62
    const-string v0, "liveLabels"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_62

    goto/16 :goto_0

    :cond_62
    const/16 v2, 0xca

    goto/16 :goto_0

    :sswitch_63
    const-string v0, "cardStyles"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_63

    goto/16 :goto_0

    :cond_63
    const/16 v2, 0xc9

    goto/16 :goto_0

    :sswitch_64
    const-string v0, "popGuide"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_64

    goto/16 :goto_0

    :cond_64
    const/16 v2, 0xc8

    goto/16 :goto_0

    :sswitch_65
    const-string v0, "netPictureResult"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_65

    goto/16 :goto_0

    :cond_65
    const/16 v2, 0xc7

    goto/16 :goto_0

    :sswitch_66
    const-string v0, "invitationInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    goto/16 :goto_0

    :cond_66
    const/16 v2, 0xc6

    goto/16 :goto_0

    :sswitch_67
    const-string v0, "merchandises"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_67

    goto/16 :goto_0

    :cond_67
    const/16 v2, 0xc5

    goto/16 :goto_0

    :sswitch_68
    const-string v0, "iceBreakings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_68

    goto/16 :goto_0

    :cond_68
    const/16 v2, 0xc4

    goto/16 :goto_0

    :sswitch_69
    const-string v0, "superlikeByCounts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_69

    goto/16 :goto_0

    :cond_69
    const/16 v2, 0xc3

    goto/16 :goto_0

    :sswitch_6a
    const-string v0, "boostResultEntry"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6a

    goto/16 :goto_0

    :cond_6a
    const/16 v2, 0xc2

    goto/16 :goto_0

    :sswitch_6b
    const-string v0, "giftPanel"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6b

    goto/16 :goto_0

    :cond_6b
    const/16 v2, 0xc1

    goto/16 :goto_0

    :sswitch_6c
    const-string v0, "giftInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6c

    goto/16 :goto_0

    :cond_6c
    const/16 v2, 0xc0

    goto/16 :goto_0

    :sswitch_6d
    const-string v0, "camping"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6d

    goto/16 :goto_0

    :cond_6d
    const/16 v2, 0xbf

    goto/16 :goto_0

    :sswitch_6e
    const-string v0, "giftGuide"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6e

    goto/16 :goto_0

    :cond_6e
    const/16 v2, 0xbe

    goto/16 :goto_0

    :sswitch_6f
    const-string v0, "keywords"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6f

    goto/16 :goto_0

    :cond_6f
    const/16 v2, 0xbd

    goto/16 :goto_0

    :sswitch_70
    const-string v0, "compliments"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_70

    goto/16 :goto_0

    :cond_70
    const/16 v2, 0xbc

    goto/16 :goto_0

    :sswitch_71
    const-string v0, "membershipUpgradeInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_71

    goto/16 :goto_0

    :cond_71
    const/16 v2, 0xbb

    goto/16 :goto_0

    :sswitch_72
    const-string v0, "cardModels"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_72

    goto/16 :goto_0

    :cond_72
    const/16 v2, 0xba

    goto/16 :goto_0

    :sswitch_73
    const-string v0, "relationships"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_73

    goto/16 :goto_0

    :cond_73
    const/16 v2, 0xb9

    goto/16 :goto_0

    :sswitch_74
    const-string v0, "myMeetListV3"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_74

    goto/16 :goto_0

    :cond_74
    const/16 v2, 0xb8

    goto/16 :goto_0

    :sswitch_75
    const-string v0, "officialAccounts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_75

    goto/16 :goto_0

    :cond_75
    const/16 v2, 0xb7

    goto/16 :goto_0

    :sswitch_76
    const-string v0, "fateRadar"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_76

    goto/16 :goto_0

    :cond_76
    const/16 v2, 0xb6

    goto/16 :goto_0

    :sswitch_77
    const-string v0, "privateQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_77

    goto/16 :goto_0

    :cond_77
    const/16 v2, 0xb5

    goto/16 :goto_0

    :sswitch_78
    const-string v0, "monetizationMsg"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    goto/16 :goto_0

    :cond_78
    const/16 v2, 0xb4

    goto/16 :goto_0

    :sswitch_79
    const-string v0, "love520"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_79

    goto/16 :goto_0

    :cond_79
    const/16 v2, 0xb3

    goto/16 :goto_0

    :sswitch_7a
    const-string v0, "membershipRecommendUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7a

    goto/16 :goto_0

    :cond_7a
    const/16 v2, 0xb2

    goto/16 :goto_0

    :sswitch_7b
    const-string v0, "visitorDoorInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7b

    goto/16 :goto_0

    :cond_7b
    const/16 v2, 0xb1

    goto/16 :goto_0

    :sswitch_7c
    const-string v0, "dynamicLabels"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7c

    goto/16 :goto_0

    :cond_7c
    const/16 v2, 0xb0

    goto/16 :goto_0

    :sswitch_7d
    const-string v0, "chatHeatPermissions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7d

    goto/16 :goto_0

    :cond_7d
    const/16 v2, 0xaf

    goto/16 :goto_0

    :sswitch_7e
    const-string v0, "redPackets"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7e

    goto/16 :goto_0

    :cond_7e
    const/16 v2, 0xae

    goto/16 :goto_0

    :sswitch_7f
    const-string v0, "dislikedUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7f

    goto/16 :goto_0

    :cond_7f
    const/16 v2, 0xad

    goto/16 :goto_0

    :sswitch_80
    const-string v0, "bundles"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_80

    goto/16 :goto_0

    :cond_80
    const/16 v2, 0xac

    goto/16 :goto_0

    :sswitch_81
    const-string v0, "vipSettings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_81

    goto/16 :goto_0

    :cond_81
    const/16 v2, 0xab

    goto/16 :goto_0

    :sswitch_82
    const-string v0, "campaignPage"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_82

    goto/16 :goto_0

    :cond_82
    const/16 v2, 0xaa

    goto/16 :goto_0

    :sswitch_83
    const-string v0, "autoDeducts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_83

    goto/16 :goto_0

    :cond_83
    const/16 v2, 0xa9

    goto/16 :goto_0

    :sswitch_84
    const-string v0, "greetingNewPeopleMessage"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_84

    goto/16 :goto_0

    :cond_84
    const/16 v2, 0xa8

    goto/16 :goto_0

    :sswitch_85
    const-string v0, "score"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_85

    goto/16 :goto_0

    :cond_85
    const/16 v2, 0xa7

    goto/16 :goto_0

    :sswitch_86
    const-string v0, "sames"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_86

    goto/16 :goto_0

    :cond_86
    const/16 v2, 0xa6

    goto/16 :goto_0

    :sswitch_87
    const-string v0, "risks"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_87

    goto/16 :goto_0

    :cond_87
    const/16 v2, 0xa5

    goto/16 :goto_0

    :sswitch_88
    const-string v0, "picks"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_88

    goto/16 :goto_0

    :cond_88
    const/16 v2, 0xa4

    goto/16 :goto_0

    :sswitch_89
    const-string v0, "menus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_89

    goto/16 :goto_0

    :cond_89
    const/16 v2, 0xa3

    goto/16 :goto_0

    :sswitch_8a
    const-string v0, "lives"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8a

    goto/16 :goto_0

    :cond_8a
    const/16 v2, 0xa2

    goto/16 :goto_0

    :sswitch_8b
    const-string v0, "links"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8b

    goto/16 :goto_0

    :cond_8b
    const/16 v2, 0xa1

    goto/16 :goto_0

    :sswitch_8c
    const-string v0, "level"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8c

    goto/16 :goto_0

    :cond_8c
    const/16 v2, 0xa0

    goto/16 :goto_0

    :sswitch_8d
    const-string v0, "layer"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8d

    goto/16 :goto_0

    :cond_8d
    const/16 v2, 0x9f

    goto/16 :goto_0

    :sswitch_8e
    const-string v0, "isHit"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8e

    goto/16 :goto_0

    :cond_8e
    const/16 v2, 0x9e

    goto/16 :goto_0

    :sswitch_8f
    const-string v0, "count"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8f

    goto/16 :goto_0

    :cond_8f
    const/16 v2, 0x9d

    goto/16 :goto_0

    :sswitch_90
    const-string v0, "coins"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_90

    goto/16 :goto_0

    :cond_90
    const/16 v2, 0x9c

    goto/16 :goto_0

    :sswitch_91
    const-string v0, "calls"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_91

    goto/16 :goto_0

    :cond_91
    const/16 v2, 0x9b

    goto/16 :goto_0

    :sswitch_92
    const-string v0, "tagLoadStrategy"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_92

    goto/16 :goto_0

    :cond_92
    const/16 v2, 0x9a

    goto/16 :goto_0

    :sswitch_93
    const-string v0, "pendingPaymentGuidance"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_93

    goto/16 :goto_0

    :cond_93
    const/16 v2, 0x99

    goto/16 :goto_0

    :sswitch_94
    const-string v0, "videoChatSecondFloorSummary"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_94

    goto/16 :goto_0

    :cond_94
    const/16 v2, 0x98

    goto/16 :goto_0

    :sswitch_95
    const-string v0, "user"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_95

    goto/16 :goto_0

    :cond_95
    const/16 v2, 0x97

    goto/16 :goto_0

    :sswitch_96
    const-string v0, "tags"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_96

    goto/16 :goto_0

    :cond_96
    const/16 v2, 0x96

    goto/16 :goto_0

    :sswitch_97
    const-string v0, "next"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_97

    goto/16 :goto_0

    :cond_97
    const/16 v2, 0x95

    goto/16 :goto_0

    :sswitch_98
    const-string v0, "link"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_98

    goto/16 :goto_0

    :cond_98
    const/16 v2, 0x94

    goto/16 :goto_0

    :sswitch_99
    const-string v0, "hint"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_99

    goto/16 :goto_0

    :cond_99
    const/16 v2, 0x93

    goto/16 :goto_0

    :sswitch_9a
    const-string v0, "card"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9a

    goto/16 :goto_0

    :cond_9a
    const/16 v2, 0x92

    goto/16 :goto_0

    :sswitch_9b
    const-string v0, "bell"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9b

    goto/16 :goto_0

    :cond_9b
    const/16 v2, 0x91

    goto/16 :goto_0

    :sswitch_9c
    const-string v0, "tab"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9c

    goto/16 :goto_0

    :cond_9c
    const/16 v2, 0x90

    goto/16 :goto_0

    :sswitch_9d
    const-string v0, "ids"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9d

    goto/16 :goto_0

    :cond_9d
    const/16 v2, 0x8f

    goto/16 :goto_0

    :sswitch_9e
    const-string v0, "userStrategyConfiguration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9e

    goto/16 :goto_0

    :cond_9e
    const/16 v2, 0x8e

    goto/16 :goto_0

    :sswitch_9f
    const-string v0, "surpriseGiftExpirationTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9f

    goto/16 :goto_0

    :cond_9f
    const/16 v2, 0x8d

    goto/16 :goto_0

    :sswitch_a0
    const-string v0, "greetingSummary"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a0

    goto/16 :goto_0

    :cond_a0
    const/16 v2, 0x8c

    goto/16 :goto_0

    :sswitch_a1
    const-string v0, "chatProfiles"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    goto/16 :goto_0

    :cond_a1
    const/16 v2, 0x8b

    goto/16 :goto_0

    :sswitch_a2
    const-string v0, "suggestUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a2

    goto/16 :goto_0

    :cond_a2
    const/16 v2, 0x8a

    goto/16 :goto_0

    :sswitch_a3
    const-string v0, "conversationDiff"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a3

    goto/16 :goto_0

    :cond_a3
    const/16 v2, 0x89

    goto/16 :goto_0

    :sswitch_a4
    const-string v0, "realPicturesInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a4

    goto/16 :goto_0

    :cond_a4
    const/16 v2, 0x88

    goto/16 :goto_0

    :sswitch_a5
    const-string v0, "recommendMessages"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a5

    goto/16 :goto_0

    :cond_a5
    const/16 v2, 0x87

    goto/16 :goto_0

    :sswitch_a6
    const-string v0, "urlTags"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a6

    goto/16 :goto_0

    :cond_a6
    const/16 v2, 0x86

    goto/16 :goto_0

    :sswitch_a7
    const-string v0, "likeUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a7

    goto/16 :goto_0

    :cond_a7
    const/16 v2, 0x85

    goto/16 :goto_0

    :sswitch_a8
    const-string v0, "likedByToday"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a8

    goto/16 :goto_0

    :cond_a8
    const/16 v2, 0x84

    goto/16 :goto_0

    :sswitch_a9
    const-string v0, "advancedSearchSettings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a9

    goto/16 :goto_0

    :cond_a9
    const/16 v2, 0x83

    goto/16 :goto_0

    :sswitch_aa
    const-string v0, "cardExtraInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_aa

    goto/16 :goto_0

    :cond_aa
    const/16 v2, 0x82

    goto/16 :goto_0

    :sswitch_ab
    const-string v0, "aiChatAdvice"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ab

    goto/16 :goto_0

    :cond_ab
    const/16 v2, 0x81

    goto/16 :goto_0

    :sswitch_ac
    const-string v0, "cardInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ac

    goto/16 :goto_0

    :cond_ac
    const/16 v2, 0x80

    goto/16 :goto_0

    :sswitch_ad
    const-string v0, "userRisk"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ad

    goto/16 :goto_0

    :cond_ad
    const/16 v2, 0x7f

    goto/16 :goto_0

    :sswitch_ae
    const-string v0, "myMeetEntryV3"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ae

    goto/16 :goto_0

    :cond_ae
    const/16 v2, 0x7e

    goto/16 :goto_0

    :sswitch_af
    const-string v0, "features"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_af

    goto/16 :goto_0

    :cond_af
    const/16 v2, 0x7d

    goto/16 :goto_0

    :sswitch_b0
    const-string v0, "idealInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b0

    goto/16 :goto_0

    :cond_b0
    const/16 v2, 0x7c

    goto/16 :goto_0

    :sswitch_b1
    const-string v0, "appealInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b1

    goto/16 :goto_0

    :cond_b1
    const/16 v2, 0x7b

    goto/16 :goto_0

    :sswitch_b2
    const-string v0, "mkt_activity_quiz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b2

    goto/16 :goto_0

    :cond_b2
    const/16 v2, 0x7a

    goto/16 :goto_0

    :sswitch_b3
    const-string v0, "lowPhotoResult"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b3

    goto/16 :goto_0

    :cond_b3
    const/16 v2, 0x79

    goto/16 :goto_0

    :sswitch_b4
    const-string v0, "privateCustomSetting"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b4

    goto/16 :goto_0

    :cond_b4
    const/16 v2, 0x78

    goto/16 :goto_0

    :sswitch_b5
    const-string v0, "priorityLike"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b5

    goto/16 :goto_0

    :cond_b5
    const/16 v2, 0x77

    goto/16 :goto_0

    :sswitch_b6
    const-string v0, "surpriseGift"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b6

    goto/16 :goto_0

    :cond_b6
    const/16 v2, 0x76

    goto/16 :goto_0

    :sswitch_b7
    const-string v0, "canChange"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b7

    goto/16 :goto_0

    :cond_b7
    const/16 v2, 0x75

    goto/16 :goto_0

    :sswitch_b8
    const-string v0, "myTabTasks"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b8

    goto/16 :goto_0

    :cond_b8
    const/16 v2, 0x74

    goto/16 :goto_0

    :sswitch_b9
    const-string v0, "messages"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b9

    goto/16 :goto_0

    :cond_b9
    const/16 v2, 0x73

    goto/16 :goto_0

    :sswitch_ba
    const-string v0, "myTabGuide"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ba

    goto/16 :goto_0

    :cond_ba
    const/16 v2, 0x72

    goto/16 :goto_0

    :sswitch_bb
    const-string v0, "profileLikesComments"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bb

    goto/16 :goto_0

    :cond_bb
    const/16 v2, 0x71

    goto/16 :goto_0

    :sswitch_bc
    const-string v0, "greetingSetting"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bc

    goto/16 :goto_0

    :cond_bc
    const/16 v2, 0x70

    goto/16 :goto_0

    :sswitch_bd
    const-string v0, "feedbackRemainedNum"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bd

    goto/16 :goto_0

    :cond_bd
    const/16 v2, 0x6f

    goto/16 :goto_0

    :sswitch_be
    const-string v0, "extremePickByList"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_be

    goto/16 :goto_0

    :cond_be
    const/16 v2, 0x6e

    goto/16 :goto_0

    :sswitch_bf
    const-string v0, "idealInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bf

    goto/16 :goto_0

    :cond_bf
    const/16 v2, 0x6d

    goto/16 :goto_0

    :sswitch_c0
    const-string v0, "contractInfos"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c0

    goto/16 :goto_0

    :cond_c0
    const/16 v2, 0x6c

    goto/16 :goto_0

    :sswitch_c1
    const-string v0, "compliment"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c1

    goto/16 :goto_0

    :cond_c1
    const/16 v2, 0x6b

    goto/16 :goto_0

    :sswitch_c2
    const-string v0, "contract"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c2

    goto/16 :goto_0

    :cond_c2
    const/16 v2, 0x6a

    goto/16 :goto_0

    :sswitch_c3
    const-string v0, "contacts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c3

    goto/16 :goto_0

    :cond_c3
    const/16 v2, 0x69

    goto/16 :goto_0

    :sswitch_c4
    const-string v0, "onlineLiveChatPair"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c4

    goto/16 :goto_0

    :cond_c4
    const/16 v2, 0x68

    goto/16 :goto_0

    :sswitch_c5
    const-string v0, "greetingResult"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c5

    goto/16 :goto_0

    :cond_c5
    const/16 v2, 0x67

    goto/16 :goto_0

    :sswitch_c6
    const-string v0, "complain"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c6

    goto/16 :goto_0

    :cond_c6
    const/16 v2, 0x66

    goto/16 :goto_0

    :sswitch_c7
    const-string v0, "friends"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c7

    goto/16 :goto_0

    :cond_c7
    const/16 v2, 0x65

    goto/16 :goto_0

    :sswitch_c8
    const-string v0, "freeTrialInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    goto/16 :goto_0

    :cond_c8
    const/16 v2, 0x64

    goto/16 :goto_0

    :sswitch_c9
    const-string v0, "notVerificationResultData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c9

    goto/16 :goto_0

    :cond_c9
    const/16 v2, 0x63

    goto/16 :goto_0

    :sswitch_ca
    const-string v0, "likedUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ca

    goto/16 :goto_0

    :cond_ca
    const/16 v2, 0x62

    goto/16 :goto_0

    :sswitch_cb
    const-string v0, "svipWeeklyReport"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_cb

    goto/16 :goto_0

    :cond_cb
    const/16 v2, 0x61

    goto/16 :goto_0

    :sswitch_cc
    const-string v0, "anonymousSummary"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_cc

    goto/16 :goto_0

    :cond_cc
    const/16 v2, 0x60

    goto/16 :goto_0

    :sswitch_cd
    const-string v0, "monetizationChatSeeUser"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_cd

    goto/16 :goto_0

    :cond_cd
    const/16 v2, 0x5f

    goto/16 :goto_0

    :sswitch_ce
    const-string v0, "barLoverPlaces"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ce

    goto/16 :goto_0

    :cond_ce
    const/16 v2, 0x5e

    goto/16 :goto_0

    :sswitch_cf
    const-string v0, "scoreThreshold"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_cf

    goto/16 :goto_0

    :cond_cf
    const/16 v2, 0x5d

    goto/16 :goto_0

    :sswitch_d0
    const-string v0, "iceBreakQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d0

    goto/16 :goto_0

    :cond_d0
    const/16 v2, 0x5c

    goto/16 :goto_0

    :sswitch_d1
    const-string v0, "payWill"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d1

    goto/16 :goto_0

    :cond_d1
    const/16 v2, 0x5b

    goto/16 :goto_0

    :sswitch_d2
    const-string v0, "wechat"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d2

    goto/16 :goto_0

    :cond_d2
    const/16 v2, 0x5a

    goto/16 :goto_0

    :sswitch_d3
    const-string v0, "partner"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d3

    goto/16 :goto_0

    :cond_d3
    const/16 v2, 0x59

    goto/16 :goto_0

    :sswitch_d4
    const-string v0, "wallet"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d4

    goto/16 :goto_0

    :cond_d4
    const/16 v2, 0x58

    goto/16 :goto_0

    :sswitch_d5
    const-string v0, "interestedGroups"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d5

    goto/16 :goto_0

    :cond_d5
    const/16 v2, 0x57

    goto/16 :goto_0

    :sswitch_d6
    const-string v0, "groupSettings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d6

    goto/16 :goto_0

    :cond_d6
    const/16 v2, 0x56

    goto/16 :goto_0

    :sswitch_d7
    const-string v0, "chatGameInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d7

    goto/16 :goto_0

    :cond_d7
    const/16 v2, 0x55

    goto/16 :goto_0

    :sswitch_d8
    const-string v0, "recentConversations"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d8

    goto/16 :goto_0

    :cond_d8
    const/16 v2, 0x54

    goto/16 :goto_0

    :sswitch_d9
    const-string v0, "voices"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d9

    goto/16 :goto_0

    :cond_d9
    const/16 v2, 0x53

    goto/16 :goto_0

    :sswitch_da
    const-string v0, "verificationTokens"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_da

    goto/16 :goto_0

    :cond_da
    const/16 v2, 0x52

    goto/16 :goto_0

    :sswitch_db
    const-string v0, "blindbox"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_db

    goto/16 :goto_0

    :cond_db
    const/16 v2, 0x51

    goto/16 :goto_0

    :sswitch_dc
    const-string v0, "prologues"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_dc

    goto/16 :goto_0

    :cond_dc
    const/16 v2, 0x50

    goto/16 :goto_0

    :sswitch_dd
    const-string v0, "seeTrialEligible"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_dd

    goto/16 :goto_0

    :cond_dd
    const/16 v2, 0x4f

    goto/16 :goto_0

    :sswitch_de
    const-string v0, "figures"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_de

    goto/16 :goto_0

    :cond_de
    const/16 v2, 0x4e

    goto/16 :goto_0

    :sswitch_df
    const-string v0, "fakeSuggest"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_df

    goto/16 :goto_0

    :cond_df
    const/16 v2, 0x4d

    goto/16 :goto_0

    :sswitch_e0
    const-string v0, "odiamondList"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e0

    goto/16 :goto_0

    :cond_e0
    const/16 v2, 0x4c

    goto/16 :goto_0

    :sswitch_e1
    const-string v0, "states"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e1

    goto/16 :goto_0

    :cond_e1
    const/16 v2, 0x4b

    goto/16 :goto_0

    :sswitch_e2
    const-string v0, "profileLikeCounter"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e2

    goto/16 :goto_0

    :cond_e2
    const/16 v2, 0x4a

    goto/16 :goto_0

    :sswitch_e3
    const-string v0, "superLikeCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e3

    goto/16 :goto_0

    :cond_e3
    const/16 v2, 0x49

    goto/16 :goto_0

    :sswitch_e4
    const-string v0, "instantMatchGiveCountInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e4

    goto/16 :goto_0

    :cond_e4
    const/16 v2, 0x48

    goto/16 :goto_0

    :sswitch_e5
    const-string v0, "visitorInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e5

    goto/16 :goto_0

    :cond_e5
    const/16 v2, 0x47

    goto/16 :goto_0

    :sswitch_e6
    const-string v0, "feedbackQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e6

    goto/16 :goto_0

    :cond_e6
    const/16 v2, 0x46

    goto/16 :goto_0

    :sswitch_e7
    const-string v0, "orders"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e7

    goto/16 :goto_0

    :cond_e7
    const/16 v2, 0x45

    goto/16 :goto_0

    :sswitch_e8
    const-string v0, "questionnaire"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e8

    goto/16 :goto_0

    :cond_e8
    const/16 v2, 0x44

    goto/16 :goto_0

    :sswitch_e9
    const-string v0, "voicechat"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e9

    goto/16 :goto_0

    :cond_e9
    const/16 v2, 0x43

    goto/16 :goto_0

    :sswitch_ea
    const-string v0, "giftWallSocials"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ea

    goto/16 :goto_0

    :cond_ea
    const/16 v2, 0x42

    goto/16 :goto_0

    :sswitch_eb
    const-string v0, "intlBubble"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_eb

    goto/16 :goto_0

    :cond_eb
    const/16 v2, 0x41

    goto/16 :goto_0

    :sswitch_ec
    const-string v0, "picksUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ec

    goto/16 :goto_0

    :cond_ec
    const/16 v2, 0x40

    goto/16 :goto_0

    :sswitch_ed
    const-string v0, "myMeet"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ed

    goto/16 :goto_0

    :cond_ed
    const/16 v2, 0x3f

    goto/16 :goto_0

    :sswitch_ee
    const-string v0, "cardCornerMarks"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ee

    goto/16 :goto_0

    :cond_ee
    const/16 v2, 0x3e

    goto/16 :goto_0

    :sswitch_ef
    const-string v0, "isRecallUser"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ef

    goto/16 :goto_0

    :cond_ef
    const/16 v2, 0x3d

    goto/16 :goto_0

    :sswitch_f0
    const-string v0, "barLoverCities"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f0

    goto/16 :goto_0

    :cond_f0
    const/16 v2, 0x3c

    goto/16 :goto_0

    :sswitch_f1
    const-string v0, "greetingHotLevelInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f1

    goto/16 :goto_0

    :cond_f1
    const/16 v2, 0x3b

    goto/16 :goto_0

    :sswitch_f2
    const-string v0, "cityCData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f2

    goto/16 :goto_0

    :cond_f2
    const/16 v2, 0x3a

    goto/16 :goto_0

    :sswitch_f3
    const-string v0, "recommendList"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f3

    goto/16 :goto_0

    :cond_f3
    const/16 v2, 0x39

    goto/16 :goto_0

    :sswitch_f4
    const-string v0, "groupApplies"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f4

    goto/16 :goto_0

    :cond_f4
    const/16 v2, 0x38

    goto/16 :goto_0

    :sswitch_f5
    const-string v0, "latestMoments"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f5

    goto/16 :goto_0

    :cond_f5
    const/16 v2, 0x37

    goto/16 :goto_0

    :sswitch_f6
    const-string v0, "loveLetterContent"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f6

    goto/16 :goto_0

    :cond_f6
    const/16 v2, 0x36

    goto/16 :goto_0

    :sswitch_f7
    const-string v0, "actives"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f7

    goto/16 :goto_0

    :cond_f7
    const/16 v2, 0x35

    goto/16 :goto_0

    :sswitch_f8
    const-string v0, "creditScores"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f8

    goto/16 :goto_0

    :cond_f8
    const/16 v2, 0x34

    goto/16 :goto_0

    :sswitch_f9
    const-string v0, "tacitTest"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f9

    goto/16 :goto_0

    :cond_f9
    const/16 v2, 0x33

    goto/16 :goto_0

    :sswitch_fa
    const-string v0, "ttcToDiamondRate"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_fa

    goto/16 :goto_0

    :cond_fa
    const/16 v2, 0x32

    goto/16 :goto_0

    :sswitch_fb
    const-string v0, "greets"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_fb

    goto/16 :goto_0

    :cond_fb
    const/16 v2, 0x31

    goto/16 :goto_0

    :sswitch_fc
    const-string v0, "userMomentSetting"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_fc

    goto/16 :goto_0

    :cond_fc
    const/16 v2, 0x30

    goto/16 :goto_0

    :sswitch_fd
    const-string v0, "privateCustomResults"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_fd

    goto/16 :goto_0

    :cond_fd
    const/16 v2, 0x2f

    goto/16 :goto_0

    :sswitch_fe
    const-string v0, "floats"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_fe

    goto/16 :goto_0

    :cond_fe
    const/16 v2, 0x2e

    goto/16 :goto_0

    :sswitch_ff
    const-string v0, "pictureTags"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ff

    goto/16 :goto_0

    :cond_ff
    const/16 v2, 0x2d

    goto/16 :goto_0

    :sswitch_100
    const-string v0, "marriageGuide"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_100

    goto/16 :goto_0

    :cond_100
    const/16 v2, 0x2c

    goto/16 :goto_0

    :sswitch_101
    const-string v0, "explore"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_101

    goto/16 :goto_0

    :cond_101
    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_102
    const-string v0, "oneside"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_102

    goto/16 :goto_0

    :cond_102
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_103
    const-string v0, "greetingPermissions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_103

    goto/16 :goto_0

    :cond_103
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_104
    const-string v0, "tickles"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_104

    goto/16 :goto_0

    :cond_104
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_105
    const-string v0, "avatar"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_105

    goto/16 :goto_0

    :cond_105
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_106
    const-string v0, "picksInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_106

    goto/16 :goto_0

    :cond_106
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_107
    const-string v0, "action"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_107

    goto/16 :goto_0

    :cond_107
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_108
    const-string v0, "tagCategories"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_108

    goto/16 :goto_0

    :cond_108
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_109
    const-string v0, "stateEmotion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_109

    goto/16 :goto_0

    :cond_109
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_10a
    const-string v0, "groupTabs"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10a

    goto/16 :goto_0

    :cond_10a
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_10b
    const-string v0, "selectedQuestion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10b

    goto/16 :goto_0

    :cond_10b
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_10c
    const-string v0, "greetingCounter"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10c

    goto/16 :goto_0

    :cond_10c
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_10d
    const-string v0, "literatureConfigInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10d

    goto/16 :goto_0

    :cond_10d
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_10e
    const-string v0, "profileCounts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10e

    goto/16 :goto_0

    :cond_10e
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_10f
    const-string v0, "comStatusAwards"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10f

    goto/16 :goto_0

    :cond_10f
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_110
    const-string v0, "cipherId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_110

    goto/16 :goto_0

    :cond_110
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_111
    const-string v0, "loveLetter"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_111

    goto/16 :goto_0

    :cond_111
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_112
    const-string v0, "selectionUserInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_112

    goto/16 :goto_0

    :cond_112
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_113
    const-string v0, "tagUserCounts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_113

    goto/16 :goto_0

    :cond_113
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_114
    const-string v0, "aiPictureAuth"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_114

    goto/16 :goto_0

    :cond_114
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_115
    const-string v0, "exposureInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_115

    goto/16 :goto_0

    :cond_115
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_116
    const-string v0, "seeExposedUser"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_116

    goto/16 :goto_0

    :cond_116
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_117
    const-string v0, "tagCategoryStrategy"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_117

    goto/16 :goto_0

    :cond_117
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_118
    const-string v0, "chatAssistantQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_118

    goto/16 :goto_0

    :cond_118
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_119
    const-string v0, "tagPictureStrategy"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_119

    goto/16 :goto_0

    :cond_119
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_11a
    const-string v0, "questions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11a

    goto/16 :goto_0

    :cond_11a
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_11b
    const-string v0, "privacySettings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11b

    goto/16 :goto_0

    :cond_11b
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_11c
    const-string v0, "ultraRightsUpgradeInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11c

    goto/16 :goto_0

    :cond_11c
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_11d
    const-string v0, "chatGroupMembers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11d

    goto/16 :goto_0

    :cond_11d
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_11e
    const-string v0, "settingGroups"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11e

    goto/16 :goto_0

    :cond_11e
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_11f
    const-string v0, "surveys"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11f

    goto/16 :goto_0

    :cond_11f
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_120
    const-string v0, "systemQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_120

    goto/16 :goto_0

    :cond_120
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_121
    const-string v0, "readMessages"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_121

    goto/16 :goto_0

    :cond_121
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_122
    const-string v0, "acceleratePairing"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_122

    goto/16 :goto_0

    :cond_122
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_123
    const-string v0, "fakeGuideData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_123

    goto/16 :goto_0

    :cond_123
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_124
    const-string v0, "resources"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_124

    goto/16 :goto_0

    :cond_124
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_125
    const-string v0, "purchaseDialogConf"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_125

    goto :goto_0

    :cond_125
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_126
    const-string v0, "extremeQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_126

    goto :goto_0

    :cond_126
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_127
    const-string v0, "chatGroups"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_127

    goto :goto_0

    :cond_127
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_128
    const-string v0, "privilegeGifts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_128

    goto :goto_0

    :cond_128
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_129
    const-string v0, "instantChat"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_129

    goto :goto_0

    :cond_129
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_12a
    const-string v0, "walletAccounts"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12a

    goto :goto_0

    :cond_12a
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_12b
    const-string v0, "selectionUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12b

    goto :goto_0

    :cond_12b
    move v2, v1

    goto :goto_0

    :sswitch_12c
    const-string v0, "chatPartners"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12c

    goto :goto_0

    :cond_12c
    const/4 v2, 0x0

    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 2
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0

    :pswitch_0
    return v1

    :sswitch_data_0
    .sparse-switch
        -0x7fd523dd -> :sswitch_12c
        -0x7f4fbc24 -> :sswitch_12b
        -0x7e609501 -> :sswitch_12a
        -0x7c69ab27 -> :sswitch_129
        -0x7b6da2ee -> :sswitch_128
        -0x778488b4 -> :sswitch_127
        -0x771a09ff -> :sswitch_126
        -0x76b86f93 -> :sswitch_125
        -0x763341db -> :sswitch_124
        -0x7544870f -> :sswitch_123
        -0x738856d5 -> :sswitch_122
        -0x71cb36fe -> :sswitch_121
        -0x70890c22 -> :sswitch_120
        -0x6e6ebba7 -> :sswitch_11f
        -0x6e0e27bc -> :sswitch_11e
        -0x6d856eee -> :sswitch_11d
        -0x6ba11bb9 -> :sswitch_11c
        -0x6ad9c435 -> :sswitch_11b
        -0x6a3abeb3 -> :sswitch_11a
        -0x6780e869 -> :sswitch_119
        -0x64ac8e79 -> :sswitch_118
        -0x649189b5 -> :sswitch_117
        -0x6482c148 -> :sswitch_116
        -0x624d85ab -> :sswitch_115
        -0x60f70d82 -> :sswitch_114
        -0x602837d7 -> :sswitch_113
        -0x5fe88f3b -> :sswitch_112
        -0x5f4205c8 -> :sswitch_111
        -0x5c75677a -> :sswitch_110
        -0x5b261397 -> :sswitch_10f
        -0x5a975bb3 -> :sswitch_10e
        -0x5a8c14bf -> :sswitch_10d
        -0x5a1b947d -> :sswitch_10c
        -0x5940385f -> :sswitch_10b
        -0x5864b963 -> :sswitch_10a
        -0x56842176 -> :sswitch_109
        -0x563456aa -> :sswitch_108
        -0x54d081ca -> :sswitch_107
        -0x549d2bc0 -> :sswitch_106
        -0x53cd3ea7 -> :sswitch_105
        -0x4edaf0a3 -> :sswitch_104
        -0x4ec41175 -> :sswitch_103
        -0x4eb21743 -> :sswitch_102
        -0x4e08056d -> :sswitch_101
        -0x4bdc77ae -> :sswitch_100
        -0x4bdaa9c9 -> :sswitch_ff
        -0x4bcbd669 -> :sswitch_fe
        -0x4b4ff17e -> :sswitch_fd
        -0x4ab115db -> :sswitch_fc
        -0x49c6ed76 -> :sswitch_fb
        -0x47d3c24a -> :sswitch_fa
        -0x45eb908d -> :sswitch_f9
        -0x45c8b386 -> :sswitch_f8
        -0x453f9dd3 -> :sswitch_f7
        -0x44599cdf -> :sswitch_f6
        -0x442f6f14 -> :sswitch_f5
        -0x441baaf3 -> :sswitch_f4
        -0x44148886 -> :sswitch_f3
        -0x438fe3fe -> :sswitch_f2
        -0x433894a2 -> :sswitch_f1
        -0x425faf6a -> :sswitch_f0
        -0x412a5cba -> :sswitch_ef
        -0x40a8bf3f -> :sswitch_ee
        -0x3f321fed -> :sswitch_ed
        -0x3e5cef4a -> :sswitch_ec
        -0x3e10f2b7 -> :sswitch_eb
        -0x3cef39d4 -> :sswitch_ea
        -0x3cb67476 -> :sswitch_e9
        -0x3c9ef25d -> :sswitch_e8
        -0x3c209d1b -> :sswitch_e7
        -0x3abe64b8 -> :sswitch_e6
        -0x3a36d9c4 -> :sswitch_e5
        -0x370fb3b8 -> :sswitch_e4
        -0x36b03d83 -> :sswitch_e3
        -0x35c27f04 -> :sswitch_e2
        -0x353231fe -> :sswitch_e1
        -0x3487cfbd -> :sswitch_e0
        -0x3473c991 -> :sswitch_df
        -0x33352df1 -> :sswitch_de
        -0x32f27686 -> :sswitch_dd
        -0x315d98f4 -> :sswitch_dc
        -0x3141edaa -> :sswitch_db
        -0x30c4f86b -> :sswitch_da
        -0x3056ba7f -> :sswitch_d9
        -0x3050f64b -> :sswitch_d8
        -0x302c04c8 -> :sswitch_d7
        -0x3024d83e -> :sswitch_d6
        -0x2ff48383 -> :sswitch_d5
        -0x2f65ac07 -> :sswitch_d4
        -0x2f432338 -> :sswitch_d3
        -0x2f3174da -> :sswitch_d2
        -0x2eedbf66 -> :sswitch_d1
        -0x2e2bb587 -> :sswitch_d0
        -0x2c86f607 -> :sswitch_cf
        -0x2c0f2267 -> :sswitch_ce
        -0x2b29aec3 -> :sswitch_cd
        -0x29df9987 -> :sswitch_cc
        -0x285bdf01 -> :sswitch_cb
        -0x277761a5 -> :sswitch_ca
        -0x2549f76b -> :sswitch_c9
        -0x24b81028 -> :sswitch_c8
        -0x23c4b66b -> :sswitch_c7
        -0x23badf17 -> :sswitch_c6
        -0x23ab9a4a -> :sswitch_c5
        -0x235172af -> :sswitch_c4
        -0x21d29fad -> :sswitch_c3
        -0x21caeeee -> :sswitch_c2
        -0x200cfbd6 -> :sswitch_c1
        -0x1fc2f46d -> :sswitch_c0
        -0x1f8e71d0 -> :sswitch_bf
        -0x1f1ae11e -> :sswitch_be
        -0x1e0a694a -> :sswitch_bd
        -0x1cd3dc29 -> :sswitch_bc
        -0x1c7a9559 -> :sswitch_bb
        -0x1be8f9cd -> :sswitch_ba
        -0x1b8afeb4 -> :sswitch_b9
        -0x1b3ab93b -> :sswitch_b8
        -0x1a0d9c60 -> :sswitch_b7
        -0x19655847 -> :sswitch_b6
        -0x1730d4a5 -> :sswitch_b5
        -0x165c1f24 -> :sswitch_b4
        -0x15829305 -> :sswitch_b3
        -0x14be4c64 -> :sswitch_b2
        -0x13af6aca -> :sswitch_b1
        -0x1188b95d -> :sswitch_b0
        -0x11531bc3 -> :sswitch_af
        -0x10183504 -> :sswitch_ae
        -0xfe312c6 -> :sswitch_ad
        -0xfd3cfab -> :sswitch_ac
        -0xf950f48 -> :sswitch_ab
        -0xef7857b -> :sswitch_aa
        -0xe785153 -> :sswitch_a9
        -0xaeff743 -> :sswitch_a8
        -0xa4deb4f -> :sswitch_a7
        -0xa24e1d8 -> :sswitch_a6
        -0x98905d8 -> :sswitch_a5
        -0x92f55bf -> :sswitch_a4
        -0x6d99cd8 -> :sswitch_a3
        -0x37ebf1c -> :sswitch_a2
        -0x271349e -> :sswitch_a1
        -0x1ec42d3 -> :sswitch_a0
        -0x94e1cb -> :sswitch_9f
        -0x944ac8 -> :sswitch_9e
        0x196b8 -> :sswitch_9d
        0x1bf95 -> :sswitch_9c
        0x2e1503 -> :sswitch_9b
        0x2e7b10 -> :sswitch_9a
        0x30de87 -> :sswitch_99
        0x32affa -> :sswitch_98
        0x338af3 -> :sswitch_97
        0x363419 -> :sswitch_96
        0x36ebcb -> :sswitch_95
        0xd7cc61 -> :sswitch_94
        0x1f608e7 -> :sswitch_93
        0x40d0333 -> :sswitch_92
        0x5a0d1d5 -> :sswitch_91
        0x5a72402 -> :sswitch_90
        0x5a7510f -> :sswitch_8f
        0x5fd0609 -> :sswitch_8e
        0x61fd551 -> :sswitch_8d
        0x6219b84 -> :sswitch_8c
        0x6234fb9 -> :sswitch_8b
        0x6236d07 -> :sswitch_8a
        0x62f96f4 -> :sswitch_89
        0x65b8472 -> :sswitch_88
        0x677ef84 -> :sswitch_87
        0x6824ccd -> :sswitch_86
        0x6833e92 -> :sswitch_85
        0x7589311 -> :sswitch_84
        0x9164361 -> :sswitch_83
        0xa47cfbf -> :sswitch_82
        0xad77b60 -> :sswitch_81
        0xe06e031 -> :sswitch_80
        0xe504969 -> :sswitch_7f
        0xec78f1a -> :sswitch_7e
        0xff4c1fc -> :sswitch_7d
        0x10fb411e -> :sswitch_7c
        0x113cc00a -> :sswitch_7b
        0x121d8822 -> :sswitch_7a
        0x15387881 -> :sswitch_79
        0x17781378 -> :sswitch_78
        0x1804bf0a -> :sswitch_77
        0x18f3adfa -> :sswitch_76
        0x1a729ff1 -> :sswitch_75
        0x1baa3dae -> :sswitch_74
        0x1c2a513b -> :sswitch_73
        0x1c3a459a -> :sswitch_72
        0x1deb0334 -> :sswitch_71
        0x1e6d8189 -> :sswitch_70
        0x1f2e9faa -> :sswitch_6f
        0x20b11fac -> :sswitch_6e
        0x20c381c1 -> :sswitch_6d
        0x20ca1635 -> :sswitch_6c
        0x2126eeb4 -> :sswitch_6b
        0x2274cab2 -> :sswitch_6a
        0x22c9882d -> :sswitch_69
        0x23a2dc05 -> :sswitch_68
        0x2427a510 -> :sswitch_67
        0x253adbe7 -> :sswitch_66
        0x2559a81e -> :sswitch_65
        0x2595632b -> :sswitch_64
        0x26c77412 -> :sswitch_63
        0x26e29c0b -> :sswitch_62
        0x2807c385 -> :sswitch_61
        0x28bb30d5 -> :sswitch_60
        0x2b21e5ab -> :sswitch_5f
        0x2b7ac466 -> :sswitch_5e
        0x2bdd1ad7 -> :sswitch_5d
        0x2bfafb5c -> :sswitch_5c
        0x2c4034f5 -> :sswitch_5b
        0x2cc154ed -> :sswitch_5a
        0x2d17cf0d -> :sswitch_59
        0x2d8673c1 -> :sswitch_58
        0x2e5b94a9 -> :sswitch_57
        0x2f1e7411 -> :sswitch_56
        0x3091cb53 -> :sswitch_55
        0x31c2690e -> :sswitch_54
        0x3217eed7 -> :sswitch_53
        0x3254e0b7 -> :sswitch_52
        0x330cbc98 -> :sswitch_51
        0x332c073c -> :sswitch_50
        0x33430e7c -> :sswitch_4f
        0x33aed6d9 -> :sswitch_4e
        0x39182d0d -> :sswitch_4d
        0x398e40f2 -> :sswitch_4c
        0x3ac204eb -> :sswitch_4b
        0x3b429830 -> :sswitch_4a
        0x3d8a10e0 -> :sswitch_49
        0x3d9b4372 -> :sswitch_48
        0x3fca340b -> :sswitch_47
        0x3fca76dc -> :sswitch_46
        0x403673a3 -> :sswitch_45
        0x40debb32 -> :sswitch_44
        0x418dd3aa -> :sswitch_43
        0x41c14e41 -> :sswitch_42
        0x41c1aeee -> :sswitch_41
        0x421861d2 -> :sswitch_40
        0x4468e016 -> :sswitch_3f
        0x46e716f5 -> :sswitch_3e
        0x473f7799 -> :sswitch_3d
        0x475fd6bf -> :sswitch_3c
        0x47a162d3 -> :sswitch_3b
        0x48cb86e3 -> :sswitch_3a
        0x490bb556 -> :sswitch_39
        0x4934edb8 -> :sswitch_38
        0x49a0be73 -> :sswitch_37
        0x4a0b6637 -> :sswitch_36
        0x4b101859 -> :sswitch_35
        0x4c9baf27 -> :sswitch_34
        0x4d6a43bb -> :sswitch_33
        0x4dc627f2 -> :sswitch_32
        0x4edfac55 -> :sswitch_31
        0x4ef34925 -> :sswitch_30
        0x501062cb -> :sswitch_2f
        0x51c266fb -> :sswitch_2e
        0x52df7c12 -> :sswitch_2d
        0x53981898 -> :sswitch_2c
        0x53c07202 -> :sswitch_2b
        0x54e6a060 -> :sswitch_2a
        0x55aafe07 -> :sswitch_29
        0x55b4de5b -> :sswitch_28
        0x579db450 -> :sswitch_27
        0x585891f9 -> :sswitch_26
        0x58d35b7e -> :sswitch_25
        0x58dcb629 -> :sswitch_24
        0x5afaa177 -> :sswitch_23
        0x5b4c1ed6 -> :sswitch_22
        0x5bb7cab0 -> :sswitch_21
        0x5cd8f242 -> :sswitch_20
        0x5d6cf584 -> :sswitch_1f
        0x5deef313 -> :sswitch_1e
        0x5e19a936 -> :sswitch_1d
        0x5f45c40b -> :sswitch_1c
        0x5fe6f99a -> :sswitch_1b
        0x60e88180 -> :sswitch_1a
        0x62a62154 -> :sswitch_19
        0x63cebb9f -> :sswitch_18
        0x67a61d4b -> :sswitch_17
        0x6819d542 -> :sswitch_16
        0x6afd613e -> :sswitch_15
        0x6b51cf55 -> :sswitch_14
        0x6bbd5975 -> :sswitch_13
        0x6cf23c02 -> :sswitch_12
        0x6e88982d -> :sswitch_11
        0x6eceb69c -> :sswitch_10
        0x6f717534 -> :sswitch_f
        0x6fa4ef9d -> :sswitch_e
        0x724a137f -> :sswitch_d
        0x729fc528 -> :sswitch_c
        0x72d3e682 -> :sswitch_b
        0x732ad02d -> :sswitch_a
        0x7334aef7 -> :sswitch_9
        0x78a9abff -> :sswitch_8
        0x793ad897 -> :sswitch_7
        0x7a226117 -> :sswitch_6
        0x7a70dd5a -> :sswitch_5
        0x7b91875a -> :sswitch_4
        0x7c558789 -> :sswitch_3
        0x7ec8b41e -> :sswitch_2
        0x7ef99372 -> :sswitch_1
        0x7fad9162 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CoreData$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/CoreData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/CoreData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    if-eqz p0, :cond_0

    .line 2
    const-string p0, "relationships"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/data/Relationship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    if-eqz p0, :cond_1

    .line 5
    const-string p0, "conversations"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 7
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    if-eqz p0, :cond_2

    .line 8
    const-string p0, "messages"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    if-eqz p0, :cond_3

    .line 11
    const-string p0, "contacts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/data/Contact;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 13
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    if-eqz p0, :cond_4

    .line 14
    const-string p0, "questions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/Question;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 16
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    if-eqz p0, :cond_5

    .line 17
    const-string p0, "stickers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/Sticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 19
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    if-eqz p0, :cond_6

    .line 20
    const-string p0, "packages"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 22
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    if-eqz p0, :cond_7

    .line 23
    const-string p0, "bundles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerBundle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 25
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    if-eqz p0, :cond_8

    .line 26
    const-string p0, "links"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/data/Link;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 28
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    if-eqz p0, :cond_9

    .line 29
    const-string p0, "schools"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 30
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/School;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 31
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    if-eqz p0, :cond_a

    .line 32
    const-string p0, "reminders"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/Reminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 34
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    if-eqz p0, :cond_b

    .line 35
    const-string p0, "verifications"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 37
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    const/4 v0, 0x1

    if-eqz p0, :cond_c

    .line 38
    const-string p0, "wallet"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/data/Wallet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 40
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    if-eqz p0, :cond_d

    .line 41
    const-string p0, "privateQuestions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 43
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    if-eqz p0, :cond_e

    .line 44
    const-string p0, "coins"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/data/Coin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 46
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    if-eqz p0, :cond_f

    .line 47
    const-string p0, "summarizedPrivileges"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 48
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 49
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    if-eqz p0, :cond_10

    .line 50
    const-string p0, "faceidTokens"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/FaceidToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 52
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    if-eqz p0, :cond_11

    .line 53
    const-string p0, "merchandises"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 55
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    if-eqz p0, :cond_12

    .line 56
    const-string p0, "privacySettings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 58
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    if-eqz p0, :cond_13

    .line 59
    const-string p0, "figures"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Figure;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 61
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    if-eqz p0, :cond_14

    .line 62
    const-string p0, "orders"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 63
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 64
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    if-eqz p0, :cond_15

    .line 65
    const-string p0, "boostStatus"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 67
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    if-eqz p0, :cond_16

    .line 68
    const-string p0, "summarizedPrivilegePrices"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 70
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    if-eqz p0, :cond_17

    .line 71
    const-string p0, "advancedSearchSettings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 72
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 73
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    if-eqz p0, :cond_18

    .line 74
    const-string p0, "surveys"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Surveys;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 76
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    if-eqz p0, :cond_19

    .line 77
    const-string p0, "appealInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 78
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/AppealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 79
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    if-eqz p0, :cond_1a

    .line 80
    const-string p0, "autoDeducts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 81
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/AutoDeducts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 82
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    if-eqz p0, :cond_1b

    .line 83
    const-string p0, "calls"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/VoiceCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 85
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    if-eqz p0, :cond_1c

    .line 86
    const-string p0, "complain"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Complain;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 88
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    if-eqz p0, :cond_1d

    .line 89
    const-string p0, "liveLabels"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 91
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    if-eqz p0, :cond_1e

    .line 92
    const-string p0, "likedUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 93
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/LikedUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 94
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    if-eqz p0, :cond_1f

    .line 95
    const-string p0, "refundDetails"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 96
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/RefundDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 97
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    if-eqz p0, :cond_20

    .line 98
    const-string p0, "walletAccounts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 99
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/WalletAccount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 100
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    if-eqz p0, :cond_21

    .line 101
    const-string p0, "accountRecords"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 102
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/AccountRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 103
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    if-eqz p0, :cond_22

    .line 104
    const-string p0, "monetizationConfiguration"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 106
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    if-eqz p0, :cond_23

    .line 107
    const-string p0, "contract"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 108
    sget-object p0, Lcom/p1/mobile/putong/data/Contract;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 109
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    if-eqz p0, :cond_24

    .line 110
    const-string p0, "verificationTokens"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/VerificationToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 112
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    if-eqz p0, :cond_25

    .line 113
    const-string p0, "heartbeats"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/HeartBeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 115
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    if-eqz p0, :cond_26

    .line 116
    const-string p0, "contractInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 117
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ContractInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 118
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    if-eqz p0, :cond_27

    .line 119
    const-string p0, "chatGroups"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 120
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 121
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    if-eqz p0, :cond_28

    .line 122
    const-string p0, "chatGroupMembers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 124
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    if-eqz p0, :cond_29

    .line 125
    const-string p0, "groupApplies"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 126
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupApply;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 127
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    if-eqz p0, :cond_2a

    .line 128
    const-string p0, "notificationCounters"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 129
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/NotificationCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 130
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    if-eqz p0, :cond_2b

    .line 131
    const-string p0, "groupNotifications"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 132
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupNotification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 133
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    if-eqz p0, :cond_2c

    .line 134
    const-string p0, "groupAttributes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 135
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupAttribute;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 136
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    if-eqz p0, :cond_2d

    .line 137
    const-string p0, "interestedGroups"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 138
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 139
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    if-eqz p0, :cond_2e

    .line 140
    const-string p0, "groupTabs"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 141
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 142
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    if-eqz p0, :cond_2f

    .line 143
    const-string p0, "keywords"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 144
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 145
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    if-eqz p0, :cond_30

    .line 146
    const-string p0, "groupSettings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 147
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 148
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    if-eqz p0, :cond_31

    .line 149
    const-string p0, "settingGroups"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 151
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    if-eqz p0, :cond_32

    .line 152
    const-string p0, "lives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/Live;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 154
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    if-eqz p0, :cond_33

    .line 155
    const-string p0, "officialAccounts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 156
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/OfficialAccount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 157
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    if-eqz p0, :cond_34

    .line 158
    const-string p0, "menus"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 159
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 160
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    if-eqz p0, :cond_35

    .line 161
    const-string p0, "tickles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 163
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    if-eqz p0, :cond_36

    .line 164
    const-string p0, "monetizationPromotions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 165
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 166
    :cond_36
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    if-eqz p0, :cond_37

    .line 167
    const-string p0, "coupons"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 168
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Coupon;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 169
    :cond_37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    if-eqz p0, :cond_38

    .line 170
    const-string p0, "chatProfiles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 171
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 172
    :cond_38
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    if-eqz p0, :cond_39

    .line 173
    const-string p0, "systemQuestions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 174
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 175
    :cond_39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    if-eqz p0, :cond_3a

    .line 176
    const-string p0, "priorityLike"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 177
    sget-object p0, Lcom/p1/mobile/putong/core/data/PriorityLike;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 178
    :cond_3a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    if-eqz p0, :cond_3b

    .line 179
    const-string p0, "couponBag"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 180
    sget-object p0, Lcom/p1/mobile/putong/core/data/Couponbag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 181
    :cond_3b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    if-eqz p0, :cond_3c

    .line 182
    const-string p0, "userStickers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 183
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/UserSticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 184
    :cond_3c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    if-eqz p0, :cond_3d

    .line 185
    const-string p0, "redPackets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 186
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/RedPacket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 187
    :cond_3d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    if-eqz p0, :cond_3e

    .line 188
    const-string p0, "giftInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 189
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 190
    :cond_3e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    if-eqz p0, :cond_3f

    .line 191
    const-string p0, "counterVerification"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 192
    sget-object p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 193
    :cond_3f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    if-eqz p0, :cond_40

    .line 194
    const-string p0, "liveSchemas"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 195
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/LiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 196
    :cond_40
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    if-eqz p0, :cond_41

    .line 197
    const-string p0, "friends"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 198
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/FriendInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 199
    :cond_41
    const-string p0, "nextTime"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 200
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 201
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    if-eqz p0, :cond_42

    .line 202
    const-string p0, "conversationDiff"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 203
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationDiff;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 204
    :cond_42
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    if-eqz p0, :cond_43

    .line 205
    const-string p0, "comStatusAwards"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 206
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 207
    :cond_43
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    if-eqz p0, :cond_44

    .line 208
    const-string p0, "cardStyles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 209
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 210
    :cond_44
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    if-eqz p0, :cond_45

    .line 211
    const-string p0, "audioTexts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 212
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/AudioText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 213
    :cond_45
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    if-eqz p0, :cond_46

    .line 214
    const-string p0, "giftGuide"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 215
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 216
    :cond_46
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    if-eqz p0, :cond_47

    .line 217
    const-string p0, "giftPanel"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 218
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 219
    :cond_47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    if-eqz p0, :cond_48

    .line 220
    const-string p0, "giftWallSocials"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 221
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 222
    :cond_48
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    if-eqz p0, :cond_49

    .line 223
    const-string p0, "giftWallRankInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 224
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 225
    :cond_49
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    if-eqz p0, :cond_4a

    .line 226
    const-string p0, "giftWallTitles"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 227
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftWallTitle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 228
    :cond_4a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    if-eqz p0, :cond_4b

    .line 229
    const-string p0, "newGiftWalls"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 230
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 231
    :cond_4b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    if-eqz p0, :cond_4c

    .line 232
    const-string p0, "purchaseDialogConf"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 233
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 234
    :cond_4c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    if-eqz p0, :cond_4d

    .line 235
    const-string p0, "greetings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 236
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Greeting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 237
    :cond_4d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    if-eqz p0, :cond_4e

    .line 238
    const-string p0, "greetingCounter"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 239
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 240
    :cond_4e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    if-eqz p0, :cond_4f

    .line 241
    const-string p0, "greetingPermissions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 242
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingPermission;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 243
    :cond_4f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz p0, :cond_50

    .line 244
    const-string p0, "greetingSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 245
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 246
    :cond_50
    const-string p0, "hint"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 247
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    if-eqz p0, :cond_51

    .line 248
    const-string p0, "cardExtraInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 249
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 250
    :cond_51
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    if-eqz p0, :cond_52

    .line 251
    const-string p0, "readMessages"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 252
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ReadMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 253
    :cond_52
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    if-eqz p0, :cond_53

    .line 254
    const-string p0, "recentConversations"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 255
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/RecentConversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 256
    :cond_53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    if-eqz p0, :cond_54

    .line 257
    const-string p0, "orderInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 258
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/OrderInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 259
    :cond_54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    if-eqz p0, :cond_55

    .line 260
    const-string p0, "card"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 261
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 262
    :cond_55
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    if-eqz p0, :cond_56

    .line 263
    const-string p0, "picksUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 264
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/PicksUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 265
    :cond_56
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    if-eqz p0, :cond_57

    .line 266
    const-string p0, "picks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 267
    sget-object p0, Lcom/p1/mobile/putong/core/data/Picks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 268
    :cond_57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    if-eqz p0, :cond_58

    .line 269
    const-string p0, "countdownLikes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 270
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CountdownItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 271
    :cond_58
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    if-eqz p0, :cond_59

    .line 272
    const-string p0, "greetingSetting"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 273
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 274
    :cond_59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    if-eqz p0, :cond_5a

    .line 275
    const-string p0, "onlineLiveChatPair"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 276
    sget-object p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 277
    :cond_5a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    if-eqz p0, :cond_5b

    .line 278
    const-string p0, "likedMes"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 279
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 280
    :cond_5b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    if-eqz p0, :cond_5c

    .line 281
    const-string p0, "myMeet"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 282
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 283
    :cond_5c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    if-eqz p0, :cond_5d

    .line 284
    const-string p0, "moments"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 285
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 286
    :cond_5d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    if-eqz p0, :cond_5e

    .line 287
    const-string p0, "voicechat"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 288
    sget-object p0, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 289
    :cond_5e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    if-eqz p0, :cond_5f

    .line 290
    const-string p0, "bell"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 291
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 292
    :cond_5f
    const-string p0, "isHit"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 293
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    if-eqz p0, :cond_60

    .line 294
    const-string p0, "user"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 295
    sget-object p0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 296
    :cond_60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    if-eqz p0, :cond_61

    .line 297
    const-string p0, "literaturesComments"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 298
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 299
    :cond_61
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    if-eqz p0, :cond_62

    .line 300
    const-string p0, "literatures"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 301
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Literatures;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 302
    :cond_62
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    if-eqz p0, :cond_63

    .line 303
    const-string p0, "membershipRecommendUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 304
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 305
    :cond_63
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    if-eqz p0, :cond_64

    .line 306
    const-string p0, "freeTrialInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 307
    sget-object p0, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 308
    :cond_64
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    if-eqz p0, :cond_65

    .line 309
    const-string p0, "freeTrialOperateResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 310
    sget-object p0, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 311
    :cond_65
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    if-eqz p0, :cond_66

    .line 312
    const-string p0, "speedUpCard"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 313
    sget-object p0, Lcom/p1/mobile/putong/core/data/Note;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 314
    :cond_66
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    if-eqz p0, :cond_67

    .line 315
    const-string p0, "states"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 316
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 317
    :cond_67
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    if-eqz p0, :cond_68

    .line 318
    const-string p0, "thirdPartyInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 319
    sget-object p0, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 320
    :cond_68
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    if-eqz p0, :cond_69

    .line 321
    const-string p0, "evaluations"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 322
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Evaluation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 323
    :cond_69
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    if-eqz p0, :cond_6a

    .line 324
    const-string p0, "evaluationReports"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 325
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 326
    :cond_6a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    if-eqz p0, :cond_6b

    .line 327
    const-string p0, "msgData"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 328
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 329
    :cond_6b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    if-eqz p0, :cond_6c

    .line 330
    const-string p0, "evaluation"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 331
    sget-object p0, Lcom/p1/mobile/putong/core/data/Evaluation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 332
    :cond_6c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    if-eqz p0, :cond_6d

    .line 333
    const-string p0, "privilegeGifts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 334
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 335
    :cond_6d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    if-eqz p0, :cond_6e

    .line 336
    const-string p0, "recommendMessages"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 337
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/RecommendMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 338
    :cond_6e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    if-eqz p0, :cond_6f

    .line 339
    const-string p0, "greets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 340
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/UserGreetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 341
    :cond_6f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    if-eqz p0, :cond_70

    .line 342
    const-string p0, "cardModels"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 343
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 344
    :cond_70
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    if-eqz p0, :cond_71

    .line 345
    const-string p0, "heartbeatMatch"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 346
    sget-object p0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 347
    :cond_71
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    if-eqz p0, :cond_72

    .line 348
    const-string p0, "oneside"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 349
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 350
    :cond_72
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    if-eqz p0, :cond_73

    .line 351
    const-string p0, "myMeetListV3"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 352
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 353
    :cond_73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    if-eqz p0, :cond_74

    .line 354
    const-string p0, "myMeetEntryV3"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 355
    sget-object p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 356
    :cond_74
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    if-eqz p0, :cond_75

    .line 357
    const-string p0, "intlInsertCardSets"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 358
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/InsertCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 359
    :cond_75
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    if-eqz p0, :cond_76

    .line 360
    const-string p0, "actives"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 361
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Active;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 362
    :cond_76
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    if-eqz p0, :cond_77

    .line 363
    const-string p0, "cardsIcons"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 364
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardsIcons;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 365
    :cond_77
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    if-eqz p0, :cond_78

    .line 366
    const-string p0, "tacitTest"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 367
    sget-object p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 368
    :cond_78
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    if-eqz p0, :cond_79

    .line 369
    const-string p0, "iceBreakings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 370
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/BreakIce;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 371
    :cond_79
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    if-eqz p0, :cond_7a

    .line 372
    const-string p0, "greetingHotLevelInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 373
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 374
    :cond_7a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    if-eqz p0, :cond_7b

    .line 375
    const-string p0, "voices"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 376
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Voice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 377
    :cond_7b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    if-eqz p0, :cond_7c

    const-string v1, "avatar"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    :cond_7c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    if-eqz p0, :cond_7d

    .line 379
    const-string p0, "suggestUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 380
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 381
    :cond_7d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    if-eqz p0, :cond_7e

    .line 382
    const-string p0, "action"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 383
    sget-object p0, Lcom/p1/mobile/putong/core/data/ActionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 384
    :cond_7e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz p0, :cond_7f

    .line 385
    const-string p0, "tagLoadStrategy"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 386
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 387
    :cond_7f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    if-eqz p0, :cond_80

    .line 388
    const-string p0, "tags"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 389
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/NewTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 390
    :cond_80
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz p0, :cond_81

    .line 391
    const-string p0, "tagCategoryStrategy"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 392
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 393
    :cond_81
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    if-eqz p0, :cond_82

    .line 394
    const-string p0, "tagCategories"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 395
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/TagCategories;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 396
    :cond_82
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    if-eqz p0, :cond_83

    .line 397
    const-string p0, "tagUserCounts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 398
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/TagUserCounts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 399
    :cond_83
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    if-eqz p0, :cond_84

    .line 400
    const-string p0, "sames"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 401
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 402
    :cond_84
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    if-eqz p0, :cond_85

    .line 403
    const-string p0, "literatureConfigInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 404
    sget-object p0, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 405
    :cond_85
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz p0, :cond_86

    .line 406
    const-string p0, "anonymousSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 407
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 408
    :cond_86
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    if-eqz p0, :cond_87

    .line 409
    const-string p0, "cardInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 410
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 411
    :cond_87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    if-eqz p0, :cond_88

    .line 412
    const-string p0, "seeInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 413
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 414
    :cond_88
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    if-eqz p0, :cond_89

    .line 415
    const-string p0, "seePortraits"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 416
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SeePortrait;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 417
    :cond_89
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    if-eqz p0, :cond_8a

    .line 418
    const-string p0, "profileLikesComments"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 419
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 420
    :cond_8a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    if-eqz p0, :cond_8b

    .line 421
    const-string p0, "profileLikeCounter"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 422
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 423
    :cond_8b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    if-eqz p0, :cond_8c

    .line 424
    const-string p0, "extraPrivileges"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 425
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 426
    :cond_8c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    if-eqz p0, :cond_8d

    .line 427
    const-string p0, "selectedQuestion"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 428
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 429
    :cond_8d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    if-eqz p0, :cond_8e

    .line 430
    const-string p0, "likeUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 431
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/LikeUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 432
    :cond_8e
    const-string p0, "next"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 433
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    if-eqz p0, :cond_8f

    .line 434
    const-string p0, "cipherId"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 435
    sget-object p0, Lcom/p1/mobile/putong/core/data/CipherId;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 436
    :cond_8f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    if-eqz p0, :cond_90

    .line 437
    const-string p0, "shareId"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 438
    sget-object p0, Lcom/p1/mobile/putong/core/data/ShareId;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 439
    :cond_90
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    if-eqz p0, :cond_91

    .line 440
    const-string p0, "stateEmotion"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 441
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/StateEmotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 442
    :cond_91
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    if-eqz p0, :cond_92

    .line 443
    const-string p0, "seePortraitCounter"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 444
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 445
    :cond_92
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    if-eqz p0, :cond_93

    .line 446
    const-string p0, "recommended"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 447
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Recommended;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 448
    :cond_93
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    if-eqz p0, :cond_94

    .line 449
    const-string p0, "chatHeats"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 450
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 451
    :cond_94
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    if-eqz p0, :cond_95

    .line 452
    const-string p0, "chatHeatPermissions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 453
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/PermissionsItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 454
    :cond_95
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    if-eqz p0, :cond_96

    .line 455
    const-string p0, "resources"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 456
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ResourceTriggers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 457
    :cond_96
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    if-eqz p0, :cond_97

    .line 458
    const-string p0, "greetingResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 459
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 460
    :cond_97
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    if-eqz p0, :cond_98

    .line 461
    const-string p0, "latestMoments"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 462
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 463
    :cond_98
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    if-eqz p0, :cond_99

    .line 464
    const-string p0, "jmpTarget"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 465
    sget-object p0, Lcom/p1/mobile/putong/core/data/JmpTarget;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 466
    :cond_99
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    if-eqz p0, :cond_9a

    .line 467
    const-string p0, "buzzUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 468
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/BuzzUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 469
    :cond_9a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    if-eqz p0, :cond_9b

    .line 470
    const-string p0, "odiamondList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 471
    sget-object p0, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 472
    :cond_9b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    if-eqz p0, :cond_9c

    .line 473
    const-string p0, "popGuide"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 474
    sget-object p0, Lcom/p1/mobile/putong/core/data/PopGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 475
    :cond_9c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    if-eqz p0, :cond_9d

    .line 476
    const-string p0, "superLikeCount"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 477
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SuperLikeCount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 478
    :cond_9d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    if-eqz p0, :cond_9e

    .line 479
    const-string p0, "floats"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 480
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/FloatsCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 481
    :cond_9e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    if-eqz p0, :cond_9f

    .line 482
    const-string p0, "monetizationMsg"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 483
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 484
    :cond_9f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    if-eqz p0, :cond_a0

    const-string v1, "link"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    :cond_a0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    if-eqz p0, :cond_a1

    .line 486
    const-string p0, "tab"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 487
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 488
    :cond_a1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    if-eqz p0, :cond_a2

    .line 489
    const-string p0, "seeExposedUser"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 490
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 491
    :cond_a2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    if-eqz p0, :cond_a3

    .line 492
    const-string p0, "exposureInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 493
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 494
    :cond_a3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    if-eqz p0, :cond_a4

    .line 495
    const-string p0, "love520"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 496
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 497
    :cond_a4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    if-eqz p0, :cond_a5

    const-string v1, "payWill"

    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    :cond_a5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    if-eqz p0, :cond_a6

    .line 499
    const-string p0, "extremePickByList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 500
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ExtremePickItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 501
    :cond_a6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    if-eqz p0, :cond_a7

    .line 502
    const-string p0, "chatGameInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 503
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 504
    :cond_a7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    if-eqz p0, :cond_a8

    .line 505
    const-string p0, "camping"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 506
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 507
    :cond_a8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    if-eqz p0, :cond_a9

    .line 508
    const-string p0, "recallMatch"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 509
    sget-object p0, Lcom/p1/mobile/putong/core/data/RecallMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 510
    :cond_a9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    if-eqz p0, :cond_aa

    .line 511
    const-string p0, "liveActivities"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 512
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 513
    :cond_aa
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    if-eqz p0, :cond_ab

    .line 514
    const-string p0, "mkt_activity_regular"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 515
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 516
    :cond_ab
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    if-eqz p0, :cond_ac

    .line 517
    const-string p0, "monetizationChatSeeUser"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 518
    sget-object p0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 519
    :cond_ac
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    if-eqz p0, :cond_ad

    .line 520
    const-string p0, "intlVisitorInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 521
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlVisitor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 522
    :cond_ad
    const-string p0, "count"

    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 523
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    if-eqz p0, :cond_ae

    .line 524
    const-string p0, "ids"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 525
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 526
    :cond_ae
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    if-eqz p0, :cond_af

    .line 527
    const-string p0, "chatAssistantQuestions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 528
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 529
    :cond_af
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    if-eqz p0, :cond_b0

    .line 530
    const-string p0, "mkt_activity_quiz"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 531
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 532
    :cond_b0
    const-string p0, "isRecallUser"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 533
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    if-eqz p0, :cond_b1

    .line 534
    const-string p0, "greetingNewPeople"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 535
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/UserIdType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 536
    :cond_b1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    if-eqz p0, :cond_b2

    .line 537
    const-string p0, "greetingNewPeopleMessage"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 538
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 539
    :cond_b2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    if-eqz p0, :cond_b3

    .line 540
    const-string p0, "extremeQuestions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 541
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 542
    :cond_b3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    if-eqz p0, :cond_b4

    .line 543
    const-string p0, "boostResultEntry"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 544
    sget-object p0, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 545
    :cond_b4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    if-eqz p0, :cond_b5

    .line 546
    const-string p0, "todayMatchInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 547
    sget-object p0, Lcom/p1/mobile/putong/core/data/MatchInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 548
    :cond_b5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    if-eqz p0, :cond_b6

    .line 549
    const-string p0, "growthMesInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 550
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 551
    :cond_b6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    if-eqz p0, :cond_b7

    .line 552
    const-string p0, "aiPictureAuth"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 553
    sget-object p0, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 554
    :cond_b7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    if-eqz p0, :cond_b8

    .line 555
    const-string p0, "acceleratePairing"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 556
    sget-object p0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 557
    :cond_b8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    if-eqz p0, :cond_b9

    .line 558
    const-string p0, "invitation"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 559
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 560
    :cond_b9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    if-eqz p0, :cond_ba

    .line 561
    const-string p0, "campaignPage"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 562
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 563
    :cond_ba
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    if-eqz p0, :cond_bb

    .line 564
    const-string p0, "partner"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 565
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthPartner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 566
    :cond_bb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    if-eqz p0, :cond_bc

    .line 567
    const-string p0, "cityCData"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 568
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CityCData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 569
    :cond_bc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    if-eqz p0, :cond_bd

    .line 570
    const-string p0, "blindbox"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 571
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 572
    :cond_bd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    if-eqz p0, :cond_be

    .line 573
    const-string p0, "unReadUserIds"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 574
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 575
    :cond_be
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    if-eqz p0, :cond_bf

    .line 576
    const-string p0, "cityCBanner"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 577
    sget-object p0, Lcom/p1/mobile/putong/core/data/CityCBanner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 578
    :cond_bf
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    if-eqz p0, :cond_c0

    .line 579
    const-string p0, "chatPartners"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 580
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPartners;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 581
    :cond_c0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    if-eqz p0, :cond_c1

    .line 582
    const-string p0, "chatPartnersSignals"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 583
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 584
    :cond_c1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    if-eqz p0, :cond_c2

    .line 585
    const-string p0, "surpriseGift"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 586
    sget-object p0, Lcom/p1/mobile/putong/core/data/SurpriseGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 587
    :cond_c2
    const-string p0, "surpriseGiftExpirationTime"

    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 588
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    if-eqz p0, :cond_c3

    .line 589
    const-string p0, "cardCornerMarks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 590
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CardCornerMark;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 591
    :cond_c3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz p0, :cond_c4

    .line 592
    const-string p0, "lowPhotoResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 593
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 594
    :cond_c4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    if-eqz p0, :cond_c5

    .line 595
    const-string p0, "mkt_activity_flash"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 596
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 597
    :cond_c5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    if-eqz p0, :cond_c6

    .line 598
    const-string p0, "cityCConfig"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 599
    sget-object p0, Lcom/p1/mobile/putong/core/data/CityCConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 600
    :cond_c6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    if-eqz p0, :cond_c7

    .line 601
    const-string p0, "privateCustomSetting"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 602
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 603
    :cond_c7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz p0, :cond_c8

    .line 604
    const-string p0, "privateCustomResults"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 605
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 606
    :cond_c8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    if-eqz p0, :cond_c9

    .line 607
    const-string p0, "userMomentSetting"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 608
    sget-object p0, Lcom/p1/mobile/putong/core/data/VisitorSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 609
    :cond_c9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    if-eqz p0, :cond_ca

    .line 610
    const-string p0, "visitorHiddens"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 611
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorHidden;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 612
    :cond_ca
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    if-eqz p0, :cond_cb

    .line 613
    const-string p0, "marriageGuide"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 614
    sget-object p0, Lcom/p1/mobile/putong/core/data/MarriageGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 615
    :cond_cb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    if-eqz p0, :cond_cc

    .line 616
    const-string p0, "selectionUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 617
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SelectionUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 618
    :cond_cc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    if-eqz p0, :cond_cd

    .line 619
    const-string p0, "selectionUserInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 620
    sget-object p0, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 621
    :cond_cd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    if-eqz p0, :cond_ce

    .line 622
    const-string p0, "userAudits"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 623
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/UserAudits;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 624
    :cond_ce
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    if-eqz p0, :cond_cf

    .line 625
    const-string p0, "dynamicLabels"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 626
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/DynamicLable;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 627
    :cond_cf
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    if-eqz p0, :cond_d0

    .line 628
    const-string p0, "details"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 629
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/DetectText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 630
    :cond_d0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    if-eqz p0, :cond_d1

    .line 631
    const-string p0, "layer"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 632
    sget-object p0, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 633
    :cond_d1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    if-eqz p0, :cond_d2

    .line 634
    const-string p0, "auditPictureTags"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 635
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/AuditPictureTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 636
    :cond_d2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    if-eqz p0, :cond_d3

    .line 637
    const-string p0, "myTabGuide"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 638
    sget-object p0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 639
    :cond_d3
    const-string p0, "profileGuide"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 640
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz p0, :cond_d4

    .line 641
    const-string p0, "tagPictureStrategy"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 642
    sget-object p0, Lcom/p1/mobile/putong/core/data/TagStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 643
    :cond_d4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    if-eqz p0, :cond_d5

    .line 644
    const-string p0, "pictureTags"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 645
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/NewTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 646
    :cond_d5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    if-eqz p0, :cond_d6

    .line 647
    const-string p0, "fakeSuggest"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 648
    sget-object p0, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 649
    :cond_d6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz p0, :cond_d7

    .line 650
    const-string p0, "userRisk"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 651
    sget-object p0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 652
    :cond_d7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz p0, :cond_d8

    .line 653
    const-string p0, "descriptionRisk"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 654
    sget-object p0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 655
    :cond_d8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    if-eqz p0, :cond_d9

    .line 656
    const-string p0, "risks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 657
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/RiskSelfData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 658
    :cond_d9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    if-eqz p0, :cond_da

    .line 659
    const-string p0, "barLoverPlaces"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 660
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 661
    :cond_da
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    if-eqz p0, :cond_db

    .line 662
    const-string p0, "barLoverCities"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 663
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/BarLoverCitys;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 664
    :cond_db
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    if-eqz p0, :cond_dc

    .line 665
    const-string p0, "fateRadar"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 666
    sget-object p0, Lcom/p1/mobile/putong/core/data/FateRadar;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 667
    :cond_dc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    if-eqz p0, :cond_dd

    .line 668
    const-string p0, "svipWeeklyReport"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 669
    sget-object p0, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 670
    :cond_dd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    if-eqz p0, :cond_de

    .line 671
    const-string p0, "explore"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 672
    sget-object p0, Lcom/p1/mobile/putong/core/data/Explore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 673
    :cond_de
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    if-eqz p0, :cond_df

    .line 674
    const-string p0, "wechat"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 675
    sget-object p0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 676
    :cond_df
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    if-eqz p0, :cond_e0

    .line 677
    const-string p0, "vipSettings"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 678
    sget-object p0, Lcom/p1/mobile/putong/core/data/VipSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 679
    :cond_e0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    if-eqz p0, :cond_e1

    .line 680
    const-string p0, "iceBreakQuestions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 681
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 682
    :cond_e1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    if-eqz p0, :cond_e2

    .line 683
    const-string p0, "fakeGuideData"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 684
    sget-object p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 685
    :cond_e2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    if-eqz p0, :cond_e3

    .line 686
    const-string p0, "userActivityInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 687
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/UserActivityInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 688
    :cond_e3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    if-eqz p0, :cond_e4

    .line 689
    const-string p0, "questionnaire"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 690
    sget-object p0, Lcom/p1/mobile/putong/core/data/Questionnaire;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 691
    :cond_e4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    if-eqz p0, :cond_e5

    .line 692
    const-string p0, "features"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 693
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 694
    :cond_e5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    if-eqz p0, :cond_e6

    .line 695
    const-string p0, "userStrategyConfiguration"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 696
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 697
    :cond_e6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    if-eqz p0, :cond_e7

    .line 698
    const-string p0, "fakePhotoFeedback"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 699
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 700
    :cond_e7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz p0, :cond_e8

    .line 701
    const-string p0, "repeatPictureResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 702
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 703
    :cond_e8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz p0, :cond_e9

    .line 704
    const-string p0, "netPictureResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 705
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 706
    :cond_e9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    if-eqz p0, :cond_ea

    .line 707
    const-string p0, "userFeedbackInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 708
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 709
    :cond_ea
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    if-eqz p0, :cond_eb

    .line 710
    const-string p0, "idealDetails"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 711
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/data/IdealTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 712
    :cond_eb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    if-eqz p0, :cond_ec

    .line 713
    const-string p0, "idealInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 714
    sget-object p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 715
    :cond_ec
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    if-eqz p0, :cond_ed

    .line 716
    const-string p0, "idealInfos"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 717
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 718
    :cond_ed
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    if-eqz p0, :cond_ee

    .line 719
    const-string p0, "urlTags"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 720
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/UrlTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 721
    :cond_ee
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    if-eqz p0, :cond_ef

    .line 722
    const-string p0, "profileCounts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 723
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 724
    :cond_ef
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz p0, :cond_f0

    .line 725
    const-string p0, "privateCustomResult"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 726
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 727
    :cond_f0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    if-eqz p0, :cond_f1

    .line 728
    const-string p0, "videoChatSecondFloorSummary"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 729
    sget-object p0, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 730
    :cond_f1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    if-eqz p0, :cond_f2

    .line 731
    const-string p0, "realPicturesBanner"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 732
    sget-object p0, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 733
    :cond_f2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    if-eqz p0, :cond_f3

    .line 734
    const-string p0, "realPicturesInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 735
    sget-object p0, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 736
    :cond_f3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    if-eqz p0, :cond_f4

    .line 737
    const-string p0, "ipRegion"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 738
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/IPRegion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 739
    :cond_f4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    if-eqz p0, :cond_f5

    .line 740
    const-string p0, "realFeelInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 741
    sget-object p0, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 742
    :cond_f5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    if-eqz p0, :cond_f6

    .line 743
    const-string p0, "loveLetter"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 744
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 745
    :cond_f6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    if-eqz p0, :cond_f7

    .line 746
    const-string p0, "loveLetterGroup"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 747
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 748
    :cond_f7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    if-eqz p0, :cond_f8

    .line 749
    const-string p0, "loveLetterContent"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 750
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 751
    :cond_f8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    if-eqz p0, :cond_f9

    .line 752
    const-string p0, "chatPage"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 753
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 754
    :cond_f9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    if-eqz p0, :cond_fa

    .line 755
    const-string p0, "showOnlineForWhoIMeet"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 756
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 757
    :cond_fa
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz p0, :cond_fb

    .line 758
    const-string p0, "notVerificationResultData"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 759
    sget-object p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 760
    :cond_fb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    if-eqz p0, :cond_fc

    .line 761
    const-string p0, "verificationLowLabels"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 762
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 763
    :cond_fc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    if-eqz p0, :cond_fd

    .line 764
    const-string p0, "myTabTasks"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 765
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/MyTabTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 766
    :cond_fd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    if-eqz p0, :cond_fe

    .line 767
    const-string p0, "pendingPaymentGuidance"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 768
    sget-object p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 769
    :cond_fe
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    if-eqz p0, :cond_ff

    .line 770
    const-string p0, "seeTrialEligible"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 771
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 772
    :cond_ff
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    if-eqz p0, :cond_100

    .line 773
    const-string p0, "seeTrialStatus"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 774
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 775
    :cond_100
    const-string p0, "likedByToday"

    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 776
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    if-eqz p0, :cond_101

    .line 777
    const-string p0, "feedbackQuestions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 778
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 779
    :cond_101
    const-string p0, "feedbackRemainedNum"

    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 780
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    if-eqz p0, :cond_102

    .line 781
    const-string p0, "instantChat"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 782
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 783
    :cond_102
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    if-eqz p0, :cond_103

    .line 784
    const-string p0, "aiChatAdvice"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 785
    sget-object p0, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 786
    :cond_103
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    if-eqz p0, :cond_104

    .line 787
    const-string p0, "aiChatAnalysis"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 788
    sget-object p0, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 789
    :cond_104
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    if-eqz p0, :cond_105

    .line 790
    const-string p0, "invitationInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 791
    sget-object p0, Lcom/p1/mobile/putong/core/data/InvitationInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 792
    :cond_105
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    if-eqz p0, :cond_106

    .line 793
    const-string p0, "pictureVerifyRightedInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 794
    sget-object p0, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 795
    :cond_106
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    if-eqz p0, :cond_107

    .line 796
    const-string p0, "diamond"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 797
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 798
    :cond_107
    const-string p0, "canChange"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 799
    const-string p0, "ttcToDiamondRate"

    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 800
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    if-eqz p0, :cond_108

    .line 801
    const-string p0, "prologues"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 802
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Prologue;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 803
    :cond_108
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    if-eqz p0, :cond_109

    .line 804
    const-string p0, "instantMatchGiveCountInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 805
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 806
    :cond_109
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    if-eqz p0, :cond_10a

    .line 807
    const-string p0, "creditScores"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 808
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/CreditScoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 809
    :cond_10a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    if-eqz p0, :cond_10b

    .line 810
    const-string p0, "dislikedUsers"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 811
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/DislikedUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 812
    :cond_10b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    if-eqz p0, :cond_10c

    .line 813
    const-string p0, "analysisGuide"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 814
    sget-object p0, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 815
    :cond_10c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    if-eqz p0, :cond_10d

    .line 816
    const-string p0, "visitorDoorInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 817
    sget-object p0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 818
    :cond_10d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    if-eqz p0, :cond_10e

    .line 819
    const-string p0, "visitorInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 820
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 821
    :cond_10e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    if-eqz p0, :cond_10f

    .line 822
    const-string p0, "instantMatchUserInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 823
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 824
    :cond_10f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    if-eqz p0, :cond_110

    .line 825
    const-string p0, "recommendList"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 826
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/TribeSubset;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 827
    :cond_110
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    if-eqz p0, :cond_111

    .line 828
    const-string p0, "intlBubble"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 829
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 830
    :cond_111
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    if-eqz p0, :cond_112

    .line 831
    const-string p0, "membershipUpgradeInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 832
    sget-object p0, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 833
    :cond_112
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    if-eqz p0, :cond_113

    .line 834
    const-string p0, "ultraRightsUpgradeInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 835
    sget-object p0, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 836
    :cond_113
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    if-eqz p0, :cond_114

    .line 837
    const-string p0, "purchaseSavePop"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 838
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 839
    :cond_114
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    if-eqz p0, :cond_115

    .line 840
    const-string p0, "swipeUpperLimit"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 841
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 842
    :cond_115
    const-string p0, "level"

    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 843
    const-string p0, "visitorAllCount"

    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 844
    const-string p0, "score"

    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 845
    const-string p0, "scoreThreshold"

    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 846
    const-string p0, "scoreThresholdOther"

    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 847
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    if-eqz p0, :cond_116

    .line 848
    const-string p0, "picksInfo"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 849
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 850
    :cond_116
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    if-eqz p0, :cond_117

    .line 851
    const-string p0, "superlikeByCounts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 852
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 853
    :cond_117
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    if-eqz p0, :cond_118

    .line 854
    const-string p0, "complimentTexts"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 855
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    sget-object v1, Lcom/p1/mobile/putong/core/data/ComplimentText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 856
    :cond_118
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    if-eqz p0, :cond_119

    .line 857
    const-string p0, "compliment"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 858
    sget-object p0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 859
    :cond_119
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    if-eqz p0, :cond_11a

    .line 860
    const-string p0, "compliments"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 861
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    sget-object v0, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 862
    :cond_11a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    if-eqz p0, :cond_11b

    .line 863
    const-string p0, "promotions"

    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 864
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    sget-object p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    :cond_11b
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 865
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreData$2;->serializeFields(Lcom/p1/mobile/putong/core/data/CoreData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
