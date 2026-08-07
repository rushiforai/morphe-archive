.class Lcom/p1/mobile/putong/core/data/Message$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/Message;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message$2;->newInstance()Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Message;",
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
    const-string p0, "commentInfo"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "location"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "settings"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "subCommentIds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "msgType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "msgData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "sentFrom"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "needRead"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "channel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "secondSend"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "value"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "owner"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "media"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "likes"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "liked"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "call"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "id"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "moreSubComments"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "parentCommentId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "recalledReason"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "createdTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "isNewComment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "isBottom"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "coinSign"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "recalled"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "consumeType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "status"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "reference"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "additionalData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "riskTags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "letter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "notifiedUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "hostId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "extData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto :goto_0

    :cond_21
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_22
    const-string p0, "localPrivateQuestions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto :goto_0

    :cond_22
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_23
    const-string p0, "action"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_24
    const-string p0, "recalledHint"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_25
    const-string p0, "localRedPacketType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_26
    const-string p0, "referenceMsgId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_27
    const-string p0, "otherUser"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto :goto_0

    :cond_27
    move v2, v1

    goto :goto_0

    :sswitch_28
    const-string p0, "accessory"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto :goto_0

    :cond_28
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CommentInfo;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    return v1

    .line 4
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/MessageLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 5
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/MessageLocation;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    return v1

    .line 6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageSetting;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    return v1

    .line 8
    :pswitch_3
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    return v1

    .line 10
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageType;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    return v1

    .line 11
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    return v1

    .line 12
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    return v1

    .line 13
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    return v1

    .line 14
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageChannel;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    return v1

    .line 15
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    return v1

    .line 16
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    return v1

    .line 17
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    return v1

    .line 18
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    return v1

    .line 20
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    return v1

    .line 21
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    return v1

    .line 22
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/core/data/CallRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/CallRecord;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    return v1

    .line 24
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    return v0

    .line 25
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    return v1

    .line 26
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    return v1

    .line 27
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    return v1

    .line 28
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    return v1

    .line 29
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    return v1

    .line 30
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    return v1

    .line 31
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    return v1

    .line 32
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p0

    sget-object p2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne p0, p2, :cond_29

    const/4 p0, 0x0

    goto :goto_1

    .line 33
    :cond_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    return v1

    .line 34
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    return v1

    .line 35
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    return v1

    .line 36
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageReference;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageReference;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    return v1

    .line 38
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    return v1

    .line 40
    :pswitch_1d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    return v1

    .line 42
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/core/data/Letter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 43
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Letter;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    return v1

    .line 44
    :pswitch_1f
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    return v1

    .line 46
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    return v1

    .line 47
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageExtData;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    return v1

    .line 49
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    return v1

    .line 51
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    return v1

    .line 52
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    return v1

    .line 53
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    return v1

    .line 54
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    return v1

    .line 55
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->GROUP_ID:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    return v1

    .line 56
    :pswitch_28
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAccessory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageAccessory;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7e10b0ee -> :sswitch_28
        -0x73fb2905 -> :sswitch_27
        -0x723d840f -> :sswitch_26
        -0x6f376a58 -> :sswitch_25
        -0x583821e9 -> :sswitch_24
        -0x54d081ca -> :sswitch_23
        -0x4eaf536b -> :sswitch_22
        -0x4de20a95 -> :sswitch_21
        -0x4835cb1d -> :sswitch_20
        -0x46eedcb0 -> :sswitch_1f
        -0x41eedbda -> :sswitch_1e
        -0x4102ec78 -> :sswitch_1d
        -0x3a150f8f -> :sswitch_1c
        -0x3724c0b5 -> :sswitch_1b
        -0x3532300e -> :sswitch_1a
        -0x33375eaa -> :sswitch_19
        -0x306b3c90 -> :sswitch_18
        -0x2ab5b012 -> :sswitch_17
        -0x2a45740b -> :sswitch_16
        -0x227c3a97 -> :sswitch_15
        -0x1d336e2b -> :sswitch_14
        -0x19e5122c -> :sswitch_13
        -0x11a6edb0 -> :sswitch_12
        -0x11eca41 -> :sswitch_11
        0xd1b -> :sswitch_10
        0x2e7a5e -> :sswitch_f
        0x62343ad -> :sswitch_e
        0x62343bc -> :sswitch_d
        0x62f6fe4 -> :sswitch_c
        0x653f2b3 -> :sswitch_b
        0x6ac9171 -> :sswitch_a
        0x19432e1c -> :sswitch_9
        0x2c0b7d03 -> :sswitch_8
        0x33981b4c -> :sswitch_7
        0x4b35cf62 -> :sswitch_6
        0x501062cb -> :sswitch_5
        0x5018025b -> :sswitch_4
        0x55026a39 -> :sswitch_3
        0x5582bc23 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x7d5c7fad -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/Message$2;->parseField(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Message;",
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
    const-string v0, "commentInfo"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v3, 0x28

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "location"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v3, 0x27

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "settings"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v3, 0x26

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "subCommentIds"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v3, 0x25

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "msgType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v3, 0x24

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "msgData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v3, 0x23

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "sentFrom"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v3, 0x22

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "needRead"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v3, 0x21

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "channel"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v3, 0x20

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "secondSend"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v3, 0x1f

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "value"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v3, 0x1e

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "owner"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v3, 0x1d

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "media"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v3, 0x1c

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "likes"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v3, 0x1b

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "liked"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v3, 0x1a

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "call"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v3, 0x19

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v3, 0x18

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "moreSubComments"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v3, 0x17

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "parentCommentId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v3, 0x16

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "recalledReason"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v3, 0x15

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "createdTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v3, 0x14

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "isNewComment"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v3, 0x13

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "isBottom"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v3, 0x12

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "coinSign"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v3, 0x11

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "recalled"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v3, 0x10

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "consumeType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v3, 0xf

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "status"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v3, 0xe

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "reference"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v3, 0xd

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "additionalData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v3, 0xc

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "riskTags"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v3, 0xb

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "letter"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v3, 0xa

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "notifiedUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v3, 0x9

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "hostId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v3, 0x8

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "extData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto :goto_0

    :cond_21
    const/4 v3, 0x7

    goto :goto_0

    :sswitch_22
    const-string v0, "localPrivateQuestions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto :goto_0

    :cond_22
    const/4 v3, 0x6

    goto :goto_0

    :sswitch_23
    const-string v0, "action"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v3, 0x5

    goto :goto_0

    :sswitch_24
    const-string v0, "recalledHint"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v3, 0x4

    goto :goto_0

    :sswitch_25
    const-string v0, "localRedPacketType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_26
    const-string v0, "referenceMsgId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_27
    const-string v0, "otherUser"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto :goto_0

    :cond_27
    move v3, v2

    goto :goto_0

    :sswitch_28
    const-string v0, "accessory"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_0

    :cond_28
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
        -0x7e10b0ee -> :sswitch_28
        -0x73fb2905 -> :sswitch_27
        -0x723d840f -> :sswitch_26
        -0x6f376a58 -> :sswitch_25
        -0x583821e9 -> :sswitch_24
        -0x54d081ca -> :sswitch_23
        -0x4eaf536b -> :sswitch_22
        -0x4de20a95 -> :sswitch_21
        -0x4835cb1d -> :sswitch_20
        -0x46eedcb0 -> :sswitch_1f
        -0x41eedbda -> :sswitch_1e
        -0x4102ec78 -> :sswitch_1d
        -0x3a150f8f -> :sswitch_1c
        -0x3724c0b5 -> :sswitch_1b
        -0x3532300e -> :sswitch_1a
        -0x33375eaa -> :sswitch_19
        -0x306b3c90 -> :sswitch_18
        -0x2ab5b012 -> :sswitch_17
        -0x2a45740b -> :sswitch_16
        -0x227c3a97 -> :sswitch_15
        -0x1d336e2b -> :sswitch_14
        -0x19e5122c -> :sswitch_13
        -0x11a6edb0 -> :sswitch_12
        -0x11eca41 -> :sswitch_11
        0xd1b -> :sswitch_10
        0x2e7a5e -> :sswitch_f
        0x62343ad -> :sswitch_e
        0x62343bc -> :sswitch_d
        0x62f6fe4 -> :sswitch_c
        0x653f2b3 -> :sswitch_b
        0x6ac9171 -> :sswitch_a
        0x19432e1c -> :sswitch_9
        0x2c0b7d03 -> :sswitch_8
        0x33981b4c -> :sswitch_7
        0x4b35cf62 -> :sswitch_6
        0x501062cb -> :sswitch_5
        0x5018025b -> :sswitch_4
        0x55026a39 -> :sswitch_3
        0x5582bc23 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x7d5c7fad -> :sswitch_0
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/Message$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/Message;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
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
    const-string p0, "createdTime"

    .line 11
    .line 12
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const-string p0, "otherUser"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->GROUP_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    const-string p0, "media"

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    .line 56
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 60
    .line 61
    if-eqz p0, :cond_3

    .line 62
    .line 63
    const-string p0, "sentFrom"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 69
    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 71
    .line 72
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 73
    .line 74
    .line 75
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 76
    .line 77
    if-eqz p0, :cond_4

    .line 78
    .line 79
    const-string p0, "reference"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageReference;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 87
    .line 88
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 89
    .line 90
    .line 91
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz p0, :cond_5

    .line 94
    .line 95
    const-string p0, "owner"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 105
    .line 106
    .line 107
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 108
    .line 109
    if-eqz p0, :cond_6

    .line 110
    .line 111
    const-string p0, "location"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/p1/mobile/putong/data/MessageLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    .line 118
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 119
    .line 120
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 121
    .line 122
    .line 123
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 124
    .line 125
    if-eqz p0, :cond_7

    .line 126
    .line 127
    const-string v0, "recalled"

    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 134
    .line 135
    .line 136
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz p0, :cond_8

    .line 139
    .line 140
    const-string v0, "value"

    .line 141
    .line 142
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 146
    .line 147
    if-eqz p0, :cond_9

    .line 148
    .line 149
    const-string p0, "accessory"

    .line 150
    .line 151
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAccessory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 155
    .line 156
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 157
    .line 158
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 159
    .line 160
    .line 161
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 162
    .line 163
    if-eqz p0, :cond_a

    .line 164
    .line 165
    const-string p0, "call"

    .line 166
    .line 167
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sget-object p0, Lcom/p1/mobile/putong/core/data/CallRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 171
    .line 172
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 173
    .line 174
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 175
    .line 176
    .line 177
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 178
    .line 179
    if-eqz p0, :cond_b

    .line 180
    .line 181
    const-string p0, "localPrivateQuestions"

    .line 182
    .line 183
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 187
    .line 188
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 189
    .line 190
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 191
    .line 192
    .line 193
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 194
    .line 195
    if-eqz p0, :cond_c

    .line 196
    .line 197
    const-string p0, "letter"

    .line 198
    .line 199
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    sget-object p0, Lcom/p1/mobile/putong/core/data/Letter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 203
    .line 204
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 205
    .line 206
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 207
    .line 208
    .line 209
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 210
    .line 211
    if-eqz p0, :cond_d

    .line 212
    .line 213
    const-string v0, "recalledReason"

    .line 214
    .line 215
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 219
    .line 220
    if-eqz p0, :cond_e

    .line 221
    .line 222
    const-string v0, "recalledHint"

    .line 223
    .line 224
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 228
    .line 229
    if-eqz p0, :cond_f

    .line 230
    .line 231
    const-string p0, "msgType"

    .line 232
    .line 233
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 237
    .line 238
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 239
    .line 240
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 241
    .line 242
    .line 243
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 244
    .line 245
    if-eqz p0, :cond_10

    .line 246
    .line 247
    const-string p0, "additionalData"

    .line 248
    .line 249
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 253
    .line 254
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 255
    .line 256
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 257
    .line 258
    .line 259
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 260
    .line 261
    if-eqz p0, :cond_11

    .line 262
    .line 263
    const-string p0, "commentInfo"

    .line 264
    .line 265
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    sget-object p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 269
    .line 270
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 271
    .line 272
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 273
    .line 274
    .line 275
    :cond_11
    const-string p0, "likes"

    .line 276
    .line 277
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 278
    .line 279
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 280
    .line 281
    .line 282
    const-string p0, "liked"

    .line 283
    .line 284
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 285
    .line 286
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 287
    .line 288
    .line 289
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 290
    .line 291
    if-eqz p0, :cond_12

    .line 292
    .line 293
    const-string v0, "parentCommentId"

    .line 294
    .line 295
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 299
    .line 300
    if-eqz p0, :cond_13

    .line 301
    .line 302
    const-string p0, "subCommentIds"

    .line 303
    .line 304
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 308
    .line 309
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 310
    .line 311
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 312
    .line 313
    .line 314
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 315
    .line 316
    if-eqz p0, :cond_14

    .line 317
    .line 318
    const-string v0, "moreSubComments"

    .line 319
    .line 320
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    :cond_14
    const-string p0, "isBottom"

    .line 324
    .line 325
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 326
    .line 327
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 328
    .line 329
    .line 330
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 331
    .line 332
    if-eqz p0, :cond_15

    .line 333
    .line 334
    const-string v0, "msgData"

    .line 335
    .line 336
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 340
    .line 341
    if-eqz p0, :cond_16

    .line 342
    .line 343
    const-string p0, "settings"

    .line 344
    .line 345
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 349
    .line 350
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 351
    .line 352
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 353
    .line 354
    .line 355
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 356
    .line 357
    if-eqz p0, :cond_17

    .line 358
    .line 359
    const-string p0, "channel"

    .line 360
    .line 361
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 365
    .line 366
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 367
    .line 368
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 369
    .line 370
    .line 371
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 372
    .line 373
    if-eqz p0, :cond_18

    .line 374
    .line 375
    const-string p0, "notifiedUsers"

    .line 376
    .line 377
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 381
    .line 382
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 383
    .line 384
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 385
    .line 386
    .line 387
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 388
    .line 389
    if-eqz p0, :cond_19

    .line 390
    .line 391
    const-string p0, "status"

    .line 392
    .line 393
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 397
    .line 398
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 399
    .line 400
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 401
    .line 402
    .line 403
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 404
    .line 405
    if-eqz p0, :cond_1a

    .line 406
    .line 407
    const-string v0, "referenceMsgId"

    .line 408
    .line 409
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 413
    .line 414
    if-eqz p0, :cond_1b

    .line 415
    .line 416
    const-string v0, "hostId"

    .line 417
    .line 418
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 422
    .line 423
    if-eqz p0, :cond_1c

    .line 424
    .line 425
    const-string v0, "localRedPacketType"

    .line 426
    .line 427
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    :cond_1c
    const-string p0, "isNewComment"

    .line 431
    .line 432
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 433
    .line 434
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 435
    .line 436
    .line 437
    const-string p0, "needRead"

    .line 438
    .line 439
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 440
    .line 441
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 442
    .line 443
    .line 444
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 445
    .line 446
    if-eqz p0, :cond_1d

    .line 447
    .line 448
    const-string p0, "extData"

    .line 449
    .line 450
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 454
    .line 455
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 456
    .line 457
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 458
    .line 459
    .line 460
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 461
    .line 462
    if-eqz p0, :cond_1e

    .line 463
    .line 464
    const-string v0, "consumeType"

    .line 465
    .line 466
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 470
    .line 471
    if-eqz p0, :cond_1f

    .line 472
    .line 473
    const-string v0, "coinSign"

    .line 474
    .line 475
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 479
    .line 480
    if-eqz p0, :cond_20

    .line 481
    .line 482
    const-string v0, "action"

    .line 483
    .line 484
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 488
    .line 489
    if-eqz p0, :cond_21

    .line 490
    .line 491
    const-string p0, "riskTags"

    .line 492
    .line 493
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 494
    .line 495
    .line 496
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 497
    .line 498
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 499
    .line 500
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 501
    .line 502
    .line 503
    :cond_21
    const-string p0, "secondSend"

    .line 504
    .line 505
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 506
    .line 507
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 508
    .line 509
    .line 510
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 511
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Message$2;->serializeFields(Lcom/p1/mobile/putong/core/data/Message;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
