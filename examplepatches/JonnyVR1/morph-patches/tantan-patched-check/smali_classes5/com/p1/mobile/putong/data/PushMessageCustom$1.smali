.class Lcom/p1/mobile/putong/data/PushMessageCustom$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
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
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/PushMessageCustom;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/PushMessageCustom;)I
    .locals 3

    const/4 p0, 0x1

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    move-result p0

    const/4 v0, 0x2

    .line 2
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 5
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    if-eqz v0, :cond_2

    const/4 v1, 0x5

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 6
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    if-eqz v0, :cond_3

    const/4 v1, 0x6

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 7
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    if-eqz v0, :cond_4

    const/4 v1, 0x7

    .line 8
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 9
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    if-eqz v0, :cond_5

    const/16 v1, 0x8

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 10
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/16 v1, 0x9

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 11
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    if-eqz v0, :cond_7

    const/16 v1, 0xa

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 12
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    if-eqz v0, :cond_8

    const/16 v1, 0xb

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 13
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    if-eqz v0, :cond_9

    const/16 v1, 0xc

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 14
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    if-eqz v0, :cond_a

    const/16 v1, 0xd

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 15
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    if-eqz v0, :cond_b

    const/16 v1, 0xe

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 16
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    if-eqz v0, :cond_c

    const/16 v1, 0xf

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 18
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    if-eqz v0, :cond_d

    const/16 v1, 0x10

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 19
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    if-eqz v0, :cond_e

    const/16 v1, 0x11

    .line 20
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 21
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    if-eqz v0, :cond_f

    const/16 v1, 0x12

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 22
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    if-eqz v0, :cond_10

    const/16 v1, 0x13

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 23
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    if-eqz v0, :cond_11

    const/16 v1, 0x14

    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 25
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    if-eqz v0, :cond_12

    const/16 v1, 0x15

    .line 26
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 27
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    if-eqz v0, :cond_13

    const/16 v1, 0x16

    .line 28
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 29
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    if-eqz v0, :cond_14

    const/16 v1, 0x17

    .line 30
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 31
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    if-eqz v0, :cond_15

    const/16 v1, 0x18

    .line 32
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_15
    const/16 v0, 0x19

    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    if-eqz v0, :cond_16

    const/16 v1, 0x1a

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 36
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    if-eqz v0, :cond_17

    const/16 v1, 0x1b

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_17
    const/16 v0, 0x1c

    .line 38
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    if-eqz v0, :cond_18

    const/16 v1, 0x1d

    .line 40
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 41
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    if-eqz v0, :cond_19

    const/16 v1, 0x1e

    .line 42
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 43
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    if-eqz v0, :cond_1a

    const/16 v1, 0x1f

    .line 44
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 45
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    if-eqz v0, :cond_1b

    const/16 v1, 0x20

    .line 46
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 47
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    if-eqz v0, :cond_1c

    const/16 v1, 0x21

    .line 48
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 49
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    if-eqz v0, :cond_1d

    const/16 v1, 0x22

    .line 50
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 51
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    if-eqz v0, :cond_1e

    const/16 v1, 0x23

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 52
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    if-eqz v0, :cond_1f

    const/16 v1, 0x24

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 54
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    if-eqz v0, :cond_20

    const/16 v1, 0x25

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 55
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    if-eqz v0, :cond_21

    const/16 v1, 0x26

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 56
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    if-eqz v0, :cond_22

    const/16 v1, 0x27

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 57
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    if-eqz v0, :cond_23

    const/16 v1, 0x28

    .line 58
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 59
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    if-eqz v0, :cond_24

    const/16 v1, 0x29

    .line 60
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 61
    :cond_24
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    if-eqz v0, :cond_25

    const/16 v1, 0x2a

    .line 62
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 63
    :cond_25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    if-eqz v0, :cond_26

    const/16 v1, 0x2b

    .line 64
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 65
    :cond_26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    if-eqz v0, :cond_27

    const/16 v1, 0x2c

    .line 66
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 67
    :cond_27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    if-eqz v0, :cond_28

    const/16 v1, 0x2d

    .line 68
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_28
    const/16 v0, 0x2e

    .line 69
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    move-result v0

    add-int/2addr p0, v0

    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    if-eqz v0, :cond_29

    const/16 v1, 0x2f

    .line 71
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    :cond_29
    const/16 v0, 0x30

    .line 72
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 73
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    if-eqz v0, :cond_2a

    const/16 v1, 0x31

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 74
    :cond_2a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    if-eqz v0, :cond_2b

    const/16 v1, 0x32

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 75
    :cond_2b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    if-eqz v0, :cond_2c

    const/16 v1, 0x33

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 76
    :cond_2c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    if-eqz v0, :cond_2d

    const/16 v1, 0x34

    .line 77
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 78
    :cond_2d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    if-eqz v0, :cond_2e

    const/16 v1, 0x35

    .line 79
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 80
    :cond_2e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    if-eqz v0, :cond_2f

    const/16 v1, 0x36

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 81
    :cond_2f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    if-eqz v0, :cond_30

    const/16 v1, 0x37

    .line 82
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 83
    :cond_30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    if-eqz v0, :cond_31

    const/16 v1, 0x38

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 84
    :cond_31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    if-eqz v0, :cond_32

    const/16 v1, 0x39

    .line 85
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 86
    :cond_32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    if-eqz v0, :cond_33

    const/16 v1, 0x3a

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_33
    const/16 v0, 0x3b

    .line 87
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    if-eqz v0, :cond_34

    const/16 v1, 0x3c

    .line 89
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 90
    :cond_34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    if-eqz v0, :cond_35

    const/16 v1, 0x3d

    .line 91
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 92
    :cond_35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    if-eqz v0, :cond_36

    const/16 v1, 0x3e

    .line 93
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 94
    :cond_36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    if-eqz v0, :cond_37

    const/16 v1, 0x3f

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 95
    :cond_37
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    if-eqz v0, :cond_38

    const/16 v1, 0x40

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_38
    const/16 v0, 0x41

    .line 96
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    if-eqz v0, :cond_39

    const/16 v1, 0x42

    .line 98
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 99
    :cond_39
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    if-eqz v0, :cond_3a

    const/16 v1, 0x43

    .line 100
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 101
    :cond_3a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    if-eqz v0, :cond_3b

    const/16 v1, 0x44

    .line 102
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 103
    :cond_3b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    if-eqz v0, :cond_3c

    const/16 v1, 0x45

    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 105
    :cond_3c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    if-eqz v0, :cond_3d

    const/16 v1, 0x46

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 106
    :cond_3d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    if-eqz v0, :cond_3e

    const/16 v1, 0x47

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 107
    :cond_3e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    if-eqz v0, :cond_3f

    const/16 v1, 0x48

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 108
    :cond_3f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    if-eqz v0, :cond_40

    const/16 v1, 0x49

    .line 109
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 110
    :cond_40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    if-eqz v0, :cond_41

    const/16 v1, 0x4a

    .line 111
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 112
    :cond_41
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    if-eqz v0, :cond_42

    const/16 v1, 0x4b

    .line 113
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 114
    :cond_42
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    if-eqz v0, :cond_43

    const/16 v1, 0x4c

    .line 115
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 116
    :cond_43
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    if-eqz v0, :cond_44

    const/16 v1, 0x4d

    .line 117
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 118
    :cond_44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    if-eqz v0, :cond_45

    const/16 v1, 0x4e

    .line 119
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 120
    :cond_45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    if-eqz v0, :cond_46

    const/16 v1, 0x4f

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 121
    :cond_46
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    if-eqz v0, :cond_47

    const/16 v1, 0x50

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 122
    :cond_47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    if-eqz v0, :cond_48

    const/16 v1, 0x51

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 123
    :cond_48
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    if-eqz v0, :cond_49

    const/16 v1, 0x52

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 124
    :cond_49
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    if-eqz v0, :cond_4a

    const/16 v1, 0x53

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 125
    :cond_4a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    if-eqz v0, :cond_4b

    const/16 v1, 0x54

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 126
    :cond_4b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    if-eqz v0, :cond_4c

    const/16 v1, 0x55

    .line 127
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_4c
    const/16 v0, 0x56

    .line 128
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 129
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    if-eqz v0, :cond_4d

    const/16 v1, 0x57

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_4d
    const/16 v0, 0x58

    .line 130
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x59

    .line 131
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 132
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    if-eqz v0, :cond_4e

    const/16 v1, 0x5a

    .line 133
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 134
    :cond_4e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    if-eqz v0, :cond_4f

    const/16 v1, 0x5b

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 135
    :cond_4f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    if-eqz v0, :cond_50

    const/16 v1, 0x5c

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_50
    const/16 v0, 0x5d

    .line 136
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 137
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    if-eqz v0, :cond_51

    const/16 v1, 0x5e

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_51
    const/16 v0, 0x5f

    .line 138
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    if-eqz v0, :cond_52

    const/16 v1, 0x60

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_52
    const/16 v0, 0x61

    .line 140
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 141
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    if-eqz v0, :cond_53

    const/16 v1, 0x62

    .line 142
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 143
    :cond_53
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    if-eqz v0, :cond_54

    const/16 v1, 0x63

    .line 144
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 145
    :cond_54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    if-eqz v0, :cond_55

    const/16 v1, 0x64

    .line 146
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 147
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 148
    :cond_55
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    if-eqz v0, :cond_56

    const/16 v1, 0x65

    .line 149
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v0

    .line 150
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    :cond_56
    const/16 v0, 0x66

    .line 151
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 152
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    if-eqz v0, :cond_57

    const/16 v1, 0x67

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 153
    :cond_57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    if-eqz v0, :cond_58

    const/16 v1, 0x68

    .line 154
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 155
    :cond_58
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    if-eqz v0, :cond_59

    const/16 v1, 0x69

    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 157
    :cond_59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    if-eqz v0, :cond_5a

    const/16 v1, 0x6a

    .line 158
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 159
    :cond_5a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    if-eqz v0, :cond_5b

    const/16 v1, 0x6b

    .line 160
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 161
    :cond_5b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    if-eqz v0, :cond_5c

    const/16 v1, 0x6c

    .line 162
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 163
    :cond_5c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    if-eqz v0, :cond_5d

    const/16 v1, 0x6d

    .line 164
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 165
    :cond_5d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    if-eqz v0, :cond_5e

    const/16 v1, 0x6e

    .line 166
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 167
    :cond_5e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    if-eqz v0, :cond_5f

    const/16 v1, 0x6f

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 168
    :cond_5f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    if-eqz v0, :cond_60

    const/16 v1, 0x70

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 169
    :cond_60
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    if-eqz v0, :cond_61

    const/16 v1, 0x71

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 170
    :cond_61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    if-eqz v0, :cond_62

    const/16 v1, 0x72

    .line 171
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 172
    :cond_62
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    if-eqz v0, :cond_63

    const/16 v1, 0x73

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_63
    const/16 v0, 0x74

    .line 173
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 174
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    if-eqz v0, :cond_64

    const/16 v1, 0x75

    .line 175
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 176
    :cond_64
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    if-eqz v0, :cond_65

    const/16 v1, 0x76

    .line 177
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 178
    :cond_65
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    if-eqz v0, :cond_66

    const/16 v1, 0x77

    .line 179
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 180
    :cond_66
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    if-eqz v0, :cond_67

    const/16 v1, 0x78

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 181
    :cond_67
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    if-eqz v0, :cond_68

    const/16 v1, 0x79

    .line 182
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 183
    :cond_68
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    if-eqz v0, :cond_69

    const/16 v1, 0x7a

    .line 184
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 185
    :cond_69
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    if-eqz v0, :cond_6a

    const/16 v1, 0x7b

    .line 186
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 187
    :cond_6a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    if-eqz v0, :cond_6b

    const/16 v1, 0x7c

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 188
    :cond_6b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    if-eqz v0, :cond_6c

    const/16 v1, 0x7d

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 189
    :cond_6c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    if-eqz v0, :cond_6d

    const/16 v1, 0x7e

    .line 190
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_6d
    const/16 v0, 0x7f

    .line 191
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x80

    .line 192
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 193
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    if-eqz v0, :cond_6e

    const/16 v1, 0x81

    .line 194
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 195
    :cond_6e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    if-eqz v0, :cond_6f

    const/16 v1, 0x82

    .line 196
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 197
    :cond_6f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    if-eqz v0, :cond_70

    const/16 v1, 0x83

    .line 198
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 199
    :cond_70
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    if-eqz v0, :cond_71

    const/16 v1, 0x84

    .line 200
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 201
    :cond_71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    if-eqz v0, :cond_72

    const/16 v1, 0x85

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 202
    :cond_72
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    if-eqz v0, :cond_73

    const/16 v1, 0x86

    .line 203
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 204
    :cond_73
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    if-eqz v0, :cond_74

    const/16 v1, 0x87

    .line 205
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 206
    :cond_74
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    if-eqz v0, :cond_75

    const/16 v1, 0x88

    .line 207
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 208
    :cond_75
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    if-eqz v0, :cond_76

    const/16 v1, 0x89

    .line 209
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 210
    :cond_76
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    if-eqz v0, :cond_77

    const/16 v1, 0x8a

    .line 211
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 212
    :cond_77
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    if-eqz v0, :cond_78

    const/16 v1, 0x8b

    .line 213
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 214
    :cond_78
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    if-eqz v0, :cond_79

    const/16 v1, 0x8c

    .line 215
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_79
    const/16 v0, 0x8d

    .line 216
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x8e

    .line 217
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x8f

    .line 218
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x90

    .line 219
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 220
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    if-eqz v0, :cond_7a

    const/16 v1, 0x91

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_7a
    const/16 v0, 0x92

    .line 221
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 222
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    if-eqz v0, :cond_7b

    const/16 v1, 0x93

    .line 223
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 224
    :cond_7b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    if-eqz v0, :cond_7c

    const/16 v1, 0x94

    .line 225
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_7c
    const/16 v0, 0x95

    .line 226
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x96

    .line 227
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 228
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    if-eqz v0, :cond_7d

    const/16 v1, 0x97

    .line 229
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_7d
    const/16 v0, 0x98

    .line 230
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x99

    .line 231
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 232
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    if-eqz v0, :cond_7e

    const/16 v1, 0x9a

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 233
    :cond_7e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    if-eqz v0, :cond_7f

    const/16 v1, 0x9b

    .line 234
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_7f
    const/16 v0, 0x9c

    .line 235
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 236
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    if-eqz v0, :cond_80

    const/16 v1, 0x9d

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 237
    :cond_80
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    if-eqz v0, :cond_81

    const/16 v1, 0x9e

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 238
    :cond_81
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    if-eqz v0, :cond_82

    const/16 v1, 0x9f

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 239
    :cond_82
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    if-eqz v0, :cond_83

    const/16 v1, 0xa0

    .line 240
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 241
    :cond_83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    if-eqz v0, :cond_84

    const/16 v1, 0xa1

    .line 242
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 243
    :cond_84
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    if-eqz v0, :cond_85

    const/16 v1, 0xa2

    .line 244
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_85
    const/16 v0, 0xa3

    .line 245
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 246
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    if-eqz v0, :cond_86

    const/16 v1, 0xa4

    .line 247
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 248
    :cond_86
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    if-eqz v0, :cond_87

    const/16 v1, 0xa5

    .line 249
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 250
    :cond_87
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    if-eqz v0, :cond_88

    const/16 v1, 0xa6

    .line 251
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_88
    const/16 v0, 0xa7

    .line 252
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0xa8

    .line 253
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 254
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    if-eqz v0, :cond_89

    const/16 v1, 0xa9

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 255
    :cond_89
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    if-eqz v0, :cond_8a

    const/16 v1, 0xaa

    .line 256
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 257
    :cond_8a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    if-eqz v0, :cond_8b

    const/16 v1, 0xab

    .line 258
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 259
    :cond_8b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    if-eqz v0, :cond_8c

    const/16 v1, 0xac

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 260
    :cond_8c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    if-eqz v0, :cond_8d

    const/16 v1, 0xad

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 261
    :cond_8d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    if-eqz v0, :cond_8e

    const/16 v1, 0xae

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_8e
    const/16 v0, 0xaf

    .line 262
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    if-eqz v0, :cond_8f

    const/16 v1, 0xb0

    .line 264
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 265
    :cond_8f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    if-eqz v0, :cond_90

    const/16 v1, 0xb1

    .line 266
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 267
    :cond_90
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    if-eqz v0, :cond_91

    const/16 v1, 0xb2

    .line 268
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 269
    :cond_91
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    if-eqz v0, :cond_92

    const/16 v1, 0xb3

    .line 270
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 271
    :cond_92
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    if-eqz v0, :cond_93

    const/16 v1, 0xb4

    .line 272
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 273
    :cond_93
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    if-eqz v0, :cond_94

    const/16 v1, 0xb5

    .line 274
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 275
    :cond_94
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    if-eqz v0, :cond_95

    const/16 v1, 0xb6

    .line 276
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 277
    :cond_95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    if-eqz v0, :cond_96

    const/16 v1, 0xb7

    .line 278
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 279
    :cond_96
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    if-eqz v0, :cond_97

    const/16 v1, 0xb8

    .line 280
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 281
    :cond_97
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    if-eqz v0, :cond_98

    const/16 v1, 0xb9

    .line 282
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 283
    :cond_98
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    if-eqz v0, :cond_99

    const/16 v1, 0xba

    .line 284
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 285
    :cond_99
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    if-eqz v0, :cond_9a

    const/16 v1, 0xbb

    .line 286
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 287
    :cond_9a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    if-eqz v0, :cond_9b

    const/16 v1, 0xbc

    .line 288
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 289
    :cond_9b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    if-eqz v0, :cond_9c

    const/16 v1, 0xbd

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_9c
    const/16 v0, 0xbe

    .line 290
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 291
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    if-eqz v0, :cond_9d

    const/16 v1, 0xbf

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 292
    :cond_9d
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 293
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PushMessageCustom$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/PushMessageCustom;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PushMessageCustom;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PushMessageCustom;-><init>()V

    const/4 v0, 0x0

    move-object v1, v0

    .line 2
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    move-result v2

    .line 3
    const-string v3, ""

    sparse-switch v2, :sswitch_data_0

    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    if-nez p1, :cond_0

    if-eqz v1, :cond_0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    if-nez p1, :cond_1

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 8
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    if-nez p1, :cond_2

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 9
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    if-nez p1, :cond_3

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 10
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    if-nez p1, :cond_4

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 11
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    if-nez p1, :cond_5

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 12
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    if-nez p1, :cond_6

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 13
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    if-nez p1, :cond_7

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 14
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    if-nez p1, :cond_8

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 15
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    if-nez p1, :cond_9

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 16
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    if-nez p1, :cond_a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 17
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    if-nez p1, :cond_b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 18
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    if-nez p1, :cond_c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 19
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    if-nez p1, :cond_d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 20
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    if-nez p1, :cond_e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 21
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    if-nez p1, :cond_f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 22
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    if-nez p1, :cond_10

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 23
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    if-nez p1, :cond_11

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 24
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    if-nez p1, :cond_12

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 25
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    if-nez p1, :cond_13

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 26
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    if-nez p1, :cond_14

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 27
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    if-nez p1, :cond_15

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 28
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    if-nez p1, :cond_16

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 29
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    if-nez p1, :cond_17

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 30
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    if-nez p1, :cond_18

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 31
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    if-nez p1, :cond_19

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 32
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    if-nez p1, :cond_1a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 33
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    if-nez p1, :cond_1b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 34
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    if-nez p1, :cond_1c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 35
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    if-nez p1, :cond_1d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 36
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    if-nez p1, :cond_1e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 37
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    if-nez p1, :cond_1f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 38
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    if-nez p1, :cond_20

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 39
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    if-nez p1, :cond_21

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 40
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    if-nez p1, :cond_22

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 41
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    if-nez p1, :cond_23

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 42
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    if-nez p1, :cond_24

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 43
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    if-nez p1, :cond_25

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 44
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    if-nez p1, :cond_26

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 45
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    if-nez p1, :cond_27

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 46
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    if-nez p1, :cond_28

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 47
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    if-nez p1, :cond_29

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 48
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    if-nez p1, :cond_2a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 49
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    if-nez p1, :cond_2b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 50
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    if-nez p1, :cond_2c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 51
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    if-nez p1, :cond_2d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 52
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    if-nez p1, :cond_2e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 53
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    if-nez p1, :cond_2f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 54
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    if-nez p1, :cond_30

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 55
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    if-nez p1, :cond_31

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 56
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    if-nez p1, :cond_32

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 57
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    if-nez p1, :cond_33

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 58
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    if-nez p1, :cond_34

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 59
    :cond_34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    if-nez p1, :cond_35

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 60
    :cond_35
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    if-nez p1, :cond_36

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 61
    :cond_36
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    if-nez p1, :cond_37

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 62
    :cond_37
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    if-nez p1, :cond_38

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 63
    :cond_38
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    if-nez p1, :cond_39

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 64
    :cond_39
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    if-nez p1, :cond_3a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 65
    :cond_3a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    if-nez p1, :cond_3b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 66
    :cond_3b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    if-nez p1, :cond_3c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 67
    :cond_3c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    if-nez p1, :cond_3d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 68
    :cond_3d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    if-nez p1, :cond_3e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 69
    :cond_3e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    if-nez p1, :cond_3f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 70
    :cond_3f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    if-nez p1, :cond_40

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 71
    :cond_40
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    if-nez p1, :cond_41

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 72
    :cond_41
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    if-nez p1, :cond_84

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    return-object p0

    .line 73
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    goto/16 :goto_0

    .line 74
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    goto/16 :goto_0

    .line 75
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    goto/16 :goto_0

    .line 76
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    goto/16 :goto_0

    .line 77
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    goto/16 :goto_0

    .line 78
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    goto/16 :goto_0

    .line 79
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    goto/16 :goto_0

    .line 80
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    goto/16 :goto_0

    .line 81
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    goto/16 :goto_0

    .line 82
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    goto/16 :goto_0

    .line 83
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    goto/16 :goto_0

    .line 84
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    goto/16 :goto_0

    .line 85
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    goto/16 :goto_0

    .line 86
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    goto/16 :goto_0

    .line 87
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 88
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    goto/16 :goto_0

    .line 89
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    goto/16 :goto_0

    .line 90
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    goto/16 :goto_0

    .line 91
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    goto/16 :goto_0

    .line 92
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    goto/16 :goto_0

    .line 93
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    goto/16 :goto_0

    .line 94
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    goto/16 :goto_0

    .line 95
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    goto/16 :goto_0

    .line 96
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    goto/16 :goto_0

    .line 97
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    goto/16 :goto_0

    .line 98
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    goto/16 :goto_0

    .line 99
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    goto/16 :goto_0

    .line 100
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    goto/16 :goto_0

    .line 101
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    goto/16 :goto_0

    .line 102
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    goto/16 :goto_0

    .line 103
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    goto/16 :goto_0

    .line 104
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    goto/16 :goto_0

    .line 105
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    goto/16 :goto_0

    .line 106
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    goto/16 :goto_0

    .line 107
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    goto/16 :goto_0

    .line 108
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    goto/16 :goto_0

    .line 109
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    goto/16 :goto_0

    .line 110
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    goto/16 :goto_0

    .line 111
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    goto/16 :goto_0

    .line 112
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    goto/16 :goto_0

    .line 113
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    goto/16 :goto_0

    .line 114
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    goto/16 :goto_0

    .line 115
    :sswitch_2a
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    goto/16 :goto_0

    .line 116
    :sswitch_2b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    goto/16 :goto_0

    .line 117
    :sswitch_2c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 118
    :sswitch_2d
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    goto/16 :goto_0

    .line 119
    :sswitch_2e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    goto/16 :goto_0

    .line 120
    :sswitch_2f
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    goto/16 :goto_0

    .line 121
    :sswitch_30
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    goto/16 :goto_0

    .line 122
    :sswitch_31
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    goto/16 :goto_0

    .line 123
    :sswitch_32
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    goto/16 :goto_0

    .line 124
    :sswitch_33
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 125
    :sswitch_34
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    goto/16 :goto_0

    .line 126
    :sswitch_35
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    goto/16 :goto_0

    .line 127
    :sswitch_36
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    goto/16 :goto_0

    .line 128
    :sswitch_37
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    goto/16 :goto_0

    .line 129
    :sswitch_38
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    goto/16 :goto_0

    .line 130
    :sswitch_39
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    goto/16 :goto_0

    .line 131
    :sswitch_3a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    goto/16 :goto_0

    .line 132
    :sswitch_3b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    goto/16 :goto_0

    .line 133
    :sswitch_3c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    goto/16 :goto_0

    .line 134
    :sswitch_3d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    goto/16 :goto_0

    .line 135
    :sswitch_3e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    goto/16 :goto_0

    .line 136
    :sswitch_3f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    goto/16 :goto_0

    .line 137
    :sswitch_40
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    goto/16 :goto_0

    .line 138
    :sswitch_41
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    goto/16 :goto_0

    .line 139
    :sswitch_42
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    goto/16 :goto_0

    .line 140
    :sswitch_43
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    goto/16 :goto_0

    .line 141
    :sswitch_44
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    goto/16 :goto_0

    .line 142
    :sswitch_45
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    goto/16 :goto_0

    .line 143
    :sswitch_46
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    goto/16 :goto_0

    .line 144
    :sswitch_47
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    goto/16 :goto_0

    .line 145
    :sswitch_48
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    goto/16 :goto_0

    .line 146
    :sswitch_49
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    goto/16 :goto_0

    .line 147
    :sswitch_4a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    goto/16 :goto_0

    .line 148
    :sswitch_4b
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    goto/16 :goto_0

    .line 149
    :sswitch_4c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    goto/16 :goto_0

    .line 150
    :sswitch_4d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    goto/16 :goto_0

    .line 151
    :sswitch_4e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    goto/16 :goto_0

    .line 152
    :sswitch_4f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    goto/16 :goto_0

    .line 153
    :sswitch_50
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    goto/16 :goto_0

    .line 154
    :sswitch_51
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    goto/16 :goto_0

    .line 155
    :sswitch_52
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    goto/16 :goto_0

    .line 156
    :sswitch_53
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    goto/16 :goto_0

    .line 157
    :sswitch_54
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    goto/16 :goto_0

    .line 158
    :sswitch_55
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    goto/16 :goto_0

    .line 159
    :sswitch_56
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    goto/16 :goto_0

    .line 160
    :sswitch_57
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    goto/16 :goto_0

    .line 161
    :sswitch_58
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    goto/16 :goto_0

    .line 162
    :sswitch_59
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    goto/16 :goto_0

    .line 163
    :sswitch_5a
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto/16 :goto_0

    .line 164
    :sswitch_5b
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 165
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/data/RelationshipStatus;

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    goto/16 :goto_0

    .line 166
    :sswitch_5c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    goto/16 :goto_0

    .line 167
    :sswitch_5d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    goto/16 :goto_0

    .line 168
    :sswitch_5e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    goto/16 :goto_0

    .line 169
    :sswitch_5f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    goto/16 :goto_0

    .line 170
    :sswitch_60
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    goto/16 :goto_0

    .line 171
    :sswitch_61
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    goto/16 :goto_0

    .line 172
    :sswitch_62
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    goto/16 :goto_0

    .line 173
    :sswitch_63
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    goto/16 :goto_0

    .line 174
    :sswitch_64
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    goto/16 :goto_0

    .line 175
    :sswitch_65
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    goto/16 :goto_0

    .line 176
    :sswitch_66
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    goto/16 :goto_0

    .line 177
    :sswitch_67
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    goto/16 :goto_0

    .line 178
    :sswitch_68
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    goto/16 :goto_0

    .line 179
    :sswitch_69
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    goto/16 :goto_0

    .line 180
    :sswitch_6a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    goto/16 :goto_0

    .line 181
    :sswitch_6b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    goto/16 :goto_0

    .line 182
    :sswitch_6c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    goto/16 :goto_0

    .line 183
    :sswitch_6d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    goto/16 :goto_0

    .line 184
    :sswitch_6e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    goto/16 :goto_0

    .line 185
    :sswitch_6f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    goto/16 :goto_0

    .line 186
    :sswitch_70
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    goto/16 :goto_0

    .line 187
    :sswitch_71
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    goto/16 :goto_0

    .line 188
    :sswitch_72
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    goto/16 :goto_0

    .line 189
    :sswitch_73
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    goto/16 :goto_0

    .line 190
    :sswitch_74
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    goto/16 :goto_0

    .line 191
    :sswitch_75
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    goto/16 :goto_0

    .line 192
    :sswitch_76
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    goto/16 :goto_0

    .line 193
    :sswitch_77
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    goto/16 :goto_0

    .line 194
    :sswitch_78
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    goto/16 :goto_0

    .line 195
    :sswitch_79
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    goto/16 :goto_0

    .line 196
    :sswitch_7a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    goto/16 :goto_0

    .line 197
    :sswitch_7b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    goto/16 :goto_0

    .line 198
    :sswitch_7c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    goto/16 :goto_0

    .line 199
    :sswitch_7d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    goto/16 :goto_0

    .line 200
    :sswitch_7e
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    goto/16 :goto_0

    .line 201
    :sswitch_7f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    goto/16 :goto_0

    .line 202
    :sswitch_80
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    goto/16 :goto_0

    .line 203
    :sswitch_81
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    goto/16 :goto_0

    .line 204
    :sswitch_82
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    goto/16 :goto_0

    .line 205
    :sswitch_83
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    goto/16 :goto_0

    .line 206
    :sswitch_84
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    goto/16 :goto_0

    .line 207
    :sswitch_85
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    goto/16 :goto_0

    .line 208
    :sswitch_86
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    goto/16 :goto_0

    .line 209
    :sswitch_87
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    goto/16 :goto_0

    .line 210
    :sswitch_88
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    goto/16 :goto_0

    .line 211
    :sswitch_89
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    goto/16 :goto_0

    .line 212
    :sswitch_8a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    goto/16 :goto_0

    .line 213
    :sswitch_8b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    goto/16 :goto_0

    .line 214
    :sswitch_8c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    goto/16 :goto_0

    .line 215
    :sswitch_8d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    goto/16 :goto_0

    .line 216
    :sswitch_8e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    goto/16 :goto_0

    .line 217
    :sswitch_8f
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    goto/16 :goto_0

    .line 218
    :sswitch_90
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 219
    :sswitch_91
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    goto/16 :goto_0

    .line 220
    :sswitch_92
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 221
    :sswitch_93
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 222
    :sswitch_94
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    goto/16 :goto_0

    .line 223
    :sswitch_95
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    goto/16 :goto_0

    .line 224
    :sswitch_96
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    goto/16 :goto_0

    .line 225
    :sswitch_97
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    goto/16 :goto_0

    .line 226
    :sswitch_98
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    goto/16 :goto_0

    .line 227
    :sswitch_99
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    goto/16 :goto_0

    .line 228
    :sswitch_9a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    goto/16 :goto_0

    .line 229
    :sswitch_9b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    goto/16 :goto_0

    .line 230
    :sswitch_9c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    goto/16 :goto_0

    .line 231
    :sswitch_9d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    goto/16 :goto_0

    .line 232
    :sswitch_9e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    goto/16 :goto_0

    .line 233
    :sswitch_9f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    goto/16 :goto_0

    .line 234
    :sswitch_a0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    goto/16 :goto_0

    .line 235
    :sswitch_a1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 236
    :sswitch_a2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    goto/16 :goto_0

    .line 237
    :sswitch_a3
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    goto/16 :goto_0

    .line 238
    :sswitch_a4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    goto/16 :goto_0

    .line 239
    :sswitch_a5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 240
    :sswitch_a6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    goto/16 :goto_0

    .line 241
    :sswitch_a7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    goto/16 :goto_0

    .line 242
    :sswitch_a8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    goto/16 :goto_0

    .line 243
    :sswitch_a9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    goto/16 :goto_0

    .line 244
    :sswitch_aa
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    goto/16 :goto_0

    .line 245
    :sswitch_ab
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    goto/16 :goto_0

    .line 246
    :sswitch_ac
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    goto/16 :goto_0

    .line 247
    :sswitch_ad
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    goto/16 :goto_0

    .line 248
    :sswitch_ae
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    goto/16 :goto_0

    .line 249
    :sswitch_af
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    goto/16 :goto_0

    .line 250
    :sswitch_b0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    goto/16 :goto_0

    .line 251
    :sswitch_b1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    goto/16 :goto_0

    .line 252
    :sswitch_b2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    goto/16 :goto_0

    .line 253
    :sswitch_b3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    goto/16 :goto_0

    .line 254
    :sswitch_b4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    goto/16 :goto_0

    .line 255
    :sswitch_b5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    goto/16 :goto_0

    .line 256
    :sswitch_b6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    goto/16 :goto_0

    .line 257
    :sswitch_b7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    goto/16 :goto_0

    .line 258
    :sswitch_b8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    goto/16 :goto_0

    .line 259
    :sswitch_b9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    goto/16 :goto_0

    .line 260
    :sswitch_ba
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    goto/16 :goto_0

    .line 261
    :sswitch_bb
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    goto/16 :goto_0

    .line 262
    :sswitch_bc
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    goto/16 :goto_0

    .line 263
    :sswitch_bd
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v2

    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    goto/16 :goto_0

    .line 264
    :sswitch_be
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    goto/16 :goto_0

    .line 265
    :sswitch_bf
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    if-nez p1, :cond_42

    if-eqz v1, :cond_42

    .line 266
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 267
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 268
    :cond_42
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    if-nez p1, :cond_43

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 269
    :cond_43
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    if-nez p1, :cond_44

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 270
    :cond_44
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    if-nez p1, :cond_45

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 271
    :cond_45
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    if-nez p1, :cond_46

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 272
    :cond_46
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    if-nez p1, :cond_47

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 273
    :cond_47
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    if-nez p1, :cond_48

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 274
    :cond_48
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    if-nez p1, :cond_49

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 275
    :cond_49
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    if-nez p1, :cond_4a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 276
    :cond_4a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    if-nez p1, :cond_4b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 277
    :cond_4b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    if-nez p1, :cond_4c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 278
    :cond_4c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    if-nez p1, :cond_4d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 279
    :cond_4d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    if-nez p1, :cond_4e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 280
    :cond_4e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    if-nez p1, :cond_4f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 281
    :cond_4f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    if-nez p1, :cond_50

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 282
    :cond_50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    if-nez p1, :cond_51

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 283
    :cond_51
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    if-nez p1, :cond_52

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 284
    :cond_52
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    if-nez p1, :cond_53

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 285
    :cond_53
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    if-nez p1, :cond_54

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 286
    :cond_54
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    if-nez p1, :cond_55

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 287
    :cond_55
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    if-nez p1, :cond_56

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 288
    :cond_56
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    if-nez p1, :cond_57

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 289
    :cond_57
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    if-nez p1, :cond_58

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 290
    :cond_58
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    if-nez p1, :cond_59

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 291
    :cond_59
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    if-nez p1, :cond_5a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 292
    :cond_5a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    if-nez p1, :cond_5b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 293
    :cond_5b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    if-nez p1, :cond_5c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 294
    :cond_5c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    if-nez p1, :cond_5d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 295
    :cond_5d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    if-nez p1, :cond_5e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 296
    :cond_5e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    if-nez p1, :cond_5f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 297
    :cond_5f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    if-nez p1, :cond_60

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 298
    :cond_60
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    if-nez p1, :cond_61

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 299
    :cond_61
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    if-nez p1, :cond_62

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 300
    :cond_62
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    if-nez p1, :cond_63

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 301
    :cond_63
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    if-nez p1, :cond_64

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 302
    :cond_64
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    if-nez p1, :cond_65

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 303
    :cond_65
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    if-nez p1, :cond_66

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 304
    :cond_66
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    if-nez p1, :cond_67

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 305
    :cond_67
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    if-nez p1, :cond_68

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 306
    :cond_68
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    if-nez p1, :cond_69

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 307
    :cond_69
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    if-nez p1, :cond_6a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 308
    :cond_6a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    if-nez p1, :cond_6b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 309
    :cond_6b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    if-nez p1, :cond_6c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 310
    :cond_6c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    if-nez p1, :cond_6d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 311
    :cond_6d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    if-nez p1, :cond_6e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 312
    :cond_6e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    if-nez p1, :cond_6f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 313
    :cond_6f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    if-nez p1, :cond_70

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 314
    :cond_70
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    if-nez p1, :cond_71

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 315
    :cond_71
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    if-nez p1, :cond_72

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 316
    :cond_72
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    if-nez p1, :cond_73

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 317
    :cond_73
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    if-nez p1, :cond_74

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 318
    :cond_74
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    if-nez p1, :cond_75

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 319
    :cond_75
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    if-nez p1, :cond_76

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 320
    :cond_76
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    if-nez p1, :cond_77

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 321
    :cond_77
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    if-nez p1, :cond_78

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 322
    :cond_78
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    if-nez p1, :cond_79

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 323
    :cond_79
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    if-nez p1, :cond_7a

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 324
    :cond_7a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    if-nez p1, :cond_7b

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 325
    :cond_7b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    if-nez p1, :cond_7c

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 326
    :cond_7c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    if-nez p1, :cond_7d

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 327
    :cond_7d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    if-nez p1, :cond_7e

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 328
    :cond_7e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    if-nez p1, :cond_7f

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 329
    :cond_7f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    if-nez p1, :cond_80

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 330
    :cond_80
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    if-nez p1, :cond_81

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 331
    :cond_81
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    if-nez p1, :cond_82

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 332
    :cond_82
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    if-nez p1, :cond_83

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 333
    :cond_83
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    if-nez p1, :cond_84

    iput-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    :cond_84
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_bf
        0x9 -> :sswitch_be
        0x10 -> :sswitch_bd
        0x1a -> :sswitch_bc
        0x22 -> :sswitch_bb
        0x2a -> :sswitch_ba
        0x32 -> :sswitch_b9
        0x3a -> :sswitch_b8
        0x42 -> :sswitch_b7
        0x4a -> :sswitch_b6
        0x52 -> :sswitch_b5
        0x5a -> :sswitch_b4
        0x62 -> :sswitch_b3
        0x6a -> :sswitch_b2
        0x72 -> :sswitch_b1
        0x7a -> :sswitch_b0
        0x82 -> :sswitch_af
        0x8a -> :sswitch_ae
        0x92 -> :sswitch_ad
        0x9a -> :sswitch_ac
        0xa2 -> :sswitch_ab
        0xaa -> :sswitch_aa
        0xb2 -> :sswitch_a9
        0xba -> :sswitch_a8
        0xc2 -> :sswitch_a7
        0xc8 -> :sswitch_a6
        0xd2 -> :sswitch_a5
        0xda -> :sswitch_a4
        0xe0 -> :sswitch_a3
        0xea -> :sswitch_a2
        0xf2 -> :sswitch_a1
        0xfa -> :sswitch_a0
        0x102 -> :sswitch_9f
        0x10a -> :sswitch_9e
        0x112 -> :sswitch_9d
        0x11a -> :sswitch_9c
        0x122 -> :sswitch_9b
        0x12a -> :sswitch_9a
        0x132 -> :sswitch_99
        0x13a -> :sswitch_98
        0x142 -> :sswitch_97
        0x14a -> :sswitch_96
        0x152 -> :sswitch_95
        0x15a -> :sswitch_94
        0x162 -> :sswitch_93
        0x16a -> :sswitch_92
        0x171 -> :sswitch_91
        0x178 -> :sswitch_90
        0x180 -> :sswitch_8f
        0x18a -> :sswitch_8e
        0x192 -> :sswitch_8d
        0x19a -> :sswitch_8c
        0x1a2 -> :sswitch_8b
        0x1aa -> :sswitch_8a
        0x1b2 -> :sswitch_89
        0x1ba -> :sswitch_88
        0x1c2 -> :sswitch_87
        0x1ca -> :sswitch_86
        0x1d2 -> :sswitch_85
        0x1d8 -> :sswitch_84
        0x1e2 -> :sswitch_83
        0x1ea -> :sswitch_82
        0x1f2 -> :sswitch_81
        0x1fa -> :sswitch_80
        0x202 -> :sswitch_7f
        0x208 -> :sswitch_7e
        0x212 -> :sswitch_7d
        0x21a -> :sswitch_7c
        0x222 -> :sswitch_7b
        0x22a -> :sswitch_7a
        0x232 -> :sswitch_79
        0x23a -> :sswitch_78
        0x242 -> :sswitch_77
        0x24a -> :sswitch_76
        0x252 -> :sswitch_75
        0x25a -> :sswitch_74
        0x262 -> :sswitch_73
        0x26a -> :sswitch_72
        0x272 -> :sswitch_71
        0x27a -> :sswitch_70
        0x282 -> :sswitch_6f
        0x28a -> :sswitch_6e
        0x292 -> :sswitch_6d
        0x29a -> :sswitch_6c
        0x2a2 -> :sswitch_6b
        0x2aa -> :sswitch_6a
        0x2b0 -> :sswitch_69
        0x2ba -> :sswitch_68
        0x2c0 -> :sswitch_67
        0x2c8 -> :sswitch_66
        0x2d2 -> :sswitch_65
        0x2da -> :sswitch_64
        0x2e2 -> :sswitch_63
        0x2e8 -> :sswitch_62
        0x2f2 -> :sswitch_61
        0x2f8 -> :sswitch_60
        0x302 -> :sswitch_5f
        0x308 -> :sswitch_5e
        0x312 -> :sswitch_5d
        0x31a -> :sswitch_5c
        0x322 -> :sswitch_5b
        0x328 -> :sswitch_5a
        0x330 -> :sswitch_59
        0x33a -> :sswitch_58
        0x342 -> :sswitch_57
        0x34a -> :sswitch_56
        0x352 -> :sswitch_55
        0x35a -> :sswitch_54
        0x362 -> :sswitch_53
        0x36a -> :sswitch_52
        0x372 -> :sswitch_51
        0x37a -> :sswitch_50
        0x382 -> :sswitch_4f
        0x38a -> :sswitch_4e
        0x392 -> :sswitch_4d
        0x39a -> :sswitch_4c
        0x3a0 -> :sswitch_4b
        0x3aa -> :sswitch_4a
        0x3b2 -> :sswitch_49
        0x3ba -> :sswitch_48
        0x3c2 -> :sswitch_47
        0x3ca -> :sswitch_46
        0x3d2 -> :sswitch_45
        0x3da -> :sswitch_44
        0x3e2 -> :sswitch_43
        0x3ea -> :sswitch_42
        0x3f2 -> :sswitch_41
        0x3f8 -> :sswitch_40
        0x400 -> :sswitch_3f
        0x40a -> :sswitch_3e
        0x412 -> :sswitch_3d
        0x41a -> :sswitch_3c
        0x422 -> :sswitch_3b
        0x42a -> :sswitch_3a
        0x432 -> :sswitch_39
        0x43a -> :sswitch_38
        0x442 -> :sswitch_37
        0x44a -> :sswitch_36
        0x452 -> :sswitch_35
        0x45a -> :sswitch_34
        0x462 -> :sswitch_33
        0x468 -> :sswitch_32
        0x470 -> :sswitch_31
        0x478 -> :sswitch_30
        0x480 -> :sswitch_2f
        0x48a -> :sswitch_2e
        0x490 -> :sswitch_2d
        0x49a -> :sswitch_2c
        0x4a2 -> :sswitch_2b
        0x4a8 -> :sswitch_2a
        0x4b0 -> :sswitch_29
        0x4ba -> :sswitch_28
        0x4c0 -> :sswitch_27
        0x4c8 -> :sswitch_26
        0x4d2 -> :sswitch_25
        0x4da -> :sswitch_24
        0x4e0 -> :sswitch_23
        0x4ea -> :sswitch_22
        0x4f2 -> :sswitch_21
        0x4fa -> :sswitch_20
        0x502 -> :sswitch_1f
        0x50a -> :sswitch_1e
        0x512 -> :sswitch_1d
        0x518 -> :sswitch_1c
        0x522 -> :sswitch_1b
        0x52a -> :sswitch_1a
        0x532 -> :sswitch_19
        0x538 -> :sswitch_18
        0x540 -> :sswitch_17
        0x54a -> :sswitch_16
        0x552 -> :sswitch_15
        0x55a -> :sswitch_14
        0x562 -> :sswitch_13
        0x56a -> :sswitch_12
        0x572 -> :sswitch_11
        0x578 -> :sswitch_10
        0x582 -> :sswitch_f
        0x588 -> :sswitch_e
        0x592 -> :sswitch_d
        0x59a -> :sswitch_c
        0x5a2 -> :sswitch_b
        0x5aa -> :sswitch_a
        0x5b2 -> :sswitch_9
        0x5ba -> :sswitch_8
        0x5c2 -> :sswitch_7
        0x5ca -> :sswitch_6
        0x5d2 -> :sswitch_5
        0x5da -> :sswitch_4
        0x5e2 -> :sswitch_3
        0x5ea -> :sswitch_2
        0x5f0 -> :sswitch_1
        0x5fa -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 334
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PushMessageCustom$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PushMessageCustom;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/PushMessageCustom;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x6

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x7

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    const/16 v0, 0x9

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 v0, 0xa

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_8

    .line 83
    .line 84
    const/16 v0, 0xb

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_9

    .line 92
    .line 93
    const/16 v0, 0xc

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p0, :cond_a

    .line 101
    .line 102
    const/16 v0, 0xd

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz p0, :cond_b

    .line 110
    .line 111
    const/16 v0, 0xe

    .line 112
    .line 113
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_c

    .line 119
    .line 120
    const/16 v0, 0xf

    .line 121
    .line 122
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz p0, :cond_d

    .line 128
    .line 129
    const/16 v0, 0x10

    .line 130
    .line 131
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz p0, :cond_e

    .line 137
    .line 138
    const/16 v0, 0x11

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz p0, :cond_f

    .line 146
    .line 147
    const/16 v0, 0x12

    .line 148
    .line 149
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz p0, :cond_10

    .line 155
    .line 156
    const/16 v0, 0x13

    .line 157
    .line 158
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    .line 162
    .line 163
    if-eqz p0, :cond_11

    .line 164
    .line 165
    const/16 v0, 0x14

    .line 166
    .line 167
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz p0, :cond_12

    .line 173
    .line 174
    const/16 v0, 0x15

    .line 175
    .line 176
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz p0, :cond_13

    .line 182
    .line 183
    const/16 v0, 0x16

    .line 184
    .line 185
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    .line 189
    .line 190
    if-eqz p0, :cond_14

    .line 191
    .line 192
    const/16 v0, 0x17

    .line 193
    .line 194
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    .line 198
    .line 199
    if-eqz p0, :cond_15

    .line 200
    .line 201
    const/16 v0, 0x18

    .line 202
    .line 203
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 204
    .line 205
    .line 206
    :cond_15
    const/16 p0, 0x19

    .line 207
    .line 208
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    .line 209
    .line 210
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 211
    .line 212
    .line 213
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    .line 214
    .line 215
    if-eqz p0, :cond_16

    .line 216
    .line 217
    const/16 v0, 0x1a

    .line 218
    .line 219
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    .line 223
    .line 224
    if-eqz p0, :cond_17

    .line 225
    .line 226
    const/16 v0, 0x1b

    .line 227
    .line 228
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 229
    .line 230
    .line 231
    :cond_17
    const/16 p0, 0x1c

    .line 232
    .line 233
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    .line 234
    .line 235
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 236
    .line 237
    .line 238
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    .line 239
    .line 240
    if-eqz p0, :cond_18

    .line 241
    .line 242
    const/16 v0, 0x1d

    .line 243
    .line 244
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 245
    .line 246
    .line 247
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    .line 248
    .line 249
    if-eqz p0, :cond_19

    .line 250
    .line 251
    const/16 v0, 0x1e

    .line 252
    .line 253
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 254
    .line 255
    .line 256
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    .line 257
    .line 258
    if-eqz p0, :cond_1a

    .line 259
    .line 260
    const/16 v0, 0x1f

    .line 261
    .line 262
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    .line 266
    .line 267
    if-eqz p0, :cond_1b

    .line 268
    .line 269
    const/16 v0, 0x20

    .line 270
    .line 271
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 272
    .line 273
    .line 274
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 275
    .line 276
    if-eqz p0, :cond_1c

    .line 277
    .line 278
    const/16 v0, 0x21

    .line 279
    .line 280
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 281
    .line 282
    .line 283
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    .line 284
    .line 285
    if-eqz p0, :cond_1d

    .line 286
    .line 287
    const/16 v0, 0x22

    .line 288
    .line 289
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 290
    .line 291
    .line 292
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 293
    .line 294
    if-eqz p0, :cond_1e

    .line 295
    .line 296
    const/16 v0, 0x23

    .line 297
    .line 298
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 299
    .line 300
    .line 301
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    .line 302
    .line 303
    if-eqz p0, :cond_1f

    .line 304
    .line 305
    const/16 v0, 0x24

    .line 306
    .line 307
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 308
    .line 309
    .line 310
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 311
    .line 312
    if-eqz p0, :cond_20

    .line 313
    .line 314
    const/16 v0, 0x25

    .line 315
    .line 316
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 317
    .line 318
    .line 319
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 320
    .line 321
    if-eqz p0, :cond_21

    .line 322
    .line 323
    const/16 v0, 0x26

    .line 324
    .line 325
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 326
    .line 327
    .line 328
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 329
    .line 330
    if-eqz p0, :cond_22

    .line 331
    .line 332
    const/16 v0, 0x27

    .line 333
    .line 334
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 335
    .line 336
    .line 337
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 338
    .line 339
    if-eqz p0, :cond_23

    .line 340
    .line 341
    const/16 v0, 0x28

    .line 342
    .line 343
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 344
    .line 345
    .line 346
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 347
    .line 348
    if-eqz p0, :cond_24

    .line 349
    .line 350
    const/16 v0, 0x29

    .line 351
    .line 352
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 353
    .line 354
    .line 355
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 356
    .line 357
    if-eqz p0, :cond_25

    .line 358
    .line 359
    const/16 v0, 0x2a

    .line 360
    .line 361
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 362
    .line 363
    .line 364
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    .line 365
    .line 366
    if-eqz p0, :cond_26

    .line 367
    .line 368
    const/16 v0, 0x2b

    .line 369
    .line 370
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    .line 374
    .line 375
    if-eqz p0, :cond_27

    .line 376
    .line 377
    const/16 v0, 0x2c

    .line 378
    .line 379
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 380
    .line 381
    .line 382
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    .line 383
    .line 384
    if-eqz p0, :cond_28

    .line 385
    .line 386
    const/16 v0, 0x2d

    .line 387
    .line 388
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 389
    .line 390
    .line 391
    :cond_28
    const/16 p0, 0x2e

    .line 392
    .line 393
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    .line 394
    .line 395
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 396
    .line 397
    .line 398
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    .line 399
    .line 400
    if-eqz p0, :cond_29

    .line 401
    .line 402
    const/16 v0, 0x2f

    .line 403
    .line 404
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 405
    .line 406
    .line 407
    move-result p0

    .line 408
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 409
    .line 410
    .line 411
    :cond_29
    const/16 p0, 0x30

    .line 412
    .line 413
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    .line 414
    .line 415
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 416
    .line 417
    .line 418
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    .line 419
    .line 420
    if-eqz p0, :cond_2a

    .line 421
    .line 422
    const/16 v0, 0x31

    .line 423
    .line 424
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 425
    .line 426
    .line 427
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    .line 428
    .line 429
    if-eqz p0, :cond_2b

    .line 430
    .line 431
    const/16 v0, 0x32

    .line 432
    .line 433
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 434
    .line 435
    .line 436
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    .line 437
    .line 438
    if-eqz p0, :cond_2c

    .line 439
    .line 440
    const/16 v0, 0x33

    .line 441
    .line 442
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 443
    .line 444
    .line 445
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    .line 446
    .line 447
    if-eqz p0, :cond_2d

    .line 448
    .line 449
    const/16 v0, 0x34

    .line 450
    .line 451
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 452
    .line 453
    .line 454
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 455
    .line 456
    if-eqz p0, :cond_2e

    .line 457
    .line 458
    const/16 v0, 0x35

    .line 459
    .line 460
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 461
    .line 462
    .line 463
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 464
    .line 465
    if-eqz p0, :cond_2f

    .line 466
    .line 467
    const/16 v0, 0x36

    .line 468
    .line 469
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 470
    .line 471
    .line 472
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    .line 473
    .line 474
    if-eqz p0, :cond_30

    .line 475
    .line 476
    const/16 v0, 0x37

    .line 477
    .line 478
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 479
    .line 480
    .line 481
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 482
    .line 483
    if-eqz p0, :cond_31

    .line 484
    .line 485
    const/16 v0, 0x38

    .line 486
    .line 487
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 488
    .line 489
    .line 490
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    .line 491
    .line 492
    if-eqz p0, :cond_32

    .line 493
    .line 494
    const/16 v0, 0x39

    .line 495
    .line 496
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 497
    .line 498
    .line 499
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 500
    .line 501
    if-eqz p0, :cond_33

    .line 502
    .line 503
    const/16 v0, 0x3a

    .line 504
    .line 505
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 506
    .line 507
    .line 508
    :cond_33
    const/16 p0, 0x3b

    .line 509
    .line 510
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    .line 511
    .line 512
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 513
    .line 514
    .line 515
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    .line 516
    .line 517
    if-eqz p0, :cond_34

    .line 518
    .line 519
    const/16 v0, 0x3c

    .line 520
    .line 521
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 522
    .line 523
    .line 524
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 525
    .line 526
    if-eqz p0, :cond_35

    .line 527
    .line 528
    const/16 v0, 0x3d

    .line 529
    .line 530
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 531
    .line 532
    .line 533
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    .line 534
    .line 535
    if-eqz p0, :cond_36

    .line 536
    .line 537
    const/16 v0, 0x3e

    .line 538
    .line 539
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 540
    .line 541
    .line 542
    :cond_36
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    .line 543
    .line 544
    if-eqz p0, :cond_37

    .line 545
    .line 546
    const/16 v0, 0x3f

    .line 547
    .line 548
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 549
    .line 550
    .line 551
    :cond_37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 552
    .line 553
    if-eqz p0, :cond_38

    .line 554
    .line 555
    const/16 v0, 0x40

    .line 556
    .line 557
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 558
    .line 559
    .line 560
    :cond_38
    const/16 p0, 0x41

    .line 561
    .line 562
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    .line 563
    .line 564
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 565
    .line 566
    .line 567
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    .line 568
    .line 569
    if-eqz p0, :cond_39

    .line 570
    .line 571
    const/16 v0, 0x42

    .line 572
    .line 573
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 574
    .line 575
    .line 576
    :cond_39
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    .line 577
    .line 578
    if-eqz p0, :cond_3a

    .line 579
    .line 580
    const/16 v0, 0x43

    .line 581
    .line 582
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 583
    .line 584
    .line 585
    :cond_3a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    .line 586
    .line 587
    if-eqz p0, :cond_3b

    .line 588
    .line 589
    const/16 v0, 0x44

    .line 590
    .line 591
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 592
    .line 593
    .line 594
    :cond_3b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    .line 595
    .line 596
    if-eqz p0, :cond_3c

    .line 597
    .line 598
    const/16 v0, 0x45

    .line 599
    .line 600
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 601
    .line 602
    .line 603
    :cond_3c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 604
    .line 605
    if-eqz p0, :cond_3d

    .line 606
    .line 607
    const/16 v0, 0x46

    .line 608
    .line 609
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 610
    .line 611
    .line 612
    :cond_3d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 613
    .line 614
    if-eqz p0, :cond_3e

    .line 615
    .line 616
    const/16 v0, 0x47

    .line 617
    .line 618
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 619
    .line 620
    .line 621
    :cond_3e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 622
    .line 623
    if-eqz p0, :cond_3f

    .line 624
    .line 625
    const/16 v0, 0x48

    .line 626
    .line 627
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 628
    .line 629
    .line 630
    :cond_3f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    .line 631
    .line 632
    if-eqz p0, :cond_40

    .line 633
    .line 634
    const/16 v0, 0x49

    .line 635
    .line 636
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 637
    .line 638
    .line 639
    :cond_40
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    .line 640
    .line 641
    if-eqz p0, :cond_41

    .line 642
    .line 643
    const/16 v0, 0x4a

    .line 644
    .line 645
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 646
    .line 647
    .line 648
    :cond_41
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    .line 649
    .line 650
    if-eqz p0, :cond_42

    .line 651
    .line 652
    const/16 v0, 0x4b

    .line 653
    .line 654
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 655
    .line 656
    .line 657
    :cond_42
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    .line 658
    .line 659
    if-eqz p0, :cond_43

    .line 660
    .line 661
    const/16 v0, 0x4c

    .line 662
    .line 663
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 664
    .line 665
    .line 666
    :cond_43
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    .line 667
    .line 668
    if-eqz p0, :cond_44

    .line 669
    .line 670
    const/16 v0, 0x4d

    .line 671
    .line 672
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 673
    .line 674
    .line 675
    :cond_44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 676
    .line 677
    if-eqz p0, :cond_45

    .line 678
    .line 679
    const/16 v0, 0x4e

    .line 680
    .line 681
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 682
    .line 683
    .line 684
    :cond_45
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    .line 685
    .line 686
    if-eqz p0, :cond_46

    .line 687
    .line 688
    const/16 v0, 0x4f

    .line 689
    .line 690
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 691
    .line 692
    .line 693
    :cond_46
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    .line 694
    .line 695
    if-eqz p0, :cond_47

    .line 696
    .line 697
    const/16 v0, 0x50

    .line 698
    .line 699
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 700
    .line 701
    .line 702
    :cond_47
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    .line 703
    .line 704
    if-eqz p0, :cond_48

    .line 705
    .line 706
    const/16 v0, 0x51

    .line 707
    .line 708
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 709
    .line 710
    .line 711
    :cond_48
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 712
    .line 713
    if-eqz p0, :cond_49

    .line 714
    .line 715
    const/16 v0, 0x52

    .line 716
    .line 717
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 718
    .line 719
    .line 720
    :cond_49
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 721
    .line 722
    if-eqz p0, :cond_4a

    .line 723
    .line 724
    const/16 v0, 0x53

    .line 725
    .line 726
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 727
    .line 728
    .line 729
    :cond_4a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 730
    .line 731
    if-eqz p0, :cond_4b

    .line 732
    .line 733
    const/16 v0, 0x54

    .line 734
    .line 735
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 736
    .line 737
    .line 738
    :cond_4b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 739
    .line 740
    if-eqz p0, :cond_4c

    .line 741
    .line 742
    const/16 v0, 0x55

    .line 743
    .line 744
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 745
    .line 746
    .line 747
    :cond_4c
    const/16 p0, 0x56

    .line 748
    .line 749
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    .line 750
    .line 751
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 752
    .line 753
    .line 754
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 755
    .line 756
    if-eqz p0, :cond_4d

    .line 757
    .line 758
    const/16 v0, 0x57

    .line 759
    .line 760
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 761
    .line 762
    .line 763
    :cond_4d
    const/16 p0, 0x58

    .line 764
    .line 765
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    .line 766
    .line 767
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 768
    .line 769
    .line 770
    const/16 p0, 0x59

    .line 771
    .line 772
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    .line 773
    .line 774
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 775
    .line 776
    .line 777
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    .line 778
    .line 779
    if-eqz p0, :cond_4e

    .line 780
    .line 781
    const/16 v0, 0x5a

    .line 782
    .line 783
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 784
    .line 785
    .line 786
    :cond_4e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    .line 787
    .line 788
    if-eqz p0, :cond_4f

    .line 789
    .line 790
    const/16 v0, 0x5b

    .line 791
    .line 792
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 793
    .line 794
    .line 795
    :cond_4f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    .line 796
    .line 797
    if-eqz p0, :cond_50

    .line 798
    .line 799
    const/16 v0, 0x5c

    .line 800
    .line 801
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 802
    .line 803
    .line 804
    :cond_50
    const/16 p0, 0x5d

    .line 805
    .line 806
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    .line 807
    .line 808
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 809
    .line 810
    .line 811
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    .line 812
    .line 813
    if-eqz p0, :cond_51

    .line 814
    .line 815
    const/16 v0, 0x5e

    .line 816
    .line 817
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 818
    .line 819
    .line 820
    :cond_51
    const/16 p0, 0x5f

    .line 821
    .line 822
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    .line 823
    .line 824
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 825
    .line 826
    .line 827
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    .line 828
    .line 829
    if-eqz p0, :cond_52

    .line 830
    .line 831
    const/16 v0, 0x60

    .line 832
    .line 833
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 834
    .line 835
    .line 836
    :cond_52
    const/16 p0, 0x61

    .line 837
    .line 838
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    .line 839
    .line 840
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 841
    .line 842
    .line 843
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    .line 844
    .line 845
    if-eqz p0, :cond_53

    .line 846
    .line 847
    const/16 v0, 0x62

    .line 848
    .line 849
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 850
    .line 851
    .line 852
    :cond_53
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 853
    .line 854
    if-eqz p0, :cond_54

    .line 855
    .line 856
    const/16 v0, 0x63

    .line 857
    .line 858
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 859
    .line 860
    .line 861
    :cond_54
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 862
    .line 863
    if-eqz p0, :cond_55

    .line 864
    .line 865
    const/16 v0, 0x64

    .line 866
    .line 867
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 868
    .line 869
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 870
    .line 871
    .line 872
    :cond_55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 873
    .line 874
    if-eqz p0, :cond_56

    .line 875
    .line 876
    const/16 v0, 0x65

    .line 877
    .line 878
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 879
    .line 880
    .line 881
    move-result p0

    .line 882
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 883
    .line 884
    .line 885
    :cond_56
    const/16 p0, 0x66

    .line 886
    .line 887
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 888
    .line 889
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 890
    .line 891
    .line 892
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 893
    .line 894
    if-eqz p0, :cond_57

    .line 895
    .line 896
    const/16 v0, 0x67

    .line 897
    .line 898
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 899
    .line 900
    .line 901
    :cond_57
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 902
    .line 903
    if-eqz p0, :cond_58

    .line 904
    .line 905
    const/16 v0, 0x68

    .line 906
    .line 907
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 908
    .line 909
    .line 910
    :cond_58
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 911
    .line 912
    if-eqz p0, :cond_59

    .line 913
    .line 914
    const/16 v0, 0x69

    .line 915
    .line 916
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 917
    .line 918
    .line 919
    :cond_59
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    .line 920
    .line 921
    if-eqz p0, :cond_5a

    .line 922
    .line 923
    const/16 v0, 0x6a

    .line 924
    .line 925
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 926
    .line 927
    .line 928
    :cond_5a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 929
    .line 930
    if-eqz p0, :cond_5b

    .line 931
    .line 932
    const/16 v0, 0x6b

    .line 933
    .line 934
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 935
    .line 936
    .line 937
    :cond_5b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 938
    .line 939
    if-eqz p0, :cond_5c

    .line 940
    .line 941
    const/16 v0, 0x6c

    .line 942
    .line 943
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 944
    .line 945
    .line 946
    :cond_5c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    .line 947
    .line 948
    if-eqz p0, :cond_5d

    .line 949
    .line 950
    const/16 v0, 0x6d

    .line 951
    .line 952
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 953
    .line 954
    .line 955
    :cond_5d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    .line 956
    .line 957
    if-eqz p0, :cond_5e

    .line 958
    .line 959
    const/16 v0, 0x6e

    .line 960
    .line 961
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 962
    .line 963
    .line 964
    :cond_5e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    .line 965
    .line 966
    if-eqz p0, :cond_5f

    .line 967
    .line 968
    const/16 v0, 0x6f

    .line 969
    .line 970
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 971
    .line 972
    .line 973
    :cond_5f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 974
    .line 975
    if-eqz p0, :cond_60

    .line 976
    .line 977
    const/16 v0, 0x70

    .line 978
    .line 979
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 980
    .line 981
    .line 982
    :cond_60
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 983
    .line 984
    if-eqz p0, :cond_61

    .line 985
    .line 986
    const/16 v0, 0x71

    .line 987
    .line 988
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 989
    .line 990
    .line 991
    :cond_61
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    .line 992
    .line 993
    if-eqz p0, :cond_62

    .line 994
    .line 995
    const/16 v0, 0x72

    .line 996
    .line 997
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 998
    .line 999
    .line 1000
    :cond_62
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 1001
    .line 1002
    if-eqz p0, :cond_63

    .line 1003
    .line 1004
    const/16 v0, 0x73

    .line 1005
    .line 1006
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1007
    .line 1008
    .line 1009
    :cond_63
    const/16 p0, 0x74

    .line 1010
    .line 1011
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    .line 1012
    .line 1013
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 1014
    .line 1015
    .line 1016
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    .line 1017
    .line 1018
    if-eqz p0, :cond_64

    .line 1019
    .line 1020
    const/16 v0, 0x75

    .line 1021
    .line 1022
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1023
    .line 1024
    .line 1025
    :cond_64
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 1026
    .line 1027
    if-eqz p0, :cond_65

    .line 1028
    .line 1029
    const/16 v0, 0x76

    .line 1030
    .line 1031
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1032
    .line 1033
    .line 1034
    :cond_65
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 1035
    .line 1036
    if-eqz p0, :cond_66

    .line 1037
    .line 1038
    const/16 v0, 0x77

    .line 1039
    .line 1040
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1041
    .line 1042
    .line 1043
    :cond_66
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 1044
    .line 1045
    if-eqz p0, :cond_67

    .line 1046
    .line 1047
    const/16 v0, 0x78

    .line 1048
    .line 1049
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1050
    .line 1051
    .line 1052
    :cond_67
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 1053
    .line 1054
    if-eqz p0, :cond_68

    .line 1055
    .line 1056
    const/16 v0, 0x79

    .line 1057
    .line 1058
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1059
    .line 1060
    .line 1061
    :cond_68
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 1062
    .line 1063
    if-eqz p0, :cond_69

    .line 1064
    .line 1065
    const/16 v0, 0x7a

    .line 1066
    .line 1067
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1068
    .line 1069
    .line 1070
    :cond_69
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 1071
    .line 1072
    if-eqz p0, :cond_6a

    .line 1073
    .line 1074
    const/16 v0, 0x7b

    .line 1075
    .line 1076
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1077
    .line 1078
    .line 1079
    :cond_6a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 1080
    .line 1081
    if-eqz p0, :cond_6b

    .line 1082
    .line 1083
    const/16 v0, 0x7c

    .line 1084
    .line 1085
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1086
    .line 1087
    .line 1088
    :cond_6b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 1089
    .line 1090
    if-eqz p0, :cond_6c

    .line 1091
    .line 1092
    const/16 v0, 0x7d

    .line 1093
    .line 1094
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1095
    .line 1096
    .line 1097
    :cond_6c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 1098
    .line 1099
    if-eqz p0, :cond_6d

    .line 1100
    .line 1101
    const/16 v0, 0x7e

    .line 1102
    .line 1103
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1104
    .line 1105
    .line 1106
    :cond_6d
    const/16 p0, 0x7f

    .line 1107
    .line 1108
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    .line 1109
    .line 1110
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1111
    .line 1112
    .line 1113
    const/16 p0, 0x80

    .line 1114
    .line 1115
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 1116
    .line 1117
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1118
    .line 1119
    .line 1120
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 1121
    .line 1122
    if-eqz p0, :cond_6e

    .line 1123
    .line 1124
    const/16 v0, 0x81

    .line 1125
    .line 1126
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1127
    .line 1128
    .line 1129
    :cond_6e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 1130
    .line 1131
    if-eqz p0, :cond_6f

    .line 1132
    .line 1133
    const/16 v0, 0x82

    .line 1134
    .line 1135
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1136
    .line 1137
    .line 1138
    :cond_6f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 1139
    .line 1140
    if-eqz p0, :cond_70

    .line 1141
    .line 1142
    const/16 v0, 0x83

    .line 1143
    .line 1144
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1145
    .line 1146
    .line 1147
    :cond_70
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 1148
    .line 1149
    if-eqz p0, :cond_71

    .line 1150
    .line 1151
    const/16 v0, 0x84

    .line 1152
    .line 1153
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1154
    .line 1155
    .line 1156
    :cond_71
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 1157
    .line 1158
    if-eqz p0, :cond_72

    .line 1159
    .line 1160
    const/16 v0, 0x85

    .line 1161
    .line 1162
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1163
    .line 1164
    .line 1165
    :cond_72
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 1166
    .line 1167
    if-eqz p0, :cond_73

    .line 1168
    .line 1169
    const/16 v0, 0x86

    .line 1170
    .line 1171
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1172
    .line 1173
    .line 1174
    :cond_73
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 1175
    .line 1176
    if-eqz p0, :cond_74

    .line 1177
    .line 1178
    const/16 v0, 0x87

    .line 1179
    .line 1180
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1181
    .line 1182
    .line 1183
    :cond_74
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 1184
    .line 1185
    if-eqz p0, :cond_75

    .line 1186
    .line 1187
    const/16 v0, 0x88

    .line 1188
    .line 1189
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1190
    .line 1191
    .line 1192
    :cond_75
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 1193
    .line 1194
    if-eqz p0, :cond_76

    .line 1195
    .line 1196
    const/16 v0, 0x89

    .line 1197
    .line 1198
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1199
    .line 1200
    .line 1201
    :cond_76
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 1202
    .line 1203
    if-eqz p0, :cond_77

    .line 1204
    .line 1205
    const/16 v0, 0x8a

    .line 1206
    .line 1207
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1208
    .line 1209
    .line 1210
    :cond_77
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 1211
    .line 1212
    if-eqz p0, :cond_78

    .line 1213
    .line 1214
    const/16 v0, 0x8b

    .line 1215
    .line 1216
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1217
    .line 1218
    .line 1219
    :cond_78
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 1220
    .line 1221
    if-eqz p0, :cond_79

    .line 1222
    .line 1223
    const/16 v0, 0x8c

    .line 1224
    .line 1225
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1226
    .line 1227
    .line 1228
    :cond_79
    const/16 p0, 0x8d

    .line 1229
    .line 1230
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    .line 1231
    .line 1232
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1233
    .line 1234
    .line 1235
    const/16 p0, 0x8e

    .line 1236
    .line 1237
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    .line 1238
    .line 1239
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1240
    .line 1241
    .line 1242
    const/16 p0, 0x8f

    .line 1243
    .line 1244
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    .line 1245
    .line 1246
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1247
    .line 1248
    .line 1249
    const/16 p0, 0x90

    .line 1250
    .line 1251
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    .line 1252
    .line 1253
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1254
    .line 1255
    .line 1256
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 1257
    .line 1258
    if-eqz p0, :cond_7a

    .line 1259
    .line 1260
    const/16 v0, 0x91

    .line 1261
    .line 1262
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1263
    .line 1264
    .line 1265
    :cond_7a
    const/16 p0, 0x92

    .line 1266
    .line 1267
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    .line 1268
    .line 1269
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1270
    .line 1271
    .line 1272
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 1273
    .line 1274
    if-eqz p0, :cond_7b

    .line 1275
    .line 1276
    const/16 v0, 0x93

    .line 1277
    .line 1278
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1279
    .line 1280
    .line 1281
    :cond_7b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 1282
    .line 1283
    if-eqz p0, :cond_7c

    .line 1284
    .line 1285
    const/16 v0, 0x94

    .line 1286
    .line 1287
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1288
    .line 1289
    .line 1290
    :cond_7c
    const/16 p0, 0x95

    .line 1291
    .line 1292
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    .line 1293
    .line 1294
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1295
    .line 1296
    .line 1297
    const/16 p0, 0x96

    .line 1298
    .line 1299
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    .line 1300
    .line 1301
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1302
    .line 1303
    .line 1304
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 1305
    .line 1306
    if-eqz p0, :cond_7d

    .line 1307
    .line 1308
    const/16 v0, 0x97

    .line 1309
    .line 1310
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1311
    .line 1312
    .line 1313
    :cond_7d
    const/16 p0, 0x98

    .line 1314
    .line 1315
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    .line 1316
    .line 1317
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1318
    .line 1319
    .line 1320
    const/16 p0, 0x99

    .line 1321
    .line 1322
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    .line 1323
    .line 1324
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1325
    .line 1326
    .line 1327
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 1328
    .line 1329
    if-eqz p0, :cond_7e

    .line 1330
    .line 1331
    const/16 v0, 0x9a

    .line 1332
    .line 1333
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1334
    .line 1335
    .line 1336
    :cond_7e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 1337
    .line 1338
    if-eqz p0, :cond_7f

    .line 1339
    .line 1340
    const/16 v0, 0x9b

    .line 1341
    .line 1342
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1343
    .line 1344
    .line 1345
    :cond_7f
    const/16 p0, 0x9c

    .line 1346
    .line 1347
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    .line 1348
    .line 1349
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1350
    .line 1351
    .line 1352
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 1353
    .line 1354
    if-eqz p0, :cond_80

    .line 1355
    .line 1356
    const/16 v0, 0x9d

    .line 1357
    .line 1358
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1359
    .line 1360
    .line 1361
    :cond_80
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 1362
    .line 1363
    if-eqz p0, :cond_81

    .line 1364
    .line 1365
    const/16 v0, 0x9e

    .line 1366
    .line 1367
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1368
    .line 1369
    .line 1370
    :cond_81
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 1371
    .line 1372
    if-eqz p0, :cond_82

    .line 1373
    .line 1374
    const/16 v0, 0x9f

    .line 1375
    .line 1376
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1377
    .line 1378
    .line 1379
    :cond_82
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 1380
    .line 1381
    if-eqz p0, :cond_83

    .line 1382
    .line 1383
    const/16 v0, 0xa0

    .line 1384
    .line 1385
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1386
    .line 1387
    .line 1388
    :cond_83
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 1389
    .line 1390
    if-eqz p0, :cond_84

    .line 1391
    .line 1392
    const/16 v0, 0xa1

    .line 1393
    .line 1394
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1395
    .line 1396
    .line 1397
    :cond_84
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 1398
    .line 1399
    if-eqz p0, :cond_85

    .line 1400
    .line 1401
    const/16 v0, 0xa2

    .line 1402
    .line 1403
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1404
    .line 1405
    .line 1406
    :cond_85
    const/16 p0, 0xa3

    .line 1407
    .line 1408
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    .line 1409
    .line 1410
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1411
    .line 1412
    .line 1413
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 1414
    .line 1415
    if-eqz p0, :cond_86

    .line 1416
    .line 1417
    const/16 v0, 0xa4

    .line 1418
    .line 1419
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1420
    .line 1421
    .line 1422
    :cond_86
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 1423
    .line 1424
    if-eqz p0, :cond_87

    .line 1425
    .line 1426
    const/16 v0, 0xa5

    .line 1427
    .line 1428
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1429
    .line 1430
    .line 1431
    :cond_87
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 1432
    .line 1433
    if-eqz p0, :cond_88

    .line 1434
    .line 1435
    const/16 v0, 0xa6

    .line 1436
    .line 1437
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1438
    .line 1439
    .line 1440
    :cond_88
    const/16 p0, 0xa7

    .line 1441
    .line 1442
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    .line 1443
    .line 1444
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 1445
    .line 1446
    .line 1447
    const/16 p0, 0xa8

    .line 1448
    .line 1449
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    .line 1450
    .line 1451
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1452
    .line 1453
    .line 1454
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 1455
    .line 1456
    if-eqz p0, :cond_89

    .line 1457
    .line 1458
    const/16 v0, 0xa9

    .line 1459
    .line 1460
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1461
    .line 1462
    .line 1463
    :cond_89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 1464
    .line 1465
    if-eqz p0, :cond_8a

    .line 1466
    .line 1467
    const/16 v0, 0xaa

    .line 1468
    .line 1469
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1470
    .line 1471
    .line 1472
    :cond_8a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 1473
    .line 1474
    if-eqz p0, :cond_8b

    .line 1475
    .line 1476
    const/16 v0, 0xab

    .line 1477
    .line 1478
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1479
    .line 1480
    .line 1481
    :cond_8b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 1482
    .line 1483
    if-eqz p0, :cond_8c

    .line 1484
    .line 1485
    const/16 v0, 0xac

    .line 1486
    .line 1487
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1488
    .line 1489
    .line 1490
    :cond_8c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 1491
    .line 1492
    if-eqz p0, :cond_8d

    .line 1493
    .line 1494
    const/16 v0, 0xad

    .line 1495
    .line 1496
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1497
    .line 1498
    .line 1499
    :cond_8d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 1500
    .line 1501
    if-eqz p0, :cond_8e

    .line 1502
    .line 1503
    const/16 v0, 0xae

    .line 1504
    .line 1505
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1506
    .line 1507
    .line 1508
    :cond_8e
    const/16 p0, 0xaf

    .line 1509
    .line 1510
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    .line 1511
    .line 1512
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1513
    .line 1514
    .line 1515
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 1516
    .line 1517
    if-eqz p0, :cond_8f

    .line 1518
    .line 1519
    const/16 v0, 0xb0

    .line 1520
    .line 1521
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1522
    .line 1523
    .line 1524
    :cond_8f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    .line 1525
    .line 1526
    if-eqz p0, :cond_90

    .line 1527
    .line 1528
    const/16 v0, 0xb1

    .line 1529
    .line 1530
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1531
    .line 1532
    .line 1533
    move-result p0

    .line 1534
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1535
    .line 1536
    .line 1537
    :cond_90
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 1538
    .line 1539
    if-eqz p0, :cond_91

    .line 1540
    .line 1541
    const/16 v0, 0xb2

    .line 1542
    .line 1543
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1544
    .line 1545
    .line 1546
    :cond_91
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 1547
    .line 1548
    if-eqz p0, :cond_92

    .line 1549
    .line 1550
    const/16 v0, 0xb3

    .line 1551
    .line 1552
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1553
    .line 1554
    .line 1555
    :cond_92
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 1556
    .line 1557
    if-eqz p0, :cond_93

    .line 1558
    .line 1559
    const/16 v0, 0xb4

    .line 1560
    .line 1561
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1562
    .line 1563
    .line 1564
    :cond_93
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 1565
    .line 1566
    if-eqz p0, :cond_94

    .line 1567
    .line 1568
    const/16 v0, 0xb5

    .line 1569
    .line 1570
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1571
    .line 1572
    .line 1573
    :cond_94
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 1574
    .line 1575
    if-eqz p0, :cond_95

    .line 1576
    .line 1577
    const/16 v0, 0xb6

    .line 1578
    .line 1579
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1580
    .line 1581
    .line 1582
    :cond_95
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 1583
    .line 1584
    if-eqz p0, :cond_96

    .line 1585
    .line 1586
    const/16 v0, 0xb7

    .line 1587
    .line 1588
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1589
    .line 1590
    .line 1591
    :cond_96
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 1592
    .line 1593
    if-eqz p0, :cond_97

    .line 1594
    .line 1595
    const/16 v0, 0xb8

    .line 1596
    .line 1597
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1598
    .line 1599
    .line 1600
    :cond_97
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 1601
    .line 1602
    if-eqz p0, :cond_98

    .line 1603
    .line 1604
    const/16 v0, 0xb9

    .line 1605
    .line 1606
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1607
    .line 1608
    .line 1609
    :cond_98
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 1610
    .line 1611
    if-eqz p0, :cond_99

    .line 1612
    .line 1613
    const/16 v0, 0xba

    .line 1614
    .line 1615
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1616
    .line 1617
    .line 1618
    :cond_99
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 1619
    .line 1620
    if-eqz p0, :cond_9a

    .line 1621
    .line 1622
    const/16 v0, 0xbb

    .line 1623
    .line 1624
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1625
    .line 1626
    .line 1627
    :cond_9a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 1628
    .line 1629
    if-eqz p0, :cond_9b

    .line 1630
    .line 1631
    const/16 v0, 0xbc

    .line 1632
    .line 1633
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1634
    .line 1635
    .line 1636
    :cond_9b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 1637
    .line 1638
    if-eqz p0, :cond_9c

    .line 1639
    .line 1640
    const/16 v0, 0xbd

    .line 1641
    .line 1642
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1643
    .line 1644
    .line 1645
    :cond_9c
    const/16 p0, 0xbe

    .line 1646
    .line 1647
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    .line 1648
    .line 1649
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1650
    .line 1651
    .line 1652
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 1653
    .line 1654
    if-eqz p0, :cond_9d

    .line 1655
    .line 1656
    const/16 p1, 0xbf

    .line 1657
    .line 1658
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1659
    .line 1660
    .line 1661
    :cond_9d
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1662
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/PushMessageCustom$1;->serialize(Lcom/p1/mobile/putong/data/PushMessageCustom;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
