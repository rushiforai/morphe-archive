.class Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;->newInstance()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
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
    const-string p0, "questionResult"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "chatGiftInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "iceBreakQuestionID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "forceSend"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "aiChatGuideType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "understandShare"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "iceBreakingQA"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "contact"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "localUXQuestionnaire"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "continuousChatTip"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "aiPicture"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "commonTipBox"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "newQuestion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "song"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "href"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "momentGiftInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "harassAlertInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "exchangePicture"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "limitTimePicture"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "woodenFishHint"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "compliment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "coinSign"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "consumeType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "status"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "femaleUnreplyReminder"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "prologue"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "loveLetterInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "conversationNotification"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "oneSideNoMatch"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "caller"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "callee"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "contactInfoRequestMessageId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto :goto_0

    :cond_1f
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_20
    const-string p0, "chatAssistantQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto :goto_0

    :cond_20
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_21
    const-string p0, "twoSidesDifferentTip"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto :goto_0

    :cond_21
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_22
    const-string p0, "newQuestionAnswer"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto :goto_0

    :cond_22
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_23
    const-string p0, "groupInvitation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_24
    const-string p0, "duration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_25
    const-string p0, "systemReminder"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto :goto_0

    :cond_25
    move v2, v1

    goto :goto_0

    :sswitch_26
    const-string p0, "iceBreakingQuestion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto :goto_0

    :cond_26
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuestionResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    return v1

    .line 4
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 5
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    return v1

    .line 6
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    return v1

    .line 7
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    return v1

    .line 8
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    return v1

    .line 9
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    return v1

    .line 11
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    return v1

    .line 13
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageContact;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageContact;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    return v1

    .line 15
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/core/data/Questionnaire;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Questionnaire;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    return v1

    .line 17
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    return v1

    .line 19
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/core/data/AiPicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/AiPicture;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    return v1

    .line 21
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 22
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    return v1

    .line 23
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/NewQuestion;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    return v1

    .line 25
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageMusic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageMusic;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    return v1

    .line 27
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    return v1

    .line 28
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    return v1

    .line 30
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 31
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    return v1

    .line 32
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    return v1

    .line 34
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    return v1

    .line 36
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    return v1

    .line 38
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    return v1

    .line 40
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    return v1

    .line 41
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    return v1

    .line 42
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    return v1

    .line 43
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    return v1

    .line 45
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    return v1

    .line 47
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    return v1

    .line 49
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationNotification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationNotification;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    return v1

    .line 51
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    return v1

    .line 53
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    return v1

    .line 54
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    return v1

    .line 55
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    return v1

    .line 56
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    return v1

    .line 58
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatTips;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 59
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatTips;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    return v1

    .line 60
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    return v1

    .line 62
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/GroupInvitation;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    return v1

    .line 64
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    return v1

    .line 65
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/core/data/SystemReminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 66
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/SystemReminder;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    return v1

    .line 67
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 68
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7fb703cc -> :sswitch_26
        -0x79f4083f -> :sswitch_25
        -0x76bbb26c -> :sswitch_24
        -0x72d48888 -> :sswitch_23
        -0x727e7efc -> :sswitch_22
        -0x6bbe372e -> :sswitch_21
        -0x64ac8e79 -> :sswitch_20
        -0x5337a93f -> :sswitch_1f
        -0x51869882 -> :sswitch_1e
        -0x51869875 -> :sswitch_1d
        -0x4ca03b19 -> :sswitch_1c
        -0x4379f2f2 -> :sswitch_1b
        -0x3f9708fa -> :sswitch_1a
        -0x3b661db9 -> :sswitch_19
        -0x36428569 -> :sswitch_18
        -0x3532300e -> :sswitch_17
        -0x33375eaa -> :sswitch_16
        -0x2ab5b012 -> :sswitch_15
        -0x200cfbd6 -> :sswitch_14
        -0x1d3fd8cb -> :sswitch_13
        -0x14df654a -> :sswitch_12
        -0x94336a5 -> :sswitch_11
        -0x92e503e -> :sswitch_10
        -0x7dcefe2 -> :sswitch_f
        0x30ff2b -> :sswitch_e
        0x35f515 -> :sswitch_d
        0x56aa9a6 -> :sswitch_c
        0x82774fb -> :sswitch_b
        0xa126bb6 -> :sswitch_a
        0xbdbdc14 -> :sswitch_9
        0x108fd0f5 -> :sswitch_8
        0x38b72420 -> :sswitch_7
        0x50b8a0be -> :sswitch_6
        0x53572681 -> :sswitch_5
        0x542e5496 -> :sswitch_4
        0x5b136113 -> :sswitch_3
        0x68b4ffd5 -> :sswitch_2
        0x6be74976 -> :sswitch_1
        0x7935eba3 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;->parseField(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
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
    const-string v0, "questionResult"

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
    const/16 v2, 0x26

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "chatGiftInfo"

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
    const/16 v2, 0x25

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "iceBreakQuestionID"

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
    const/16 v2, 0x24

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "forceSend"

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
    const/16 v2, 0x23

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "aiChatGuideType"

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
    const/16 v2, 0x22

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "understandShare"

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
    const/16 v2, 0x21

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "iceBreakingQA"

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
    const/16 v2, 0x20

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "contact"

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
    const/16 v2, 0x1f

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "localUXQuestionnaire"

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
    const/16 v2, 0x1e

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "continuousChatTip"

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
    const/16 v2, 0x1d

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "aiPicture"

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
    const/16 v2, 0x1c

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "commonTipBox"

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
    const/16 v2, 0x1b

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "newQuestion"

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
    const/16 v2, 0x1a

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "song"

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
    const/16 v2, 0x19

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "href"

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
    const/16 v2, 0x18

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "momentGiftInfo"

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
    const/16 v2, 0x17

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "harassAlertInfo"

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
    const/16 v2, 0x16

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "exchangePicture"

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
    const/16 v2, 0x15

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "limitTimePicture"

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
    const/16 v2, 0x14

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "woodenFishHint"

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
    const/16 v2, 0x13

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "compliment"

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
    const/16 v2, 0x12

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "coinSign"

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
    const/16 v2, 0x11

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "consumeType"

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
    const/16 v2, 0x10

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_17
    const-string v0, "status"

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
    const/16 v2, 0xf

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_18
    const-string v0, "femaleUnreplyReminder"

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
    const/16 v2, 0xe

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_19
    const-string v0, "prologue"

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
    const/16 v2, 0xd

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :sswitch_1a
    const-string v0, "loveLetterInfo"

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
    const/16 v2, 0xc

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_1b
    const-string v0, "conversationNotification"

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
    const/16 v2, 0xb

    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :sswitch_1c
    const-string v0, "oneSideNoMatch"

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
    const/16 v2, 0xa

    .line 418
    .line 419
    goto/16 :goto_0

    .line 420
    .line 421
    :sswitch_1d
    const-string v0, "caller"

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
    goto/16 :goto_0

    .line 430
    .line 431
    :cond_1d
    const/16 v2, 0x9

    .line 432
    .line 433
    goto/16 :goto_0

    .line 434
    .line 435
    :sswitch_1e
    const-string v0, "callee"

    .line 436
    .line 437
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_1e

    .line 442
    .line 443
    goto/16 :goto_0

    .line 444
    .line 445
    :cond_1e
    const/16 v2, 0x8

    .line 446
    .line 447
    goto/16 :goto_0

    .line 448
    .line 449
    :sswitch_1f
    const-string v0, "contactInfoRequestMessageId"

    .line 450
    .line 451
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result v0

    .line 455
    if-nez v0, :cond_1f

    .line 456
    .line 457
    goto :goto_0

    .line 458
    :cond_1f
    const/4 v2, 0x7

    .line 459
    goto :goto_0

    .line 460
    :sswitch_20
    const-string v0, "chatAssistantQuestions"

    .line 461
    .line 462
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-nez v0, :cond_20

    .line 467
    .line 468
    goto :goto_0

    .line 469
    :cond_20
    const/4 v2, 0x6

    .line 470
    goto :goto_0

    .line 471
    :sswitch_21
    const-string v0, "twoSidesDifferentTip"

    .line 472
    .line 473
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result v0

    .line 477
    if-nez v0, :cond_21

    .line 478
    .line 479
    goto :goto_0

    .line 480
    :cond_21
    const/4 v2, 0x5

    .line 481
    goto :goto_0

    .line 482
    :sswitch_22
    const-string v0, "newQuestionAnswer"

    .line 483
    .line 484
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 485
    .line 486
    .line 487
    move-result v0

    .line 488
    if-nez v0, :cond_22

    .line 489
    .line 490
    goto :goto_0

    .line 491
    :cond_22
    const/4 v2, 0x4

    .line 492
    goto :goto_0

    .line 493
    :sswitch_23
    const-string v0, "groupInvitation"

    .line 494
    .line 495
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 496
    .line 497
    .line 498
    move-result v0

    .line 499
    if-nez v0, :cond_23

    .line 500
    .line 501
    goto :goto_0

    .line 502
    :cond_23
    const/4 v2, 0x3

    .line 503
    goto :goto_0

    .line 504
    :sswitch_24
    const-string v0, "duration"

    .line 505
    .line 506
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    move-result v0

    .line 510
    if-nez v0, :cond_24

    .line 511
    .line 512
    goto :goto_0

    .line 513
    :cond_24
    const/4 v2, 0x2

    .line 514
    goto :goto_0

    .line 515
    :sswitch_25
    const-string v0, "systemReminder"

    .line 516
    .line 517
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    move-result v0

    .line 521
    if-nez v0, :cond_25

    .line 522
    .line 523
    goto :goto_0

    .line 524
    :cond_25
    move v2, v1

    .line 525
    goto :goto_0

    .line 526
    :sswitch_26
    const-string v0, "iceBreakingQuestion"

    .line 527
    .line 528
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 529
    .line 530
    .line 531
    move-result v0

    .line 532
    if-nez v0, :cond_26

    .line 533
    .line 534
    goto :goto_0

    .line 535
    :cond_26
    const/4 v2, 0x0

    .line 536
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 537
    .line 538
    .line 539
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 540
    .line 541
    .line 542
    move-result p0

    .line 543
    return p0

    .line 544
    :pswitch_0
    return v1

    .line 545
    :sswitch_data_0
    .sparse-switch
        -0x7fb703cc -> :sswitch_26
        -0x79f4083f -> :sswitch_25
        -0x76bbb26c -> :sswitch_24
        -0x72d48888 -> :sswitch_23
        -0x727e7efc -> :sswitch_22
        -0x6bbe372e -> :sswitch_21
        -0x64ac8e79 -> :sswitch_20
        -0x5337a93f -> :sswitch_1f
        -0x51869882 -> :sswitch_1e
        -0x51869875 -> :sswitch_1d
        -0x4ca03b19 -> :sswitch_1c
        -0x4379f2f2 -> :sswitch_1b
        -0x3f9708fa -> :sswitch_1a
        -0x3b661db9 -> :sswitch_19
        -0x36428569 -> :sswitch_18
        -0x3532300e -> :sswitch_17
        -0x33375eaa -> :sswitch_16
        -0x2ab5b012 -> :sswitch_15
        -0x200cfbd6 -> :sswitch_14
        -0x1d3fd8cb -> :sswitch_13
        -0x14df654a -> :sswitch_12
        -0x94336a5 -> :sswitch_11
        -0x92e503e -> :sswitch_10
        -0x7dcefe2 -> :sswitch_f
        0x30ff2b -> :sswitch_e
        0x35f515 -> :sswitch_d
        0x56aa9a6 -> :sswitch_c
        0x82774fb -> :sswitch_b
        0xa126bb6 -> :sswitch_a
        0xbdbdc14 -> :sswitch_9
        0x108fd0f5 -> :sswitch_8
        0x38b72420 -> :sswitch_7
        0x50b8a0be -> :sswitch_6
        0x53572681 -> :sswitch_5
        0x542e5496 -> :sswitch_4
        0x5b136113 -> :sswitch_3
        0x68b4ffd5 -> :sswitch_2
        0x6be74976 -> :sswitch_1
        0x7935eba3 -> :sswitch_0
    .end sparse-switch

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
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 545
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "contactInfoRequestMessageId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "href"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "caller"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "callee"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "status"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    const-string v0, "duration"

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 56
    .line 57
    const/4 v0, 0x1

    .line 58
    if-eqz p0, :cond_6

    .line 59
    .line 60
    const-string p0, "newQuestion"

    .line 61
    .line 62
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 68
    .line 69
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 70
    .line 71
    .line 72
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    const-string p0, "newQuestionAnswer"

    .line 77
    .line 78
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sget-object p0, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 82
    .line 83
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 84
    .line 85
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 86
    .line 87
    .line 88
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 89
    .line 90
    if-eqz p0, :cond_8

    .line 91
    .line 92
    const-string p0, "questionResult"

    .line 93
    .line 94
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuestionResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 100
    .line 101
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 105
    .line 106
    if-eqz p0, :cond_9

    .line 107
    .line 108
    const-string p0, "iceBreakingQuestion"

    .line 109
    .line 110
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    sget-object p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 114
    .line 115
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 116
    .line 117
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 118
    .line 119
    .line 120
    :cond_9
    const-string p0, "forceSend"

    .line 121
    .line 122
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 123
    .line 124
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const-string v1, "consumeType"

    .line 132
    .line 133
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz p0, :cond_b

    .line 139
    .line 140
    const-string v1, "coinSign"

    .line 141
    .line 142
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 146
    .line 147
    if-eqz p0, :cond_c

    .line 148
    .line 149
    const-string p0, "contact"

    .line 150
    .line 151
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageContact;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 155
    .line 156
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 157
    .line 158
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 159
    .line 160
    .line 161
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 162
    .line 163
    if-eqz p0, :cond_d

    .line 164
    .line 165
    const-string p0, "oneSideNoMatch"

    .line 166
    .line 167
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sget-object p0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 171
    .line 172
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 173
    .line 174
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 175
    .line 176
    .line 177
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 178
    .line 179
    if-eqz p0, :cond_e

    .line 180
    .line 181
    const-string p0, "song"

    .line 182
    .line 183
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageMusic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 187
    .line 188
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 189
    .line 190
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 191
    .line 192
    .line 193
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 194
    .line 195
    if-eqz p0, :cond_f

    .line 196
    .line 197
    const-string p0, "conversationNotification"

    .line 198
    .line 199
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationNotification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 203
    .line 204
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 205
    .line 206
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 207
    .line 208
    .line 209
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 210
    .line 211
    if-eqz p0, :cond_10

    .line 212
    .line 213
    const-string p0, "chatGiftInfo"

    .line 214
    .line 215
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 219
    .line 220
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 221
    .line 222
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 223
    .line 224
    .line 225
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 226
    .line 227
    if-eqz p0, :cond_11

    .line 228
    .line 229
    const-string p0, "momentGiftInfo"

    .line 230
    .line 231
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 235
    .line 236
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 237
    .line 238
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 239
    .line 240
    .line 241
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 242
    .line 243
    if-eqz p0, :cond_12

    .line 244
    .line 245
    const-string p0, "groupInvitation"

    .line 246
    .line 247
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 251
    .line 252
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 253
    .line 254
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 255
    .line 256
    .line 257
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 258
    .line 259
    if-eqz p0, :cond_13

    .line 260
    .line 261
    const-string p0, "understandShare"

    .line 262
    .line 263
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    sget-object p0, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 267
    .line 268
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 269
    .line 270
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 271
    .line 272
    .line 273
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 274
    .line 275
    if-eqz p0, :cond_14

    .line 276
    .line 277
    const-string p0, "woodenFishHint"

    .line 278
    .line 279
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    sget-object p0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 283
    .line 284
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 285
    .line 286
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 287
    .line 288
    .line 289
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 290
    .line 291
    if-eqz p0, :cond_15

    .line 292
    .line 293
    const-string p0, "exchangePicture"

    .line 294
    .line 295
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    sget-object p0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 299
    .line 300
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 301
    .line 302
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 303
    .line 304
    .line 305
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 306
    .line 307
    if-eqz p0, :cond_16

    .line 308
    .line 309
    const-string p0, "chatAssistantQuestions"

    .line 310
    .line 311
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 315
    .line 316
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 317
    .line 318
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 319
    .line 320
    .line 321
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 322
    .line 323
    if-eqz p0, :cond_17

    .line 324
    .line 325
    const-string p0, "twoSidesDifferentTip"

    .line 326
    .line 327
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatTips;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 331
    .line 332
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 333
    .line 334
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 335
    .line 336
    .line 337
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 338
    .line 339
    if-eqz p0, :cond_18

    .line 340
    .line 341
    const-string p0, "femaleUnreplyReminder"

    .line 342
    .line 343
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    sget-object p0, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 347
    .line 348
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 349
    .line 350
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 351
    .line 352
    .line 353
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 354
    .line 355
    if-eqz p0, :cond_19

    .line 356
    .line 357
    const-string p0, "aiPicture"

    .line 358
    .line 359
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    sget-object p0, Lcom/p1/mobile/putong/core/data/AiPicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 363
    .line 364
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 365
    .line 366
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 367
    .line 368
    .line 369
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 370
    .line 371
    if-eqz p0, :cond_1a

    .line 372
    .line 373
    const-string p0, "harassAlertInfo"

    .line 374
    .line 375
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    sget-object p0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 379
    .line 380
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 381
    .line 382
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 383
    .line 384
    .line 385
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 386
    .line 387
    if-eqz p0, :cond_1b

    .line 388
    .line 389
    const-string p0, "continuousChatTip"

    .line 390
    .line 391
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    sget-object p0, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 395
    .line 396
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 397
    .line 398
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 399
    .line 400
    .line 401
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 402
    .line 403
    if-eqz p0, :cond_1c

    .line 404
    .line 405
    const-string p0, "systemReminder"

    .line 406
    .line 407
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    sget-object p0, Lcom/p1/mobile/putong/core/data/SystemReminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 411
    .line 412
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 413
    .line 414
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 415
    .line 416
    .line 417
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 418
    .line 419
    if-eqz p0, :cond_1d

    .line 420
    .line 421
    const-string p0, "limitTimePicture"

    .line 422
    .line 423
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    sget-object p0, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 427
    .line 428
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 429
    .line 430
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 431
    .line 432
    .line 433
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 434
    .line 435
    if-eqz p0, :cond_1e

    .line 436
    .line 437
    const-string p0, "commonTipBox"

    .line 438
    .line 439
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    sget-object p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 443
    .line 444
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 445
    .line 446
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 447
    .line 448
    .line 449
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    .line 450
    .line 451
    if-eqz p0, :cond_1f

    .line 452
    .line 453
    const-string v1, "iceBreakQuestionID"

    .line 454
    .line 455
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 459
    .line 460
    if-eqz p0, :cond_20

    .line 461
    .line 462
    const-string p0, "localUXQuestionnaire"

    .line 463
    .line 464
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 465
    .line 466
    .line 467
    sget-object p0, Lcom/p1/mobile/putong/core/data/Questionnaire;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 468
    .line 469
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 470
    .line 471
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 472
    .line 473
    .line 474
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 475
    .line 476
    if-eqz p0, :cond_21

    .line 477
    .line 478
    const-string p0, "loveLetterInfo"

    .line 479
    .line 480
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 481
    .line 482
    .line 483
    sget-object p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 484
    .line 485
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 486
    .line 487
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 488
    .line 489
    .line 490
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 491
    .line 492
    if-eqz p0, :cond_22

    .line 493
    .line 494
    const-string p0, "iceBreakingQA"

    .line 495
    .line 496
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    sget-object p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 500
    .line 501
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 502
    .line 503
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 504
    .line 505
    .line 506
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 507
    .line 508
    if-eqz p0, :cond_23

    .line 509
    .line 510
    const-string p0, "prologue"

    .line 511
    .line 512
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 516
    .line 517
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 518
    .line 519
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 520
    .line 521
    .line 522
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 523
    .line 524
    if-eqz p0, :cond_24

    .line 525
    .line 526
    const-string v1, "aiChatGuideType"

    .line 527
    .line 528
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 532
    .line 533
    if-eqz p0, :cond_25

    .line 534
    .line 535
    const-string p0, "compliment"

    .line 536
    .line 537
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 541
    .line 542
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 543
    .line 544
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 545
    .line 546
    .line 547
    :cond_25
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 548
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;->serializeFields(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
