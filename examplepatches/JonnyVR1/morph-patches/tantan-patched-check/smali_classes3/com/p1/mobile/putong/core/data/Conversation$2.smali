.class Lcom/p1/mobile/putong/core/data/Conversation$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Conversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation$2;->newInstance()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
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
    const-string p0, "importance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "conversationUserDistance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "unmatchConversation"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "latestFriendCommentCreatedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "scenarios"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "remainedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "localBotherStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "conversationUserUpdatedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "unreadMessages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "clearedUntil"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "intimacy"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "localIsLimitedTrialSee"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "localNotificationStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "place"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "muted"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "level"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "group"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "read"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "heat"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "mm"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "id"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "latestTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "messages"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "createdTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "convType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "otherReadUntil"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "updatedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "status"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "property"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "myTalk"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "clearedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "readUntil"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "isFake"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "follow"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "quickChatProgress"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto :goto_0

    :cond_22
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_23
    const-string p0, "suggestionScore"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_24
    const-string p0, "otherStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_25
    const-string p0, "subtype"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_26
    const-string p0, "additional"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_27
    const-string p0, "otherUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto :goto_0

    :cond_27
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_28
    const-string p0, "otherTalk"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto :goto_0

    :cond_28
    move v2, v1

    goto :goto_0

    :sswitch_29
    const-string p0, "userMessageCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto :goto_0

    :cond_29
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/StickStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    return v1

    .line 3
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    return v1

    .line 4
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    return v1

    .line 5
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    return v1

    .line 7
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->SCENARIO_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    return v1

    .line 9
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    return v1

    .line 10
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    return v1

    .line 11
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    return v1

    .line 13
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    return v1

    .line 14
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    return v1

    .line 15
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    return v1

    .line 16
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    return v1

    .line 17
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 18
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    return v1

    .line 19
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    return v1

    .line 20
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    return v1

    .line 21
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    return v1

    .line 22
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    return v1

    .line 24
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p0

    sget-object p2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne p0, p2, :cond_2a

    const/4 p0, 0x0

    goto :goto_1

    .line 25
    :cond_2a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    return v1

    .line 26
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    return v1

    .line 28
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    return v1

    .line 29
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    return v0

    .line 30
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    return v1

    .line 31
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 32
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/PartialIdList;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    return v1

    .line 33
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    return v1

    .line 34
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    return v1

    .line 35
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    return v1

    .line 36
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    return v1

    .line 37
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/ConversationStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    return v1

    .line 38
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    return v1

    .line 40
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/core/data/TalkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TalkInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    return v1

    .line 42
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    return v1

    .line 43
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    return v1

    .line 44
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    return v1

    .line 45
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    return v1

    .line 46
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    return v1

    .line 47
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    return v1

    .line 48
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    return v1

    .line 49
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationType;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    return v1

    .line 50
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 51
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    return v1

    .line 52
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->GROUP_ID:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    return v1

    .line 53
    :pswitch_28
    sget-object p0, Lcom/p1/mobile/putong/core/data/TalkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 54
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/TalkInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    return v1

    .line 55
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    return v1

    :sswitch_data_0
    .sparse-switch
        -0x7c54cb4d -> :sswitch_29
        -0x73fbe024 -> :sswitch_28
        -0x73fb2905 -> :sswitch_27
        -0x731f07d9 -> :sswitch_26
        -0x6f50d286 -> :sswitch_25
        -0x653250de -> :sswitch_24
        -0x6301d912 -> :sswitch_23
        -0x61671fce -> :sswitch_22
        -0x4ba2c44f -> :sswitch_21
        -0x465d4c61 -> :sswitch_20
        -0x42ed3c98 -> :sswitch_1f
        -0x40b88b67 -> :sswitch_1e
        -0x3f2eff88 -> :sswitch_1d
        -0x3b32222b -> :sswitch_1c
        -0x3532300e -> :sswitch_1b
        -0x21f62dd8 -> :sswitch_1a
        -0x21d7a9c8 -> :sswitch_19
        -0x21bc0772 -> :sswitch_18
        -0x1d336e2b -> :sswitch_17
        -0x1b8afeb4 -> :sswitch_16
        -0x770c50c -> :sswitch_15
        0xd1b -> :sswitch_14
        0xda0 -> :sswitch_13
        0x30cdf0 -> :sswitch_12
        0x355996 -> :sswitch_11
        0x5e0f67f -> :sswitch_10
        0x6219b84 -> :sswitch_f
        0x636f16b -> :sswitch_e
        0x65cd907 -> :sswitch_d
        0x9065f88 -> :sswitch_c
        0x219b8a62 -> :sswitch_b
        0x2235ae64 -> :sswitch_a
        0x29b79712 -> :sswitch_9
        0x44deba1b -> :sswitch_8
        0x534fb65a -> :sswitch_7
        0x60ad688b -> :sswitch_6
        0x64d4ad78 -> :sswitch_5
        0x66e8fee3 -> :sswitch_4
        0x7101d3db -> :sswitch_3
        0x717b616f -> :sswitch_2
        0x7c776503 -> :sswitch_1
        0x7eb2da74 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/Conversation$2;->parseField(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
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

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, -0x1

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "importance"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v3, 0x29

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "conversationUserDistance"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v3, 0x28

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "unmatchConversation"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v3, 0x27

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "latestFriendCommentCreatedTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v3, 0x26

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "scenarios"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v3, 0x25

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "remainedTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v3, 0x24

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "localBotherStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v3, 0x23

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "conversationUserUpdatedTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v3, 0x22

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "unreadMessages"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v3, 0x21

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "clearedUntil"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v3, 0x20

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "intimacy"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v3, 0x1f

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "localIsLimitedTrialSee"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v3, 0x1e

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "localNotificationStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v3, 0x1d

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "place"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v3, 0x1c

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "muted"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v3, 0x1b

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "level"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v3, 0x1a

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "group"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v3, 0x19

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "read"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v3, 0x18

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "heat"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v3, 0x17

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "mm"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v3, 0x16

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v3, 0x15

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "latestTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v3, 0x14

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "messages"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v3, 0x13

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "createdTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v3, 0x12

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "convType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v3, 0x11

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "otherReadUntil"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v3, 0x10

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "updatedTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v3, 0xf

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "status"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v3, 0xe

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "property"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v3, 0xd

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "myTalk"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v3, 0xc

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "clearedTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v3, 0xb

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "readUntil"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v3, 0xa

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "isFake"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v3, 0x9

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "follow"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v3, 0x8

    goto/16 :goto_0

    :sswitch_22
    const-string v0, "quickChatProgress"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto :goto_0

    :cond_22
    const/4 v3, 0x7

    goto :goto_0

    :sswitch_23
    const-string v0, "suggestionScore"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v3, 0x6

    goto :goto_0

    :sswitch_24
    const-string v0, "otherStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v3, 0x5

    goto :goto_0

    :sswitch_25
    const-string v0, "subtype"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v3, 0x4

    goto :goto_0

    :sswitch_26
    const-string v0, "additional"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_27
    const-string v0, "otherUser"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto :goto_0

    :cond_27
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_28
    const-string v0, "otherTalk"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_0

    :cond_28
    move v3, v2

    goto :goto_0

    :sswitch_29
    const-string v0, "userMessageCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    goto :goto_0

    :cond_29
    move v3, v1

    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 2
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0

    :pswitch_0
    return v2

    :pswitch_1
    return v1

    :pswitch_2
    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7c54cb4d -> :sswitch_29
        -0x73fbe024 -> :sswitch_28
        -0x73fb2905 -> :sswitch_27
        -0x731f07d9 -> :sswitch_26
        -0x6f50d286 -> :sswitch_25
        -0x653250de -> :sswitch_24
        -0x6301d912 -> :sswitch_23
        -0x61671fce -> :sswitch_22
        -0x4ba2c44f -> :sswitch_21
        -0x465d4c61 -> :sswitch_20
        -0x42ed3c98 -> :sswitch_1f
        -0x40b88b67 -> :sswitch_1e
        -0x3f2eff88 -> :sswitch_1d
        -0x3b32222b -> :sswitch_1c
        -0x3532300e -> :sswitch_1b
        -0x21f62dd8 -> :sswitch_1a
        -0x21d7a9c8 -> :sswitch_19
        -0x21bc0772 -> :sswitch_18
        -0x1d336e2b -> :sswitch_17
        -0x1b8afeb4 -> :sswitch_16
        -0x770c50c -> :sswitch_15
        0xd1b -> :sswitch_14
        0xda0 -> :sswitch_13
        0x30cdf0 -> :sswitch_12
        0x355996 -> :sswitch_11
        0x5e0f67f -> :sswitch_10
        0x6219b84 -> :sswitch_f
        0x636f16b -> :sswitch_e
        0x65cd907 -> :sswitch_d
        0x9065f88 -> :sswitch_c
        0x219b8a62 -> :sswitch_b
        0x2235ae64 -> :sswitch_a
        0x29b79712 -> :sswitch_9
        0x44deba1b -> :sswitch_8
        0x534fb65a -> :sswitch_7
        0x60ad688b -> :sswitch_6
        0x64d4ad78 -> :sswitch_5
        0x66e8fee3 -> :sswitch_4
        0x7101d3db -> :sswitch_3
        0x717b616f -> :sswitch_2
        0x7c776503 -> :sswitch_1
        0x7eb2da74 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/Conversation$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string p0, "messages"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string v1, "read"

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz p0, :cond_3

    .line 43
    .line 44
    const-string p0, "otherUser"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->GROUP_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 54
    .line 55
    .line 56
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz p0, :cond_4

    .line 59
    .line 60
    const-string v1, "readUntil"

    .line 61
    .line 62
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_4
    const-string p0, "latestTime"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 73
    .line 74
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 79
    .line 80
    .line 81
    const-string v1, "createdTime"

    .line 82
    .line 83
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 87
    .line 88
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 96
    .line 97
    if-eqz v1, :cond_5

    .line 98
    .line 99
    const-string v1, "localNotificationStatus"

    .line 100
    .line 101
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    sget-object v1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 105
    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 107
    .line 108
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 109
    .line 110
    .line 111
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v1, :cond_6

    .line 114
    .line 115
    const-string v1, "scenarios"

    .line 116
    .line 117
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 121
    .line 122
    sget-object v2, Lcom/p1/mobile/putong/data/Converter;->SCENARIO_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 123
    .line 124
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 125
    .line 126
    .line 127
    :cond_6
    const-string v1, "unreadMessages"

    .line 128
    .line 129
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 130
    .line 131
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 135
    .line 136
    if-eqz v1, :cond_7

    .line 137
    .line 138
    const-string v1, "importance"

    .line 139
    .line 140
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sget-object v1, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 144
    .line 145
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 146
    .line 147
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 148
    .line 149
    .line 150
    :cond_7
    const-string v1, "follow"

    .line 151
    .line 152
    iget-boolean v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 153
    .line 154
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz v1, :cond_8

    .line 160
    .line 161
    const-string v2, "clearedUntil"

    .line 162
    .line 163
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 167
    .line 168
    if-eqz v1, :cond_9

    .line 169
    .line 170
    const-string v1, "status"

    .line 171
    .line 172
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sget-object v1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 176
    .line 177
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 178
    .line 179
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 180
    .line 181
    .line 182
    :cond_9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 183
    .line 184
    if-eqz v1, :cond_a

    .line 185
    .line 186
    const-string v2, "place"

    .line 187
    .line 188
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :cond_a
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 192
    .line 193
    if-eqz v1, :cond_b

    .line 194
    .line 195
    const-string v1, "subtype"

    .line 196
    .line 197
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 201
    .line 202
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 203
    .line 204
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 205
    .line 206
    .line 207
    :cond_b
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 208
    .line 209
    if-eqz v1, :cond_c

    .line 210
    .line 211
    const-string v1, "myTalk"

    .line 212
    .line 213
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    sget-object v1, Lcom/p1/mobile/putong/core/data/TalkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 217
    .line 218
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 219
    .line 220
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 221
    .line 222
    .line 223
    :cond_c
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 224
    .line 225
    if-eqz v1, :cond_d

    .line 226
    .line 227
    const-string v1, "otherTalk"

    .line 228
    .line 229
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    sget-object v1, Lcom/p1/mobile/putong/core/data/TalkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 233
    .line 234
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 235
    .line 236
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 237
    .line 238
    .line 239
    :cond_d
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 240
    .line 241
    if-eqz v1, :cond_e

    .line 242
    .line 243
    const-string v2, "otherReadUntil"

    .line 244
    .line 245
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    :cond_e
    const-string v1, "updatedTime"

    .line 249
    .line 250
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 254
    .line 255
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 260
    .line 261
    .line 262
    const-string v1, "unmatchConversation"

    .line 263
    .line 264
    iget-boolean v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 265
    .line 266
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 267
    .line 268
    .line 269
    const-string v1, "remainedTime"

    .line 270
    .line 271
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 272
    .line 273
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 274
    .line 275
    .line 276
    const-string v1, "conversationUserDistance"

    .line 277
    .line 278
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 279
    .line 280
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 281
    .line 282
    .line 283
    const-string v1, "conversationUserUpdatedTime"

    .line 284
    .line 285
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 289
    .line 290
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 295
    .line 296
    .line 297
    const-string v1, "level"

    .line 298
    .line 299
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 300
    .line 301
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 302
    .line 303
    .line 304
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 305
    .line 306
    if-eqz v1, :cond_f

    .line 307
    .line 308
    const-string v1, "additional"

    .line 309
    .line 310
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 314
    .line 315
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 316
    .line 317
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 318
    .line 319
    .line 320
    :cond_f
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 321
    .line 322
    if-eqz v1, :cond_10

    .line 323
    .line 324
    const-string v2, "convType"

    .line 325
    .line 326
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    :cond_10
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 330
    .line 331
    if-eqz v1, :cond_11

    .line 332
    .line 333
    const-string v1, "property"

    .line 334
    .line 335
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    .line 340
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 341
    .line 342
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 343
    .line 344
    .line 345
    :cond_11
    const-string v1, "userMessageCount"

    .line 346
    .line 347
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 348
    .line 349
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 350
    .line 351
    .line 352
    const-string v1, "latestFriendCommentCreatedTime"

    .line 353
    .line 354
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 358
    .line 359
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 364
    .line 365
    .line 366
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 367
    .line 368
    if-eqz v1, :cond_12

    .line 369
    .line 370
    const-string v1, "heat"

    .line 371
    .line 372
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    sget-object v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 376
    .line 377
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 378
    .line 379
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 380
    .line 381
    .line 382
    :cond_12
    const-string v1, "suggestionScore"

    .line 383
    .line 384
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 385
    .line 386
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 387
    .line 388
    .line 389
    const-string v1, "localBotherStatus"

    .line 390
    .line 391
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 392
    .line 393
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 394
    .line 395
    .line 396
    const-string v1, "muted"

    .line 397
    .line 398
    iget-boolean v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 399
    .line 400
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 401
    .line 402
    .line 403
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 404
    .line 405
    if-eqz v1, :cond_13

    .line 406
    .line 407
    const-string v1, "group"

    .line 408
    .line 409
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 413
    .line 414
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 415
    .line 416
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 417
    .line 418
    .line 419
    :cond_13
    const-string v1, "mm"

    .line 420
    .line 421
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 422
    .line 423
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 424
    .line 425
    .line 426
    const-string v1, "intimacy"

    .line 427
    .line 428
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 429
    .line 430
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 431
    .line 432
    .line 433
    const-string v1, "quickChatProgress"

    .line 434
    .line 435
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 436
    .line 437
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 438
    .line 439
    .line 440
    const-string v1, "clearedTime"

    .line 441
    .line 442
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 446
    .line 447
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 452
    .line 453
    .line 454
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 455
    .line 456
    if-eqz p0, :cond_14

    .line 457
    .line 458
    const-string v0, "otherStatus"

    .line 459
    .line 460
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    :cond_14
    const-string p0, "isFake"

    .line 464
    .line 465
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 466
    .line 467
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 468
    .line 469
    .line 470
    const-string p0, "localIsLimitedTrialSee"

    .line 471
    .line 472
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 473
    .line 474
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 475
    .line 476
    .line 477
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 478
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation$2;->serializeFields(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
