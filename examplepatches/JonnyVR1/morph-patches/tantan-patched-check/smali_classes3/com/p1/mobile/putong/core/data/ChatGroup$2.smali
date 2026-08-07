.class Lcom/p1/mobile/putong/core/data/ChatGroup$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup$2;->newInstance()Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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
    const-string p0, "silence"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "joinCondition"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "creatorUserId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "upgraded"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "memberLimit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "memberCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "memberIds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "publicId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "localConId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "groupTopic"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "permissions"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "localMembersLoaded"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "adminLimit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "inModeration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "onlineCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "announcement"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "token"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "category"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "type"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "tags"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "name"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "id"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "expiredTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "ownerUserId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "joinRemainedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "adminUserIds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "createdTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "updatedTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "avatars"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto :goto_0

    :cond_1c
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_1d
    const-string p0, "status"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto :goto_0

    :cond_1d
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_1e
    const-string p0, "source"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto :goto_0

    :cond_1e
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_1f
    const-string p0, "punishment"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto :goto_0

    :cond_1f
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_20
    const-string p0, "memberStatistics"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto :goto_0

    :cond_20
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_21
    const-string p0, "description"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto :goto_0

    :cond_21
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_22
    const-string p0, "shareToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto :goto_0

    :cond_22
    move v2, v1

    goto :goto_0

    :sswitch_23
    const-string p0, "duration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_0

    :cond_23
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    return v1

    .line 4
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/JoinCondition;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    return v1

    .line 5
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    return v1

    .line 6
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    return v1

    .line 7
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    return v1

    .line 8
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    return v1

    .line 9
    :pswitch_6
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    return v1

    .line 11
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    return v1

    .line 12
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    return v1

    .line 13
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    return v1

    .line 15
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/core/data/Permissions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/Permissions;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    return v1

    .line 17
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    return v1

    .line 18
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    return v1

    .line 19
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/core/data/InModeration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/InModeration;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    return v1

    .line 21
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    return v1

    .line 22
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    return v1

    .line 23
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    return v1

    .line 24
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    return v1

    .line 26
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    return v1

    .line 27
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    return v1

    .line 29
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    return v1

    .line 30
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    return v0

    .line 31
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    return v1

    .line 32
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    return v1

    .line 33
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    return v1

    .line 34
    :pswitch_19
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    return v1

    .line 36
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    return v1

    .line 37
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    return v1

    .line 38
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_PICTURE:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    return v1

    .line 40
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    return v1

    .line 41
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    return v1

    .line 42
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPunishment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 43
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatPunishment;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    return v1

    .line 44
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    return v1

    .line 46
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    return v1

    .line 47
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    return v1

    .line 48
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    return v1

    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_23
        -0x6b2f72a6 -> :sswitch_22
        -0x66ca7c04 -> :sswitch_21
        -0x3f9fe0a3 -> :sswitch_20
        -0x3d3e404d -> :sswitch_1f
        -0x356f97e5 -> :sswitch_1e
        -0x3532300e -> :sswitch_1d
        -0x25da95c6 -> :sswitch_1c
        -0x21f62dd8 -> :sswitch_1b
        -0x1d336e2b -> :sswitch_1a
        -0x1bcf5762 -> :sswitch_19
        -0x1492903e -> :sswitch_18
        -0xb5e0527 -> :sswitch_17
        -0x583ac6e -> :sswitch_16
        0xd1b -> :sswitch_15
        0x337a8b -> :sswitch_14
        0x363419 -> :sswitch_13
        0x368f3a -> :sswitch_12
        0x302bcfe -> :sswitch_11
        0x696b9f9 -> :sswitch_10
        0x9584d47 -> :sswitch_f
        0x1a1da67c -> :sswitch_e
        0x20c5642b -> :sswitch_d
        0x27f311ac -> :sswitch_c
        0x34f8e4d3 -> :sswitch_b
        0x4392f484 -> :sswitch_a
        0x4bd41df0 -> :sswitch_9
        0x4c284d92 -> :sswitch_8
        0x4d1ac564 -> :sswitch_7
        0x500055be -> :sswitch_6
        0x50f26695 -> :sswitch_5
        0x516e6141 -> :sswitch_4
        0x54daa9c8 -> :sswitch_3
        0x5790c992 -> :sswitch_2
        0x65bedf11 -> :sswitch_1
        0x7cbaf4a1 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ChatGroup$2;->parseField(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, -0x1

    .line 11
    sparse-switch v0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string v0, "silence"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v3, 0x23

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "joinCondition"

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v3, 0x22

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "creatorUserId"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v3, 0x21

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "upgraded"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v3, 0x20

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "memberLimit"

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v3, 0x1f

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "memberCount"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v3, 0x1e

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "memberIds"

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v3, 0x1d

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "publicId"

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v3, 0x1c

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "localConId"

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v3, 0x1b

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "groupTopic"

    .line 143
    .line 144
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v3, 0x1a

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "permissions"

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v3, 0x19

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "localMembersLoaded"

    .line 171
    .line 172
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v3, 0x18

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string v0, "adminLimit"

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v3, 0x17

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string v0, "inModeration"

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v3, 0x16

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string v0, "onlineCount"

    .line 213
    .line 214
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v3, 0x15

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string v0, "announcement"

    .line 227
    .line 228
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_f

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v3, 0x14

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string v0, "token"

    .line 241
    .line 242
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_10

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v3, 0x13

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string v0, "category"

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-nez v0, :cond_11

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v3, 0x12

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string v0, "type"

    .line 269
    .line 270
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_12

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v3, 0x11

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string v0, "tags"

    .line 283
    .line 284
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-nez v0, :cond_13

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_13
    const/16 v3, 0x10

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string v0, "name"

    .line 297
    .line 298
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    if-nez v0, :cond_14

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_14
    const/16 v3, 0xf

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string v0, "id"

    .line 311
    .line 312
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-nez v0, :cond_15

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_15
    const/16 v3, 0xe

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string v0, "expiredTime"

    .line 325
    .line 326
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    if-nez v0, :cond_16

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :cond_16
    const/16 v3, 0xd

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string v0, "ownerUserId"

    .line 339
    .line 340
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-nez v0, :cond_17

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_17
    const/16 v3, 0xc

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string v0, "joinRemainedTime"

    .line 353
    .line 354
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-nez v0, :cond_18

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :cond_18
    const/16 v3, 0xb

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string v0, "adminUserIds"

    .line 367
    .line 368
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    if-nez v0, :cond_19

    .line 373
    .line 374
    goto/16 :goto_0

    .line 375
    .line 376
    :cond_19
    const/16 v3, 0xa

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string v0, "createdTime"

    .line 381
    .line 382
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    if-nez v0, :cond_1a

    .line 387
    .line 388
    goto/16 :goto_0

    .line 389
    .line 390
    :cond_1a
    const/16 v3, 0x9

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string v0, "updatedTime"

    .line 395
    .line 396
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    if-nez v0, :cond_1b

    .line 401
    .line 402
    goto/16 :goto_0

    .line 403
    .line 404
    :cond_1b
    const/16 v3, 0x8

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string v0, "avatars"

    .line 409
    .line 410
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-nez v0, :cond_1c

    .line 415
    .line 416
    goto :goto_0

    .line 417
    :cond_1c
    const/4 v3, 0x7

    .line 418
    goto :goto_0

    .line 419
    :sswitch_1d
    const-string v0, "status"

    .line 420
    .line 421
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    if-nez v0, :cond_1d

    .line 426
    .line 427
    goto :goto_0

    .line 428
    :cond_1d
    const/4 v3, 0x6

    .line 429
    goto :goto_0

    .line 430
    :sswitch_1e
    const-string v0, "source"

    .line 431
    .line 432
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    move-result v0

    .line 436
    if-nez v0, :cond_1e

    .line 437
    .line 438
    goto :goto_0

    .line 439
    :cond_1e
    const/4 v3, 0x5

    .line 440
    goto :goto_0

    .line 441
    :sswitch_1f
    const-string v0, "punishment"

    .line 442
    .line 443
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    if-nez v0, :cond_1f

    .line 448
    .line 449
    goto :goto_0

    .line 450
    :cond_1f
    const/4 v3, 0x4

    .line 451
    goto :goto_0

    .line 452
    :sswitch_20
    const-string v0, "memberStatistics"

    .line 453
    .line 454
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    move-result v0

    .line 458
    if-nez v0, :cond_20

    .line 459
    .line 460
    goto :goto_0

    .line 461
    :cond_20
    const/4 v3, 0x3

    .line 462
    goto :goto_0

    .line 463
    :sswitch_21
    const-string v0, "description"

    .line 464
    .line 465
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    if-nez v0, :cond_21

    .line 470
    .line 471
    goto :goto_0

    .line 472
    :cond_21
    const/4 v3, 0x2

    .line 473
    goto :goto_0

    .line 474
    :sswitch_22
    const-string v0, "shareToken"

    .line 475
    .line 476
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    if-nez v0, :cond_22

    .line 481
    .line 482
    goto :goto_0

    .line 483
    :cond_22
    move v3, v2

    .line 484
    goto :goto_0

    .line 485
    :sswitch_23
    const-string v0, "duration"

    .line 486
    .line 487
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result v0

    .line 491
    if-nez v0, :cond_23

    .line 492
    .line 493
    goto :goto_0

    .line 494
    :cond_23
    move v3, v1

    .line 495
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 496
    .line 497
    .line 498
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 499
    .line 500
    .line 501
    move-result p0

    .line 502
    return p0

    .line 503
    :pswitch_0
    return v2

    .line 504
    :pswitch_1
    return v1

    .line 505
    :pswitch_2
    return v2

    .line 506
    nop

    .line 507
    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_23
        -0x6b2f72a6 -> :sswitch_22
        -0x66ca7c04 -> :sswitch_21
        -0x3f9fe0a3 -> :sswitch_20
        -0x3d3e404d -> :sswitch_1f
        -0x356f97e5 -> :sswitch_1e
        -0x3532300e -> :sswitch_1d
        -0x25da95c6 -> :sswitch_1c
        -0x21f62dd8 -> :sswitch_1b
        -0x1d336e2b -> :sswitch_1a
        -0x1bcf5762 -> :sswitch_19
        -0x1492903e -> :sswitch_18
        -0xb5e0527 -> :sswitch_17
        -0x583ac6e -> :sswitch_16
        0xd1b -> :sswitch_15
        0x337a8b -> :sswitch_14
        0x363419 -> :sswitch_13
        0x368f3a -> :sswitch_12
        0x302bcfe -> :sswitch_11
        0x696b9f9 -> :sswitch_10
        0x9584d47 -> :sswitch_f
        0x1a1da67c -> :sswitch_e
        0x20c5642b -> :sswitch_d
        0x27f311ac -> :sswitch_c
        0x34f8e4d3 -> :sswitch_b
        0x4392f484 -> :sswitch_a
        0x4bd41df0 -> :sswitch_9
        0x4c284d92 -> :sswitch_8
        0x4d1ac564 -> :sswitch_7
        0x500055be -> :sswitch_6
        0x50f26695 -> :sswitch_5
        0x516e6141 -> :sswitch_4
        0x54daa9c8 -> :sswitch_3
        0x5790c992 -> :sswitch_2
        0x65bedf11 -> :sswitch_1
        0x7cbaf4a1 -> :sswitch_0
    .end sparse-switch

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
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 507
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ChatGroup$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "name"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string p0, "avatars"

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_PICTURE:Lcom/tantanapp/common/data/JsonAdapter;

    .line 31
    .line 32
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string v0, "announcement"

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string p0, "status"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 57
    .line 58
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string v1, "localConId"

    .line 66
    .line 67
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    const-string v1, "ownerUserId"

    .line 75
    .line 76
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    const-string p0, "adminUserIds"

    .line 84
    .line 85
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 89
    .line 90
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 91
    .line 92
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 93
    .line 94
    .line 95
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz p0, :cond_8

    .line 98
    .line 99
    const-string v1, "creatorUserId"

    .line 100
    .line 101
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 105
    .line 106
    if-eqz p0, :cond_9

    .line 107
    .line 108
    const-string p0, "type"

    .line 109
    .line 110
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 114
    .line 115
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 116
    .line 117
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 118
    .line 119
    .line 120
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 121
    .line 122
    if-eqz p0, :cond_a

    .line 123
    .line 124
    const-string p0, "memberIds"

    .line 125
    .line 126
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 130
    .line 131
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 132
    .line 133
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 134
    .line 135
    .line 136
    :cond_a
    const-string p0, "memberCount"

    .line 137
    .line 138
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 139
    .line 140
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 141
    .line 142
    .line 143
    const-string p0, "memberLimit"

    .line 144
    .line 145
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 146
    .line 147
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 151
    .line 152
    if-eqz p0, :cond_b

    .line 153
    .line 154
    const-string p0, "memberStatistics"

    .line 155
    .line 156
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 160
    .line 161
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 162
    .line 163
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 164
    .line 165
    .line 166
    :cond_b
    const-string p0, "createdTime"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 174
    .line 175
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 180
    .line 181
    .line 182
    const-string v1, "updatedTime"

    .line 183
    .line 184
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 188
    .line 189
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 194
    .line 195
    .line 196
    const-string p0, "localMembersLoaded"

    .line 197
    .line 198
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 199
    .line 200
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 204
    .line 205
    if-eqz p0, :cond_c

    .line 206
    .line 207
    const-string v1, "publicId"

    .line 208
    .line 209
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 213
    .line 214
    if-eqz p0, :cond_d

    .line 215
    .line 216
    const-string p0, "category"

    .line 217
    .line 218
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 222
    .line 223
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 224
    .line 225
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 226
    .line 227
    .line 228
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 229
    .line 230
    if-eqz p0, :cond_e

    .line 231
    .line 232
    const-string v1, "description"

    .line 233
    .line 234
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 238
    .line 239
    if-eqz p0, :cond_f

    .line 240
    .line 241
    const-string p0, "tags"

    .line 242
    .line 243
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 247
    .line 248
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 249
    .line 250
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 251
    .line 252
    .line 253
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 254
    .line 255
    if-eqz p0, :cond_10

    .line 256
    .line 257
    const-string p0, "silence"

    .line 258
    .line 259
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 263
    .line 264
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 265
    .line 266
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 267
    .line 268
    .line 269
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 270
    .line 271
    if-eqz p0, :cond_11

    .line 272
    .line 273
    const-string p0, "punishment"

    .line 274
    .line 275
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPunishment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 279
    .line 280
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 281
    .line 282
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 283
    .line 284
    .line 285
    :cond_11
    const-string p0, "expiredTime"

    .line 286
    .line 287
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 288
    .line 289
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 290
    .line 291
    .line 292
    const-string p0, "joinRemainedTime"

    .line 293
    .line 294
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 295
    .line 296
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 297
    .line 298
    .line 299
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 300
    .line 301
    if-eqz p0, :cond_12

    .line 302
    .line 303
    const-string v1, "source"

    .line 304
    .line 305
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 309
    .line 310
    if-eqz p0, :cond_13

    .line 311
    .line 312
    const-string v1, "token"

    .line 313
    .line 314
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 318
    .line 319
    if-eqz p0, :cond_14

    .line 320
    .line 321
    const-string p0, "groupTopic"

    .line 322
    .line 323
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 327
    .line 328
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 329
    .line 330
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 331
    .line 332
    .line 333
    :cond_14
    const-string p0, "upgraded"

    .line 334
    .line 335
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 336
    .line 337
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 338
    .line 339
    .line 340
    const-string p0, "duration"

    .line 341
    .line 342
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 343
    .line 344
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 345
    .line 346
    .line 347
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 348
    .line 349
    if-eqz p0, :cond_15

    .line 350
    .line 351
    const-string p0, "joinCondition"

    .line 352
    .line 353
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    sget-object p0, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 357
    .line 358
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 359
    .line 360
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 361
    .line 362
    .line 363
    :cond_15
    const-string p0, "onlineCount"

    .line 364
    .line 365
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 366
    .line 367
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 368
    .line 369
    .line 370
    const-string p0, "adminLimit"

    .line 371
    .line 372
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 373
    .line 374
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 375
    .line 376
    .line 377
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 378
    .line 379
    if-eqz p0, :cond_16

    .line 380
    .line 381
    const-string p0, "permissions"

    .line 382
    .line 383
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    sget-object p0, Lcom/p1/mobile/putong/core/data/Permissions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 387
    .line 388
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 389
    .line 390
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 391
    .line 392
    .line 393
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 394
    .line 395
    if-eqz p0, :cond_17

    .line 396
    .line 397
    const-string p0, "inModeration"

    .line 398
    .line 399
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    sget-object p0, Lcom/p1/mobile/putong/core/data/InModeration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 403
    .line 404
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 405
    .line 406
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 407
    .line 408
    .line 409
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 410
    .line 411
    if-eqz p0, :cond_18

    .line 412
    .line 413
    const-string p1, "shareToken"

    .line 414
    .line 415
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    :cond_18
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 419
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroup$2;->serializeFields(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
