.class Lcom/p1/mobile/putong/data/PushMessageCustom$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/PushMessageCustom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/PushMessageCustom;",
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
    const-class p0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/PushMessageCustom;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PushMessageCustom;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PushMessageCustom$2;->newInstance()Lcom/p1/mobile/putong/data/PushMessageCustom;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PushMessageCustom;",
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

    const/4 p5, 0x0

    const/4 p6, 0x1

    const/4 v0, -0x1

    sparse-switch p0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string p0, "isGreet"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v0, 0xbd

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "canUserStartLive"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v0, 0xbc

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "USSBusiness"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v0, 0xbb

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "callerDeviceId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v0, 0xba

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "platform"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v0, 0xb9

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "matchTopic"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v0, 0xb8

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "msgSingleUpdateIgnoreConvStatus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v0, 0xb7

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "bellType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v0, 0xb6

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "merchandiseId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v0, 0xb5

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "creationData"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v0, 0xb4

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "receiveUserID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v0, 0xb3

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "ruleKey"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v0, 0xb2

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "voicePartnerFinderId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v0, 0xb1

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "questionIdSelected"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v0, 0xb0

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "queryOtherUserToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v0, 0xaf

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "NewToast"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v0, 0xae

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "liveMode"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v0, 0xad

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "extraPrivileges"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v0, 0xac

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "likedPopuserCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v0, 0xab

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "channelNameV2"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v0, 0xaa

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "canShowNotification"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v0, 0xa9

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "rtcChannelWaitingTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v0, 0xa8

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "buzzToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v0, 0xa7

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "rsStateReceiverToSender"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v0, 0xa6

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "countDownSeconds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v0, 0xa5

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "big_pic_url"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v0, 0xa4

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "birthday"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v0, 0xa3

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "needReact"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v0, 0xa2

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "liveTitle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v0, 0xa1

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "content"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v0, 0xa0

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "fitReason"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v0, 0x9f

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "USSToast"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v0, 0x9e

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "matched"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v0, 0x9d

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "channel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v0, 0x9c

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "callerToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v0, 0x9b

    goto/16 :goto_0

    :sswitch_23
    const-string p0, "pushChannel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v0, 0x9a

    goto/16 :goto_0

    :sswitch_24
    const-string p0, "contractId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v0, 0x99

    goto/16 :goto_0

    :sswitch_25
    const-string p0, "couponDesc"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v0, 0x98

    goto/16 :goto_0

    :sswitch_26
    const-string p0, "videoPartnerFinderId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v0, 0x97

    goto/16 :goto_0

    :sswitch_27
    const-string p0, "frozenDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v0, 0x96

    goto/16 :goto_0

    :sswitch_28
    const-string p0, "USSPage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v0, 0x95

    goto/16 :goto_0

    :sswitch_29
    const-string p0, "videoChatId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v0, 0x94

    goto/16 :goto_0

    :sswitch_2a
    const-string p0, "pullStreamUrl"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v0, 0x93

    goto/16 :goto_0

    :sswitch_2b
    const-string p0, "userMatched"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v0, 0x92

    goto/16 :goto_0

    :sswitch_2c
    const-string p0, "rtcProvider"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v0, 0x91

    goto/16 :goto_0

    :sswitch_2d
    const-string p0, "avatarState"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v0, 0x90

    goto/16 :goto_0

    :sswitch_2e
    const-string p0, "buttonText"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v0, 0x8f

    goto/16 :goto_0

    :sswitch_2f
    const-string p0, "calleeToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v0, 0x8e

    goto/16 :goto_0

    :sswitch_30
    const-string p0, "groupId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v0, 0x8d

    goto/16 :goto_0

    :sswitch_31
    const-string p0, "distance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v0, 0x8c

    goto/16 :goto_0

    :sswitch_32
    const-string p0, "greetID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v0, 0x8b

    goto/16 :goto_0

    :sswitch_33
    const-string p0, "maskMode"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v0, 0x8a

    goto/16 :goto_0

    :sswitch_34
    const-string p0, "channelName"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v0, 0x89

    goto/16 :goto_0

    :sswitch_35
    const-string p0, "total"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v0, 0x88

    goto/16 :goto_0

    :sswitch_36
    const-string p0, "title"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v0, 0x87

    goto/16 :goto_0

    :sswitch_37
    const-string p0, "tagID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v0, 0x86

    goto/16 :goto_0

    :sswitch_38
    const-string p0, "tabId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v0, 0x85

    goto/16 :goto_0

    :sswitch_39
    const-string p0, "state"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v0, 0x84

    goto/16 :goto_0

    :sswitch_3a
    const-string p0, "stage"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v0, 0x83

    goto/16 :goto_0

    :sswitch_3b
    const-string p0, "score"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v0, 0x82

    goto/16 :goto_0

    :sswitch_3c
    const-string p0, "scene"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto/16 :goto_0

    :cond_3c
    const/16 v0, 0x81

    goto/16 :goto_0

    :sswitch_3d
    const-string p0, "price"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3d

    goto/16 :goto_0

    :cond_3d
    const/16 v0, 0x80

    goto/16 :goto_0

    :sswitch_3e
    const-string p0, "msgId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    goto/16 :goto_0

    :cond_3e
    const/16 v0, 0x7f

    goto/16 :goto_0

    :sswitch_3f
    const-string p0, "image"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3f

    goto/16 :goto_0

    :cond_3f
    const/16 v0, 0x7e

    goto/16 :goto_0

    :sswitch_40
    const-string p0, "extra"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_40

    goto/16 :goto_0

    :cond_40
    const/16 v0, 0x7d

    goto/16 :goto_0

    :sswitch_41
    const-string p0, "emoji"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_41

    goto/16 :goto_0

    :cond_41
    const/16 v0, 0x7c

    goto/16 :goto_0

    :sswitch_42
    const-string p0, "dates"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    goto/16 :goto_0

    :cond_42
    const/16 v0, 0x7b

    goto/16 :goto_0

    :sswitch_43
    const-string p0, "bgImg"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    goto/16 :goto_0

    :cond_43
    const/16 v0, 0x7a

    goto/16 :goto_0

    :sswitch_44
    const-string p0, "appId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_44

    goto/16 :goto_0

    :cond_44
    const/16 v0, 0x79

    goto/16 :goto_0

    :sswitch_45
    const-string p0, "added"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_45

    goto/16 :goto_0

    :cond_45
    const/16 v0, 0x78

    goto/16 :goto_0

    :sswitch_46
    const-string p0, "nickname"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_46

    goto/16 :goto_0

    :cond_46
    const/16 v0, 0x77

    goto/16 :goto_0

    :sswitch_47
    const-string p0, "timestamp"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_47

    goto/16 :goto_0

    :cond_47
    const/16 v0, 0x76

    goto/16 :goto_0

    :sswitch_48
    const-string p0, "bellNotShowStayTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    goto/16 :goto_0

    :cond_48
    const/16 v0, 0x75

    goto/16 :goto_0

    :sswitch_49
    const-string p0, "category"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_49

    goto/16 :goto_0

    :cond_49
    const/16 v0, 0x74

    goto/16 :goto_0

    :sswitch_4a
    const-string p0, "eventName"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4a

    goto/16 :goto_0

    :cond_4a
    const/16 v0, 0x73

    goto/16 :goto_0

    :sswitch_4b
    const-string p0, "type"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4b

    goto/16 :goto_0

    :cond_4b
    const/16 v0, 0x72

    goto/16 :goto_0

    :sswitch_4c
    const-string p0, "text"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4c

    goto/16 :goto_0

    :cond_4c
    const/16 v0, 0x71

    goto/16 :goto_0

    :sswitch_4d
    const-string p0, "tag3"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4d

    goto/16 :goto_0

    :cond_4d
    const/16 v0, 0x70

    goto/16 :goto_0

    :sswitch_4e
    const-string p0, "tag2"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4e

    goto/16 :goto_0

    :cond_4e
    const/16 v0, 0x6f

    goto/16 :goto_0

    :sswitch_4f
    const-string p0, "tag1"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4f

    goto/16 :goto_0

    :cond_4f
    const/16 v0, 0x6e

    goto/16 :goto_0

    :sswitch_50
    const-string p0, "name"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_50

    goto/16 :goto_0

    :cond_50
    const/16 v0, 0x6d

    goto/16 :goto_0

    :sswitch_51
    const-string p0, "mode"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_51

    goto/16 :goto_0

    :cond_51
    const/16 v0, 0x6c

    goto/16 :goto_0

    :sswitch_52
    const-string p0, "link"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_52

    goto/16 :goto_0

    :cond_52
    const/16 v0, 0x6b

    goto/16 :goto_0

    :sswitch_53
    const-string p0, "city"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    goto/16 :goto_0

    :cond_53
    const/16 v0, 0x6a

    goto/16 :goto_0

    :sswitch_54
    const-string p0, "cell"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_54

    goto/16 :goto_0

    :cond_54
    const/16 v0, 0x69

    goto/16 :goto_0

    :sswitch_55
    const-string p0, "url"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    goto/16 :goto_0

    :cond_55
    const/16 v0, 0x68

    goto/16 :goto_0

    :sswitch_56
    const-string p0, "gid"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    goto/16 :goto_0

    :cond_56
    const/16 v0, 0x67

    goto/16 :goto_0

    :sswitch_57
    const-string p0, "ext"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_57

    goto/16 :goto_0

    :cond_57
    const/16 v0, 0x66

    goto/16 :goto_0

    :sswitch_58
    const-string p0, "biz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_58

    goto/16 :goto_0

    :cond_58
    const/16 v0, 0x65

    goto/16 :goto_0

    :sswitch_59
    const-string p0, "age"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_59

    goto/16 :goto_0

    :cond_59
    const/16 v0, 0x64

    goto/16 :goto_0

    :sswitch_5a
    const-string p0, "id"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5a

    goto/16 :goto_0

    :cond_5a
    const/16 v0, 0x63

    goto/16 :goto_0

    :sswitch_5b
    const-string p0, "extremePickShowId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5b

    goto/16 :goto_0

    :cond_5b
    const/16 v0, 0x62

    goto/16 :goto_0

    :sswitch_5c
    const-string p0, "channelToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5c

    goto/16 :goto_0

    :cond_5c
    const/16 v0, 0x61

    goto/16 :goto_0

    :sswitch_5d
    const-string p0, "callback"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5d

    goto/16 :goto_0

    :cond_5d
    const/16 v0, 0x60

    goto/16 :goto_0

    :sswitch_5e
    const-string p0, "queryToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5e

    goto/16 :goto_0

    :cond_5e
    const/16 v0, 0x5f

    goto/16 :goto_0

    :sswitch_5f
    const-string p0, "otherUsers"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5f

    goto/16 :goto_0

    :cond_5f
    const/16 v0, 0x5e

    goto/16 :goto_0

    :sswitch_60
    const-string p0, "insidePool"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_60

    goto/16 :goto_0

    :cond_60
    const/16 v0, 0x5d

    goto/16 :goto_0

    :sswitch_61
    const-string p0, "initialDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_61

    goto/16 :goto_0

    :cond_61
    const/16 v0, 0x5c

    goto/16 :goto_0

    :sswitch_62
    const-string p0, "userName"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_62

    goto/16 :goto_0

    :cond_62
    const/16 v0, 0x5b

    goto/16 :goto_0

    :sswitch_63
    const-string p0, "calleeDeviceId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_63

    goto/16 :goto_0

    :cond_63
    const/16 v0, 0x5a

    goto/16 :goto_0

    :sswitch_64
    const-string p0, "currencySymbol"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    goto/16 :goto_0

    :cond_64
    const/16 v0, 0x59

    goto/16 :goto_0

    :sswitch_65
    const-string p0, "zodiacFitPercent"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_65

    goto/16 :goto_0

    :cond_65
    const/16 v0, 0x58

    goto/16 :goto_0

    :sswitch_66
    const-string p0, "couponId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_66

    goto/16 :goto_0

    :cond_66
    const/16 v0, 0x57

    goto/16 :goto_0

    :sswitch_67
    const-string p0, "subSource"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_67

    goto/16 :goto_0

    :cond_67
    const/16 v0, 0x56

    goto/16 :goto_0

    :sswitch_68
    const-string p0, "mandatory"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_68

    goto/16 :goto_0

    :cond_68
    const/16 v0, 0x55

    goto/16 :goto_0

    :sswitch_69
    const-string p0, "rtcToken"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_69

    goto/16 :goto_0

    :cond_69
    const/16 v0, 0x54

    goto/16 :goto_0

    :sswitch_6a
    const-string p0, "callerTokenV2"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6a

    goto/16 :goto_0

    :cond_6a
    const/16 v0, 0x53

    goto/16 :goto_0

    :sswitch_6b
    const-string p0, "createdTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6b

    goto/16 :goto_0

    :cond_6b
    const/16 v0, 0x52

    goto/16 :goto_0

    :sswitch_6c
    const-string p0, "bellShowStayTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6c

    goto/16 :goto_0

    :cond_6c
    const/16 v0, 0x51

    goto/16 :goto_0

    :sswitch_6d
    const-string p0, "resolutionHeight"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6d

    goto/16 :goto_0

    :cond_6d
    const/16 v0, 0x50

    goto/16 :goto_0

    :sswitch_6e
    const-string p0, "avatars"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6e

    goto/16 :goto_0

    :cond_6e
    const/16 v0, 0x4f

    goto/16 :goto_0

    :sswitch_6f
    const-string p0, "businessType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6f

    goto/16 :goto_0

    :cond_6f
    const/16 v0, 0x4e

    goto/16 :goto_0

    :sswitch_70
    const-string p0, "likedCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_70

    goto/16 :goto_0

    :cond_70
    const/16 v0, 0x4d

    goto/16 :goto_0

    :sswitch_71
    const-string p0, "zodiac"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_71

    goto/16 :goto_0

    :cond_71
    const/16 v0, 0x4c

    goto/16 :goto_0

    :sswitch_72
    const-string p0, "partyId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_72

    goto/16 :goto_0

    :cond_72
    const/16 v0, 0x4b

    goto/16 :goto_0

    :sswitch_73
    const-string p0, "fullScreen"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_73

    goto/16 :goto_0

    :cond_73
    const/16 v0, 0x4a

    goto/16 :goto_0

    :sswitch_74
    const-string p0, "testGroupName"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_74

    goto/16 :goto_0

    :cond_74
    const/16 v0, 0x49

    goto/16 :goto_0

    :sswitch_75
    const-string p0, "vendor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_75

    goto/16 :goto_0

    :cond_75
    const/16 v0, 0x48

    goto/16 :goto_0

    :sswitch_76
    const-string p0, "userId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_76

    goto/16 :goto_0

    :cond_76
    const/16 v0, 0x47

    goto/16 :goto_0

    :sswitch_77
    const-string p0, "unread"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_77

    goto/16 :goto_0

    :cond_77
    const/16 v0, 0x46

    goto/16 :goto_0

    :sswitch_78
    const-string p0, "reaction"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_78

    goto/16 :goto_0

    :cond_78
    const/16 v0, 0x45

    goto/16 :goto_0

    :sswitch_79
    const-string p0, "taskId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_79

    goto/16 :goto_0

    :cond_79
    const/16 v0, 0x44

    goto/16 :goto_0

    :sswitch_7a
    const-string p0, "openingRemark"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7a

    goto/16 :goto_0

    :cond_7a
    const/16 v0, 0x43

    goto/16 :goto_0

    :sswitch_7b
    const-string p0, "status"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7b

    goto/16 :goto_0

    :cond_7b
    const/16 v0, 0x42

    goto/16 :goto_0

    :sswitch_7c
    const-string p0, "source"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7c

    goto/16 :goto_0

    :cond_7c
    const/16 v0, 0x41

    goto/16 :goto_0

    :sswitch_7d
    const-string p0, "schema"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7d

    goto/16 :goto_0

    :cond_7d
    const/16 v0, 0x40

    goto/16 :goto_0

    :sswitch_7e
    const-string p0, "alertId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7e

    goto/16 :goto_0

    :cond_7e
    const/16 v0, 0x3f

    goto/16 :goto_0

    :sswitch_7f
    const-string p0, "roomId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7f

    goto/16 :goto_0

    :cond_7f
    const/16 v0, 0x3e

    goto/16 :goto_0

    :sswitch_80
    const-string p0, "localNotificationImportance"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_80

    goto/16 :goto_0

    :cond_80
    const/16 v0, 0x3d

    goto/16 :goto_0

    :sswitch_81
    const-string p0, "popupsDisplay"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_81

    goto/16 :goto_0

    :cond_81
    const/16 v0, 0x3c

    goto/16 :goto_0

    :sswitch_82
    const-string p0, "honorGiftCardDetail"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_82

    goto/16 :goto_0

    :cond_82
    const/16 v0, 0x3b

    goto/16 :goto_0

    :sswitch_83
    const-string p0, "broadcastID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_83

    goto/16 :goto_0

    :cond_83
    const/16 v0, 0x3a

    goto/16 :goto_0

    :sswitch_84
    const-string p0, "radioType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_84

    goto/16 :goto_0

    :cond_84
    const/16 v0, 0x39

    goto/16 :goto_0

    :sswitch_85
    const-string p0, "anchorId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_85

    goto/16 :goto_0

    :cond_85
    const/16 v0, 0x38

    goto/16 :goto_0

    :sswitch_86
    const-string p0, "poolID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    goto/16 :goto_0

    :cond_86
    const/16 v0, 0x37

    goto/16 :goto_0

    :sswitch_87
    const-string p0, "triggeredUserId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_87

    goto/16 :goto_0

    :cond_87
    const/16 v0, 0x36

    goto/16 :goto_0

    :sswitch_88
    const-string p0, "provider"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_88

    goto/16 :goto_0

    :cond_88
    const/16 v0, 0x35

    goto/16 :goto_0

    :sswitch_89
    const-string p0, "origin"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_89

    goto/16 :goto_0

    :cond_89
    const/16 v0, 0x34

    goto/16 :goto_0

    :sswitch_8a
    const-string p0, "readUntilId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8a

    goto/16 :goto_0

    :cond_8a
    const/16 v0, 0x33

    goto/16 :goto_0

    :sswitch_8b
    const-string p0, "tracker"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8b

    goto/16 :goto_0

    :cond_8b
    const/16 v0, 0x32

    goto/16 :goto_0

    :sswitch_8c
    const-string p0, "traceId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8c

    goto/16 :goto_0

    :cond_8c
    const/16 v0, 0x31

    goto/16 :goto_0

    :sswitch_8d
    const-string p0, "otherUserName"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8d

    goto/16 :goto_0

    :cond_8d
    const/16 v0, 0x30

    goto/16 :goto_0

    :sswitch_8e
    const-string p0, "liveId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    goto/16 :goto_0

    :cond_8e
    const/16 v0, 0x2f

    goto/16 :goto_0

    :sswitch_8f
    const-string p0, "letter"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8f

    goto/16 :goto_0

    :cond_8f
    const/16 v0, 0x2e

    goto/16 :goto_0

    :sswitch_90
    const-string p0, "topicId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_90

    goto/16 :goto_0

    :cond_90
    const/16 v0, 0x2d

    goto/16 :goto_0

    :sswitch_91
    const-string p0, "recommendText"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_91

    goto/16 :goto_0

    :cond_91
    const/16 v0, 0x2c

    goto/16 :goto_0

    :sswitch_92
    const-string p0, "otherID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_92

    goto/16 :goto_0

    :cond_92
    const/16 v0, 0x2b

    goto/16 :goto_0

    :sswitch_93
    const-string p0, "itemId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_93

    goto/16 :goto_0

    :cond_93
    const/16 v0, 0x2a

    goto/16 :goto_0

    :sswitch_94
    const-string p0, "intent"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_94

    goto/16 :goto_0

    :cond_94
    const/16 v0, 0x29

    goto/16 :goto_0

    :sswitch_95
    const-string p0, "inflow"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_95

    goto/16 :goto_0

    :cond_95
    const/16 v0, 0x28

    goto/16 :goto_0

    :sswitch_96
    const-string p0, "orderId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_96

    goto/16 :goto_0

    :cond_96
    const/16 v0, 0x27

    goto/16 :goto_0

    :sswitch_97
    const-string p0, "giftId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_97

    goto/16 :goto_0

    :cond_97
    const/16 v0, 0x26

    goto/16 :goto_0

    :sswitch_98
    const-string p0, "gender"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_98

    goto/16 :goto_0

    :cond_98
    const/16 v0, 0x25

    goto/16 :goto_0

    :sswitch_99
    const-string p0, "expire"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_99

    goto/16 :goto_0

    :cond_99
    const/16 v0, 0x24

    goto/16 :goto_0

    :sswitch_9a
    const-string p0, "rtcChannel"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9a

    goto/16 :goto_0

    :cond_9a
    const/16 v0, 0x23

    goto/16 :goto_0

    :sswitch_9b
    const-string p0, "caller"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9b

    goto/16 :goto_0

    :cond_9b
    const/16 v0, 0x22

    goto/16 :goto_0

    :sswitch_9c
    const-string p0, "callee"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9c

    goto/16 :goto_0

    :cond_9c
    const/16 v0, 0x21

    goto/16 :goto_0

    :sswitch_9d
    const-string p0, "isPassive"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9d

    goto/16 :goto_0

    :cond_9d
    const/16 v0, 0x20

    goto/16 :goto_0

    :sswitch_9e
    const-string p0, "avatar"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9e

    goto/16 :goto_0

    :cond_9e
    const/16 v0, 0x1f

    goto/16 :goto_0

    :sswitch_9f
    const-string p0, "action"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9f

    goto/16 :goto_0

    :cond_9f
    const/16 v0, 0x1e

    goto/16 :goto_0

    :sswitch_a0
    const-string p0, "messageID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a0

    goto/16 :goto_0

    :cond_a0
    const/16 v0, 0x1d

    goto/16 :goto_0

    :sswitch_a1
    const-string p0, "anchorCallId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a1

    goto/16 :goto_0

    :cond_a1
    const/16 v0, 0x1c

    goto/16 :goto_0

    :sswitch_a2
    const-string p0, "USSVerify"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a2

    goto/16 :goto_0

    :cond_a2
    const/16 v0, 0x1b

    goto/16 :goto_0

    :sswitch_a3
    const-string p0, "productType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a3

    goto/16 :goto_0

    :cond_a3
    const/16 v0, 0x1a

    goto/16 :goto_0

    :sswitch_a4
    const-string p0, "selectedQuestion"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a4

    goto/16 :goto_0

    :cond_a4
    const/16 v0, 0x19

    goto/16 :goto_0

    :sswitch_a5
    const-string p0, "quickchatType"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a5

    goto/16 :goto_0

    :cond_a5
    const/16 v0, 0x18

    goto/16 :goto_0

    :sswitch_a6
    const-string p0, "calleeTokenV2"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a6

    goto/16 :goto_0

    :cond_a6
    const/16 v0, 0x17

    goto/16 :goto_0

    :sswitch_a7
    const-string p0, "endDate"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a7

    goto/16 :goto_0

    :cond_a7
    const/16 v0, 0x16

    goto/16 :goto_0

    :sswitch_a8
    const-string p0, "memojiDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a8

    goto/16 :goto_0

    :cond_a8
    const/16 v0, 0x15

    goto/16 :goto_0

    :sswitch_a9
    const-string p0, "otherUserId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a9

    goto/16 :goto_0

    :cond_a9
    const/16 v0, 0x14

    goto/16 :goto_0

    :sswitch_aa
    const-string p0, "otherUserID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_aa

    goto/16 :goto_0

    :cond_aa
    const/16 v0, 0x13

    goto/16 :goto_0

    :sswitch_ab
    const-string p0, "prolongCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ab

    goto/16 :goto_0

    :cond_ab
    const/16 v0, 0x12

    goto/16 :goto_0

    :sswitch_ac
    const-string p0, "privileges"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ac

    goto/16 :goto_0

    :cond_ac
    const/16 v0, 0x11

    goto/16 :goto_0

    :sswitch_ad
    const-string p0, "USSOption"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ad

    goto/16 :goto_0

    :cond_ad
    const/16 v0, 0x10

    goto/16 :goto_0

    :sswitch_ae
    const-string p0, "conversationId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ae

    goto/16 :goto_0

    :cond_ae
    const/16 v0, 0xf

    goto/16 :goto_0

    :sswitch_af
    const-string p0, "USSIds"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_af

    goto/16 :goto_0

    :cond_af
    const/16 v0, 0xe

    goto/16 :goto_0

    :sswitch_b0
    const-string p0, "localNotificationCategory"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b0

    goto/16 :goto_0

    :cond_b0
    const/16 v0, 0xd

    goto/16 :goto_0

    :sswitch_b1
    const-string p0, "extTabId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b1

    goto/16 :goto_0

    :cond_b1
    const/16 v0, 0xc

    goto/16 :goto_0

    :sswitch_b2
    const-string p0, "USSInsert"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b2

    goto/16 :goto_0

    :cond_b2
    const/16 v0, 0xb

    goto/16 :goto_0

    :sswitch_b3
    const-string p0, "stateID"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b3

    goto/16 :goto_0

    :cond_b3
    const/16 v0, 0xa

    goto/16 :goto_0

    :sswitch_b4
    const-string p0, "channelKey"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b4

    goto/16 :goto_0

    :cond_b4
    const/16 v0, 0x9

    goto/16 :goto_0

    :sswitch_b5
    const-string p0, "resolutionWidth"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b5

    goto/16 :goto_0

    :cond_b5
    const/16 v0, 0x8

    goto/16 :goto_0

    :sswitch_b6
    const-string p0, "noRecommended"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b6

    goto :goto_0

    :cond_b6
    const/4 v0, 0x7

    goto :goto_0

    :sswitch_b7
    const-string p0, "totalDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b7

    goto :goto_0

    :cond_b7
    const/4 v0, 0x6

    goto :goto_0

    :sswitch_b8
    const-string p0, "duration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b8

    goto :goto_0

    :cond_b8
    const/4 v0, 0x5

    goto :goto_0

    :sswitch_b9
    const-string p0, "friendPurpose"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b9

    goto :goto_0

    :cond_b9
    const/4 v0, 0x4

    goto :goto_0

    :sswitch_ba
    const-string p0, "lastActiveTime"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ba

    goto :goto_0

    :cond_ba
    const/4 v0, 0x3

    goto :goto_0

    :sswitch_bb
    const-string p0, "popChange"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bb

    goto :goto_0

    :cond_bb
    const/4 v0, 0x2

    goto :goto_0

    :sswitch_bc
    const-string p0, "subTitle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bc

    goto :goto_0

    :cond_bc
    move v0, p6

    goto :goto_0

    :sswitch_bd
    const-string p0, "startDate"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_bd

    goto :goto_0

    :cond_bd
    move v0, p5

    :goto_0
    const/4 p0, 0x0

    packed-switch v0, :pswitch_data_0

    return p5

    .line 2
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    return p6

    .line 3
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p2

    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne p2, p4, :cond_be

    goto :goto_1

    .line 4
    :cond_be
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    return p6

    .line 5
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    return p6

    .line 6
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    return p6

    .line 7
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    return p6

    .line 8
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    return p6

    .line 9
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    return p6

    .line 10
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    return p6

    .line 11
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    return p6

    .line 12
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    return p6

    .line 13
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    return p6

    .line 14
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    return p6

    .line 15
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    return p6

    .line 16
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    return p6

    .line 17
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    return p6

    .line 18
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    return p6

    .line 19
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    return p6

    .line 20
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    return p6

    .line 21
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    return p6

    .line 22
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    return p6

    .line 23
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p2

    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne p2, p4, :cond_bf

    goto :goto_2

    .line 24
    :cond_bf
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_2
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    return p6

    .line 25
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    return p6

    .line 26
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    return p6

    .line 27
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 28
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    return p6

    .line 29
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    return p6

    .line 30
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    return p6

    .line 31
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    return p6

    .line 32
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    return p6

    .line 33
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    return p6

    .line 34
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    return p6

    .line 35
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    return p6

    .line 36
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    return p6

    .line 37
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    return p6

    .line 38
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    return p6

    .line 39
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    return p6

    .line 40
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    return p6

    .line 41
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    return p6

    .line 42
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    return p6

    .line 43
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    return p6

    .line 44
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    return p6

    .line 45
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    return p6

    .line 46
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    return p6

    .line 47
    :pswitch_2a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    return p6

    .line 48
    :pswitch_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    return p6

    .line 49
    :pswitch_2c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    return p6

    .line 50
    :pswitch_2d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    return p6

    .line 51
    :pswitch_2e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    return p6

    .line 52
    :pswitch_2f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    return p6

    .line 53
    :pswitch_30
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    return p6

    .line 54
    :pswitch_31
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    return p6

    .line 55
    :pswitch_32
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    return p6

    .line 56
    :pswitch_33
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    return p6

    .line 57
    :pswitch_34
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    return p6

    .line 58
    :pswitch_35
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    return p6

    .line 59
    :pswitch_36
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    return p6

    .line 60
    :pswitch_37
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    return p6

    .line 61
    :pswitch_38
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    return p6

    .line 62
    :pswitch_39
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    return p6

    .line 63
    :pswitch_3a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    return p6

    .line 64
    :pswitch_3b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    return p6

    .line 65
    :pswitch_3c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    return p6

    .line 66
    :pswitch_3d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    return p6

    .line 67
    :pswitch_3e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    return p6

    .line 68
    :pswitch_3f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    return p6

    .line 69
    :pswitch_40
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    return p6

    .line 70
    :pswitch_41
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    return p6

    .line 71
    :pswitch_42
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    return p6

    .line 72
    :pswitch_43
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    return p6

    .line 73
    :pswitch_44
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    return p6

    .line 74
    :pswitch_45
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    return p6

    .line 75
    :pswitch_46
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    return p6

    .line 76
    :pswitch_47
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    return p6

    .line 77
    :pswitch_48
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    return p6

    .line 78
    :pswitch_49
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    return p6

    .line 79
    :pswitch_4a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    return p6

    .line 80
    :pswitch_4b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    return p6

    .line 81
    :pswitch_4c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    return p6

    .line 82
    :pswitch_4d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    return p6

    .line 83
    :pswitch_4e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    return p6

    .line 84
    :pswitch_4f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    return p6

    .line 85
    :pswitch_50
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    return p6

    .line 86
    :pswitch_51
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    return p6

    .line 87
    :pswitch_52
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    return p6

    .line 88
    :pswitch_53
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    return p6

    .line 89
    :pswitch_54
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    return p6

    .line 90
    :pswitch_55
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    return p6

    .line 91
    :pswitch_56
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    return p6

    .line 92
    :pswitch_57
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    return p6

    .line 93
    :pswitch_58
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    return p6

    .line 94
    :pswitch_59
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    return p6

    .line 95
    :pswitch_5a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    return p5

    .line 96
    :pswitch_5b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    return p6

    .line 97
    :pswitch_5c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    return p6

    .line 98
    :pswitch_5d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    return p6

    .line 99
    :pswitch_5e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    return p6

    .line 100
    :pswitch_5f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    return p6

    .line 101
    :pswitch_60
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    return p6

    .line 102
    :pswitch_61
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    return p6

    .line 103
    :pswitch_62
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    return p6

    .line 104
    :pswitch_63
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    return p6

    .line 105
    :pswitch_64
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    return p6

    .line 106
    :pswitch_65
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    return p6

    .line 107
    :pswitch_66
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    return p6

    .line 108
    :pswitch_67
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    return p6

    .line 109
    :pswitch_68
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    return p6

    .line 110
    :pswitch_69
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    return p6

    .line 111
    :pswitch_6a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    return p6

    .line 112
    :pswitch_6b
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    return p6

    .line 113
    :pswitch_6c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    return p6

    .line 114
    :pswitch_6d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    return p6

    .line 115
    :pswitch_6e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    return p6

    .line 116
    :pswitch_6f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    return p6

    .line 117
    :pswitch_70
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    return p6

    .line 118
    :pswitch_71
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    return p6

    .line 119
    :pswitch_72
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    return p6

    .line 120
    :pswitch_73
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    return p6

    .line 121
    :pswitch_74
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    return p6

    .line 122
    :pswitch_75
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    return p6

    .line 123
    :pswitch_76
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    return p6

    .line 124
    :pswitch_77
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    return p6

    .line 125
    :pswitch_78
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    return p6

    .line 126
    :pswitch_79
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    return p6

    .line 127
    :pswitch_7a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    return p6

    .line 128
    :pswitch_7b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    return p6

    .line 129
    :pswitch_7c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    return p6

    .line 130
    :pswitch_7d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    return p6

    .line 131
    :pswitch_7e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    return p6

    .line 132
    :pswitch_7f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    return p6

    .line 133
    :pswitch_80
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    return p6

    .line 134
    :pswitch_81
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    return p6

    .line 135
    :pswitch_82
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    return p6

    .line 136
    :pswitch_83
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    return p6

    .line 137
    :pswitch_84
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    return p6

    .line 138
    :pswitch_85
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    return p6

    .line 139
    :pswitch_86
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    return p6

    .line 140
    :pswitch_87
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    return p6

    .line 141
    :pswitch_88
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    return p6

    .line 142
    :pswitch_89
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    return p6

    .line 143
    :pswitch_8a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    return p6

    .line 144
    :pswitch_8b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    return p6

    .line 145
    :pswitch_8c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    return p6

    .line 146
    :pswitch_8d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    return p6

    .line 147
    :pswitch_8e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    return p6

    .line 148
    :pswitch_8f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    return p6

    .line 149
    :pswitch_90
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    return p6

    .line 150
    :pswitch_91
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    return p6

    .line 151
    :pswitch_92
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    return p6

    .line 152
    :pswitch_93
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    return p6

    .line 153
    :pswitch_94
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    return p6

    .line 154
    :pswitch_95
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    return p6

    .line 155
    :pswitch_96
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    return p6

    .line 156
    :pswitch_97
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    return p6

    .line 157
    :pswitch_98
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    return p6

    .line 158
    :pswitch_99
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    return p6

    .line 159
    :pswitch_9a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    return p6

    .line 160
    :pswitch_9b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    return p6

    .line 161
    :pswitch_9c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    return p6

    .line 162
    :pswitch_9d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    return p6

    .line 163
    :pswitch_9e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    return p6

    .line 164
    :pswitch_9f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    return p6

    .line 165
    :pswitch_a0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    return p6

    .line 166
    :pswitch_a1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    return p6

    .line 167
    :pswitch_a2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    return p6

    .line 168
    :pswitch_a3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    return p6

    .line 169
    :pswitch_a4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    return p6

    .line 170
    :pswitch_a5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    return p6

    .line 171
    :pswitch_a6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    return p6

    .line 172
    :pswitch_a7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    return p6

    .line 173
    :pswitch_a8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    return p6

    .line 174
    :pswitch_a9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    return p6

    .line 175
    :pswitch_aa
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    return p6

    .line 176
    :pswitch_ab
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    return p6

    .line 177
    :pswitch_ac
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    return p6

    .line 178
    :pswitch_ad
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    return p6

    .line 179
    :pswitch_ae
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    return p6

    .line 180
    :pswitch_af
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    return p6

    .line 181
    :pswitch_b0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    return p6

    .line 182
    :pswitch_b1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    return p6

    .line 183
    :pswitch_b2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    return p6

    .line 184
    :pswitch_b3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    return p6

    .line 185
    :pswitch_b4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    return p6

    .line 186
    :pswitch_b5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    return p6

    .line 187
    :pswitch_b6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    return p6

    .line 188
    :pswitch_b7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    return p6

    .line 189
    :pswitch_b8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    return p6

    .line 190
    :pswitch_b9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    return p6

    .line 191
    :pswitch_ba
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    return p6

    .line 192
    :pswitch_bb
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    return p6

    .line 193
    :pswitch_bc
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    return p6

    .line 194
    :pswitch_bd
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    return p6

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7ef1d8d0 -> :sswitch_bd
        -0x7c93a408 -> :sswitch_bc
        -0x7a770e9f -> :sswitch_bb
        -0x79b501d7 -> :sswitch_ba
        -0x78770360 -> :sswitch_b9
        -0x76bbb26c -> :sswitch_b8
        -0x7527f708 -> :sswitch_b7
        -0x748dfa26 -> :sswitch_b6
        -0x73f9af86 -> :sswitch_b5
        -0x731619a4 -> :sswitch_b4
        -0x71141294 -> :sswitch_b3
        -0x6dcab372 -> :sswitch_b2
        -0x6d7e1611 -> :sswitch_b1
        -0x6aaa40ec -> :sswitch_b0
        -0x6a3b9afd -> :sswitch_af
        -0x63e72f02 -> :sswitch_ae
        -0x6370edb6 -> :sswitch_ad
        -0x629c201e -> :sswitch_ac
        -0x6281b81a -> :sswitch_ab
        -0x61d4f2aa -> :sswitch_aa
        -0x61d4f28a -> :sswitch_a9
        -0x61799b53 -> :sswitch_a8
        -0x5fd3f8d7 -> :sswitch_a7
        -0x5fae6f09 -> :sswitch_a6
        -0x5b7dec61 -> :sswitch_a5
        -0x5940385f -> :sswitch_a4
        -0x58e83f37 -> :sswitch_a3
        -0x581aedb2 -> :sswitch_a2
        -0x563088d2 -> :sswitch_a1
        -0x55d4dc9e -> :sswitch_a0
        -0x54d081ca -> :sswitch_9f
        -0x53cd3ea7 -> :sswitch_9e
        -0x51c44963 -> :sswitch_9d
        -0x51869882 -> :sswitch_9c
        -0x51869875 -> :sswitch_9b
        -0x4cf0e49e -> :sswitch_9a
        -0x4cd702e1 -> :sswitch_99
        -0x4a7a0d3f -> :sswitch_98
        -0x4a451995 -> :sswitch_97
        -0x47f30af7 -> :sswitch_96
        -0x46950c2d -> :sswitch_95
        -0x468ec964 -> :sswitch_94
        -0x4640f472 -> :sswitch_93
        -0x4450fbd5 -> :sswitch_92
        -0x4410f3f7 -> :sswitch_91
        -0x43e7b956 -> :sswitch_90
        -0x41eedbda -> :sswitch_8f
        -0x41b5d0d9 -> :sswitch_8e
        -0x40602fda -> :sswitch_8d
        -0x3f9f42c0 -> :sswitch_8c
        -0x3f9f28c8 -> :sswitch_8b
        -0x3c906d5d -> :sswitch_8a
        -0x3c1e50da -> :sswitch_89
        -0x3adbfa0f -> :sswitch_88
        -0x3acbee83 -> :sswitch_87
        -0x3a90f5c9 -> :sswitch_86
        -0x39e30d50 -> :sswitch_85
        -0x39d45e2b -> :sswitch_84
        -0x39553a64 -> :sswitch_83
        -0x38c10c25 -> :sswitch_82
        -0x38122285 -> :sswitch_81
        -0x37b250f6 -> :sswitch_80
        -0x372740aa -> :sswitch_7f
        -0x36b35469 -> :sswitch_7e
        -0x361eca5f -> :sswitch_7d
        -0x356f97e5 -> :sswitch_7c
        -0x3532300e -> :sswitch_7b
        -0x348a5d08 -> :sswitch_7a
        -0x34810e80 -> :sswitch_79
        -0x33b525d7 -> :sswitch_78
        -0x32158c51 -> :sswitch_77
        -0x31d4d1ba -> :sswitch_76
        -0x30e15ab8 -> :sswitch_75
        -0x307c92c8 -> :sswitch_74
        -0x300b9825 -> :sswitch_73
        -0x2f42fd5f -> :sswitch_72
        -0x298587e4 -> :sswitch_71
        -0x28769e9e -> :sswitch_70
        -0x28191ce6 -> :sswitch_6f
        -0x25da95c6 -> :sswitch_6e
        -0x250b3b0d -> :sswitch_6d
        -0x23ec187a -> :sswitch_6c
        -0x1d336e2b -> :sswitch_6b
        -0x193f27b6 -> :sswitch_6a
        -0x17a39be8 -> :sswitch_69
        -0x176b5627 -> :sswitch_68
        -0x17409d85 -> :sswitch_67
        -0x1612901f -> :sswitch_66
        -0x144833d0 -> :sswitch_65
        -0x129fbef7 -> :sswitch_64
        -0x1237a851 -> :sswitch_63
        -0xfe5030a -> :sswitch_62
        -0xbd97b08 -> :sswitch_61
        -0xb8981c8 -> :sswitch_60
        -0xb69f728 -> :sswitch_5f
        -0xaa311ef -> :sswitch_5e
        -0xa43dfbb -> :sswitch_5d
        -0x573094a -> :sswitch_5c
        -0x2f7f5bb -> :sswitch_5b
        0xd1b -> :sswitch_5a
        0x178ff -> :sswitch_59
        0x17d13 -> :sswitch_58
        0x18a21 -> :sswitch_57
        0x18fc2 -> :sswitch_56
        0x1c56f -> :sswitch_55
        0x2e8962 -> :sswitch_54
        0x2e996b -> :sswitch_53
        0x32affa -> :sswitch_52
        0x3339a3 -> :sswitch_51
        0x337a8b -> :sswitch_50
        0x3633d7 -> :sswitch_4f
        0x3633d8 -> :sswitch_4e
        0x3633d9 -> :sswitch_4d
        0x36452d -> :sswitch_4c
        0x368f3a -> :sswitch_4b
        0x1dc8445 -> :sswitch_4a
        0x302bcfe -> :sswitch_49
        0x332e1d3 -> :sswitch_48
        0x3492916 -> :sswitch_47
        0x436a86e -> :sswitch_46
        0x585e100 -> :sswitch_45
        0x58b7f1c -> :sswitch_44
        0x594f13e -> :sswitch_43
        0x5af0685 -> :sswitch_42
        0x5c28046 -> :sswitch_41
        0x5c79410 -> :sswitch_40
        0x5faa95b -> :sswitch_3f
        0x635d47c -> :sswitch_3e
        0x65fb149 -> :sswitch_3d
        0x683188c -> :sswitch_3c
        0x6833e92 -> :sswitch_3b
        0x68ac2fe -> :sswitch_3a
        0x68ac491 -> :sswitch_39
        0x6903790 -> :sswitch_38
        0x6904a35 -> :sswitch_37
        0x6942258 -> :sswitch_36
        0x696db44 -> :sswitch_35
        0x1054322e -> :sswitch_34
        0x10625eaf -> :sswitch_33
        0x10e939e4 -> :sswitch_32
        0x11318bf5 -> :sswitch_31
        0x117d5bfa -> :sswitch_30
        0x1425611b -> :sswitch_2f
        0x155ef77f -> :sswitch_2e
        0x170502b8 -> :sswitch_2d
        0x1e943372 -> :sswitch_2c
        0x20206ad9 -> :sswitch_2b
        0x219c7d0a -> :sswitch_2a
        0x222b9eee -> :sswitch_29
        0x22cb5da4 -> :sswitch_28
        0x233b2454 -> :sswitch_27
        0x234bc6ce -> :sswitch_26
        0x244ec7d7 -> :sswitch_25
        0x25351dcd -> :sswitch_24
        0x271b1489 -> :sswitch_23
        0x2a54612e -> :sswitch_22
        0x2c0b7d03 -> :sswitch_21
        0x321e8924 -> :sswitch_20
        0x36defdb2 -> :sswitch_1f
        0x389cf9b5 -> :sswitch_1e
        0x38b73479 -> :sswitch_1d
        0x3b8434cc -> :sswitch_1c
        0x3f6b4e89 -> :sswitch_1b
        0x3fbd627d -> :sswitch_1a
        0x434af4fb -> :sswitch_19
        0x44830aee -> :sswitch_18
        0x465a268f -> :sswitch_17
        0x46d742e6 -> :sswitch_16
        0x4ba069f8 -> :sswitch_15
        0x4bee4878 -> :sswitch_14
        0x4c10694a -> :sswitch_13
        0x4c60f120 -> :sswitch_12
        0x52df7c12 -> :sswitch_11
        0x547d08af -> :sswitch_10
        0x55556487 -> :sswitch_f
        0x568bfea6 -> :sswitch_e
        0x593a095c -> :sswitch_d
        0x5b1d1537 -> :sswitch_c
        0x5c4e5dc3 -> :sswitch_b
        0x5d1b96e9 -> :sswitch_a
        0x5e814b29 -> :sswitch_9
        0x60ccf83e -> :sswitch_8
        0x616ddedd -> :sswitch_7
        0x6565e52a -> :sswitch_6
        0x6e90566a -> :sswitch_5
        0x6fbd6873 -> :sswitch_4
        0x7541fabc -> :sswitch_3
        0x756e2855 -> :sswitch_2
        0x7a9a12f3 -> :sswitch_1
        0x7ac97bff -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 195
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/PushMessageCustom$2;->parseField(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PushMessageCustom;",
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
    const-string v0, "isGreet"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v3, 0xbd

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "canUserStartLive"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v3, 0xbc

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "USSBusiness"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v3, 0xbb

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "callerDeviceId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v3, 0xba

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "platform"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v3, 0xb9

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "matchTopic"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v3, 0xb8

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "msgSingleUpdateIgnoreConvStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v3, 0xb7

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "bellType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v3, 0xb6

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "merchandiseId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v3, 0xb5

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "creationData"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v3, 0xb4

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "receiveUserID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v3, 0xb3

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "ruleKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v3, 0xb2

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "voicePartnerFinderId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v3, 0xb1

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "questionIdSelected"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v3, 0xb0

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "queryOtherUserToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v3, 0xaf

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "NewToast"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v3, 0xae

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "liveMode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v3, 0xad

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "extraPrivileges"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v3, 0xac

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "likedPopuserCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v3, 0xab

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "channelNameV2"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v3, 0xaa

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "canShowNotification"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v3, 0xa9

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "rtcChannelWaitingTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v3, 0xa8

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "buzzToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v3, 0xa7

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "rsStateReceiverToSender"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v3, 0xa6

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "countDownSeconds"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v3, 0xa5

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "big_pic_url"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v3, 0xa4

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "birthday"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v3, 0xa3

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "needReact"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v3, 0xa2

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "liveTitle"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v3, 0xa1

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "content"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v3, 0xa0

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "fitReason"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v3, 0x9f

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "USSToast"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v3, 0x9e

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "matched"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v3, 0x9d

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "channel"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v3, 0x9c

    goto/16 :goto_0

    :sswitch_22
    const-string v0, "callerToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v3, 0x9b

    goto/16 :goto_0

    :sswitch_23
    const-string v0, "pushChannel"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v3, 0x9a

    goto/16 :goto_0

    :sswitch_24
    const-string v0, "contractId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v3, 0x99

    goto/16 :goto_0

    :sswitch_25
    const-string v0, "couponDesc"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v3, 0x98

    goto/16 :goto_0

    :sswitch_26
    const-string v0, "videoPartnerFinderId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v3, 0x97

    goto/16 :goto_0

    :sswitch_27
    const-string v0, "frozenDuration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v3, 0x96

    goto/16 :goto_0

    :sswitch_28
    const-string v0, "USSPage"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v3, 0x95

    goto/16 :goto_0

    :sswitch_29
    const-string v0, "videoChatId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v3, 0x94

    goto/16 :goto_0

    :sswitch_2a
    const-string v0, "pullStreamUrl"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v3, 0x93

    goto/16 :goto_0

    :sswitch_2b
    const-string v0, "userMatched"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v3, 0x92

    goto/16 :goto_0

    :sswitch_2c
    const-string v0, "rtcProvider"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v3, 0x91

    goto/16 :goto_0

    :sswitch_2d
    const-string v0, "avatarState"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v3, 0x90

    goto/16 :goto_0

    :sswitch_2e
    const-string v0, "buttonText"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v3, 0x8f

    goto/16 :goto_0

    :sswitch_2f
    const-string v0, "calleeToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v3, 0x8e

    goto/16 :goto_0

    :sswitch_30
    const-string v0, "groupId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v3, 0x8d

    goto/16 :goto_0

    :sswitch_31
    const-string v0, "distance"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v3, 0x8c

    goto/16 :goto_0

    :sswitch_32
    const-string v0, "greetID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v3, 0x8b

    goto/16 :goto_0

    :sswitch_33
    const-string v0, "maskMode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v3, 0x8a

    goto/16 :goto_0

    :sswitch_34
    const-string v0, "channelName"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v3, 0x89

    goto/16 :goto_0

    :sswitch_35
    const-string v0, "total"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v3, 0x88

    goto/16 :goto_0

    :sswitch_36
    const-string v0, "title"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v3, 0x87

    goto/16 :goto_0

    :sswitch_37
    const-string v0, "tagID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v3, 0x86

    goto/16 :goto_0

    :sswitch_38
    const-string v0, "tabId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v3, 0x85

    goto/16 :goto_0

    :sswitch_39
    const-string v0, "state"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v3, 0x84

    goto/16 :goto_0

    :sswitch_3a
    const-string v0, "stage"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v3, 0x83

    goto/16 :goto_0

    :sswitch_3b
    const-string v0, "score"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v3, 0x82

    goto/16 :goto_0

    :sswitch_3c
    const-string v0, "scene"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3c

    goto/16 :goto_0

    :cond_3c
    const/16 v3, 0x81

    goto/16 :goto_0

    :sswitch_3d
    const-string v0, "price"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d

    goto/16 :goto_0

    :cond_3d
    const/16 v3, 0x80

    goto/16 :goto_0

    :sswitch_3e
    const-string v0, "msgId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3e

    goto/16 :goto_0

    :cond_3e
    const/16 v3, 0x7f

    goto/16 :goto_0

    :sswitch_3f
    const-string v0, "image"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    goto/16 :goto_0

    :cond_3f
    const/16 v3, 0x7e

    goto/16 :goto_0

    :sswitch_40
    const-string v0, "extra"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    goto/16 :goto_0

    :cond_40
    const/16 v3, 0x7d

    goto/16 :goto_0

    :sswitch_41
    const-string v0, "emoji"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_41

    goto/16 :goto_0

    :cond_41
    const/16 v3, 0x7c

    goto/16 :goto_0

    :sswitch_42
    const-string v0, "dates"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    goto/16 :goto_0

    :cond_42
    const/16 v3, 0x7b

    goto/16 :goto_0

    :sswitch_43
    const-string v0, "bgImg"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    goto/16 :goto_0

    :cond_43
    const/16 v3, 0x7a

    goto/16 :goto_0

    :sswitch_44
    const-string v0, "appId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44

    goto/16 :goto_0

    :cond_44
    const/16 v3, 0x79

    goto/16 :goto_0

    :sswitch_45
    const-string v0, "added"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_45

    goto/16 :goto_0

    :cond_45
    const/16 v3, 0x78

    goto/16 :goto_0

    :sswitch_46
    const-string v0, "nickname"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    goto/16 :goto_0

    :cond_46
    const/16 v3, 0x77

    goto/16 :goto_0

    :sswitch_47
    const-string v0, "timestamp"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_47

    goto/16 :goto_0

    :cond_47
    const/16 v3, 0x76

    goto/16 :goto_0

    :sswitch_48
    const-string v0, "bellNotShowStayTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_48

    goto/16 :goto_0

    :cond_48
    const/16 v3, 0x75

    goto/16 :goto_0

    :sswitch_49
    const-string v0, "category"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    goto/16 :goto_0

    :cond_49
    const/16 v3, 0x74

    goto/16 :goto_0

    :sswitch_4a
    const-string v0, "eventName"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4a

    goto/16 :goto_0

    :cond_4a
    const/16 v3, 0x73

    goto/16 :goto_0

    :sswitch_4b
    const-string v0, "type"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b

    goto/16 :goto_0

    :cond_4b
    const/16 v3, 0x72

    goto/16 :goto_0

    :sswitch_4c
    const-string v0, "text"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4c

    goto/16 :goto_0

    :cond_4c
    const/16 v3, 0x71

    goto/16 :goto_0

    :sswitch_4d
    const-string v0, "tag3"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d

    goto/16 :goto_0

    :cond_4d
    const/16 v3, 0x70

    goto/16 :goto_0

    :sswitch_4e
    const-string v0, "tag2"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4e

    goto/16 :goto_0

    :cond_4e
    const/16 v3, 0x6f

    goto/16 :goto_0

    :sswitch_4f
    const-string v0, "tag1"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4f

    goto/16 :goto_0

    :cond_4f
    const/16 v3, 0x6e

    goto/16 :goto_0

    :sswitch_50
    const-string v0, "name"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_50

    goto/16 :goto_0

    :cond_50
    const/16 v3, 0x6d

    goto/16 :goto_0

    :sswitch_51
    const-string v0, "mode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_51

    goto/16 :goto_0

    :cond_51
    const/16 v3, 0x6c

    goto/16 :goto_0

    :sswitch_52
    const-string v0, "link"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    goto/16 :goto_0

    :cond_52
    const/16 v3, 0x6b

    goto/16 :goto_0

    :sswitch_53
    const-string v0, "city"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_53

    goto/16 :goto_0

    :cond_53
    const/16 v3, 0x6a

    goto/16 :goto_0

    :sswitch_54
    const-string v0, "cell"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    goto/16 :goto_0

    :cond_54
    const/16 v3, 0x69

    goto/16 :goto_0

    :sswitch_55
    const-string v0, "url"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    goto/16 :goto_0

    :cond_55
    const/16 v3, 0x68

    goto/16 :goto_0

    :sswitch_56
    const-string v0, "gid"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_56

    goto/16 :goto_0

    :cond_56
    const/16 v3, 0x67

    goto/16 :goto_0

    :sswitch_57
    const-string v0, "ext"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_57

    goto/16 :goto_0

    :cond_57
    const/16 v3, 0x66

    goto/16 :goto_0

    :sswitch_58
    const-string v0, "biz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_58

    goto/16 :goto_0

    :cond_58
    const/16 v3, 0x65

    goto/16 :goto_0

    :sswitch_59
    const-string v0, "age"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    goto/16 :goto_0

    :cond_59
    const/16 v3, 0x64

    goto/16 :goto_0

    :sswitch_5a
    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5a

    goto/16 :goto_0

    :cond_5a
    const/16 v3, 0x63

    goto/16 :goto_0

    :sswitch_5b
    const-string v0, "extremePickShowId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5b

    goto/16 :goto_0

    :cond_5b
    const/16 v3, 0x62

    goto/16 :goto_0

    :sswitch_5c
    const-string v0, "channelToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5c

    goto/16 :goto_0

    :cond_5c
    const/16 v3, 0x61

    goto/16 :goto_0

    :sswitch_5d
    const-string v0, "callback"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5d

    goto/16 :goto_0

    :cond_5d
    const/16 v3, 0x60

    goto/16 :goto_0

    :sswitch_5e
    const-string v0, "queryToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5e

    goto/16 :goto_0

    :cond_5e
    const/16 v3, 0x5f

    goto/16 :goto_0

    :sswitch_5f
    const-string v0, "otherUsers"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5f

    goto/16 :goto_0

    :cond_5f
    const/16 v3, 0x5e

    goto/16 :goto_0

    :sswitch_60
    const-string v0, "insidePool"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_60

    goto/16 :goto_0

    :cond_60
    const/16 v3, 0x5d

    goto/16 :goto_0

    :sswitch_61
    const-string v0, "initialDuration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_61

    goto/16 :goto_0

    :cond_61
    const/16 v3, 0x5c

    goto/16 :goto_0

    :sswitch_62
    const-string v0, "userName"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_62

    goto/16 :goto_0

    :cond_62
    const/16 v3, 0x5b

    goto/16 :goto_0

    :sswitch_63
    const-string v0, "calleeDeviceId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_63

    goto/16 :goto_0

    :cond_63
    const/16 v3, 0x5a

    goto/16 :goto_0

    :sswitch_64
    const-string v0, "currencySymbol"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_64

    goto/16 :goto_0

    :cond_64
    const/16 v3, 0x59

    goto/16 :goto_0

    :sswitch_65
    const-string v0, "zodiacFitPercent"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_65

    goto/16 :goto_0

    :cond_65
    const/16 v3, 0x58

    goto/16 :goto_0

    :sswitch_66
    const-string v0, "couponId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_66

    goto/16 :goto_0

    :cond_66
    const/16 v3, 0x57

    goto/16 :goto_0

    :sswitch_67
    const-string v0, "subSource"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_67

    goto/16 :goto_0

    :cond_67
    const/16 v3, 0x56

    goto/16 :goto_0

    :sswitch_68
    const-string v0, "mandatory"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_68

    goto/16 :goto_0

    :cond_68
    const/16 v3, 0x55

    goto/16 :goto_0

    :sswitch_69
    const-string v0, "rtcToken"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_69

    goto/16 :goto_0

    :cond_69
    const/16 v3, 0x54

    goto/16 :goto_0

    :sswitch_6a
    const-string v0, "callerTokenV2"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6a

    goto/16 :goto_0

    :cond_6a
    const/16 v3, 0x53

    goto/16 :goto_0

    :sswitch_6b
    const-string v0, "createdTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6b

    goto/16 :goto_0

    :cond_6b
    const/16 v3, 0x52

    goto/16 :goto_0

    :sswitch_6c
    const-string v0, "bellShowStayTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6c

    goto/16 :goto_0

    :cond_6c
    const/16 v3, 0x51

    goto/16 :goto_0

    :sswitch_6d
    const-string v0, "resolutionHeight"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6d

    goto/16 :goto_0

    :cond_6d
    const/16 v3, 0x50

    goto/16 :goto_0

    :sswitch_6e
    const-string v0, "avatars"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6e

    goto/16 :goto_0

    :cond_6e
    const/16 v3, 0x4f

    goto/16 :goto_0

    :sswitch_6f
    const-string v0, "businessType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6f

    goto/16 :goto_0

    :cond_6f
    const/16 v3, 0x4e

    goto/16 :goto_0

    :sswitch_70
    const-string v0, "likedCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_70

    goto/16 :goto_0

    :cond_70
    const/16 v3, 0x4d

    goto/16 :goto_0

    :sswitch_71
    const-string v0, "zodiac"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_71

    goto/16 :goto_0

    :cond_71
    const/16 v3, 0x4c

    goto/16 :goto_0

    :sswitch_72
    const-string v0, "partyId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_72

    goto/16 :goto_0

    :cond_72
    const/16 v3, 0x4b

    goto/16 :goto_0

    :sswitch_73
    const-string v0, "fullScreen"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_73

    goto/16 :goto_0

    :cond_73
    const/16 v3, 0x4a

    goto/16 :goto_0

    :sswitch_74
    const-string v0, "testGroupName"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_74

    goto/16 :goto_0

    :cond_74
    const/16 v3, 0x49

    goto/16 :goto_0

    :sswitch_75
    const-string v0, "vendor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_75

    goto/16 :goto_0

    :cond_75
    const/16 v3, 0x48

    goto/16 :goto_0

    :sswitch_76
    const-string v0, "userId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_76

    goto/16 :goto_0

    :cond_76
    const/16 v3, 0x47

    goto/16 :goto_0

    :sswitch_77
    const-string v0, "unread"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_77

    goto/16 :goto_0

    :cond_77
    const/16 v3, 0x46

    goto/16 :goto_0

    :sswitch_78
    const-string v0, "reaction"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    goto/16 :goto_0

    :cond_78
    const/16 v3, 0x45

    goto/16 :goto_0

    :sswitch_79
    const-string v0, "taskId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_79

    goto/16 :goto_0

    :cond_79
    const/16 v3, 0x44

    goto/16 :goto_0

    :sswitch_7a
    const-string v0, "openingRemark"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7a

    goto/16 :goto_0

    :cond_7a
    const/16 v3, 0x43

    goto/16 :goto_0

    :sswitch_7b
    const-string v0, "status"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7b

    goto/16 :goto_0

    :cond_7b
    const/16 v3, 0x42

    goto/16 :goto_0

    :sswitch_7c
    const-string v0, "source"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7c

    goto/16 :goto_0

    :cond_7c
    const/16 v3, 0x41

    goto/16 :goto_0

    :sswitch_7d
    const-string v0, "schema"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7d

    goto/16 :goto_0

    :cond_7d
    const/16 v3, 0x40

    goto/16 :goto_0

    :sswitch_7e
    const-string v0, "alertId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7e

    goto/16 :goto_0

    :cond_7e
    const/16 v3, 0x3f

    goto/16 :goto_0

    :sswitch_7f
    const-string v0, "roomId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7f

    goto/16 :goto_0

    :cond_7f
    const/16 v3, 0x3e

    goto/16 :goto_0

    :sswitch_80
    const-string v0, "localNotificationImportance"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_80

    goto/16 :goto_0

    :cond_80
    const/16 v3, 0x3d

    goto/16 :goto_0

    :sswitch_81
    const-string v0, "popupsDisplay"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_81

    goto/16 :goto_0

    :cond_81
    const/16 v3, 0x3c

    goto/16 :goto_0

    :sswitch_82
    const-string v0, "honorGiftCardDetail"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_82

    goto/16 :goto_0

    :cond_82
    const/16 v3, 0x3b

    goto/16 :goto_0

    :sswitch_83
    const-string v0, "broadcastID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_83

    goto/16 :goto_0

    :cond_83
    const/16 v3, 0x3a

    goto/16 :goto_0

    :sswitch_84
    const-string v0, "radioType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_84

    goto/16 :goto_0

    :cond_84
    const/16 v3, 0x39

    goto/16 :goto_0

    :sswitch_85
    const-string v0, "anchorId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_85

    goto/16 :goto_0

    :cond_85
    const/16 v3, 0x38

    goto/16 :goto_0

    :sswitch_86
    const-string v0, "poolID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_86

    goto/16 :goto_0

    :cond_86
    const/16 v3, 0x37

    goto/16 :goto_0

    :sswitch_87
    const-string v0, "triggeredUserId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_87

    goto/16 :goto_0

    :cond_87
    const/16 v3, 0x36

    goto/16 :goto_0

    :sswitch_88
    const-string v0, "provider"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_88

    goto/16 :goto_0

    :cond_88
    const/16 v3, 0x35

    goto/16 :goto_0

    :sswitch_89
    const-string v0, "origin"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_89

    goto/16 :goto_0

    :cond_89
    const/16 v3, 0x34

    goto/16 :goto_0

    :sswitch_8a
    const-string v0, "readUntilId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8a

    goto/16 :goto_0

    :cond_8a
    const/16 v3, 0x33

    goto/16 :goto_0

    :sswitch_8b
    const-string v0, "tracker"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8b

    goto/16 :goto_0

    :cond_8b
    const/16 v3, 0x32

    goto/16 :goto_0

    :sswitch_8c
    const-string v0, "traceId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8c

    goto/16 :goto_0

    :cond_8c
    const/16 v3, 0x31

    goto/16 :goto_0

    :sswitch_8d
    const-string v0, "otherUserName"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8d

    goto/16 :goto_0

    :cond_8d
    const/16 v3, 0x30

    goto/16 :goto_0

    :sswitch_8e
    const-string v0, "liveId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8e

    goto/16 :goto_0

    :cond_8e
    const/16 v3, 0x2f

    goto/16 :goto_0

    :sswitch_8f
    const-string v0, "letter"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8f

    goto/16 :goto_0

    :cond_8f
    const/16 v3, 0x2e

    goto/16 :goto_0

    :sswitch_90
    const-string v0, "topicId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_90

    goto/16 :goto_0

    :cond_90
    const/16 v3, 0x2d

    goto/16 :goto_0

    :sswitch_91
    const-string v0, "recommendText"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_91

    goto/16 :goto_0

    :cond_91
    const/16 v3, 0x2c

    goto/16 :goto_0

    :sswitch_92
    const-string v0, "otherID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_92

    goto/16 :goto_0

    :cond_92
    const/16 v3, 0x2b

    goto/16 :goto_0

    :sswitch_93
    const-string v0, "itemId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_93

    goto/16 :goto_0

    :cond_93
    const/16 v3, 0x2a

    goto/16 :goto_0

    :sswitch_94
    const-string v0, "intent"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_94

    goto/16 :goto_0

    :cond_94
    const/16 v3, 0x29

    goto/16 :goto_0

    :sswitch_95
    const-string v0, "inflow"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_95

    goto/16 :goto_0

    :cond_95
    const/16 v3, 0x28

    goto/16 :goto_0

    :sswitch_96
    const-string v0, "orderId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_96

    goto/16 :goto_0

    :cond_96
    const/16 v3, 0x27

    goto/16 :goto_0

    :sswitch_97
    const-string v0, "giftId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_97

    goto/16 :goto_0

    :cond_97
    const/16 v3, 0x26

    goto/16 :goto_0

    :sswitch_98
    const-string v0, "gender"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_98

    goto/16 :goto_0

    :cond_98
    const/16 v3, 0x25

    goto/16 :goto_0

    :sswitch_99
    const-string v0, "expire"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_99

    goto/16 :goto_0

    :cond_99
    const/16 v3, 0x24

    goto/16 :goto_0

    :sswitch_9a
    const-string v0, "rtcChannel"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9a

    goto/16 :goto_0

    :cond_9a
    const/16 v3, 0x23

    goto/16 :goto_0

    :sswitch_9b
    const-string v0, "caller"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9b

    goto/16 :goto_0

    :cond_9b
    const/16 v3, 0x22

    goto/16 :goto_0

    :sswitch_9c
    const-string v0, "callee"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9c

    goto/16 :goto_0

    :cond_9c
    const/16 v3, 0x21

    goto/16 :goto_0

    :sswitch_9d
    const-string v0, "isPassive"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9d

    goto/16 :goto_0

    :cond_9d
    const/16 v3, 0x20

    goto/16 :goto_0

    :sswitch_9e
    const-string v0, "avatar"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9e

    goto/16 :goto_0

    :cond_9e
    const/16 v3, 0x1f

    goto/16 :goto_0

    :sswitch_9f
    const-string v0, "action"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9f

    goto/16 :goto_0

    :cond_9f
    const/16 v3, 0x1e

    goto/16 :goto_0

    :sswitch_a0
    const-string v0, "messageID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a0

    goto/16 :goto_0

    :cond_a0
    const/16 v3, 0x1d

    goto/16 :goto_0

    :sswitch_a1
    const-string v0, "anchorCallId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    goto/16 :goto_0

    :cond_a1
    const/16 v3, 0x1c

    goto/16 :goto_0

    :sswitch_a2
    const-string v0, "USSVerify"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a2

    goto/16 :goto_0

    :cond_a2
    const/16 v3, 0x1b

    goto/16 :goto_0

    :sswitch_a3
    const-string v0, "productType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a3

    goto/16 :goto_0

    :cond_a3
    const/16 v3, 0x1a

    goto/16 :goto_0

    :sswitch_a4
    const-string v0, "selectedQuestion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a4

    goto/16 :goto_0

    :cond_a4
    const/16 v3, 0x19

    goto/16 :goto_0

    :sswitch_a5
    const-string v0, "quickchatType"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a5

    goto/16 :goto_0

    :cond_a5
    const/16 v3, 0x18

    goto/16 :goto_0

    :sswitch_a6
    const-string v0, "calleeTokenV2"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a6

    goto/16 :goto_0

    :cond_a6
    const/16 v3, 0x17

    goto/16 :goto_0

    :sswitch_a7
    const-string v0, "endDate"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a7

    goto/16 :goto_0

    :cond_a7
    const/16 v3, 0x16

    goto/16 :goto_0

    :sswitch_a8
    const-string v0, "memojiDuration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a8

    goto/16 :goto_0

    :cond_a8
    const/16 v3, 0x15

    goto/16 :goto_0

    :sswitch_a9
    const-string v0, "otherUserId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a9

    goto/16 :goto_0

    :cond_a9
    const/16 v3, 0x14

    goto/16 :goto_0

    :sswitch_aa
    const-string v0, "otherUserID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_aa

    goto/16 :goto_0

    :cond_aa
    const/16 v3, 0x13

    goto/16 :goto_0

    :sswitch_ab
    const-string v0, "prolongCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ab

    goto/16 :goto_0

    :cond_ab
    const/16 v3, 0x12

    goto/16 :goto_0

    :sswitch_ac
    const-string v0, "privileges"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ac

    goto/16 :goto_0

    :cond_ac
    const/16 v3, 0x11

    goto/16 :goto_0

    :sswitch_ad
    const-string v0, "USSOption"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ad

    goto/16 :goto_0

    :cond_ad
    const/16 v3, 0x10

    goto/16 :goto_0

    :sswitch_ae
    const-string v0, "conversationId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ae

    goto/16 :goto_0

    :cond_ae
    const/16 v3, 0xf

    goto/16 :goto_0

    :sswitch_af
    const-string v0, "USSIds"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_af

    goto/16 :goto_0

    :cond_af
    const/16 v3, 0xe

    goto/16 :goto_0

    :sswitch_b0
    const-string v0, "localNotificationCategory"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b0

    goto/16 :goto_0

    :cond_b0
    const/16 v3, 0xd

    goto/16 :goto_0

    :sswitch_b1
    const-string v0, "extTabId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b1

    goto/16 :goto_0

    :cond_b1
    const/16 v3, 0xc

    goto/16 :goto_0

    :sswitch_b2
    const-string v0, "USSInsert"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b2

    goto/16 :goto_0

    :cond_b2
    const/16 v3, 0xb

    goto/16 :goto_0

    :sswitch_b3
    const-string v0, "stateID"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b3

    goto/16 :goto_0

    :cond_b3
    const/16 v3, 0xa

    goto/16 :goto_0

    :sswitch_b4
    const-string v0, "channelKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b4

    goto/16 :goto_0

    :cond_b4
    const/16 v3, 0x9

    goto/16 :goto_0

    :sswitch_b5
    const-string v0, "resolutionWidth"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b5

    goto/16 :goto_0

    :cond_b5
    const/16 v3, 0x8

    goto/16 :goto_0

    :sswitch_b6
    const-string v0, "noRecommended"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b6

    goto :goto_0

    :cond_b6
    const/4 v3, 0x7

    goto :goto_0

    :sswitch_b7
    const-string v0, "totalDuration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b7

    goto :goto_0

    :cond_b7
    const/4 v3, 0x6

    goto :goto_0

    :sswitch_b8
    const-string v0, "duration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b8

    goto :goto_0

    :cond_b8
    const/4 v3, 0x5

    goto :goto_0

    :sswitch_b9
    const-string v0, "friendPurpose"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b9

    goto :goto_0

    :cond_b9
    const/4 v3, 0x4

    goto :goto_0

    :sswitch_ba
    const-string v0, "lastActiveTime"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ba

    goto :goto_0

    :cond_ba
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_bb
    const-string v0, "popChange"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bb

    goto :goto_0

    :cond_bb
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_bc
    const-string v0, "subTitle"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bc

    goto :goto_0

    :cond_bc
    move v3, v2

    goto :goto_0

    :sswitch_bd
    const-string v0, "startDate"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bd

    goto :goto_0

    :cond_bd
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
        -0x7ef1d8d0 -> :sswitch_bd
        -0x7c93a408 -> :sswitch_bc
        -0x7a770e9f -> :sswitch_bb
        -0x79b501d7 -> :sswitch_ba
        -0x78770360 -> :sswitch_b9
        -0x76bbb26c -> :sswitch_b8
        -0x7527f708 -> :sswitch_b7
        -0x748dfa26 -> :sswitch_b6
        -0x73f9af86 -> :sswitch_b5
        -0x731619a4 -> :sswitch_b4
        -0x71141294 -> :sswitch_b3
        -0x6dcab372 -> :sswitch_b2
        -0x6d7e1611 -> :sswitch_b1
        -0x6aaa40ec -> :sswitch_b0
        -0x6a3b9afd -> :sswitch_af
        -0x63e72f02 -> :sswitch_ae
        -0x6370edb6 -> :sswitch_ad
        -0x629c201e -> :sswitch_ac
        -0x6281b81a -> :sswitch_ab
        -0x61d4f2aa -> :sswitch_aa
        -0x61d4f28a -> :sswitch_a9
        -0x61799b53 -> :sswitch_a8
        -0x5fd3f8d7 -> :sswitch_a7
        -0x5fae6f09 -> :sswitch_a6
        -0x5b7dec61 -> :sswitch_a5
        -0x5940385f -> :sswitch_a4
        -0x58e83f37 -> :sswitch_a3
        -0x581aedb2 -> :sswitch_a2
        -0x563088d2 -> :sswitch_a1
        -0x55d4dc9e -> :sswitch_a0
        -0x54d081ca -> :sswitch_9f
        -0x53cd3ea7 -> :sswitch_9e
        -0x51c44963 -> :sswitch_9d
        -0x51869882 -> :sswitch_9c
        -0x51869875 -> :sswitch_9b
        -0x4cf0e49e -> :sswitch_9a
        -0x4cd702e1 -> :sswitch_99
        -0x4a7a0d3f -> :sswitch_98
        -0x4a451995 -> :sswitch_97
        -0x47f30af7 -> :sswitch_96
        -0x46950c2d -> :sswitch_95
        -0x468ec964 -> :sswitch_94
        -0x4640f472 -> :sswitch_93
        -0x4450fbd5 -> :sswitch_92
        -0x4410f3f7 -> :sswitch_91
        -0x43e7b956 -> :sswitch_90
        -0x41eedbda -> :sswitch_8f
        -0x41b5d0d9 -> :sswitch_8e
        -0x40602fda -> :sswitch_8d
        -0x3f9f42c0 -> :sswitch_8c
        -0x3f9f28c8 -> :sswitch_8b
        -0x3c906d5d -> :sswitch_8a
        -0x3c1e50da -> :sswitch_89
        -0x3adbfa0f -> :sswitch_88
        -0x3acbee83 -> :sswitch_87
        -0x3a90f5c9 -> :sswitch_86
        -0x39e30d50 -> :sswitch_85
        -0x39d45e2b -> :sswitch_84
        -0x39553a64 -> :sswitch_83
        -0x38c10c25 -> :sswitch_82
        -0x38122285 -> :sswitch_81
        -0x37b250f6 -> :sswitch_80
        -0x372740aa -> :sswitch_7f
        -0x36b35469 -> :sswitch_7e
        -0x361eca5f -> :sswitch_7d
        -0x356f97e5 -> :sswitch_7c
        -0x3532300e -> :sswitch_7b
        -0x348a5d08 -> :sswitch_7a
        -0x34810e80 -> :sswitch_79
        -0x33b525d7 -> :sswitch_78
        -0x32158c51 -> :sswitch_77
        -0x31d4d1ba -> :sswitch_76
        -0x30e15ab8 -> :sswitch_75
        -0x307c92c8 -> :sswitch_74
        -0x300b9825 -> :sswitch_73
        -0x2f42fd5f -> :sswitch_72
        -0x298587e4 -> :sswitch_71
        -0x28769e9e -> :sswitch_70
        -0x28191ce6 -> :sswitch_6f
        -0x25da95c6 -> :sswitch_6e
        -0x250b3b0d -> :sswitch_6d
        -0x23ec187a -> :sswitch_6c
        -0x1d336e2b -> :sswitch_6b
        -0x193f27b6 -> :sswitch_6a
        -0x17a39be8 -> :sswitch_69
        -0x176b5627 -> :sswitch_68
        -0x17409d85 -> :sswitch_67
        -0x1612901f -> :sswitch_66
        -0x144833d0 -> :sswitch_65
        -0x129fbef7 -> :sswitch_64
        -0x1237a851 -> :sswitch_63
        -0xfe5030a -> :sswitch_62
        -0xbd97b08 -> :sswitch_61
        -0xb8981c8 -> :sswitch_60
        -0xb69f728 -> :sswitch_5f
        -0xaa311ef -> :sswitch_5e
        -0xa43dfbb -> :sswitch_5d
        -0x573094a -> :sswitch_5c
        -0x2f7f5bb -> :sswitch_5b
        0xd1b -> :sswitch_5a
        0x178ff -> :sswitch_59
        0x17d13 -> :sswitch_58
        0x18a21 -> :sswitch_57
        0x18fc2 -> :sswitch_56
        0x1c56f -> :sswitch_55
        0x2e8962 -> :sswitch_54
        0x2e996b -> :sswitch_53
        0x32affa -> :sswitch_52
        0x3339a3 -> :sswitch_51
        0x337a8b -> :sswitch_50
        0x3633d7 -> :sswitch_4f
        0x3633d8 -> :sswitch_4e
        0x3633d9 -> :sswitch_4d
        0x36452d -> :sswitch_4c
        0x368f3a -> :sswitch_4b
        0x1dc8445 -> :sswitch_4a
        0x302bcfe -> :sswitch_49
        0x332e1d3 -> :sswitch_48
        0x3492916 -> :sswitch_47
        0x436a86e -> :sswitch_46
        0x585e100 -> :sswitch_45
        0x58b7f1c -> :sswitch_44
        0x594f13e -> :sswitch_43
        0x5af0685 -> :sswitch_42
        0x5c28046 -> :sswitch_41
        0x5c79410 -> :sswitch_40
        0x5faa95b -> :sswitch_3f
        0x635d47c -> :sswitch_3e
        0x65fb149 -> :sswitch_3d
        0x683188c -> :sswitch_3c
        0x6833e92 -> :sswitch_3b
        0x68ac2fe -> :sswitch_3a
        0x68ac491 -> :sswitch_39
        0x6903790 -> :sswitch_38
        0x6904a35 -> :sswitch_37
        0x6942258 -> :sswitch_36
        0x696db44 -> :sswitch_35
        0x1054322e -> :sswitch_34
        0x10625eaf -> :sswitch_33
        0x10e939e4 -> :sswitch_32
        0x11318bf5 -> :sswitch_31
        0x117d5bfa -> :sswitch_30
        0x1425611b -> :sswitch_2f
        0x155ef77f -> :sswitch_2e
        0x170502b8 -> :sswitch_2d
        0x1e943372 -> :sswitch_2c
        0x20206ad9 -> :sswitch_2b
        0x219c7d0a -> :sswitch_2a
        0x222b9eee -> :sswitch_29
        0x22cb5da4 -> :sswitch_28
        0x233b2454 -> :sswitch_27
        0x234bc6ce -> :sswitch_26
        0x244ec7d7 -> :sswitch_25
        0x25351dcd -> :sswitch_24
        0x271b1489 -> :sswitch_23
        0x2a54612e -> :sswitch_22
        0x2c0b7d03 -> :sswitch_21
        0x321e8924 -> :sswitch_20
        0x36defdb2 -> :sswitch_1f
        0x389cf9b5 -> :sswitch_1e
        0x38b73479 -> :sswitch_1d
        0x3b8434cc -> :sswitch_1c
        0x3f6b4e89 -> :sswitch_1b
        0x3fbd627d -> :sswitch_1a
        0x434af4fb -> :sswitch_19
        0x44830aee -> :sswitch_18
        0x465a268f -> :sswitch_17
        0x46d742e6 -> :sswitch_16
        0x4ba069f8 -> :sswitch_15
        0x4bee4878 -> :sswitch_14
        0x4c10694a -> :sswitch_13
        0x4c60f120 -> :sswitch_12
        0x52df7c12 -> :sswitch_11
        0x547d08af -> :sswitch_10
        0x55556487 -> :sswitch_f
        0x568bfea6 -> :sswitch_e
        0x593a095c -> :sswitch_d
        0x5b1d1537 -> :sswitch_c
        0x5c4e5dc3 -> :sswitch_b
        0x5d1b96e9 -> :sswitch_a
        0x5e814b29 -> :sswitch_9
        0x60ccf83e -> :sswitch_8
        0x616ddedd -> :sswitch_7
        0x6565e52a -> :sswitch_6
        0x6e90566a -> :sswitch_5
        0x6fbd6873 -> :sswitch_4
        0x7541fabc -> :sswitch_3
        0x756e2855 -> :sswitch_2
        0x7a9a12f3 -> :sswitch_1
        0x7ac97bff -> :sswitch_0
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
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
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/PushMessageCustom$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/PushMessageCustom;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "expire"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    const-string v0, "fullScreen"

    .line 19
    .line 20
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    .line 21
    .line 22
    invoke-virtual {p2, v0, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string v2, "action"

    .line 30
    .line 31
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const-string v2, "url"

    .line 39
    .line 40
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    const-string v2, "gender"

    .line 48
    .line 49
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    const-string v2, "giftId"

    .line 57
    .line 58
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const-string v2, "big_pic_url"

    .line 66
    .line 67
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    const-string v2, "age"

    .line 75
    .line 76
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v0, :cond_6

    .line 82
    .line 83
    const-string v2, "name"

    .line 84
    .line 85
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v0, :cond_7

    .line 91
    .line 92
    const-string v2, "tag1"

    .line 93
    .line 94
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v0, :cond_8

    .line 100
    .line 101
    const-string v2, "tag2"

    .line 102
    .line 103
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v0, :cond_9

    .line 109
    .line 110
    const-string v2, "tag3"

    .line 111
    .line 112
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v0, :cond_a

    .line 118
    .line 119
    const-string v2, "liveId"

    .line 120
    .line 121
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v0, :cond_b

    .line 127
    .line 128
    const-string v2, "roomId"

    .line 129
    .line 130
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v0, :cond_c

    .line 136
    .line 137
    const-string v2, "nickname"

    .line 138
    .line 139
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 143
    .line 144
    if-eqz v0, :cond_d

    .line 145
    .line 146
    const-string v2, "tabId"

    .line 147
    .line 148
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v0, :cond_e

    .line 154
    .line 155
    const-string v2, "extTabId"

    .line 156
    .line 157
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v0, :cond_f

    .line 163
    .line 164
    const-string v2, "taskId"

    .line 165
    .line 166
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    .line 170
    .line 171
    if-eqz v0, :cond_10

    .line 172
    .line 173
    const-string v2, "dates"

    .line 174
    .line 175
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v0, :cond_11

    .line 181
    .line 182
    const-string v2, "recommendText"

    .line 183
    .line 184
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v0, :cond_12

    .line 190
    .line 191
    const-string v2, "buttonText"

    .line 192
    .line 193
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 197
    .line 198
    if-eqz v0, :cond_13

    .line 199
    .line 200
    const-string v2, "queryToken"

    .line 201
    .line 202
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz v0, :cond_14

    .line 208
    .line 209
    const-string v2, "otherUserID"

    .line 210
    .line 211
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz v0, :cond_15

    .line 217
    .line 218
    const-string v2, "eventName"

    .line 219
    .line 220
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :cond_15
    const-string v0, "userMatched"

    .line 224
    .line 225
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    .line 226
    .line 227
    invoke-virtual {p2, v0, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 228
    .line 229
    .line 230
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    .line 231
    .line 232
    if-eqz v0, :cond_16

    .line 233
    .line 234
    const-string v2, "rtcToken"

    .line 235
    .line 236
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    .line 240
    .line 241
    if-eqz v0, :cond_17

    .line 242
    .line 243
    const-string v2, "rtcChannel"

    .line 244
    .line 245
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    :cond_17
    const-string v0, "rtcChannelWaitingTime"

    .line 249
    .line 250
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    .line 251
    .line 252
    invoke-virtual {p2, v0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    .line 256
    .line 257
    if-eqz v0, :cond_18

    .line 258
    .line 259
    const-string v2, "quickchatType"

    .line 260
    .line 261
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    .line 265
    .line 266
    if-eqz v0, :cond_19

    .line 267
    .line 268
    const-string v2, "queryOtherUserToken"

    .line 269
    .line 270
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    .line 274
    .line 275
    if-eqz v0, :cond_1a

    .line 276
    .line 277
    const-string v2, "pullStreamUrl"

    .line 278
    .line 279
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    .line 283
    .line 284
    if-eqz v0, :cond_1b

    .line 285
    .line 286
    const-string v2, "provider"

    .line 287
    .line 288
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 292
    .line 293
    if-eqz v0, :cond_1c

    .line 294
    .line 295
    const-string v2, "businessType"

    .line 296
    .line 297
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    .line 301
    .line 302
    if-eqz v0, :cond_1d

    .line 303
    .line 304
    const-string v2, "callback"

    .line 305
    .line 306
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 310
    .line 311
    if-eqz v0, :cond_1e

    .line 312
    .line 313
    const-string v2, "source"

    .line 314
    .line 315
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    .line 319
    .line 320
    if-eqz v0, :cond_1f

    .line 321
    .line 322
    const-string v2, "subSource"

    .line 323
    .line 324
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 328
    .line 329
    if-eqz v0, :cond_20

    .line 330
    .line 331
    const-string v2, "id"

    .line 332
    .line 333
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 337
    .line 338
    if-eqz v0, :cond_21

    .line 339
    .line 340
    const-string v2, "caller"

    .line 341
    .line 342
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 346
    .line 347
    if-eqz v0, :cond_22

    .line 348
    .line 349
    const-string v2, "callee"

    .line 350
    .line 351
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 355
    .line 356
    if-eqz v0, :cond_23

    .line 357
    .line 358
    const-string v2, "callerDeviceId"

    .line 359
    .line 360
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 364
    .line 365
    if-eqz v0, :cond_24

    .line 366
    .line 367
    const-string v2, "calleeDeviceId"

    .line 368
    .line 369
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    :cond_24
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 373
    .line 374
    if-eqz v0, :cond_25

    .line 375
    .line 376
    const-string v2, "status"

    .line 377
    .line 378
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    :cond_25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    .line 382
    .line 383
    if-eqz v0, :cond_26

    .line 384
    .line 385
    const-string v2, "channelName"

    .line 386
    .line 387
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    :cond_26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    .line 391
    .line 392
    if-eqz v0, :cond_27

    .line 393
    .line 394
    const-string v2, "callerToken"

    .line 395
    .line 396
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    :cond_27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    .line 400
    .line 401
    if-eqz v0, :cond_28

    .line 402
    .line 403
    const-string v2, "calleeToken"

    .line 404
    .line 405
    invoke-virtual {p2, v2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    .line 407
    .line 408
    :cond_28
    const-string v0, "createdTime"

    .line 409
    .line 410
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    .line 414
    .line 415
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 420
    .line 421
    .line 422
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    .line 423
    .line 424
    if-eqz p0, :cond_29

    .line 425
    .line 426
    const-string v0, "canUserStartLive"

    .line 427
    .line 428
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 429
    .line 430
    .line 431
    move-result p0

    .line 432
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 433
    .line 434
    .line 435
    :cond_29
    const-string p0, "inflow"

    .line 436
    .line 437
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    .line 438
    .line 439
    invoke-virtual {p2, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 440
    .line 441
    .line 442
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    .line 443
    .line 444
    if-eqz p0, :cond_2a

    .line 445
    .line 446
    const-string v0, "origin"

    .line 447
    .line 448
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    .line 452
    .line 453
    if-eqz p0, :cond_2b

    .line 454
    .line 455
    const-string v0, "itemId"

    .line 456
    .line 457
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    .line 459
    .line 460
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    .line 461
    .line 462
    if-eqz p0, :cond_2c

    .line 463
    .line 464
    const-string v0, "orderId"

    .line 465
    .line 466
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    .line 470
    .line 471
    if-eqz p0, :cond_2d

    .line 472
    .line 473
    const-string v0, "privileges"

    .line 474
    .line 475
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 479
    .line 480
    if-eqz p0, :cond_2e

    .line 481
    .line 482
    const-string v0, "matchTopic"

    .line 483
    .line 484
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 488
    .line 489
    if-eqz p0, :cond_2f

    .line 490
    .line 491
    const-string v0, "userId"

    .line 492
    .line 493
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    .line 495
    .line 496
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    .line 497
    .line 498
    if-eqz p0, :cond_30

    .line 499
    .line 500
    const-string v0, "readUntilId"

    .line 501
    .line 502
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    .line 504
    .line 505
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 506
    .line 507
    if-eqz p0, :cond_31

    .line 508
    .line 509
    const-string v0, "letter"

    .line 510
    .line 511
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    .line 515
    .line 516
    if-eqz p0, :cond_32

    .line 517
    .line 518
    const-string v0, "openingRemark"

    .line 519
    .line 520
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 524
    .line 525
    if-eqz p0, :cond_33

    .line 526
    .line 527
    const-string v0, "poolID"

    .line 528
    .line 529
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    :cond_33
    const-string p0, "birthday"

    .line 533
    .line 534
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    .line 535
    .line 536
    invoke-virtual {p2, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 537
    .line 538
    .line 539
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    .line 540
    .line 541
    if-eqz p0, :cond_34

    .line 542
    .line 543
    const-string v0, "productType"

    .line 544
    .line 545
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 549
    .line 550
    if-eqz p0, :cond_35

    .line 551
    .line 552
    const-string v0, "category"

    .line 553
    .line 554
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 555
    .line 556
    .line 557
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    .line 558
    .line 559
    if-eqz p0, :cond_36

    .line 560
    .line 561
    const-string v0, "currencySymbol"

    .line 562
    .line 563
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    :cond_36
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    .line 567
    .line 568
    if-eqz p0, :cond_37

    .line 569
    .line 570
    const-string v0, "price"

    .line 571
    .line 572
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    :cond_37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 576
    .line 577
    if-eqz p0, :cond_38

    .line 578
    .line 579
    const-string v0, "ext"

    .line 580
    .line 581
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    .line 583
    .line 584
    :cond_38
    const-string p0, "duration"

    .line 585
    .line 586
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    .line 587
    .line 588
    invoke-virtual {p2, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 589
    .line 590
    .line 591
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    .line 592
    .line 593
    if-eqz p0, :cond_39

    .line 594
    .line 595
    const-string v0, "likedCount"

    .line 596
    .line 597
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    .line 599
    .line 600
    :cond_39
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    .line 601
    .line 602
    if-eqz p0, :cond_3a

    .line 603
    .line 604
    const-string v0, "likedPopuserCount"

    .line 605
    .line 606
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    :cond_3a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    .line 610
    .line 611
    if-eqz p0, :cond_3b

    .line 612
    .line 613
    const-string v0, "popChange"

    .line 614
    .line 615
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    .line 617
    .line 618
    :cond_3b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    .line 619
    .line 620
    if-eqz p0, :cond_3c

    .line 621
    .line 622
    const-string v0, "userName"

    .line 623
    .line 624
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    .line 626
    .line 627
    :cond_3c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 628
    .line 629
    if-eqz p0, :cond_3d

    .line 630
    .line 631
    const-string v0, "title"

    .line 632
    .line 633
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    :cond_3d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 637
    .line 638
    if-eqz p0, :cond_3e

    .line 639
    .line 640
    const-string v0, "content"

    .line 641
    .line 642
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    :cond_3e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 646
    .line 647
    if-eqz p0, :cond_3f

    .line 648
    .line 649
    const-string v0, "image"

    .line 650
    .line 651
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    .line 653
    .line 654
    :cond_3f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    .line 655
    .line 656
    if-eqz p0, :cond_40

    .line 657
    .line 658
    const-string v0, "couponId"

    .line 659
    .line 660
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    .line 662
    .line 663
    :cond_40
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    .line 664
    .line 665
    if-eqz p0, :cond_41

    .line 666
    .line 667
    const-string v0, "couponDesc"

    .line 668
    .line 669
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    :cond_41
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    .line 673
    .line 674
    if-eqz p0, :cond_42

    .line 675
    .line 676
    const-string v0, "merchandiseId"

    .line 677
    .line 678
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    .line 680
    .line 681
    :cond_42
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    .line 682
    .line 683
    if-eqz p0, :cond_43

    .line 684
    .line 685
    const-string v0, "platform"

    .line 686
    .line 687
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    .line 689
    .line 690
    :cond_43
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    .line 691
    .line 692
    if-eqz p0, :cond_44

    .line 693
    .line 694
    const-string v0, "contractId"

    .line 695
    .line 696
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    .line 698
    .line 699
    :cond_44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 700
    .line 701
    if-eqz p0, :cond_45

    .line 702
    .line 703
    const-string v0, "broadcastID"

    .line 704
    .line 705
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 706
    .line 707
    .line 708
    :cond_45
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    .line 709
    .line 710
    if-eqz p0, :cond_46

    .line 711
    .line 712
    const-string v0, "partyId"

    .line 713
    .line 714
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    .line 716
    .line 717
    :cond_46
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    .line 718
    .line 719
    if-eqz p0, :cond_47

    .line 720
    .line 721
    const-string v0, "score"

    .line 722
    .line 723
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 724
    .line 725
    .line 726
    :cond_47
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    .line 727
    .line 728
    if-eqz p0, :cond_48

    .line 729
    .line 730
    const-string v0, "link"

    .line 731
    .line 732
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    .line 734
    .line 735
    :cond_48
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 736
    .line 737
    if-eqz p0, :cond_49

    .line 738
    .line 739
    const-string v0, "extra"

    .line 740
    .line 741
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    .line 743
    .line 744
    :cond_49
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 745
    .line 746
    if-eqz p0, :cond_4a

    .line 747
    .line 748
    const-string v0, "traceId"

    .line 749
    .line 750
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 751
    .line 752
    .line 753
    :cond_4a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 754
    .line 755
    if-eqz p0, :cond_4b

    .line 756
    .line 757
    const-string v0, "otherID"

    .line 758
    .line 759
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 760
    .line 761
    .line 762
    :cond_4b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 763
    .line 764
    if-eqz p0, :cond_4c

    .line 765
    .line 766
    const-string v0, "messageID"

    .line 767
    .line 768
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 769
    .line 770
    .line 771
    :cond_4c
    const-string p0, "isGreet"

    .line 772
    .line 773
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    .line 774
    .line 775
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 776
    .line 777
    .line 778
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 779
    .line 780
    if-eqz p0, :cond_4d

    .line 781
    .line 782
    const-string v0, "tracker"

    .line 783
    .line 784
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    .line 786
    .line 787
    :cond_4d
    const-string p0, "bellShowStayTime"

    .line 788
    .line 789
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    .line 790
    .line 791
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 792
    .line 793
    .line 794
    const-string p0, "bellNotShowStayTime"

    .line 795
    .line 796
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    .line 797
    .line 798
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 799
    .line 800
    .line 801
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    .line 802
    .line 803
    if-eqz p0, :cond_4e

    .line 804
    .line 805
    const-string v0, "voicePartnerFinderId"

    .line 806
    .line 807
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 808
    .line 809
    .line 810
    :cond_4e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    .line 811
    .line 812
    if-eqz p0, :cond_4f

    .line 813
    .line 814
    const-string v0, "avatar"

    .line 815
    .line 816
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    .line 818
    .line 819
    :cond_4f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    .line 820
    .line 821
    if-eqz p0, :cond_50

    .line 822
    .line 823
    const-string v0, "city"

    .line 824
    .line 825
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 826
    .line 827
    .line 828
    :cond_50
    const-string p0, "distance"

    .line 829
    .line 830
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    .line 831
    .line 832
    invoke-virtual {p2, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 833
    .line 834
    .line 835
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    .line 836
    .line 837
    if-eqz p0, :cond_51

    .line 838
    .line 839
    const-string v0, "zodiac"

    .line 840
    .line 841
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 842
    .line 843
    .line 844
    :cond_51
    const-string p0, "countDownSeconds"

    .line 845
    .line 846
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    .line 847
    .line 848
    invoke-virtual {p2, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 849
    .line 850
    .line 851
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    .line 852
    .line 853
    if-eqz p0, :cond_52

    .line 854
    .line 855
    const-string v0, "topicId"

    .line 856
    .line 857
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 858
    .line 859
    .line 860
    :cond_52
    const-string p0, "maskMode"

    .line 861
    .line 862
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    .line 863
    .line 864
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 865
    .line 866
    .line 867
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    .line 868
    .line 869
    if-eqz p0, :cond_53

    .line 870
    .line 871
    const-string v0, "receiveUserID"

    .line 872
    .line 873
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    :cond_53
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 877
    .line 878
    if-eqz p0, :cond_54

    .line 879
    .line 880
    const-string v0, "radioType"

    .line 881
    .line 882
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 883
    .line 884
    .line 885
    :cond_54
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 886
    .line 887
    if-eqz p0, :cond_55

    .line 888
    .line 889
    const-string p0, "rsStateReceiverToSender"

    .line 890
    .line 891
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 892
    .line 893
    .line 894
    sget-object p0, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 895
    .line 896
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 897
    .line 898
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 899
    .line 900
    .line 901
    :cond_55
    const-string p0, "mandatory"

    .line 902
    .line 903
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 904
    .line 905
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 906
    .line 907
    .line 908
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 909
    .line 910
    if-eqz p0, :cond_56

    .line 911
    .line 912
    const-string v0, "scene"

    .line 913
    .line 914
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 915
    .line 916
    .line 917
    :cond_56
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 918
    .line 919
    if-eqz p0, :cond_57

    .line 920
    .line 921
    const-string v0, "greetID"

    .line 922
    .line 923
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 924
    .line 925
    .line 926
    :cond_57
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 927
    .line 928
    if-eqz p0, :cond_58

    .line 929
    .line 930
    const-string v0, "groupId"

    .line 931
    .line 932
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 933
    .line 934
    .line 935
    :cond_58
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    .line 936
    .line 937
    if-eqz p0, :cond_59

    .line 938
    .line 939
    const-string v0, "videoPartnerFinderId"

    .line 940
    .line 941
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    .line 943
    .line 944
    :cond_59
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 945
    .line 946
    if-eqz p0, :cond_5a

    .line 947
    .line 948
    const-string v0, "startDate"

    .line 949
    .line 950
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 951
    .line 952
    .line 953
    :cond_5a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 954
    .line 955
    if-eqz p0, :cond_5b

    .line 956
    .line 957
    const-string v0, "endDate"

    .line 958
    .line 959
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 960
    .line 961
    .line 962
    :cond_5b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    .line 963
    .line 964
    if-eqz p0, :cond_5c

    .line 965
    .line 966
    const-string v0, "creationData"

    .line 967
    .line 968
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 969
    .line 970
    .line 971
    :cond_5c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    .line 972
    .line 973
    if-eqz p0, :cond_5d

    .line 974
    .line 975
    const-string v0, "stateID"

    .line 976
    .line 977
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 978
    .line 979
    .line 980
    :cond_5d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    .line 981
    .line 982
    if-eqz p0, :cond_5e

    .line 983
    .line 984
    const-string v0, "stage"

    .line 985
    .line 986
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 987
    .line 988
    .line 989
    :cond_5e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 990
    .line 991
    if-eqz p0, :cond_5f

    .line 992
    .line 993
    const-string v0, "biz"

    .line 994
    .line 995
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 996
    .line 997
    .line 998
    :cond_5f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 999
    .line 1000
    if-eqz p0, :cond_60

    .line 1001
    .line 1002
    const-string v0, "text"

    .line 1003
    .line 1004
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1005
    .line 1006
    .line 1007
    :cond_60
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    .line 1008
    .line 1009
    if-eqz p0, :cond_61

    .line 1010
    .line 1011
    const-string v0, "otherUserId"

    .line 1012
    .line 1013
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1014
    .line 1015
    .line 1016
    :cond_61
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 1017
    .line 1018
    if-eqz p0, :cond_62

    .line 1019
    .line 1020
    const-string v0, "type"

    .line 1021
    .line 1022
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1023
    .line 1024
    .line 1025
    :cond_62
    const-string p0, "lastActiveTime"

    .line 1026
    .line 1027
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    .line 1028
    .line 1029
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 1030
    .line 1031
    .line 1032
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    .line 1033
    .line 1034
    if-eqz p0, :cond_63

    .line 1035
    .line 1036
    const-string v0, "otherUserName"

    .line 1037
    .line 1038
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1039
    .line 1040
    .line 1041
    :cond_63
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 1042
    .line 1043
    if-eqz p0, :cond_64

    .line 1044
    .line 1045
    const-string v0, "avatarState"

    .line 1046
    .line 1047
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    .line 1049
    .line 1050
    :cond_64
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 1051
    .line 1052
    if-eqz p0, :cond_65

    .line 1053
    .line 1054
    const-string v0, "subTitle"

    .line 1055
    .line 1056
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1057
    .line 1058
    .line 1059
    :cond_65
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 1060
    .line 1061
    if-eqz p0, :cond_66

    .line 1062
    .line 1063
    const-string v0, "state"

    .line 1064
    .line 1065
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1066
    .line 1067
    .line 1068
    :cond_66
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 1069
    .line 1070
    if-eqz p0, :cond_67

    .line 1071
    .line 1072
    const-string v0, "conversationId"

    .line 1073
    .line 1074
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1075
    .line 1076
    .line 1077
    :cond_67
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 1078
    .line 1079
    if-eqz p0, :cond_68

    .line 1080
    .line 1081
    const-string v0, "liveTitle"

    .line 1082
    .line 1083
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1084
    .line 1085
    .line 1086
    :cond_68
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 1087
    .line 1088
    if-eqz p0, :cond_69

    .line 1089
    .line 1090
    const-string v0, "anchorId"

    .line 1091
    .line 1092
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1093
    .line 1094
    .line 1095
    :cond_69
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 1096
    .line 1097
    if-eqz p0, :cond_6a

    .line 1098
    .line 1099
    const-string v0, "msgId"

    .line 1100
    .line 1101
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1102
    .line 1103
    .line 1104
    :cond_6a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 1105
    .line 1106
    if-eqz p0, :cond_6b

    .line 1107
    .line 1108
    const-string v0, "schema"

    .line 1109
    .line 1110
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1111
    .line 1112
    .line 1113
    :cond_6b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 1114
    .line 1115
    if-eqz p0, :cond_6c

    .line 1116
    .line 1117
    const-string v0, "triggeredUserId"

    .line 1118
    .line 1119
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1120
    .line 1121
    .line 1122
    :cond_6c
    const-string p0, "noRecommended"

    .line 1123
    .line 1124
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    .line 1125
    .line 1126
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1127
    .line 1128
    .line 1129
    const-string p0, "isPassive"

    .line 1130
    .line 1131
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 1132
    .line 1133
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1134
    .line 1135
    .line 1136
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 1137
    .line 1138
    if-eqz p0, :cond_6d

    .line 1139
    .line 1140
    const-string v0, "USSInsert"

    .line 1141
    .line 1142
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1143
    .line 1144
    .line 1145
    :cond_6d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 1146
    .line 1147
    if-eqz p0, :cond_6e

    .line 1148
    .line 1149
    const-string v0, "USSToast"

    .line 1150
    .line 1151
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1152
    .line 1153
    .line 1154
    :cond_6e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 1155
    .line 1156
    if-eqz p0, :cond_6f

    .line 1157
    .line 1158
    const-string v0, "USSPage"

    .line 1159
    .line 1160
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1161
    .line 1162
    .line 1163
    :cond_6f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 1164
    .line 1165
    if-eqz p0, :cond_70

    .line 1166
    .line 1167
    const-string v0, "USSBusiness"

    .line 1168
    .line 1169
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1170
    .line 1171
    .line 1172
    :cond_70
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 1173
    .line 1174
    if-eqz p0, :cond_71

    .line 1175
    .line 1176
    const-string v0, "USSIds"

    .line 1177
    .line 1178
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1179
    .line 1180
    .line 1181
    :cond_71
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 1182
    .line 1183
    if-eqz p0, :cond_72

    .line 1184
    .line 1185
    const-string v0, "USSVerify"

    .line 1186
    .line 1187
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1188
    .line 1189
    .line 1190
    :cond_72
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 1191
    .line 1192
    if-eqz p0, :cond_73

    .line 1193
    .line 1194
    const-string v0, "USSOption"

    .line 1195
    .line 1196
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1197
    .line 1198
    .line 1199
    :cond_73
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 1200
    .line 1201
    if-eqz p0, :cond_74

    .line 1202
    .line 1203
    const-string v0, "testGroupName"

    .line 1204
    .line 1205
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1206
    .line 1207
    .line 1208
    :cond_74
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 1209
    .line 1210
    if-eqz p0, :cond_75

    .line 1211
    .line 1212
    const-string v0, "avatars"

    .line 1213
    .line 1214
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1215
    .line 1216
    .line 1217
    :cond_75
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 1218
    .line 1219
    if-eqz p0, :cond_76

    .line 1220
    .line 1221
    const-string v0, "liveMode"

    .line 1222
    .line 1223
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1224
    .line 1225
    .line 1226
    :cond_76
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 1227
    .line 1228
    if-eqz p0, :cond_77

    .line 1229
    .line 1230
    const-string v0, "channel"

    .line 1231
    .line 1232
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1233
    .line 1234
    .line 1235
    :cond_77
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 1236
    .line 1237
    if-eqz p0, :cond_78

    .line 1238
    .line 1239
    const-string v0, "buzzToken"

    .line 1240
    .line 1241
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1242
    .line 1243
    .line 1244
    :cond_78
    const-string p0, "extraPrivileges"

    .line 1245
    .line 1246
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    .line 1247
    .line 1248
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1249
    .line 1250
    .line 1251
    const-string p0, "popupsDisplay"

    .line 1252
    .line 1253
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    .line 1254
    .line 1255
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1256
    .line 1257
    .line 1258
    const-string p0, "initialDuration"

    .line 1259
    .line 1260
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    .line 1261
    .line 1262
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1263
    .line 1264
    .line 1265
    const-string p0, "prolongCount"

    .line 1266
    .line 1267
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    .line 1268
    .line 1269
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1270
    .line 1271
    .line 1272
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 1273
    .line 1274
    if-eqz p0, :cond_79

    .line 1275
    .line 1276
    const-string v0, "appId"

    .line 1277
    .line 1278
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1279
    .line 1280
    .line 1281
    :cond_79
    const-string p0, "vendor"

    .line 1282
    .line 1283
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    .line 1284
    .line 1285
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1286
    .line 1287
    .line 1288
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 1289
    .line 1290
    if-eqz p0, :cond_7a

    .line 1291
    .line 1292
    const-string v0, "channelToken"

    .line 1293
    .line 1294
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1295
    .line 1296
    .line 1297
    :cond_7a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 1298
    .line 1299
    if-eqz p0, :cond_7b

    .line 1300
    .line 1301
    const-string v0, "channelKey"

    .line 1302
    .line 1303
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1304
    .line 1305
    .line 1306
    :cond_7b
    const-string p0, "totalDuration"

    .line 1307
    .line 1308
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    .line 1309
    .line 1310
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1311
    .line 1312
    .line 1313
    const-string p0, "frozenDuration"

    .line 1314
    .line 1315
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    .line 1316
    .line 1317
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1318
    .line 1319
    .line 1320
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 1321
    .line 1322
    if-eqz p0, :cond_7c

    .line 1323
    .line 1324
    const-string v0, "bellType"

    .line 1325
    .line 1326
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1327
    .line 1328
    .line 1329
    :cond_7c
    const-string p0, "resolutionHeight"

    .line 1330
    .line 1331
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    .line 1332
    .line 1333
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1334
    .line 1335
    .line 1336
    const-string p0, "resolutionWidth"

    .line 1337
    .line 1338
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    .line 1339
    .line 1340
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1341
    .line 1342
    .line 1343
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 1344
    .line 1345
    if-eqz p0, :cond_7d

    .line 1346
    .line 1347
    const-string v0, "cell"

    .line 1348
    .line 1349
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1350
    .line 1351
    .line 1352
    :cond_7d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 1353
    .line 1354
    if-eqz p0, :cond_7e

    .line 1355
    .line 1356
    const-string v0, "questionIdSelected"

    .line 1357
    .line 1358
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1359
    .line 1360
    .line 1361
    :cond_7e
    const-string p0, "insidePool"

    .line 1362
    .line 1363
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    .line 1364
    .line 1365
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1366
    .line 1367
    .line 1368
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 1369
    .line 1370
    if-eqz p0, :cond_7f

    .line 1371
    .line 1372
    const-string v0, "mode"

    .line 1373
    .line 1374
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1375
    .line 1376
    .line 1377
    :cond_7f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 1378
    .line 1379
    if-eqz p0, :cond_80

    .line 1380
    .line 1381
    const-string v0, "gid"

    .line 1382
    .line 1383
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1384
    .line 1385
    .line 1386
    :cond_80
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 1387
    .line 1388
    if-eqz p0, :cond_81

    .line 1389
    .line 1390
    const-string v0, "intent"

    .line 1391
    .line 1392
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1393
    .line 1394
    .line 1395
    :cond_81
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 1396
    .line 1397
    if-eqz p0, :cond_82

    .line 1398
    .line 1399
    const-string v0, "ruleKey"

    .line 1400
    .line 1401
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1402
    .line 1403
    .line 1404
    :cond_82
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 1405
    .line 1406
    if-eqz p0, :cond_83

    .line 1407
    .line 1408
    const-string v0, "selectedQuestion"

    .line 1409
    .line 1410
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1411
    .line 1412
    .line 1413
    :cond_83
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 1414
    .line 1415
    if-eqz p0, :cond_84

    .line 1416
    .line 1417
    const-string v0, "timestamp"

    .line 1418
    .line 1419
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1420
    .line 1421
    .line 1422
    :cond_84
    const-string p0, "needReact"

    .line 1423
    .line 1424
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    .line 1425
    .line 1426
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1427
    .line 1428
    .line 1429
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 1430
    .line 1431
    if-eqz p0, :cond_85

    .line 1432
    .line 1433
    const-string v0, "reaction"

    .line 1434
    .line 1435
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1436
    .line 1437
    .line 1438
    :cond_85
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 1439
    .line 1440
    if-eqz p0, :cond_86

    .line 1441
    .line 1442
    const-string v0, "alertId"

    .line 1443
    .line 1444
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1445
    .line 1446
    .line 1447
    :cond_86
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 1448
    .line 1449
    if-eqz p0, :cond_87

    .line 1450
    .line 1451
    const-string v0, "otherUsers"

    .line 1452
    .line 1453
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1454
    .line 1455
    .line 1456
    :cond_87
    const-string p0, "memojiDuration"

    .line 1457
    .line 1458
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    .line 1459
    .line 1460
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 1461
    .line 1462
    .line 1463
    const-string p0, "NewToast"

    .line 1464
    .line 1465
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    .line 1466
    .line 1467
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1468
    .line 1469
    .line 1470
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 1471
    .line 1472
    if-eqz p0, :cond_88

    .line 1473
    .line 1474
    const-string v0, "bgImg"

    .line 1475
    .line 1476
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1477
    .line 1478
    .line 1479
    :cond_88
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 1480
    .line 1481
    if-eqz p0, :cond_89

    .line 1482
    .line 1483
    const-string v0, "pushChannel"

    .line 1484
    .line 1485
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1486
    .line 1487
    .line 1488
    :cond_89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 1489
    .line 1490
    if-eqz p0, :cond_8a

    .line 1491
    .line 1492
    const-string v0, "extremePickShowId"

    .line 1493
    .line 1494
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1495
    .line 1496
    .line 1497
    :cond_8a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 1498
    .line 1499
    if-eqz p0, :cond_8b

    .line 1500
    .line 1501
    const-string v0, "added"

    .line 1502
    .line 1503
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1504
    .line 1505
    .line 1506
    :cond_8b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 1507
    .line 1508
    if-eqz p0, :cond_8c

    .line 1509
    .line 1510
    const-string v0, "unread"

    .line 1511
    .line 1512
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1513
    .line 1514
    .line 1515
    :cond_8c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 1516
    .line 1517
    if-eqz p0, :cond_8d

    .line 1518
    .line 1519
    const-string v0, "total"

    .line 1520
    .line 1521
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1522
    .line 1523
    .line 1524
    :cond_8d
    const-string p0, "matched"

    .line 1525
    .line 1526
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    .line 1527
    .line 1528
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1529
    .line 1530
    .line 1531
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 1532
    .line 1533
    if-eqz p0, :cond_8e

    .line 1534
    .line 1535
    const-string v0, "honorGiftCardDetail"

    .line 1536
    .line 1537
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1538
    .line 1539
    .line 1540
    :cond_8e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    .line 1541
    .line 1542
    if-eqz p0, :cond_8f

    .line 1543
    .line 1544
    const-string v0, "canShowNotification"

    .line 1545
    .line 1546
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1547
    .line 1548
    .line 1549
    move-result p0

    .line 1550
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1551
    .line 1552
    .line 1553
    :cond_8f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 1554
    .line 1555
    if-eqz p0, :cond_90

    .line 1556
    .line 1557
    const-string v0, "localNotificationCategory"

    .line 1558
    .line 1559
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1560
    .line 1561
    .line 1562
    :cond_90
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 1563
    .line 1564
    if-eqz p0, :cond_91

    .line 1565
    .line 1566
    const-string v0, "localNotificationImportance"

    .line 1567
    .line 1568
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1569
    .line 1570
    .line 1571
    :cond_91
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 1572
    .line 1573
    if-eqz p0, :cond_92

    .line 1574
    .line 1575
    const-string v0, "anchorCallId"

    .line 1576
    .line 1577
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1578
    .line 1579
    .line 1580
    :cond_92
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 1581
    .line 1582
    if-eqz p0, :cond_93

    .line 1583
    .line 1584
    const-string v0, "channelNameV2"

    .line 1585
    .line 1586
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1587
    .line 1588
    .line 1589
    :cond_93
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 1590
    .line 1591
    if-eqz p0, :cond_94

    .line 1592
    .line 1593
    const-string v0, "callerTokenV2"

    .line 1594
    .line 1595
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1596
    .line 1597
    .line 1598
    :cond_94
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 1599
    .line 1600
    if-eqz p0, :cond_95

    .line 1601
    .line 1602
    const-string v0, "calleeTokenV2"

    .line 1603
    .line 1604
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1605
    .line 1606
    .line 1607
    :cond_95
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 1608
    .line 1609
    if-eqz p0, :cond_96

    .line 1610
    .line 1611
    const-string v0, "rtcProvider"

    .line 1612
    .line 1613
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1614
    .line 1615
    .line 1616
    :cond_96
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 1617
    .line 1618
    if-eqz p0, :cond_97

    .line 1619
    .line 1620
    const-string v0, "videoChatId"

    .line 1621
    .line 1622
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1623
    .line 1624
    .line 1625
    :cond_97
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 1626
    .line 1627
    if-eqz p0, :cond_98

    .line 1628
    .line 1629
    const-string v0, "fitReason"

    .line 1630
    .line 1631
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1632
    .line 1633
    .line 1634
    :cond_98
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 1635
    .line 1636
    if-eqz p0, :cond_99

    .line 1637
    .line 1638
    const-string v0, "friendPurpose"

    .line 1639
    .line 1640
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1641
    .line 1642
    .line 1643
    :cond_99
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 1644
    .line 1645
    if-eqz p0, :cond_9a

    .line 1646
    .line 1647
    const-string v0, "zodiacFitPercent"

    .line 1648
    .line 1649
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1650
    .line 1651
    .line 1652
    :cond_9a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 1653
    .line 1654
    if-eqz p0, :cond_9b

    .line 1655
    .line 1656
    const-string v0, "tagID"

    .line 1657
    .line 1658
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1659
    .line 1660
    .line 1661
    :cond_9b
    const-string p0, "msgSingleUpdateIgnoreConvStatus"

    .line 1662
    .line 1663
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    .line 1664
    .line 1665
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 1666
    .line 1667
    .line 1668
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 1669
    .line 1670
    if-eqz p0, :cond_9c

    .line 1671
    .line 1672
    const-string p1, "emoji"

    .line 1673
    .line 1674
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 1675
    .line 1676
    .line 1677
    :cond_9c
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1678
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/PushMessageCustom$2;->serializeFields(Lcom/p1/mobile/putong/data/PushMessageCustom;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
