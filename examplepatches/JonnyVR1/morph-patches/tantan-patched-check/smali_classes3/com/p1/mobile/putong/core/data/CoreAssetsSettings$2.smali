.class Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;->newInstance()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
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
    const-string p0, "chatOnlineDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "close_act2good_all"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "autoReadConversation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "autoPayEnable"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "lowPriceFirstMonth"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "intlLetterContent"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "showLiveForIntlAdUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "intlChatRequest"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "seeSwipeCountInOneSession"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "missMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "graduateActivity"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "enableVoiceCall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "letterContent"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "profileBasicHobbyTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "userScrapeReporting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "profileUpgradeInputOrder"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "rateAlertSetting"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "forcePhoneBind"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "profileUpgradeInterest"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "keepConnection"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "counterPollingSeconds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "chatGuideExp"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "autoRenewalBenefit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "anonymityImg"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "specialCard"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "inactivateReason"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "prompt"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "schoolVerificationAgeRange"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "profileBasicRecentTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "thirdPartySticker"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto :goto_0

    :cond_1d
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_1e
    const-string p0, "seeMatchThenPay"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto :goto_0

    :cond_1e
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_1f
    const-string p0, "profileBasicTogetherTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto :goto_0

    :cond_1f
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_20
    const-string p0, "appUpdateVersionData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto :goto_0

    :cond_20
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_21
    const-string p0, "userBanAppealSwitch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto :goto_0

    :cond_21
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_22
    const-string p0, "forcePhoneBindTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto :goto_0

    :cond_22
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_23
    const-string p0, "chatEffect"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_0

    :cond_23
    move v2, v1

    goto :goto_0

    :sswitch_24
    const-string p0, "guideText"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto :goto_0

    :cond_24
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    return v1

    .line 3
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    return v1

    .line 4
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    return v1

    .line 5
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    return v1

    .line 6
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    return v1

    .line 8
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    return v1

    .line 10
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 11
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    return v1

    .line 12
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    return v1

    .line 14
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    return v1

    .line 15
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/core/data/MissMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MissMatch;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    return v1

    .line 17
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    return v1

    .line 19
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    return v1

    .line 20
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    return v1

    .line 22
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    return v1

    .line 24
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    return v1

    .line 26
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    return v1

    .line 28
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    return v1

    .line 30
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    return v1

    .line 31
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 32
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    return v1

    .line 33
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/KeepConnection;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 34
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/KeepConnection;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    return v1

    .line 35
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    return v1

    .line 36
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    return v1

    .line 37
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    return v1

    .line 39
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/core/data/AnonymityImg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 40
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AnonymityImg;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    return v1

    .line 41
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 42
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SpecialCard;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    return v1

    .line 43
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/core/data/InactivateReason;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    return v1

    .line 45
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/core/data/PromptLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PromptLimit;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    return v1

    .line 47
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    return v1

    .line 49
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    return v1

    .line 51
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    return v1

    .line 53
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 54
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    return v1

    .line 55
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    return v1

    .line 57
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 58
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    return v1

    .line 59
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 60
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    return v1

    .line 61
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    return v1

    .line 62
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatEffect;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    return v1

    .line 64
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 65
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7bc3e9b7 -> :sswitch_24
        -0x7b9ba8f7 -> :sswitch_23
        -0x7a3a2cf3 -> :sswitch_22
        -0x7899a7f9 -> :sswitch_21
        -0x716f3808 -> :sswitch_20
        -0x66e0d1e8 -> :sswitch_1f
        -0x63285447 -> :sswitch_1e
        -0x5ef67182 -> :sswitch_1d
        -0x55d26107 -> :sswitch_1c
        -0x4be52bb3 -> :sswitch_1b
        -0x3a66a69c -> :sswitch_1a
        -0x3492c684 -> :sswitch_19
        -0x3407d497 -> :sswitch_18
        -0x20eeb8eb -> :sswitch_17
        -0x168ca672 -> :sswitch_16
        -0x1504bb07 -> :sswitch_15
        -0x1192c9a8 -> :sswitch_14
        -0x8e05bbd -> :sswitch_13
        0x4a1507d -> :sswitch_12
        0x5c91c20 -> :sswitch_11
        0x8f26e54 -> :sswitch_10
        0x12a12e37 -> :sswitch_f
        0x155c5a8f -> :sswitch_e
        0x20a8c686 -> :sswitch_d
        0x2e7ad173 -> :sswitch_c
        0x3ea6646d -> :sswitch_b
        0x45e3397a -> :sswitch_a
        0x48938229 -> :sswitch_9
        0x4bd6c71d -> :sswitch_8
        0x54ca997a -> :sswitch_7
        0x5fd439eb -> :sswitch_6
        0x61709a16 -> :sswitch_5
        0x633d55e5 -> :sswitch_4
        0x75cfdb5c -> :sswitch_3
        0x795dbd08 -> :sswitch_2
        0x7aee3be6 -> :sswitch_1
        0x7d480a7f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;->parseField(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
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

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "chatOnlineDuration"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0x24

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "close_act2good_all"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0x23

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "autoReadConversation"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0x22

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "autoPayEnable"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0x21

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "lowPriceFirstMonth"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_4
    const/16 v2, 0x20

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "intlLetterContent"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_5
    const/16 v2, 0x1f

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "showLiveForIntlAdUser"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0x1e

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "intlChatRequest"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0x1d

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "seeSwipeCountInOneSession"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0x1c

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "missMatch"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0x1b

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "graduateActivity"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_a

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_a
    const/16 v2, 0x1a

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "enableVoiceCall"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_b

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    const/16 v2, 0x19

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "letterContent"

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_c

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_c
    const/16 v2, 0x18

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "profileBasicHobbyTags"

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_d

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_d
    const/16 v2, 0x17

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "userScrapeReporting"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_e

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_e
    const/16 v2, 0x16

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "profileUpgradeInputOrder"

    .line 226
    .line 227
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_f

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_f
    const/16 v2, 0x15

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "rateAlertSetting"

    .line 240
    .line 241
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-nez v0, :cond_10

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_10
    const/16 v2, 0x14

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "forcePhoneBind"

    .line 254
    .line 255
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_11

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_11
    const/16 v2, 0x13

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "profileUpgradeInterest"

    .line 268
    .line 269
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_12

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :cond_12
    const/16 v2, 0x12

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "keepConnection"

    .line 282
    .line 283
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_13

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_13
    const/16 v2, 0x11

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "counterPollingSeconds"

    .line 296
    .line 297
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_14

    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_14
    const/16 v2, 0x10

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "chatGuideExp"

    .line 310
    .line 311
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-nez v0, :cond_15

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :cond_15
    const/16 v2, 0xf

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "autoRenewalBenefit"

    .line 324
    .line 325
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    if-nez v0, :cond_16

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :cond_16
    const/16 v2, 0xe

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_17
    const-string v0, "anonymityImg"

    .line 338
    .line 339
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-nez v0, :cond_17

    .line 344
    .line 345
    goto/16 :goto_0

    .line 346
    .line 347
    :cond_17
    const/16 v2, 0xd

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_18
    const-string v0, "specialCard"

    .line 352
    .line 353
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-nez v0, :cond_18

    .line 358
    .line 359
    goto/16 :goto_0

    .line 360
    .line 361
    :cond_18
    const/16 v2, 0xc

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_19
    const-string v0, "inactivateReason"

    .line 366
    .line 367
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    if-nez v0, :cond_19

    .line 372
    .line 373
    goto/16 :goto_0

    .line 374
    .line 375
    :cond_19
    const/16 v2, 0xb

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :sswitch_1a
    const-string v0, "prompt"

    .line 380
    .line 381
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    if-nez v0, :cond_1a

    .line 386
    .line 387
    goto/16 :goto_0

    .line 388
    .line 389
    :cond_1a
    const/16 v2, 0xa

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_1b
    const-string v0, "schoolVerificationAgeRange"

    .line 394
    .line 395
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    if-nez v0, :cond_1b

    .line 400
    .line 401
    goto/16 :goto_0

    .line 402
    .line 403
    :cond_1b
    const/16 v2, 0x9

    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :sswitch_1c
    const-string v0, "profileBasicRecentTags"

    .line 408
    .line 409
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    if-nez v0, :cond_1c

    .line 414
    .line 415
    goto/16 :goto_0

    .line 416
    .line 417
    :cond_1c
    const/16 v2, 0x8

    .line 418
    .line 419
    goto/16 :goto_0

    .line 420
    .line 421
    :sswitch_1d
    const-string v0, "thirdPartySticker"

    .line 422
    .line 423
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    if-nez v0, :cond_1d

    .line 428
    .line 429
    goto :goto_0

    .line 430
    :cond_1d
    const/4 v2, 0x7

    .line 431
    goto :goto_0

    .line 432
    :sswitch_1e
    const-string v0, "seeMatchThenPay"

    .line 433
    .line 434
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-nez v0, :cond_1e

    .line 439
    .line 440
    goto :goto_0

    .line 441
    :cond_1e
    const/4 v2, 0x6

    .line 442
    goto :goto_0

    .line 443
    :sswitch_1f
    const-string v0, "profileBasicTogetherTags"

    .line 444
    .line 445
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v0

    .line 449
    if-nez v0, :cond_1f

    .line 450
    .line 451
    goto :goto_0

    .line 452
    :cond_1f
    const/4 v2, 0x5

    .line 453
    goto :goto_0

    .line 454
    :sswitch_20
    const-string v0, "appUpdateVersionData"

    .line 455
    .line 456
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-nez v0, :cond_20

    .line 461
    .line 462
    goto :goto_0

    .line 463
    :cond_20
    const/4 v2, 0x4

    .line 464
    goto :goto_0

    .line 465
    :sswitch_21
    const-string v0, "userBanAppealSwitch"

    .line 466
    .line 467
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 468
    .line 469
    .line 470
    move-result v0

    .line 471
    if-nez v0, :cond_21

    .line 472
    .line 473
    goto :goto_0

    .line 474
    :cond_21
    const/4 v2, 0x3

    .line 475
    goto :goto_0

    .line 476
    :sswitch_22
    const-string v0, "forcePhoneBindTime"

    .line 477
    .line 478
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    if-nez v0, :cond_22

    .line 483
    .line 484
    goto :goto_0

    .line 485
    :cond_22
    const/4 v2, 0x2

    .line 486
    goto :goto_0

    .line 487
    :sswitch_23
    const-string v0, "chatEffect"

    .line 488
    .line 489
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 490
    .line 491
    .line 492
    move-result v0

    .line 493
    if-nez v0, :cond_23

    .line 494
    .line 495
    goto :goto_0

    .line 496
    :cond_23
    move v2, v1

    .line 497
    goto :goto_0

    .line 498
    :sswitch_24
    const-string v0, "guideText"

    .line 499
    .line 500
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    if-nez v0, :cond_24

    .line 505
    .line 506
    goto :goto_0

    .line 507
    :cond_24
    const/4 v2, 0x0

    .line 508
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 509
    .line 510
    .line 511
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 512
    .line 513
    .line 514
    move-result p0

    .line 515
    return p0

    .line 516
    :pswitch_0
    return v1

    .line 517
    :sswitch_data_0
    .sparse-switch
        -0x7bc3e9b7 -> :sswitch_24
        -0x7b9ba8f7 -> :sswitch_23
        -0x7a3a2cf3 -> :sswitch_22
        -0x7899a7f9 -> :sswitch_21
        -0x716f3808 -> :sswitch_20
        -0x66e0d1e8 -> :sswitch_1f
        -0x63285447 -> :sswitch_1e
        -0x5ef67182 -> :sswitch_1d
        -0x55d26107 -> :sswitch_1c
        -0x4be52bb3 -> :sswitch_1b
        -0x3a66a69c -> :sswitch_1a
        -0x3492c684 -> :sswitch_19
        -0x3407d497 -> :sswitch_18
        -0x20eeb8eb -> :sswitch_17
        -0x168ca672 -> :sswitch_16
        -0x1504bb07 -> :sswitch_15
        -0x1192c9a8 -> :sswitch_14
        -0x8e05bbd -> :sswitch_13
        0x4a1507d -> :sswitch_12
        0x5c91c20 -> :sswitch_11
        0x8f26e54 -> :sswitch_10
        0x12a12e37 -> :sswitch_f
        0x155c5a8f -> :sswitch_e
        0x20a8c686 -> :sswitch_d
        0x2e7ad173 -> :sswitch_c
        0x3ea6646d -> :sswitch_b
        0x45e3397a -> :sswitch_a
        0x48938229 -> :sswitch_9
        0x4bd6c71d -> :sswitch_8
        0x54ca997a -> :sswitch_7
        0x5fd439eb -> :sswitch_6
        0x61709a16 -> :sswitch_5
        0x633d55e5 -> :sswitch_4
        0x75cfdb5c -> :sswitch_3
        0x795dbd08 -> :sswitch_2
        0x7aee3be6 -> :sswitch_1
        0x7d480a7f -> :sswitch_0
    .end sparse-switch

    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 517
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "inactivateReason"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const-string p0, "close_act2good_all"

    .line 18
    .line 19
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 20
    .line 21
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const-string p0, "prompt"

    .line 30
    .line 31
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/data/PromptLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 37
    .line 38
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    const-string p0, "counterPollingSeconds"

    .line 42
    .line 43
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 44
    .line 45
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 49
    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const-string p0, "missMatch"

    .line 53
    .line 54
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p0, Lcom/p1/mobile/putong/core/data/MissMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 58
    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 60
    .line 61
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    const-string p0, "specialCard"

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 76
    .line 77
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 78
    .line 79
    .line 80
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 81
    .line 82
    if-eqz p0, :cond_4

    .line 83
    .line 84
    const-string p0, "chatEffect"

    .line 85
    .line 86
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 90
    .line 91
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 92
    .line 93
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 94
    .line 95
    .line 96
    :cond_4
    const-string p0, "forcePhoneBind"

    .line 97
    .line 98
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 99
    .line 100
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 101
    .line 102
    .line 103
    const-string p0, "forcePhoneBindTime"

    .line 104
    .line 105
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 109
    .line 110
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 111
    .line 112
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 120
    .line 121
    if-eqz p0, :cond_5

    .line 122
    .line 123
    const-string p0, "thirdPartySticker"

    .line 124
    .line 125
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    sget-object p0, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 129
    .line 130
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 131
    .line 132
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 133
    .line 134
    .line 135
    :cond_5
    const-string p0, "enableVoiceCall"

    .line 136
    .line 137
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 138
    .line 139
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 143
    .line 144
    if-eqz p0, :cond_6

    .line 145
    .line 146
    const-string p0, "letterContent"

    .line 147
    .line 148
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    sget-object p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 152
    .line 153
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 154
    .line 155
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 156
    .line 157
    .line 158
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 159
    .line 160
    if-eqz p0, :cond_7

    .line 161
    .line 162
    const-string p0, "showLiveForIntlAdUser"

    .line 163
    .line 164
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    sget-object p0, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 168
    .line 169
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 170
    .line 171
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 172
    .line 173
    .line 174
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 175
    .line 176
    if-eqz p0, :cond_8

    .line 177
    .line 178
    const-string p0, "intlChatRequest"

    .line 179
    .line 180
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 184
    .line 185
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 186
    .line 187
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 188
    .line 189
    .line 190
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 191
    .line 192
    if-eqz p0, :cond_9

    .line 193
    .line 194
    const-string p0, "graduateActivity"

    .line 195
    .line 196
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    sget-object p0, Lcom/p1/mobile/putong/core/data/GraduateActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 202
    .line 203
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 204
    .line 205
    .line 206
    :cond_9
    const-string p0, "autoReadConversation"

    .line 207
    .line 208
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 209
    .line 210
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 211
    .line 212
    .line 213
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 214
    .line 215
    if-eqz p0, :cond_a

    .line 216
    .line 217
    const-string p0, "rateAlertSetting"

    .line 218
    .line 219
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 223
    .line 224
    sget-object v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 225
    .line 226
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 227
    .line 228
    .line 229
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 230
    .line 231
    if-eqz p0, :cond_b

    .line 232
    .line 233
    const-string p0, "userBanAppealSwitch"

    .line 234
    .line 235
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 239
    .line 240
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 241
    .line 242
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 243
    .line 244
    .line 245
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 246
    .line 247
    if-eqz p0, :cond_c

    .line 248
    .line 249
    const-string p0, "appUpdateVersionData"

    .line 250
    .line 251
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    sget-object p0, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 255
    .line 256
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 257
    .line 258
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 259
    .line 260
    .line 261
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 262
    .line 263
    if-eqz p0, :cond_d

    .line 264
    .line 265
    const-string p0, "schoolVerificationAgeRange"

    .line 266
    .line 267
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    sget-object p0, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 271
    .line 272
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 273
    .line 274
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 275
    .line 276
    .line 277
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 278
    .line 279
    if-eqz p0, :cond_e

    .line 280
    .line 281
    const-string p0, "keepConnection"

    .line 282
    .line 283
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    sget-object p0, Lcom/p1/mobile/putong/core/data/KeepConnection;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 287
    .line 288
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 289
    .line 290
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 291
    .line 292
    .line 293
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 294
    .line 295
    if-eqz p0, :cond_f

    .line 296
    .line 297
    const-string p0, "userScrapeReporting"

    .line 298
    .line 299
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    sget-object p0, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 303
    .line 304
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 305
    .line 306
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 307
    .line 308
    .line 309
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 310
    .line 311
    if-eqz p0, :cond_10

    .line 312
    .line 313
    const-string p0, "lowPriceFirstMonth"

    .line 314
    .line 315
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    sget-object p0, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 319
    .line 320
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 321
    .line 322
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 323
    .line 324
    .line 325
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 326
    .line 327
    if-eqz p0, :cond_11

    .line 328
    .line 329
    const-string p0, "seeMatchThenPay"

    .line 330
    .line 331
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    sget-object p0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 335
    .line 336
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 337
    .line 338
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 339
    .line 340
    .line 341
    :cond_11
    const-string p0, "autoPayEnable"

    .line 342
    .line 343
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 344
    .line 345
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 346
    .line 347
    .line 348
    const-string p0, "seeSwipeCountInOneSession"

    .line 349
    .line 350
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 351
    .line 352
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 353
    .line 354
    .line 355
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 356
    .line 357
    if-eqz p0, :cond_12

    .line 358
    .line 359
    const-string p0, "profileBasicHobbyTags"

    .line 360
    .line 361
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 365
    .line 366
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 367
    .line 368
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 369
    .line 370
    .line 371
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 372
    .line 373
    if-eqz p0, :cond_13

    .line 374
    .line 375
    const-string p0, "profileBasicRecentTags"

    .line 376
    .line 377
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 381
    .line 382
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 383
    .line 384
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 385
    .line 386
    .line 387
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 388
    .line 389
    if-eqz p0, :cond_14

    .line 390
    .line 391
    const-string p0, "profileBasicTogetherTags"

    .line 392
    .line 393
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 397
    .line 398
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 399
    .line 400
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 401
    .line 402
    .line 403
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 404
    .line 405
    if-eqz p0, :cond_15

    .line 406
    .line 407
    const-string p0, "anonymityImg"

    .line 408
    .line 409
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    sget-object p0, Lcom/p1/mobile/putong/core/data/AnonymityImg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 413
    .line 414
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 415
    .line 416
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 417
    .line 418
    .line 419
    :cond_15
    const-string p0, "chatGuideExp"

    .line 420
    .line 421
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 422
    .line 423
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 424
    .line 425
    .line 426
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 427
    .line 428
    if-eqz p0, :cond_16

    .line 429
    .line 430
    const-string p0, "intlLetterContent"

    .line 431
    .line 432
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    sget-object p0, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 436
    .line 437
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 438
    .line 439
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 440
    .line 441
    .line 442
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 443
    .line 444
    if-eqz p0, :cond_17

    .line 445
    .line 446
    const-string p0, "autoRenewalBenefit"

    .line 447
    .line 448
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    sget-object p0, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 452
    .line 453
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 454
    .line 455
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 456
    .line 457
    .line 458
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 459
    .line 460
    if-eqz p0, :cond_18

    .line 461
    .line 462
    const-string p0, "profileUpgradeInputOrder"

    .line 463
    .line 464
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 465
    .line 466
    .line 467
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 468
    .line 469
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 470
    .line 471
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 472
    .line 473
    .line 474
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 475
    .line 476
    if-eqz p0, :cond_19

    .line 477
    .line 478
    const-string p0, "guideText"

    .line 479
    .line 480
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 481
    .line 482
    .line 483
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 484
    .line 485
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 486
    .line 487
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 488
    .line 489
    .line 490
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 491
    .line 492
    if-eqz p0, :cond_1a

    .line 493
    .line 494
    const-string p0, "profileUpgradeInterest"

    .line 495
    .line 496
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 500
    .line 501
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 502
    .line 503
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 504
    .line 505
    .line 506
    :cond_1a
    const-string p0, "chatOnlineDuration"

    .line 507
    .line 508
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 509
    .line 510
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 511
    .line 512
    .line 513
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 514
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;->serializeFields(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
