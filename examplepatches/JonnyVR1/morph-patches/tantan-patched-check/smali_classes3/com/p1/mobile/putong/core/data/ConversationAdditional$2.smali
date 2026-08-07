.class Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationAdditional;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationAdditional;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/ConversationAdditional;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;->newInstance()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditional;",
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
    const-string p0, "localMomentInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "avatarSummary"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "heartbeatMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "newMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "blackList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "quickChat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "reSwipe"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "timeLimited"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "matchInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "liveVirtualVoice"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "fateRadar"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "liveActivity"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "game"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "tag"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "feedStateCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "compliment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "lowPayOneside"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "pinChat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "blindbox"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "greetingInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "feedInteractionCounter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "swiper"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "voiceCall"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "suggestedTimeLimitedMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "kankan"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "chatAssistantQuestion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto :goto_0

    :cond_19
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_1a
    const-string p0, "oneSideNoMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto :goto_0

    :cond_1a
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_1b
    const-string p0, "oneSide"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto :goto_0

    :cond_1b
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_1c
    const-string p0, "chatMM"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto :goto_0

    :cond_1c
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_1d
    const-string p0, "previewTexts"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto :goto_0

    :cond_1d
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_1e
    const-string p0, "continuousChat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto :goto_0

    :cond_1e
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_1f
    const-string p0, "loveLetter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto :goto_0

    :cond_1f
    move v2, v1

    goto :goto_0

    :sswitch_20
    const-string p0, "messageRelate"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto :goto_0

    :cond_20
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    return v1

    .line 4
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 5
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    return v1

    .line 6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    return v1

    .line 8
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    return v1

    .line 10
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/BlackList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 11
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/BlackList;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    return v1

    .line 12
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    return v1

    .line 14
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    return v1

    .line 16
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 17
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TimeLimited;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    return v1

    .line 18
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    return v1

    .line 20
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    return v1

    .line 22
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    return v1

    .line 24
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    return v1

    .line 26
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationGame;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    return v1

    .line 28
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    return v1

    .line 30
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 31
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    return v1

    .line 32
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    return v1

    .line 34
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/core/data/LowPayOneside;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LowPayOneside;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    return v1

    .line 36
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    return v1

    .line 38
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    return v1

    .line 40
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GreetingInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    return v1

    .line 42
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 43
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    return v1

    .line 44
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    return v1

    .line 46
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    return v1

    .line 48
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    return v1

    .line 50
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 51
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    return v1

    .line 52
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 53
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    return v1

    .line 54
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    return v1

    .line 56
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    return v1

    .line 58
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatMM;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 59
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatMM;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    return v1

    .line 60
    :pswitch_1d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    return v1

    .line 62
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/core/data/ContinuousChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ContinuousChat;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    return v1

    .line 64
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 65
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    return v1

    .line 66
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageRelate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 67
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageRelate;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x5f5a25c0 -> :sswitch_20
        -0x5f4205c8 -> :sswitch_1f
        -0x571544f9 -> :sswitch_1e
        -0x51da5602 -> :sswitch_1d
        -0x5128d908 -> :sswitch_1c
        -0x4ec0a323 -> :sswitch_1b
        -0x4ca03b19 -> :sswitch_1a
        -0x454fe394 -> :sswitch_19
        -0x43deef00 -> :sswitch_18
        -0x3ee0d705 -> :sswitch_17
        -0x3cc51950 -> :sswitch_16
        -0x35045788 -> :sswitch_15
        -0x341cc238 -> :sswitch_14
        -0x33bb6b79 -> :sswitch_13
        -0x3141edaa -> :sswitch_12
        -0x21eb1973 -> :sswitch_11
        -0x218d5697 -> :sswitch_10
        -0x200cfbd6 -> :sswitch_f
        -0x176b2f17 -> :sswitch_e
        0x1bf9a -> :sswitch_d
        0x304bf2 -> :sswitch_c
        0xabf5c1b -> :sswitch_b
        0x18f3adfa -> :sswitch_a
        0x1c0783f3 -> :sswitch_9
        0x24944813 -> :sswitch_8
        0x34724a0d -> :sswitch_7
        0x3fa928c7 -> :sswitch_6
        0x4d806ee5 -> :sswitch_5
        0x4f659d3d -> :sswitch_4
        0x51124405 -> :sswitch_3
        0x58dcb629 -> :sswitch_2
        0x6c29f80d -> :sswitch_1
        0x6ee50c99 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;->parseField(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditional;",
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
    const-string v0, "localMomentInfo"

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
    const/16 v2, 0x20

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "avatarSummary"

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
    const/16 v2, 0x1f

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "heartbeatMatch"

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
    const/16 v2, 0x1e

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "newMatch"

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
    const/16 v2, 0x1d

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "blackList"

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
    const/16 v2, 0x1c

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "quickChat"

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
    const/16 v2, 0x1b

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "reSwipe"

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
    const/16 v2, 0x1a

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "timeLimited"

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
    const/16 v2, 0x19

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "matchInfo"

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
    const/16 v2, 0x18

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "liveVirtualVoice"

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
    const/16 v2, 0x17

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "fateRadar"

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
    const/16 v2, 0x16

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "liveActivity"

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
    const/16 v2, 0x15

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "game"

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
    const/16 v2, 0x14

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "tag"

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
    const/16 v2, 0x13

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "feedStateCounter"

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
    const/16 v2, 0x12

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "compliment"

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
    const/16 v2, 0x11

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "lowPayOneside"

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
    const/16 v2, 0x10

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "pinChat"

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
    const/16 v2, 0xf

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "blindbox"

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
    const/16 v2, 0xe

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "greetingInfo"

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
    const/16 v2, 0xd

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "feedInteractionCounter"

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
    const/16 v2, 0xc

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "swiper"

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
    const/16 v2, 0xb

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "voiceCall"

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
    const/16 v2, 0xa

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_17
    const-string v0, "suggestedTimeLimitedMatch"

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
    const/16 v2, 0x9

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_18
    const-string v0, "kankan"

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
    const/16 v2, 0x8

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_19
    const-string v0, "chatAssistantQuestion"

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
    goto :goto_0

    .line 374
    :cond_19
    const/4 v2, 0x7

    .line 375
    goto :goto_0

    .line 376
    :sswitch_1a
    const-string v0, "oneSideNoMatch"

    .line 377
    .line 378
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-nez v0, :cond_1a

    .line 383
    .line 384
    goto :goto_0

    .line 385
    :cond_1a
    const/4 v2, 0x6

    .line 386
    goto :goto_0

    .line 387
    :sswitch_1b
    const-string v0, "oneSide"

    .line 388
    .line 389
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-nez v0, :cond_1b

    .line 394
    .line 395
    goto :goto_0

    .line 396
    :cond_1b
    const/4 v2, 0x5

    .line 397
    goto :goto_0

    .line 398
    :sswitch_1c
    const-string v0, "chatMM"

    .line 399
    .line 400
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    if-nez v0, :cond_1c

    .line 405
    .line 406
    goto :goto_0

    .line 407
    :cond_1c
    const/4 v2, 0x4

    .line 408
    goto :goto_0

    .line 409
    :sswitch_1d
    const-string v0, "previewTexts"

    .line 410
    .line 411
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    if-nez v0, :cond_1d

    .line 416
    .line 417
    goto :goto_0

    .line 418
    :cond_1d
    const/4 v2, 0x3

    .line 419
    goto :goto_0

    .line 420
    :sswitch_1e
    const-string v0, "continuousChat"

    .line 421
    .line 422
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-nez v0, :cond_1e

    .line 427
    .line 428
    goto :goto_0

    .line 429
    :cond_1e
    const/4 v2, 0x2

    .line 430
    goto :goto_0

    .line 431
    :sswitch_1f
    const-string v0, "loveLetter"

    .line 432
    .line 433
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    if-nez v0, :cond_1f

    .line 438
    .line 439
    goto :goto_0

    .line 440
    :cond_1f
    move v2, v1

    .line 441
    goto :goto_0

    .line 442
    :sswitch_20
    const-string v0, "messageRelate"

    .line 443
    .line 444
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    move-result v0

    .line 448
    if-nez v0, :cond_20

    .line 449
    .line 450
    goto :goto_0

    .line 451
    :cond_20
    const/4 v2, 0x0

    .line 452
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 453
    .line 454
    .line 455
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 456
    .line 457
    .line 458
    move-result p0

    .line 459
    return p0

    .line 460
    :pswitch_0
    return v1

    .line 461
    :sswitch_data_0
    .sparse-switch
        -0x5f5a25c0 -> :sswitch_20
        -0x5f4205c8 -> :sswitch_1f
        -0x571544f9 -> :sswitch_1e
        -0x51da5602 -> :sswitch_1d
        -0x5128d908 -> :sswitch_1c
        -0x4ec0a323 -> :sswitch_1b
        -0x4ca03b19 -> :sswitch_1a
        -0x454fe394 -> :sswitch_19
        -0x43deef00 -> :sswitch_18
        -0x3ee0d705 -> :sswitch_17
        -0x3cc51950 -> :sswitch_16
        -0x35045788 -> :sswitch_15
        -0x341cc238 -> :sswitch_14
        -0x33bb6b79 -> :sswitch_13
        -0x3141edaa -> :sswitch_12
        -0x21eb1973 -> :sswitch_11
        -0x218d5697 -> :sswitch_10
        -0x200cfbd6 -> :sswitch_f
        -0x176b2f17 -> :sswitch_e
        0x1bf9a -> :sswitch_d
        0x304bf2 -> :sswitch_c
        0xabf5c1b -> :sswitch_b
        0x18f3adfa -> :sswitch_a
        0x1c0783f3 -> :sswitch_9
        0x24944813 -> :sswitch_8
        0x34724a0d -> :sswitch_7
        0x3fa928c7 -> :sswitch_6
        0x4d806ee5 -> :sswitch_5
        0x4f659d3d -> :sswitch_4
        0x51124405 -> :sswitch_3
        0x58dcb629 -> :sswitch_2
        0x6c29f80d -> :sswitch_1
        0x6ee50c99 -> :sswitch_0
    .end sparse-switch

    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 461
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "quickChat"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "voiceCall"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "timeLimited"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "oneSideNoMatch"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "oneSide"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "kankan"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 94
    .line 95
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "feedStateCounter"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string p0, "suggestedTimeLimitedMatch"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    sget-object p0, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 124
    .line 125
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 126
    .line 127
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    const-string p0, "heartbeatMatch"

    .line 135
    .line 136
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sget-object p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 140
    .line 141
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 142
    .line 143
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string p0, "avatarSummary"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    sget-object p0, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 156
    .line 157
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 158
    .line 159
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 160
    .line 161
    .line 162
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 163
    .line 164
    if-eqz p0, :cond_a

    .line 165
    .line 166
    const-string p0, "feedInteractionCounter"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 174
    .line 175
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 176
    .line 177
    .line 178
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 179
    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    const-string p0, "liveVirtualVoice"

    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 190
    .line 191
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 195
    .line 196
    if-eqz p0, :cond_c

    .line 197
    .line 198
    const-string p0, "localMomentInfo"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 204
    .line 205
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 206
    .line 207
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 208
    .line 209
    .line 210
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 211
    .line 212
    if-eqz p0, :cond_d

    .line 213
    .line 214
    const-string p0, "liveActivity"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sget-object p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 222
    .line 223
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 224
    .line 225
    .line 226
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 227
    .line 228
    if-eqz p0, :cond_e

    .line 229
    .line 230
    const-string p0, "game"

    .line 231
    .line 232
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 236
    .line 237
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 238
    .line 239
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 240
    .line 241
    .line 242
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 243
    .line 244
    if-eqz p0, :cond_f

    .line 245
    .line 246
    const-string p0, "tag"

    .line 247
    .line 248
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 254
    .line 255
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 256
    .line 257
    .line 258
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 259
    .line 260
    if-eqz p0, :cond_10

    .line 261
    .line 262
    const-string p0, "chatAssistantQuestion"

    .line 263
    .line 264
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 268
    .line 269
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 270
    .line 271
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 272
    .line 273
    .line 274
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 275
    .line 276
    if-eqz p0, :cond_11

    .line 277
    .line 278
    const-string p0, "continuousChat"

    .line 279
    .line 280
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    sget-object p0, Lcom/p1/mobile/putong/core/data/ContinuousChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 284
    .line 285
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 286
    .line 287
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 288
    .line 289
    .line 290
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 291
    .line 292
    if-eqz p0, :cond_12

    .line 293
    .line 294
    const-string p0, "pinChat"

    .line 295
    .line 296
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    sget-object p0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 300
    .line 301
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 302
    .line 303
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 304
    .line 305
    .line 306
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 307
    .line 308
    if-eqz p0, :cond_13

    .line 309
    .line 310
    const-string p0, "reSwipe"

    .line 311
    .line 312
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    sget-object p0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 316
    .line 317
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 318
    .line 319
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 320
    .line 321
    .line 322
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 323
    .line 324
    if-eqz p0, :cond_14

    .line 325
    .line 326
    const-string p0, "blindbox"

    .line 327
    .line 328
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    sget-object p0, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 332
    .line 333
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 334
    .line 335
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 336
    .line 337
    .line 338
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 339
    .line 340
    if-eqz p0, :cond_15

    .line 341
    .line 342
    const-string p0, "previewTexts"

    .line 343
    .line 344
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 348
    .line 349
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    .line 351
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 352
    .line 353
    .line 354
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 355
    .line 356
    if-eqz p0, :cond_16

    .line 357
    .line 358
    const-string p0, "greetingInfo"

    .line 359
    .line 360
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    sget-object p0, Lcom/p1/mobile/putong/core/data/GreetingInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 364
    .line 365
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 366
    .line 367
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 368
    .line 369
    .line 370
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 371
    .line 372
    if-eqz p0, :cond_17

    .line 373
    .line 374
    const-string p0, "fateRadar"

    .line 375
    .line 376
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 380
    .line 381
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 382
    .line 383
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 384
    .line 385
    .line 386
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 387
    .line 388
    if-eqz p0, :cond_18

    .line 389
    .line 390
    const-string p0, "lowPayOneside"

    .line 391
    .line 392
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    sget-object p0, Lcom/p1/mobile/putong/core/data/LowPayOneside;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 396
    .line 397
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 398
    .line 399
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 400
    .line 401
    .line 402
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 403
    .line 404
    if-eqz p0, :cond_19

    .line 405
    .line 406
    const-string p0, "matchInfo"

    .line 407
    .line 408
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 412
    .line 413
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 414
    .line 415
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 416
    .line 417
    .line 418
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 419
    .line 420
    if-eqz p0, :cond_1a

    .line 421
    .line 422
    const-string p0, "newMatch"

    .line 423
    .line 424
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 428
    .line 429
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 430
    .line 431
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 432
    .line 433
    .line 434
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 435
    .line 436
    if-eqz p0, :cond_1b

    .line 437
    .line 438
    const-string p0, "loveLetter"

    .line 439
    .line 440
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 444
    .line 445
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 446
    .line 447
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 448
    .line 449
    .line 450
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 451
    .line 452
    if-eqz p0, :cond_1c

    .line 453
    .line 454
    const-string p0, "chatMM"

    .line 455
    .line 456
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatMM;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 460
    .line 461
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 462
    .line 463
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 464
    .line 465
    .line 466
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 467
    .line 468
    if-eqz p0, :cond_1d

    .line 469
    .line 470
    const-string p0, "blackList"

    .line 471
    .line 472
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    sget-object p0, Lcom/p1/mobile/putong/core/data/BlackList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 476
    .line 477
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 478
    .line 479
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 480
    .line 481
    .line 482
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 483
    .line 484
    if-eqz p0, :cond_1e

    .line 485
    .line 486
    const-string p0, "messageRelate"

    .line 487
    .line 488
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageRelate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 492
    .line 493
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 494
    .line 495
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 496
    .line 497
    .line 498
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 499
    .line 500
    if-eqz p0, :cond_1f

    .line 501
    .line 502
    const-string p0, "compliment"

    .line 503
    .line 504
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 508
    .line 509
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 510
    .line 511
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 512
    .line 513
    .line 514
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 515
    .line 516
    if-eqz p0, :cond_20

    .line 517
    .line 518
    const-string p0, "swiper"

    .line 519
    .line 520
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 524
    .line 525
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 526
    .line 527
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 528
    .line 529
    .line 530
    :cond_20
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 531
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;->serializeFields(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
