.class Lcom/p1/mobile/putong/core/data/CoreData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
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
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    if-eqz p0, :cond_0

    .line 2
    sget-object v0, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    const/4 v1, 0x1

    .line 4
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 5
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/Conversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/4 v2, 0x2

    .line 8
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 9
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 11
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/4 v2, 0x3

    .line 12
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 13
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/Contact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/4 v2, 0x4

    .line 16
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 17
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    if-eqz v0, :cond_4

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/data/Question;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/4 v2, 0x5

    .line 20
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 21
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    if-eqz v0, :cond_5

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/Sticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/4 v2, 0x6

    .line 24
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 25
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    if-eqz v0, :cond_6

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/StickerPackage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/4 v2, 0x7

    .line 28
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 29
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    if-eqz v0, :cond_7

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/StickerBundle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x8

    .line 32
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 33
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    if-eqz v0, :cond_8

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/Link;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x9

    .line 36
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 37
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    if-eqz v0, :cond_9

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/data/School;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xa

    .line 40
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 41
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    if-eqz v0, :cond_a

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xb

    .line 44
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 45
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    if-eqz v0, :cond_b

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xc

    .line 48
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 49
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    if-eqz v0, :cond_c

    const/16 v1, 0xd

    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/data/Wallet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 52
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    if-eqz v0, :cond_d

    .line 53
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xe

    .line 55
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 56
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    if-eqz v0, :cond_e

    const/16 v1, 0xf

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/Coin;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 59
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    if-eqz v0, :cond_f

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x10

    .line 62
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 63
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    if-eqz v0, :cond_10

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/data/FaceidToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x11

    .line 66
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 67
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    if-eqz v0, :cond_11

    .line 68
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x12

    .line 70
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 71
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    if-eqz v0, :cond_12

    .line 72
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x13

    .line 74
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 75
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    if-eqz v0, :cond_13

    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/data/Figure;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x14

    .line 78
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 79
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    if-eqz v0, :cond_14

    .line 80
    sget-object v1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x15

    .line 82
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 83
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    if-eqz v0, :cond_15

    .line 84
    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x16

    .line 86
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 87
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    if-eqz v0, :cond_16

    .line 88
    sget-object v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x17

    .line 90
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 91
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    if-eqz v0, :cond_17

    .line 92
    sget-object v1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x18

    .line 94
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 95
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    if-eqz v0, :cond_18

    .line 96
    sget-object v1, Lcom/p1/mobile/putong/core/data/Surveys;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x19

    .line 98
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 99
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    if-eqz v0, :cond_19

    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/data/AppealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x1a

    .line 102
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 103
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    if-eqz v0, :cond_1a

    .line 104
    sget-object v1, Lcom/p1/mobile/putong/core/data/AutoDeducts;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x1b

    .line 106
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 107
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    if-eqz v0, :cond_1b

    .line 108
    sget-object v1, Lcom/p1/mobile/putong/core/data/VoiceCall;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x1c

    .line 110
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 111
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    if-eqz v0, :cond_1c

    .line 112
    sget-object v1, Lcom/p1/mobile/putong/core/data/Complain;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x1d

    .line 114
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 115
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    if-eqz v0, :cond_1d

    .line 116
    sget-object v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x1e

    .line 118
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 119
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    if-eqz v0, :cond_1e

    .line 120
    sget-object v1, Lcom/p1/mobile/putong/core/data/LikedUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x1f

    .line 122
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 123
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    if-eqz v0, :cond_1f

    .line 124
    sget-object v1, Lcom/p1/mobile/putong/core/data/RefundDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x20

    .line 126
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 127
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    if-eqz v0, :cond_20

    .line 128
    sget-object v1, Lcom/p1/mobile/putong/core/data/WalletAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x21

    .line 130
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 131
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    if-eqz v0, :cond_21

    .line 132
    sget-object v1, Lcom/p1/mobile/putong/core/data/AccountRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x22

    .line 134
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 135
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    if-eqz v0, :cond_22

    const/16 v1, 0x23

    .line 136
    sget-object v2, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 138
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    if-eqz v0, :cond_23

    const/16 v1, 0x24

    .line 139
    sget-object v2, Lcom/p1/mobile/putong/data/Contract;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 141
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    if-eqz v0, :cond_24

    .line 142
    sget-object v1, Lcom/p1/mobile/putong/data/VerificationToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x25

    .line 144
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 145
    :cond_24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    if-eqz v0, :cond_25

    .line 146
    sget-object v1, Lcom/p1/mobile/putong/core/data/HeartBeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x26

    .line 148
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 149
    :cond_25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    if-eqz v0, :cond_26

    .line 150
    sget-object v1, Lcom/p1/mobile/putong/core/data/ContractInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x27

    .line 152
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 153
    :cond_26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    if-eqz v0, :cond_27

    .line 154
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x28

    .line 156
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 157
    :cond_27
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    if-eqz v0, :cond_28

    .line 158
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x29

    .line 160
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 161
    :cond_28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    if-eqz v0, :cond_29

    .line 162
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupApply;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x2a

    .line 164
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 165
    :cond_29
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    if-eqz v0, :cond_2a

    .line 166
    sget-object v1, Lcom/p1/mobile/putong/core/data/NotificationCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x2b

    .line 168
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 169
    :cond_2a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    if-eqz v0, :cond_2b

    .line 170
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupNotification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x2c

    .line 172
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 173
    :cond_2b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    if-eqz v0, :cond_2c

    .line 174
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupAttribute;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x2d

    .line 176
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 177
    :cond_2c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    if-eqz v0, :cond_2d

    .line 178
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x2e

    .line 180
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 181
    :cond_2d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    if-eqz v0, :cond_2e

    .line 182
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupTab;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x2f

    .line 184
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 185
    :cond_2e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    if-eqz v0, :cond_2f

    .line 186
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x30

    .line 188
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 189
    :cond_2f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    if-eqz v0, :cond_30

    .line 190
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x31

    .line 192
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 193
    :cond_30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    if-eqz v0, :cond_31

    .line 194
    sget-object v1, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x32

    .line 196
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 197
    :cond_31
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    if-eqz v0, :cond_32

    .line 198
    sget-object v1, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 199
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x33

    .line 200
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 201
    :cond_32
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    if-eqz v0, :cond_33

    .line 202
    sget-object v1, Lcom/p1/mobile/putong/core/data/OfficialAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x34

    .line 204
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 205
    :cond_33
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    if-eqz v0, :cond_34

    .line 206
    sget-object v1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x35

    .line 208
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 209
    :cond_34
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    if-eqz v0, :cond_35

    .line 210
    sget-object v1, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x36

    .line 212
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 213
    :cond_35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    if-eqz v0, :cond_36

    .line 214
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 215
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x37

    .line 216
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 217
    :cond_36
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    if-eqz v0, :cond_37

    .line 218
    sget-object v1, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x38

    .line 220
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 221
    :cond_37
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    if-eqz v0, :cond_38

    .line 222
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x39

    .line 224
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 225
    :cond_38
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    if-eqz v0, :cond_39

    .line 226
    sget-object v1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 227
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x3a

    .line 228
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 229
    :cond_39
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    if-eqz v0, :cond_3a

    const/16 v1, 0x3b

    .line 230
    sget-object v2, Lcom/p1/mobile/putong/core/data/PriorityLike;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 232
    :cond_3a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    if-eqz v0, :cond_3b

    const/16 v1, 0x3c

    .line 233
    sget-object v2, Lcom/p1/mobile/putong/core/data/Couponbag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 234
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 235
    :cond_3b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    if-eqz v0, :cond_3c

    .line 236
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x3d

    .line 238
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 239
    :cond_3c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    if-eqz v0, :cond_3d

    .line 240
    sget-object v1, Lcom/p1/mobile/putong/core/data/RedPacket;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 241
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x3e

    .line 242
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 243
    :cond_3d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    if-eqz v0, :cond_3e

    .line 244
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x3f

    .line 246
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 247
    :cond_3e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    if-eqz v0, :cond_3f

    const/16 v1, 0x40

    .line 248
    sget-object v2, Lcom/p1/mobile/putong/core/data/CounterVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 249
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 250
    :cond_3f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    if-eqz v0, :cond_40

    .line 251
    sget-object v1, Lcom/p1/mobile/putong/core/data/LiveSchema;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 252
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x41

    .line 253
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 254
    :cond_40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    if-eqz v0, :cond_41

    .line 255
    sget-object v1, Lcom/p1/mobile/putong/core/data/FriendInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 256
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x42

    .line 257
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_41
    const/16 v0, 0x43

    .line 258
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    move-result v0

    add-int/2addr p0, v0

    .line 259
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    if-eqz v0, :cond_42

    const/16 v1, 0x44

    .line 260
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationDiff;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 261
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 262
    :cond_42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    if-eqz v0, :cond_43

    .line 263
    sget-object v1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 264
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x45

    .line 265
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 266
    :cond_43
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    if-eqz v0, :cond_44

    .line 267
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x46

    .line 269
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 270
    :cond_44
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    if-eqz v0, :cond_45

    .line 271
    sget-object v1, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 272
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x47

    .line 273
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 274
    :cond_45
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    if-eqz v0, :cond_46

    const/16 v1, 0x48

    .line 275
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 276
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 277
    :cond_46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    if-eqz v0, :cond_47

    .line 278
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x49

    .line 280
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 281
    :cond_47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    if-eqz v0, :cond_48

    .line 282
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 283
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x4a

    .line 284
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 285
    :cond_48
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    if-eqz v0, :cond_49

    .line 286
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 287
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x4b

    .line 288
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 289
    :cond_49
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    if-eqz v0, :cond_4a

    .line 290
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftWallTitle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 291
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x4c

    .line 292
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 293
    :cond_4a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    if-eqz v0, :cond_4b

    .line 294
    sget-object v1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 295
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x4d

    .line 296
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 297
    :cond_4b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    if-eqz v0, :cond_4c

    .line 298
    sget-object v1, Lcom/p1/mobile/putong/core/data/Greeting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x4e

    .line 300
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 301
    :cond_4c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    if-eqz v0, :cond_4d

    const/16 v1, 0x4f

    .line 302
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 303
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 304
    :cond_4d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    if-eqz v0, :cond_4e

    .line 305
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingPermission;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 306
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x50

    .line 307
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 308
    :cond_4e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz v0, :cond_4f

    const/16 v1, 0x51

    .line 309
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 310
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_4f
    const/16 v0, 0x52

    .line 311
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 312
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    if-eqz v0, :cond_50

    .line 313
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 314
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x53

    .line 315
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 316
    :cond_50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    if-eqz v0, :cond_51

    .line 317
    sget-object v1, Lcom/p1/mobile/putong/core/data/ReadMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x54

    .line 319
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 320
    :cond_51
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    if-eqz v0, :cond_52

    .line 321
    sget-object v1, Lcom/p1/mobile/putong/core/data/RecentConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 322
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x55

    .line 323
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 324
    :cond_52
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    if-eqz v0, :cond_53

    .line 325
    sget-object v1, Lcom/p1/mobile/putong/core/data/OrderInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 326
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x56

    .line 327
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 328
    :cond_53
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    if-eqz v0, :cond_54

    const/16 v1, 0x57

    .line 329
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 330
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 331
    :cond_54
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    if-eqz v0, :cond_55

    .line 332
    sget-object v1, Lcom/p1/mobile/putong/core/data/PicksUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 333
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x58

    .line 334
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 335
    :cond_55
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    if-eqz v0, :cond_56

    const/16 v1, 0x59

    .line 336
    sget-object v2, Lcom/p1/mobile/putong/core/data/Picks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 337
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 338
    :cond_56
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    if-eqz v0, :cond_57

    .line 339
    sget-object v1, Lcom/p1/mobile/putong/core/data/CountdownItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 340
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x5a

    .line 341
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 342
    :cond_57
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    if-eqz v0, :cond_58

    const/16 v1, 0x5b

    .line 343
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 344
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 345
    :cond_58
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    if-eqz v0, :cond_59

    const/16 v1, 0x5c

    .line 346
    sget-object v2, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 347
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 348
    :cond_59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    if-eqz v0, :cond_5a

    .line 349
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 350
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x5d

    .line 351
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 352
    :cond_5a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    if-eqz v0, :cond_5b

    const/16 v1, 0x5e

    .line 353
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 354
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 355
    :cond_5b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    if-eqz v0, :cond_5c

    .line 356
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 357
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x5f

    .line 358
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 359
    :cond_5c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    if-eqz v0, :cond_5d

    const/16 v1, 0x60

    .line 360
    sget-object v2, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 361
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 362
    :cond_5d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    if-eqz v0, :cond_5e

    const/16 v1, 0x61

    .line 363
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 364
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_5e
    const/16 v0, 0x62

    .line 365
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 366
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    if-eqz v0, :cond_5f

    const/16 v1, 0x63

    .line 367
    sget-object v2, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 368
    :cond_5f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    if-eqz v0, :cond_60

    .line 369
    sget-object v1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x64

    .line 371
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 372
    :cond_60
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    if-eqz v0, :cond_61

    .line 373
    sget-object v1, Lcom/p1/mobile/putong/core/data/Literatures;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 374
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x65

    .line 375
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 376
    :cond_61
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    if-eqz v0, :cond_62

    .line 377
    sget-object v1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 378
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x66

    .line 379
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 380
    :cond_62
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    if-eqz v0, :cond_63

    const/16 v1, 0x67

    .line 381
    sget-object v2, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 382
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 383
    :cond_63
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    if-eqz v0, :cond_64

    const/16 v1, 0x68

    .line 384
    sget-object v2, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 385
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 386
    :cond_64
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    if-eqz v0, :cond_65

    const/16 v1, 0x69

    .line 387
    sget-object v2, Lcom/p1/mobile/putong/core/data/Note;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 388
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 389
    :cond_65
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    if-eqz v0, :cond_66

    .line 390
    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 391
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x6a

    .line 392
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 393
    :cond_66
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    if-eqz v0, :cond_67

    const/16 v1, 0x6b

    .line 394
    sget-object v2, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 395
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 396
    :cond_67
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    if-eqz v0, :cond_68

    .line 397
    sget-object v1, Lcom/p1/mobile/putong/core/data/Evaluation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 398
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x6c

    .line 399
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 400
    :cond_68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    if-eqz v0, :cond_69

    .line 401
    sget-object v1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 402
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x6d

    .line 403
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 404
    :cond_69
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    if-eqz v0, :cond_6a

    const/16 v1, 0x6e

    .line 405
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 406
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 407
    :cond_6a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    if-eqz v0, :cond_6b

    const/16 v1, 0x6f

    .line 408
    sget-object v2, Lcom/p1/mobile/putong/core/data/Evaluation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 409
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 410
    :cond_6b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    if-eqz v0, :cond_6c

    .line 411
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 412
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x70

    .line 413
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 414
    :cond_6c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    if-eqz v0, :cond_6d

    .line 415
    sget-object v1, Lcom/p1/mobile/putong/data/RecommendMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 416
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x71

    .line 417
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 418
    :cond_6d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    if-eqz v0, :cond_6e

    .line 419
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserGreetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 420
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x72

    .line 421
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 422
    :cond_6e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    if-eqz v0, :cond_6f

    .line 423
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 424
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x73

    .line 425
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 426
    :cond_6f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    if-eqz v0, :cond_70

    const/16 v1, 0x74

    .line 427
    sget-object v2, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 428
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 429
    :cond_70
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    if-eqz v0, :cond_71

    const/16 v1, 0x75

    .line 430
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 431
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 432
    :cond_71
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    if-eqz v0, :cond_72

    const/16 v1, 0x76

    .line 433
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 434
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 435
    :cond_72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    if-eqz v0, :cond_73

    const/16 v1, 0x77

    .line 436
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 437
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 438
    :cond_73
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    if-eqz v0, :cond_74

    .line 439
    sget-object v1, Lcom/p1/mobile/putong/core/data/InsertCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 440
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x78

    .line 441
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 442
    :cond_74
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    if-eqz v0, :cond_75

    .line 443
    sget-object v1, Lcom/p1/mobile/putong/core/data/Active;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 444
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x79

    .line 445
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 446
    :cond_75
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    if-eqz v0, :cond_76

    .line 447
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardsIcons;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 448
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x7a

    .line 449
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 450
    :cond_76
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    if-eqz v0, :cond_77

    const/16 v1, 0x7b

    .line 451
    sget-object v2, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 452
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 453
    :cond_77
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    if-eqz v0, :cond_78

    .line 454
    sget-object v1, Lcom/p1/mobile/putong/core/data/BreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 455
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x7c

    .line 456
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 457
    :cond_78
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    if-eqz v0, :cond_79

    const/16 v1, 0x7d

    .line 458
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 459
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 460
    :cond_79
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    if-eqz v0, :cond_7a

    .line 461
    sget-object v1, Lcom/p1/mobile/putong/core/data/Voice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 462
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x7e

    .line 463
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 464
    :cond_7a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    if-eqz v0, :cond_7b

    const/16 v1, 0x7f

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 465
    :cond_7b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    if-eqz v0, :cond_7c

    .line 466
    sget-object v1, Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 467
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x80

    .line 468
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 469
    :cond_7c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    if-eqz v0, :cond_7d

    const/16 v1, 0x81

    .line 470
    sget-object v2, Lcom/p1/mobile/putong/core/data/ActionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 471
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 472
    :cond_7d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v0, :cond_7e

    const/16 v1, 0x82

    .line 473
    sget-object v2, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 474
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 475
    :cond_7e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    if-eqz v0, :cond_7f

    .line 476
    sget-object v1, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 477
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x83

    .line 478
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 479
    :cond_7f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v0, :cond_80

    const/16 v1, 0x84

    .line 480
    sget-object v2, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 481
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 482
    :cond_80
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    if-eqz v0, :cond_81

    .line 483
    sget-object v1, Lcom/p1/mobile/putong/core/data/TagCategories;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 484
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x85

    .line 485
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 486
    :cond_81
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    if-eqz v0, :cond_82

    .line 487
    sget-object v1, Lcom/p1/mobile/putong/core/data/TagUserCounts;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 488
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x86

    .line 489
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 490
    :cond_82
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    if-eqz v0, :cond_83

    .line 491
    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 492
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x87

    .line 493
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 494
    :cond_83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    if-eqz v0, :cond_84

    const/16 v1, 0x88

    .line 495
    sget-object v2, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 496
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 497
    :cond_84
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz v0, :cond_85

    const/16 v1, 0x89

    .line 498
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 499
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 500
    :cond_85
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    if-eqz v0, :cond_86

    .line 501
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 502
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x8a

    .line 503
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 504
    :cond_86
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    if-eqz v0, :cond_87

    .line 505
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 506
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x8b

    .line 507
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 508
    :cond_87
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    if-eqz v0, :cond_88

    .line 509
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeePortrait;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 510
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x8c

    .line 511
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 512
    :cond_88
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    if-eqz v0, :cond_89

    const/16 v1, 0x8d

    .line 513
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 514
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 515
    :cond_89
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    if-eqz v0, :cond_8a

    const/16 v1, 0x8e

    .line 516
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 517
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 518
    :cond_8a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    if-eqz v0, :cond_8b

    .line 519
    sget-object v1, Lcom/p1/mobile/putong/core/data/LikeUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 520
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x8f

    .line 521
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_8b
    const/16 v0, 0x90

    .line 522
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 523
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    if-eqz v0, :cond_8c

    const/16 v1, 0x91

    .line 524
    sget-object v2, Lcom/p1/mobile/putong/core/data/CipherId;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 525
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 526
    :cond_8c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    if-eqz v0, :cond_8d

    const/16 v1, 0x92

    .line 527
    sget-object v2, Lcom/p1/mobile/putong/core/data/ShareId;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 528
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 529
    :cond_8d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    if-eqz v0, :cond_8e

    .line 530
    sget-object v1, Lcom/p1/mobile/putong/data/StateEmotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 531
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x93

    .line 532
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 533
    :cond_8e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    if-eqz v0, :cond_8f

    const/16 v1, 0x94

    .line 534
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 535
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 536
    :cond_8f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    if-eqz v0, :cond_90

    .line 537
    sget-object v1, Lcom/p1/mobile/putong/core/data/Recommended;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 538
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x95

    .line 539
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 540
    :cond_90
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    if-eqz v0, :cond_91

    .line 541
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 542
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x96

    .line 543
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 544
    :cond_91
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    if-eqz v0, :cond_92

    .line 545
    sget-object v1, Lcom/p1/mobile/putong/core/data/PermissionsItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 546
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x97

    .line 547
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 548
    :cond_92
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    if-eqz v0, :cond_93

    .line 549
    sget-object v1, Lcom/p1/mobile/putong/core/data/ResourceTriggers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 550
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x98

    .line 551
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 552
    :cond_93
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    if-eqz v0, :cond_94

    const/16 v1, 0x99

    .line 553
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 554
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 555
    :cond_94
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    if-eqz v0, :cond_95

    .line 556
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 557
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x9a

    .line 558
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 559
    :cond_95
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    if-eqz v0, :cond_96

    const/16 v1, 0x9b

    .line 560
    sget-object v2, Lcom/p1/mobile/putong/core/data/JmpTarget;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 561
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 562
    :cond_96
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    if-eqz v0, :cond_97

    .line 563
    sget-object v1, Lcom/p1/mobile/putong/core/data/BuzzUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 564
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x9c

    .line 565
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 566
    :cond_97
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    if-eqz v0, :cond_98

    const/16 v1, 0x9d

    .line 567
    sget-object v2, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 568
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 569
    :cond_98
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    if-eqz v0, :cond_99

    const/16 v1, 0x9e

    .line 570
    sget-object v2, Lcom/p1/mobile/putong/core/data/PopGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 571
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 572
    :cond_99
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    if-eqz v0, :cond_9a

    .line 573
    sget-object v1, Lcom/p1/mobile/putong/core/data/SuperLikeCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 574
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x9f

    .line 575
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 576
    :cond_9a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    if-eqz v0, :cond_9b

    .line 577
    sget-object v1, Lcom/p1/mobile/putong/core/data/FloatsCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 578
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xa0

    .line 579
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 580
    :cond_9b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    if-eqz v0, :cond_9c

    const/16 v1, 0xa1

    .line 581
    sget-object v2, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 582
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 583
    :cond_9c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    if-eqz v0, :cond_9d

    const/16 v1, 0xa2

    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 584
    :cond_9d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    if-eqz v0, :cond_9e

    const/16 v1, 0xa3

    .line 585
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 586
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 587
    :cond_9e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    if-eqz v0, :cond_9f

    const/16 v1, 0xa4

    .line 588
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 589
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 590
    :cond_9f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    if-eqz v0, :cond_a0

    const/16 v1, 0xa5

    .line 591
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 592
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 593
    :cond_a0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    if-eqz v0, :cond_a1

    .line 594
    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 595
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xa6

    .line 596
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 597
    :cond_a1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    if-eqz v0, :cond_a2

    const/16 v1, 0xa7

    .line 598
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    move-result v0

    add-int/2addr p0, v0

    .line 599
    :cond_a2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    if-eqz v0, :cond_a3

    .line 600
    sget-object v1, Lcom/p1/mobile/putong/core/data/ExtremePickItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 601
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xa8

    .line 602
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 603
    :cond_a3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    if-eqz v0, :cond_a4

    const/16 v1, 0xa9

    .line 604
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 605
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 606
    :cond_a4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    if-eqz v0, :cond_a5

    .line 607
    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 608
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xaa

    .line 609
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 610
    :cond_a5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    if-eqz v0, :cond_a6

    const/16 v1, 0xab

    .line 611
    sget-object v2, Lcom/p1/mobile/putong/core/data/RecallMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 612
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 613
    :cond_a6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    if-eqz v0, :cond_a7

    .line 614
    sget-object v1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 615
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xac

    .line 616
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 617
    :cond_a7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    if-eqz v0, :cond_a8

    .line 618
    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 619
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xad

    .line 620
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 621
    :cond_a8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    if-eqz v0, :cond_a9

    const/16 v1, 0xae

    .line 622
    sget-object v2, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 623
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 624
    :cond_a9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    if-eqz v0, :cond_aa

    .line 625
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlVisitor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 626
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xaf

    .line 627
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_aa
    const/16 v0, 0xb0

    .line 628
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 629
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    if-eqz v0, :cond_ab

    .line 630
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 631
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xb1

    .line 632
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 633
    :cond_ab
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    if-eqz v0, :cond_ac

    .line 634
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 635
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xb2

    .line 636
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 637
    :cond_ac
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    if-eqz v0, :cond_ad

    .line 638
    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 639
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xb3

    .line 640
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_ad
    const/16 v0, 0xb4

    .line 641
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 642
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    if-eqz v0, :cond_ae

    const/16 v1, 0xb5

    .line 643
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 644
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 645
    :cond_ae
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    if-eqz v0, :cond_af

    .line 646
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserIdType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 647
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xb6

    .line 648
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 649
    :cond_af
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    if-eqz v0, :cond_b0

    .line 650
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 651
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xb7

    .line 652
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 653
    :cond_b0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    if-eqz v0, :cond_b1

    const/16 v1, 0xb8

    .line 654
    sget-object v2, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 655
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 656
    :cond_b1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    if-eqz v0, :cond_b2

    const/16 v1, 0xb9

    .line 657
    sget-object v2, Lcom/p1/mobile/putong/core/data/MatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 658
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 659
    :cond_b2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    if-eqz v0, :cond_b3

    const/16 v1, 0xba

    .line 660
    sget-object v2, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 661
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 662
    :cond_b3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    if-eqz v0, :cond_b4

    const/16 v1, 0xbb

    .line 663
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 664
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 665
    :cond_b4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    if-eqz v0, :cond_b5

    const/16 v1, 0xbc

    .line 666
    sget-object v2, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 667
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 668
    :cond_b5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    if-eqz v0, :cond_b6

    const/16 v1, 0xbd

    .line 669
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 670
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 671
    :cond_b6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    if-eqz v0, :cond_b7

    const/16 v1, 0xbe

    .line 672
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 673
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 674
    :cond_b7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    if-eqz v0, :cond_b8

    const/16 v1, 0xbf

    .line 675
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthPartner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 676
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 677
    :cond_b8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    if-eqz v0, :cond_b9

    .line 678
    sget-object v1, Lcom/p1/mobile/putong/core/data/CityCData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 679
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xc0

    .line 680
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 681
    :cond_b9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    if-eqz v0, :cond_ba

    const/16 v1, 0xc1

    .line 682
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 683
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 684
    :cond_ba
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    if-eqz v0, :cond_bb

    .line 685
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 686
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xc2

    .line 687
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 688
    :cond_bb
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    if-eqz v0, :cond_bc

    const/16 v1, 0xc3

    .line 689
    sget-object v2, Lcom/p1/mobile/putong/core/data/CityCBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 690
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 691
    :cond_bc
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    if-eqz v0, :cond_bd

    const/16 v1, 0xc4

    .line 692
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatPartners;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 693
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 694
    :cond_bd
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    if-eqz v0, :cond_be

    .line 695
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 696
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xc5

    .line 697
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 698
    :cond_be
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    if-eqz v0, :cond_bf

    const/16 v1, 0xc6

    .line 699
    sget-object v2, Lcom/p1/mobile/putong/core/data/SurpriseGift;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 700
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_bf
    const/16 v0, 0xc7

    .line 701
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    move-result v0

    add-int/2addr p0, v0

    .line 702
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    if-eqz v0, :cond_c0

    .line 703
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardCornerMark;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 704
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xc8

    .line 705
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 706
    :cond_c0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v0, :cond_c1

    const/16 v1, 0xc9

    .line 707
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 708
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 709
    :cond_c1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    if-eqz v0, :cond_c2

    .line 710
    sget-object v1, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 711
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xca

    .line 712
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 713
    :cond_c2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    if-eqz v0, :cond_c3

    const/16 v1, 0xcb

    .line 714
    sget-object v2, Lcom/p1/mobile/putong/core/data/CityCConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 715
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 716
    :cond_c3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    if-eqz v0, :cond_c4

    const/16 v1, 0xcc

    .line 717
    sget-object v2, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 718
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 719
    :cond_c4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz v0, :cond_c5

    const/16 v1, 0xcd

    .line 720
    sget-object v2, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 721
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 722
    :cond_c5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    if-eqz v0, :cond_c6

    const/16 v1, 0xce

    .line 723
    sget-object v2, Lcom/p1/mobile/putong/core/data/VisitorSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 724
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 725
    :cond_c6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    if-eqz v0, :cond_c7

    .line 726
    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorHidden;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 727
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xcf

    .line 728
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 729
    :cond_c7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    if-eqz v0, :cond_c8

    const/16 v1, 0xd0

    .line 730
    sget-object v2, Lcom/p1/mobile/putong/core/data/MarriageGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 731
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 732
    :cond_c8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    if-eqz v0, :cond_c9

    .line 733
    sget-object v1, Lcom/p1/mobile/putong/core/data/SelectionUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 734
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xd1

    .line 735
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 736
    :cond_c9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    if-eqz v0, :cond_ca

    const/16 v1, 0xd2

    .line 737
    sget-object v2, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 738
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 739
    :cond_ca
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    if-eqz v0, :cond_cb

    .line 740
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserAudits;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 741
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xd3

    .line 742
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 743
    :cond_cb
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    if-eqz v0, :cond_cc

    .line 744
    sget-object v1, Lcom/p1/mobile/putong/core/data/DynamicLable;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 745
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xd4

    .line 746
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 747
    :cond_cc
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    if-eqz v0, :cond_cd

    .line 748
    sget-object v1, Lcom/p1/mobile/putong/data/DetectText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 749
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xd5

    .line 750
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 751
    :cond_cd
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    if-eqz v0, :cond_ce

    const/16 v1, 0xd6

    .line 752
    sget-object v2, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 753
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 754
    :cond_ce
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    if-eqz v0, :cond_cf

    .line 755
    sget-object v1, Lcom/p1/mobile/putong/core/data/AuditPictureTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 756
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xd7

    .line 757
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 758
    :cond_cf
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    if-eqz v0, :cond_d0

    const/16 v1, 0xd8

    .line 759
    sget-object v2, Lcom/p1/mobile/putong/core/data/DatingGuideData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 760
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_d0
    const/16 v0, 0xd9

    .line 761
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    .line 762
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v0, :cond_d1

    const/16 v1, 0xda

    .line 763
    sget-object v2, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 764
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 765
    :cond_d1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    if-eqz v0, :cond_d2

    .line 766
    sget-object v1, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 767
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xdb

    .line 768
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 769
    :cond_d2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    if-eqz v0, :cond_d3

    const/16 v1, 0xdc

    .line 770
    sget-object v2, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 771
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 772
    :cond_d3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz v0, :cond_d4

    const/16 v1, 0xdd

    .line 773
    sget-object v2, Lcom/p1/mobile/putong/core/data/RiskOtherData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 774
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 775
    :cond_d4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz v0, :cond_d5

    const/16 v1, 0xde

    .line 776
    sget-object v2, Lcom/p1/mobile/putong/core/data/RiskOtherData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 777
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 778
    :cond_d5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    if-eqz v0, :cond_d6

    .line 779
    sget-object v1, Lcom/p1/mobile/putong/core/data/RiskSelfData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 780
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xdf

    .line 781
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 782
    :cond_d6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    if-eqz v0, :cond_d7

    .line 783
    sget-object v1, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 784
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xe0

    .line 785
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 786
    :cond_d7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    if-eqz v0, :cond_d8

    .line 787
    sget-object v1, Lcom/p1/mobile/putong/core/data/BarLoverCitys;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 788
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xe1

    .line 789
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 790
    :cond_d8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    if-eqz v0, :cond_d9

    const/16 v1, 0xe2

    .line 791
    sget-object v2, Lcom/p1/mobile/putong/core/data/FateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 792
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 793
    :cond_d9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    if-eqz v0, :cond_da

    const/16 v1, 0xe3

    .line 794
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 795
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 796
    :cond_da
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    if-eqz v0, :cond_db

    .line 797
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 798
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xe4

    .line 799
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 800
    :cond_db
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    if-eqz v0, :cond_dc

    const/16 v1, 0xe5

    .line 801
    sget-object v2, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 802
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 803
    :cond_dc
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    if-eqz v0, :cond_dd

    const/16 v1, 0xe6

    .line 804
    sget-object v2, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 805
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 806
    :cond_dd
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    if-eqz v0, :cond_de

    const/16 v1, 0xe7

    .line 807
    sget-object v2, Lcom/p1/mobile/putong/core/data/Explore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 808
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 809
    :cond_de
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    if-eqz v0, :cond_df

    const/16 v1, 0xe8

    .line 810
    sget-object v2, Lcom/p1/mobile/putong/core/data/VipSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 811
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 812
    :cond_df
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    if-eqz v0, :cond_e0

    .line 813
    sget-object v1, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 814
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xe9

    .line 815
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 816
    :cond_e0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    if-eqz v0, :cond_e1

    const/16 v1, 0xea

    .line 817
    sget-object v2, Lcom/p1/mobile/putong/core/data/FakeGuideData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 818
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 819
    :cond_e1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    if-eqz v0, :cond_e2

    .line 820
    sget-object v1, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 821
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xeb

    .line 822
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 823
    :cond_e2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    if-eqz v0, :cond_e3

    const/16 v1, 0xec

    .line 824
    sget-object v2, Lcom/p1/mobile/putong/core/data/Questionnaire;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 825
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 826
    :cond_e3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    if-eqz v0, :cond_e4

    const/16 v1, 0xed

    .line 827
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 828
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 829
    :cond_e4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    if-eqz v0, :cond_e5

    const/16 v1, 0xee

    .line 830
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 831
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 832
    :cond_e5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    if-eqz v0, :cond_e6

    .line 833
    sget-object v1, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 834
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xef

    .line 835
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 836
    :cond_e6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v0, :cond_e7

    const/16 v1, 0xf0

    .line 837
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 838
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 839
    :cond_e7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v0, :cond_e8

    const/16 v1, 0xf1

    .line 840
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 841
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 842
    :cond_e8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    if-eqz v0, :cond_e9

    const/16 v1, 0xf2

    .line 843
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 844
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 845
    :cond_e9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    if-eqz v0, :cond_ea

    .line 846
    sget-object v1, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 847
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xf3

    .line 848
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 849
    :cond_ea
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    if-eqz v0, :cond_eb

    const/16 v1, 0xf4

    .line 850
    sget-object v2, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 851
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 852
    :cond_eb
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    if-eqz v0, :cond_ec

    .line 853
    sget-object v1, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 854
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xf5

    .line 855
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 856
    :cond_ec
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    if-eqz v0, :cond_ed

    .line 857
    sget-object v1, Lcom/p1/mobile/putong/core/data/UrlTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 858
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xf6

    .line 859
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 860
    :cond_ed
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    if-eqz v0, :cond_ee

    .line 861
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 862
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xf7

    .line 863
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 864
    :cond_ee
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz v0, :cond_ef

    const/16 v1, 0xf8

    .line 865
    sget-object v2, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 866
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 867
    :cond_ef
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    if-eqz v0, :cond_f0

    const/16 v1, 0xf9

    .line 868
    sget-object v2, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 869
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 870
    :cond_f0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    if-eqz v0, :cond_f1

    const/16 v1, 0xfa

    .line 871
    sget-object v2, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 872
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 873
    :cond_f1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    if-eqz v0, :cond_f2

    const/16 v1, 0xfb

    .line 874
    sget-object v2, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 875
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 876
    :cond_f2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    if-eqz v0, :cond_f3

    .line 877
    sget-object v1, Lcom/p1/mobile/putong/core/data/IPRegion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 878
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0xfc

    .line 879
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 880
    :cond_f3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    if-eqz v0, :cond_f4

    const/16 v1, 0xfd

    .line 881
    sget-object v2, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 882
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 883
    :cond_f4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    if-eqz v0, :cond_f5

    const/16 v1, 0xfe

    .line 884
    sget-object v2, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 885
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 886
    :cond_f5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    if-eqz v0, :cond_f6

    const/16 v1, 0xff

    .line 887
    sget-object v2, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 888
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 889
    :cond_f6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    if-eqz v0, :cond_f7

    const/16 v1, 0x100

    .line 890
    sget-object v2, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 891
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 892
    :cond_f7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    if-eqz v0, :cond_f8

    const/16 v1, 0x101

    .line 893
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 894
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 895
    :cond_f8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    if-eqz v0, :cond_f9

    .line 896
    sget-object v1, Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 897
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x102

    .line 898
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 899
    :cond_f9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    if-eqz v0, :cond_fa

    const/16 v1, 0x103

    .line 900
    sget-object v2, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 901
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 902
    :cond_fa
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v0, :cond_fb

    const/16 v1, 0x104

    .line 903
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 904
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 905
    :cond_fb
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    if-eqz v0, :cond_fc

    .line 906
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 907
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x105

    .line 908
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 909
    :cond_fc
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    if-eqz v0, :cond_fd

    .line 910
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyTabTask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 911
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x106

    .line 912
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 913
    :cond_fd
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    if-eqz v0, :cond_fe

    const/16 v1, 0x107

    .line 914
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 915
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 916
    :cond_fe
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    if-eqz v0, :cond_ff

    const/16 v1, 0x108

    .line 917
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 918
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_ff
    const/16 v0, 0x109

    .line 919
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 920
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    if-eqz v0, :cond_100

    .line 921
    sget-object v1, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 922
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x10a

    .line 923
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_100
    const/16 v0, 0x10b

    .line 924
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 925
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    if-eqz v0, :cond_101

    const/16 v1, 0x10c

    .line 926
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 927
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 928
    :cond_101
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    if-eqz v0, :cond_102

    const/16 v1, 0x10d

    .line 929
    sget-object v2, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 930
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 931
    :cond_102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    if-eqz v0, :cond_103

    const/16 v1, 0x10e

    .line 932
    sget-object v2, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 933
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 934
    :cond_103
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    if-eqz v0, :cond_104

    const/16 v1, 0x10f

    .line 935
    sget-object v2, Lcom/p1/mobile/putong/core/data/InvitationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 936
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 937
    :cond_104
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    if-eqz v0, :cond_105

    const/16 v1, 0x110

    .line 938
    sget-object v2, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 939
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 940
    :cond_105
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    if-eqz v0, :cond_106

    const/16 v1, 0x111

    .line 941
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 942
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_106
    const/16 v0, 0x112

    .line 943
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x113

    .line 944
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    .line 945
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    if-eqz v0, :cond_107

    .line 946
    sget-object v1, Lcom/p1/mobile/putong/core/data/Prologue;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 947
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x114

    .line 948
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 949
    :cond_107
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    if-eqz v0, :cond_108

    .line 950
    sget-object v1, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 951
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x115

    .line 952
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 953
    :cond_108
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    if-eqz v0, :cond_109

    .line 954
    sget-object v1, Lcom/p1/mobile/putong/core/data/CreditScoreData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 955
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x116

    .line 956
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 957
    :cond_109
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    if-eqz v0, :cond_10a

    .line 958
    sget-object v1, Lcom/p1/mobile/putong/core/data/DislikedUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 959
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x117

    .line 960
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 961
    :cond_10a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    if-eqz v0, :cond_10b

    const/16 v1, 0x118

    .line 962
    sget-object v2, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 963
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 964
    :cond_10b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    if-eqz v0, :cond_10c

    const/16 v1, 0x119

    .line 965
    sget-object v2, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 966
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 967
    :cond_10c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    if-eqz v0, :cond_10d

    .line 968
    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 969
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x11a

    .line 970
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 971
    :cond_10d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    if-eqz v0, :cond_10e

    .line 972
    sget-object v1, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 973
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x11b

    .line 974
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 975
    :cond_10e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    if-eqz v0, :cond_10f

    .line 976
    sget-object v1, Lcom/p1/mobile/putong/core/data/TribeSubset;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 977
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x11c

    .line 978
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 979
    :cond_10f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    if-eqz v0, :cond_110

    const/16 v1, 0x11d

    .line 980
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 981
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 982
    :cond_110
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    if-eqz v0, :cond_111

    const/16 v1, 0x11e

    .line 983
    sget-object v2, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 984
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 985
    :cond_111
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    if-eqz v0, :cond_112

    const/16 v1, 0x11f

    .line 986
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 987
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 988
    :cond_112
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    if-eqz v0, :cond_113

    .line 989
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 990
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x120

    .line 991
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    :cond_113
    const/16 v0, 0x121

    .line 992
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x122

    .line 993
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x123

    .line 994
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x124

    .line 995
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    move-result v0

    add-int/2addr p0, v0

    const/16 v0, 0x125

    .line 996
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    move-result v0

    add-int/2addr p0, v0

    .line 997
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    if-eqz v0, :cond_114

    .line 998
    sget-object v1, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 999
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x126

    .line 1000
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1001
    :cond_114
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    if-eqz v0, :cond_115

    .line 1002
    sget-object v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1003
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x127

    .line 1004
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1005
    :cond_115
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    if-eqz v0, :cond_116

    const/16 v1, 0x128

    .line 1006
    sget-object v2, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1007
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1008
    :cond_116
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    if-eqz v0, :cond_117

    .line 1009
    sget-object v1, Lcom/p1/mobile/putong/core/data/ComplimentText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1010
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x129

    .line 1011
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1012
    :cond_117
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    if-eqz v0, :cond_118

    const/16 v1, 0x12a

    .line 1013
    sget-object v2, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1014
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1015
    :cond_118
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    if-eqz v0, :cond_119

    .line 1016
    sget-object v1, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1017
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x12b

    .line 1018
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1019
    :cond_119
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    if-eqz v0, :cond_11a

    .line 1020
    sget-object v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1021
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    const/16 v2, 0x12c

    .line 1022
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    move-result v0

    add-int/2addr p0, v0

    .line 1023
    :cond_11a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1024
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreData;-><init>()V

    .line 2
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    move-result v0

    .line 3
    const-string v1, ""

    sparse-switch v0, :sswitch_data_0

    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    if-nez p1, :cond_1

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 6
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    if-nez p1, :cond_2

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 7
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    if-nez p1, :cond_3

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 8
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    if-nez p1, :cond_4

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 9
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    if-nez p1, :cond_5

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 10
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    if-nez p1, :cond_6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 11
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    if-nez p1, :cond_7

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 12
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    if-nez p1, :cond_8

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 13
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    if-nez p1, :cond_9

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 14
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    if-nez p1, :cond_a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 15
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    if-nez p1, :cond_b

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 16
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    if-nez p1, :cond_c

    invoke-static {}, Lcom/p1/mobile/putong/core/data/Wallet;->new_()Lcom/p1/mobile/putong/core/data/Wallet;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 17
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    if-nez p1, :cond_d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 18
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    if-nez p1, :cond_e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 19
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    if-nez p1, :cond_f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 20
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    if-nez p1, :cond_10

    invoke-static {}, Lcom/p1/mobile/putong/data/Contract;->new_()Lcom/p1/mobile/putong/data/Contract;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 21
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    if-nez p1, :cond_11

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 22
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    if-nez p1, :cond_12

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 23
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    if-nez p1, :cond_13

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 24
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    if-nez p1, :cond_14

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 25
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    if-nez p1, :cond_15

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 26
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    if-nez p1, :cond_16

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 27
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    if-nez p1, :cond_17

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 28
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    if-nez p1, :cond_18

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 29
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    if-nez p1, :cond_19

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CounterVerification;->new_()Lcom/p1/mobile/putong/core/data/CounterVerification;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 31
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    if-nez p1, :cond_1a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 32
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    if-nez p1, :cond_1b

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationDiff;->new_()Lcom/p1/mobile/putong/core/data/ConversationDiff;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 33
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    if-nez p1, :cond_1c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 34
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    if-nez p1, :cond_1d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 35
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    if-nez p1, :cond_1e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 36
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    if-nez p1, :cond_1f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 37
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    if-nez p1, :cond_20

    invoke-static {}, Lcom/p1/mobile/putong/core/data/Picks;->new_()Lcom/p1/mobile/putong/core/data/Picks;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 38
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    if-nez p1, :cond_21

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 39
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    if-nez p1, :cond_22

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 40
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    if-nez p1, :cond_23

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 41
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    if-nez p1, :cond_24

    invoke-static {}, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->new_()Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 42
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    if-nez p1, :cond_25

    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->new_()Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 44
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    if-nez p1, :cond_26

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 45
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    if-nez p1, :cond_27

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->new_()Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 46
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    if-nez p1, :cond_28

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 47
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    if-nez p1, :cond_29

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 48
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    if-nez p1, :cond_2a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 49
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    if-nez p1, :cond_2b

    invoke-static {}, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->new_()Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 50
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    if-nez p1, :cond_2c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 51
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    if-nez p1, :cond_2d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 52
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    if-nez p1, :cond_2e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 53
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    if-nez p1, :cond_2f

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->new_()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 54
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    if-nez p1, :cond_30

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 55
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    if-nez p1, :cond_31

    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 56
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-nez p1, :cond_32

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 57
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    if-nez p1, :cond_33

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 58
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-nez p1, :cond_34

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 59
    :cond_34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    if-nez p1, :cond_35

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 60
    :cond_35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    if-nez p1, :cond_36

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 61
    :cond_36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    if-nez p1, :cond_37

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 62
    :cond_37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    if-nez p1, :cond_38

    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->new_()Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 64
    :cond_38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    if-nez p1, :cond_39

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 65
    :cond_39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    if-nez p1, :cond_3a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 66
    :cond_3a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    if-nez p1, :cond_3b

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 67
    :cond_3b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    if-nez p1, :cond_3c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 68
    :cond_3c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    if-nez p1, :cond_3d

    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->new_()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 70
    :cond_3d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    if-nez p1, :cond_3e

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->new_()Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 71
    :cond_3e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    if-nez p1, :cond_3f

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->new_()Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 72
    :cond_3f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    if-nez p1, :cond_40

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 73
    :cond_40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    if-nez p1, :cond_41

    invoke-static {}, Lcom/p1/mobile/putong/core/data/CipherId;->new_()Lcom/p1/mobile/putong/core/data/CipherId;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 74
    :cond_41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    if-nez p1, :cond_42

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ShareId;->new_()Lcom/p1/mobile/putong/core/data/ShareId;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 75
    :cond_42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    if-nez p1, :cond_43

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 76
    :cond_43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    if-nez p1, :cond_44

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->new_()Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 77
    :cond_44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    if-nez p1, :cond_45

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 78
    :cond_45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    if-nez p1, :cond_46

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 79
    :cond_46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    if-nez p1, :cond_47

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 80
    :cond_47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    if-nez p1, :cond_48

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 81
    :cond_48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    if-nez p1, :cond_49

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingResult;->new_()Lcom/p1/mobile/putong/core/data/GreetingResult;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 82
    :cond_49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    if-nez p1, :cond_4a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 83
    :cond_4a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    if-nez p1, :cond_4b

    invoke-static {}, Lcom/p1/mobile/putong/core/data/JmpTarget;->new_()Lcom/p1/mobile/putong/core/data/JmpTarget;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 84
    :cond_4b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    if-nez p1, :cond_4c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 85
    :cond_4c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    if-nez p1, :cond_4d

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 86
    :cond_4d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    if-nez p1, :cond_4e

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PopGuide;->new_()Lcom/p1/mobile/putong/core/data/PopGuide;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 87
    :cond_4e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    if-nez p1, :cond_4f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 88
    :cond_4f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    if-nez p1, :cond_50

    invoke-static {}, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->new_()Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 89
    :cond_50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    if-nez p1, :cond_51

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 90
    :cond_51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    if-nez p1, :cond_52

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->new_()Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 91
    :cond_52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    if-nez p1, :cond_53

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 92
    :cond_53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    if-nez p1, :cond_54

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 93
    :cond_54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    if-nez p1, :cond_55

    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 94
    :cond_55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    if-nez p1, :cond_56

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 95
    :cond_56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    if-nez p1, :cond_57

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->new_()Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 96
    :cond_57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    if-nez p1, :cond_58

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 97
    :cond_58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    if-nez p1, :cond_59

    invoke-static {}, Lcom/p1/mobile/putong/core/data/RecallMatch;->new_()Lcom/p1/mobile/putong/core/data/RecallMatch;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 98
    :cond_59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    if-nez p1, :cond_5a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 99
    :cond_5a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    if-nez p1, :cond_5b

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 100
    :cond_5b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    if-nez p1, :cond_5c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 101
    :cond_5c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    if-nez p1, :cond_5d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 102
    :cond_5d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    if-nez p1, :cond_5e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 103
    :cond_5e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    if-nez p1, :cond_5f

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->new_()Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 104
    :cond_5f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    if-nez p1, :cond_60

    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->new_()Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 105
    :cond_60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    if-nez p1, :cond_61

    invoke-static {}, Lcom/p1/mobile/putong/core/data/MatchInfo;->new_()Lcom/p1/mobile/putong/core/data/MatchInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 106
    :cond_61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    if-nez p1, :cond_62

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 107
    :cond_62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    if-nez p1, :cond_63

    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->new_()Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 108
    :cond_63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    if-nez p1, :cond_64

    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->new_()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 109
    :cond_64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    if-nez p1, :cond_65

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthPartner;->new_()Lcom/p1/mobile/putong/core/data/GrowthPartner;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 110
    :cond_65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    if-nez p1, :cond_66

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 111
    :cond_66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    if-nez p1, :cond_67

    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCBanner;->new_()Lcom/p1/mobile/putong/core/data/CityCBanner;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 112
    :cond_67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    if-nez p1, :cond_68

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartners;->new_()Lcom/p1/mobile/putong/core/data/ChatPartners;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 113
    :cond_68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    if-nez p1, :cond_69

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 114
    :cond_69
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_6a

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 115
    :cond_6a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    if-nez p1, :cond_6b

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 116
    :cond_6b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    if-nez p1, :cond_6c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 117
    :cond_6c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-nez p1, :cond_6d

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 118
    :cond_6d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    if-nez p1, :cond_6e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 119
    :cond_6e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    if-nez p1, :cond_6f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 120
    :cond_6f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    if-nez p1, :cond_70

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 121
    :cond_70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    if-nez p1, :cond_71

    invoke-static {}, Lcom/p1/mobile/putong/core/data/FateRadar;->new_()Lcom/p1/mobile/putong/core/data/FateRadar;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 122
    :cond_71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    if-nez p1, :cond_72

    invoke-static {}, Lcom/p1/mobile/putong/core/data/Explore;->new_()Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 123
    :cond_72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_73

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 124
    :cond_73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_74

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 125
    :cond_74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    if-nez p1, :cond_75

    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->new_()Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 126
    :cond_75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    if-nez p1, :cond_76

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 127
    :cond_76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    if-nez p1, :cond_77

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPage;->new_()Lcom/p1/mobile/putong/core/data/ChatPage;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 128
    :cond_77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    if-nez p1, :cond_78

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 129
    :cond_78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_79

    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 131
    :cond_79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    if-nez p1, :cond_7a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 132
    :cond_7a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    if-nez p1, :cond_7b

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->new_()Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 133
    :cond_7b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    if-nez p1, :cond_7c

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->new_()Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 134
    :cond_7c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    if-nez p1, :cond_7d

    invoke-static {}, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->new_()Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 135
    :cond_7d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    if-nez p1, :cond_7e

    invoke-static {}, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->new_()Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 136
    :cond_7e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    if-nez p1, :cond_7f

    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->new_()Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 137
    :cond_7f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    if-nez p1, :cond_100

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    return-object p0

    .line 138
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 140
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    goto/16 :goto_0

    .line 141
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 143
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    goto/16 :goto_0

    .line 144
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    goto/16 :goto_0

    .line 145
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/ComplimentText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    goto/16 :goto_0

    .line 147
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    goto/16 :goto_0

    .line 149
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    goto/16 :goto_0

    .line 151
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 152
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 153
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    goto/16 :goto_0

    .line 154
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    goto/16 :goto_0

    .line 155
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    goto/16 :goto_0

    .line 156
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    goto/16 :goto_0

    .line 157
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    goto/16 :goto_0

    .line 158
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    goto/16 :goto_0

    .line 159
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    goto/16 :goto_0

    .line 161
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    goto/16 :goto_0

    .line 162
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    goto/16 :goto_0

    .line 164
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    goto/16 :goto_0

    .line 165
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/core/data/TribeSubset;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    goto/16 :goto_0

    .line 167
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 169
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    goto/16 :goto_0

    .line 170
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    goto/16 :goto_0

    .line 172
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    goto/16 :goto_0

    .line 173
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    goto/16 :goto_0

    .line 174
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/core/data/DislikedUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 176
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreditScoreData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    goto/16 :goto_0

    .line 178
    :sswitch_17
    sget-object v0, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 180
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    goto/16 :goto_0

    .line 181
    :sswitch_18
    sget-object v0, Lcom/p1/mobile/putong/core/data/Prologue;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    goto/16 :goto_0

    .line 182
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    goto/16 :goto_0

    .line 183
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    goto/16 :goto_0

    .line 184
    :sswitch_1b
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    goto/16 :goto_0

    .line 185
    :sswitch_1c
    sget-object v0, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    goto/16 :goto_0

    .line 187
    :sswitch_1d
    sget-object v0, Lcom/p1/mobile/putong/core/data/InvitationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/InvitationInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    goto/16 :goto_0

    .line 188
    :sswitch_1e
    sget-object v0, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    goto/16 :goto_0

    .line 189
    :sswitch_1f
    sget-object v0, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    goto/16 :goto_0

    .line 190
    :sswitch_20
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    goto/16 :goto_0

    .line 191
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    goto/16 :goto_0

    .line 192
    :sswitch_22
    sget-object v0, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    goto/16 :goto_0

    .line 194
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    goto/16 :goto_0

    .line 195
    :sswitch_24
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    goto/16 :goto_0

    .line 196
    :sswitch_25
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    goto/16 :goto_0

    .line 197
    :sswitch_26
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 198
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    goto/16 :goto_0

    .line 199
    :sswitch_27
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    goto/16 :goto_0

    .line 201
    :sswitch_28
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    goto/16 :goto_0

    .line 203
    :sswitch_29
    sget-object v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 204
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    goto/16 :goto_0

    .line 205
    :sswitch_2a
    sget-object v0, Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 206
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 207
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    goto/16 :goto_0

    .line 208
    :sswitch_2b
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatPage;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    goto/16 :goto_0

    .line 209
    :sswitch_2c
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    goto/16 :goto_0

    .line 210
    :sswitch_2d
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    goto/16 :goto_0

    .line 211
    :sswitch_2e
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    goto/16 :goto_0

    .line 212
    :sswitch_2f
    sget-object v0, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    goto/16 :goto_0

    .line 213
    :sswitch_30
    sget-object v0, Lcom/p1/mobile/putong/core/data/IPRegion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    goto/16 :goto_0

    .line 214
    :sswitch_31
    sget-object v0, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    goto/16 :goto_0

    .line 215
    :sswitch_32
    sget-object v0, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    goto/16 :goto_0

    .line 217
    :sswitch_33
    sget-object v0, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 218
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    goto/16 :goto_0

    .line 219
    :sswitch_34
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 220
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    goto/16 :goto_0

    .line 221
    :sswitch_35
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    goto/16 :goto_0

    .line 223
    :sswitch_36
    sget-object v0, Lcom/p1/mobile/putong/core/data/UrlTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    goto/16 :goto_0

    .line 224
    :sswitch_37
    sget-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 225
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 226
    :sswitch_38
    sget-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/IdealInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    goto/16 :goto_0

    .line 227
    :sswitch_39
    sget-object v0, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    goto/16 :goto_0

    .line 229
    :sswitch_3a
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    goto/16 :goto_0

    .line 230
    :sswitch_3b
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    goto/16 :goto_0

    .line 231
    :sswitch_3c
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 232
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    goto/16 :goto_0

    .line 233
    :sswitch_3d
    sget-object v0, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 234
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    goto/16 :goto_0

    .line 235
    :sswitch_3e
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 236
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    goto/16 :goto_0

    .line 237
    :sswitch_3f
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    goto/16 :goto_0

    .line 238
    :sswitch_40
    sget-object v0, Lcom/p1/mobile/putong/core/data/Questionnaire;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Questionnaire;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    goto/16 :goto_0

    .line 239
    :sswitch_41
    sget-object v0, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 241
    :sswitch_42
    sget-object v0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/FakeGuideData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    goto/16 :goto_0

    .line 242
    :sswitch_43
    sget-object v0, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    goto/16 :goto_0

    .line 244
    :sswitch_44
    sget-object v0, Lcom/p1/mobile/putong/core/data/VipSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/VipSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    goto/16 :goto_0

    .line 245
    :sswitch_45
    sget-object v0, Lcom/p1/mobile/putong/core/data/Explore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Explore;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    goto/16 :goto_0

    .line 246
    :sswitch_46
    sget-object v0, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    goto/16 :goto_0

    .line 247
    :sswitch_47
    sget-object v0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    goto/16 :goto_0

    .line 248
    :sswitch_48
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 249
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    goto/16 :goto_0

    .line 250
    :sswitch_49
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 251
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    goto/16 :goto_0

    .line 252
    :sswitch_4a
    sget-object v0, Lcom/p1/mobile/putong/core/data/FateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/FateRadar;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    goto/16 :goto_0

    .line 253
    :sswitch_4b
    sget-object v0, Lcom/p1/mobile/putong/core/data/BarLoverCitys;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    goto/16 :goto_0

    .line 255
    :sswitch_4c
    sget-object v0, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 256
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    goto/16 :goto_0

    .line 257
    :sswitch_4d
    sget-object v0, Lcom/p1/mobile/putong/core/data/RiskSelfData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    goto/16 :goto_0

    .line 258
    :sswitch_4e
    sget-object v0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/RiskOtherData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    goto/16 :goto_0

    .line 259
    :sswitch_4f
    sget-object v0, Lcom/p1/mobile/putong/core/data/RiskOtherData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/RiskOtherData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    goto/16 :goto_0

    .line 260
    :sswitch_50
    sget-object v0, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 261
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    goto/16 :goto_0

    .line 262
    :sswitch_51
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    goto/16 :goto_0

    .line 263
    :sswitch_52
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/TagStrategy;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    goto/16 :goto_0

    .line 264
    :sswitch_53
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    goto/16 :goto_0

    .line 265
    :sswitch_54
    sget-object v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    goto/16 :goto_0

    .line 266
    :sswitch_55
    sget-object v0, Lcom/p1/mobile/putong/core/data/AuditPictureTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    goto/16 :goto_0

    .line 268
    :sswitch_56
    sget-object v0, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    goto/16 :goto_0

    .line 269
    :sswitch_57
    sget-object v0, Lcom/p1/mobile/putong/data/DetectText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    goto/16 :goto_0

    .line 270
    :sswitch_58
    sget-object v0, Lcom/p1/mobile/putong/core/data/DynamicLable;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 271
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    goto/16 :goto_0

    .line 272
    :sswitch_59
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserAudits;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 273
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    goto/16 :goto_0

    .line 274
    :sswitch_5a
    sget-object v0, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    goto/16 :goto_0

    .line 275
    :sswitch_5b
    sget-object v0, Lcom/p1/mobile/putong/core/data/SelectionUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 276
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 277
    :sswitch_5c
    sget-object v0, Lcom/p1/mobile/putong/core/data/MarriageGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MarriageGuide;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    goto/16 :goto_0

    .line 278
    :sswitch_5d
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorHidden;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    goto/16 :goto_0

    .line 280
    :sswitch_5e
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    goto/16 :goto_0

    .line 281
    :sswitch_5f
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    goto/16 :goto_0

    .line 283
    :sswitch_60
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 284
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    goto/16 :goto_0

    .line 285
    :sswitch_61
    sget-object v0, Lcom/p1/mobile/putong/core/data/CityCConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CityCConfig;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    goto/16 :goto_0

    .line 286
    :sswitch_62
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 287
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    goto/16 :goto_0

    .line 288
    :sswitch_63
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    goto/16 :goto_0

    .line 289
    :sswitch_64
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardCornerMark;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 290
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    goto/16 :goto_0

    .line 291
    :sswitch_65
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    goto/16 :goto_0

    .line 292
    :sswitch_66
    sget-object v0, Lcom/p1/mobile/putong/core/data/SurpriseGift;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SurpriseGift;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    goto/16 :goto_0

    .line 293
    :sswitch_67
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 294
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 295
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    goto/16 :goto_0

    .line 296
    :sswitch_68
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatPartners;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    goto/16 :goto_0

    .line 297
    :sswitch_69
    sget-object v0, Lcom/p1/mobile/putong/core/data/CityCBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CityCBanner;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    goto/16 :goto_0

    .line 298
    :sswitch_6a
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    goto/16 :goto_0

    .line 300
    :sswitch_6b
    sget-object v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    goto/16 :goto_0

    .line 301
    :sswitch_6c
    sget-object v0, Lcom/p1/mobile/putong/core/data/CityCData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    goto/16 :goto_0

    .line 302
    :sswitch_6d
    sget-object v0, Lcom/p1/mobile/putong/core/data/GrowthPartner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthPartner;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    goto/16 :goto_0

    .line 303
    :sswitch_6e
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 304
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    goto/16 :goto_0

    .line 305
    :sswitch_6f
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    goto/16 :goto_0

    .line 306
    :sswitch_70
    sget-object v0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 307
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    goto/16 :goto_0

    .line 308
    :sswitch_71
    sget-object v0, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    goto/16 :goto_0

    .line 309
    :sswitch_72
    sget-object v0, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    goto/16 :goto_0

    .line 310
    :sswitch_73
    sget-object v0, Lcom/p1/mobile/putong/core/data/MatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MatchInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    goto/16 :goto_0

    .line 311
    :sswitch_74
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    goto/16 :goto_0

    .line 312
    :sswitch_75
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 313
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 314
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    goto/16 :goto_0

    .line 315
    :sswitch_76
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserIdType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 316
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    goto/16 :goto_0

    .line 317
    :sswitch_77
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    goto/16 :goto_0

    .line 318
    :sswitch_78
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    goto/16 :goto_0

    .line 319
    :sswitch_79
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 320
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    goto/16 :goto_0

    .line 321
    :sswitch_7a
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 322
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 323
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    goto/16 :goto_0

    .line 324
    :sswitch_7b
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    goto/16 :goto_0

    .line 326
    :sswitch_7c
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    goto/16 :goto_0

    .line 327
    :sswitch_7d
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlVisitor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 328
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    goto/16 :goto_0

    .line 329
    :sswitch_7e
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 330
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    goto/16 :goto_0

    .line 331
    :sswitch_7f
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 332
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    goto/16 :goto_0

    .line 333
    :sswitch_80
    sget-object v0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 334
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    goto/16 :goto_0

    .line 335
    :sswitch_81
    sget-object v0, Lcom/p1/mobile/putong/core/data/RecallMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/RecallMatch;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    goto/16 :goto_0

    .line 336
    :sswitch_82
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 337
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    goto/16 :goto_0

    .line 338
    :sswitch_83
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    goto/16 :goto_0

    .line 339
    :sswitch_84
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExtremePickItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 340
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    goto/16 :goto_0

    .line 341
    :sswitch_85
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    goto/16 :goto_0

    .line 342
    :sswitch_86
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 343
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    goto/16 :goto_0

    .line 344
    :sswitch_87
    sget-object v0, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    goto/16 :goto_0

    .line 345
    :sswitch_88
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    goto/16 :goto_0

    .line 346
    :sswitch_89
    sget-object v0, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    goto/16 :goto_0

    .line 347
    :sswitch_8a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    goto/16 :goto_0

    .line 348
    :sswitch_8b
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    goto/16 :goto_0

    .line 349
    :sswitch_8c
    sget-object v0, Lcom/p1/mobile/putong/core/data/FloatsCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 350
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    goto/16 :goto_0

    .line 351
    :sswitch_8d
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuperLikeCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 352
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    goto/16 :goto_0

    .line 353
    :sswitch_8e
    sget-object v0, Lcom/p1/mobile/putong/core/data/PopGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PopGuide;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    goto/16 :goto_0

    .line 354
    :sswitch_8f
    sget-object v0, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    goto/16 :goto_0

    .line 355
    :sswitch_90
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 356
    :sswitch_91
    sget-object v0, Lcom/p1/mobile/putong/core/data/JmpTarget;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/JmpTarget;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    goto/16 :goto_0

    .line 357
    :sswitch_92
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 358
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 359
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    goto/16 :goto_0

    .line 360
    :sswitch_93
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingResult;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    goto/16 :goto_0

    .line 361
    :sswitch_94
    sget-object v0, Lcom/p1/mobile/putong/core/data/ResourceTriggers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 362
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    goto/16 :goto_0

    .line 363
    :sswitch_95
    sget-object v0, Lcom/p1/mobile/putong/core/data/PermissionsItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 364
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    goto/16 :goto_0

    .line 365
    :sswitch_96
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    goto/16 :goto_0

    .line 366
    :sswitch_97
    sget-object v0, Lcom/p1/mobile/putong/core/data/Recommended;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 367
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    goto/16 :goto_0

    .line 368
    :sswitch_98
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 369
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    goto/16 :goto_0

    .line 370
    :sswitch_99
    sget-object v0, Lcom/p1/mobile/putong/data/StateEmotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 371
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    goto/16 :goto_0

    .line 372
    :sswitch_9a
    sget-object v0, Lcom/p1/mobile/putong/core/data/ShareId;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ShareId;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    goto/16 :goto_0

    .line 373
    :sswitch_9b
    sget-object v0, Lcom/p1/mobile/putong/core/data/CipherId;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CipherId;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    goto/16 :goto_0

    .line 374
    :sswitch_9c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    goto/16 :goto_0

    .line 375
    :sswitch_9d
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikeUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 376
    :sswitch_9e
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    goto/16 :goto_0

    .line 377
    :sswitch_9f
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    goto/16 :goto_0

    .line 378
    :sswitch_a0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeePortrait;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 379
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    goto/16 :goto_0

    .line 380
    :sswitch_a1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 381
    :sswitch_a2
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 382
    :sswitch_a3
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    goto/16 :goto_0

    .line 383
    :sswitch_a4
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 384
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    goto/16 :goto_0

    .line 385
    :sswitch_a5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    goto/16 :goto_0

    .line 386
    :sswitch_a6
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagUserCounts;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 387
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    goto/16 :goto_0

    .line 388
    :sswitch_a7
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagCategories;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 389
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    goto/16 :goto_0

    .line 390
    :sswitch_a8
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/TagStrategy;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    goto/16 :goto_0

    .line 391
    :sswitch_a9
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    goto/16 :goto_0

    .line 392
    :sswitch_aa
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/TagStrategy;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    goto/16 :goto_0

    .line 393
    :sswitch_ab
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    goto/16 :goto_0

    .line 394
    :sswitch_ac
    sget-object v0, Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 395
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 396
    :sswitch_ad
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    goto/16 :goto_0

    .line 397
    :sswitch_ae
    sget-object v0, Lcom/p1/mobile/putong/core/data/Voice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    goto/16 :goto_0

    .line 398
    :sswitch_af
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 399
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    goto/16 :goto_0

    .line 400
    :sswitch_b0
    sget-object v0, Lcom/p1/mobile/putong/core/data/BreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 401
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    goto/16 :goto_0

    .line 402
    :sswitch_b1
    sget-object v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    goto/16 :goto_0

    .line 403
    :sswitch_b2
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardsIcons;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 404
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    goto/16 :goto_0

    .line 405
    :sswitch_b3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Active;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    goto/16 :goto_0

    .line 406
    :sswitch_b4
    sget-object v0, Lcom/p1/mobile/putong/core/data/InsertCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 407
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    goto/16 :goto_0

    .line 408
    :sswitch_b5
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    goto/16 :goto_0

    .line 409
    :sswitch_b6
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    goto/16 :goto_0

    .line 410
    :sswitch_b7
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    goto/16 :goto_0

    .line 411
    :sswitch_b8
    sget-object v0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    goto/16 :goto_0

    .line 412
    :sswitch_b9
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 413
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    goto/16 :goto_0

    .line 414
    :sswitch_ba
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserGreetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 415
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    goto/16 :goto_0

    .line 416
    :sswitch_bb
    sget-object v0, Lcom/p1/mobile/putong/data/RecommendMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 417
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    goto/16 :goto_0

    .line 418
    :sswitch_bc
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 419
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    goto/16 :goto_0

    .line 420
    :sswitch_bd
    sget-object v0, Lcom/p1/mobile/putong/core/data/Evaluation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Evaluation;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    goto/16 :goto_0

    .line 421
    :sswitch_be
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    goto/16 :goto_0

    .line 422
    :sswitch_bf
    sget-object v0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 423
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    goto/16 :goto_0

    .line 424
    :sswitch_c0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Evaluation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 425
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    goto/16 :goto_0

    .line 426
    :sswitch_c1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    goto/16 :goto_0

    .line 427
    :sswitch_c2
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    goto/16 :goto_0

    .line 428
    :sswitch_c3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Note;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Note;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    goto/16 :goto_0

    .line 429
    :sswitch_c4
    sget-object v0, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 430
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    goto/16 :goto_0

    .line 431
    :sswitch_c5
    sget-object v0, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    goto/16 :goto_0

    .line 432
    :sswitch_c6
    sget-object v0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 433
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 434
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 435
    :sswitch_c7
    sget-object v0, Lcom/p1/mobile/putong/core/data/Literatures;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 436
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    goto/16 :goto_0

    .line 437
    :sswitch_c8
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 438
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    goto/16 :goto_0

    .line 439
    :sswitch_c9
    sget-object v0, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/User;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    goto/16 :goto_0

    .line 440
    :sswitch_ca
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    goto/16 :goto_0

    .line 441
    :sswitch_cb
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    goto/16 :goto_0

    .line 442
    :sswitch_cc
    sget-object v0, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    goto/16 :goto_0

    .line 443
    :sswitch_cd
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 444
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    goto/16 :goto_0

    .line 445
    :sswitch_ce
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    goto/16 :goto_0

    .line 446
    :sswitch_cf
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    goto/16 :goto_0

    .line 447
    :sswitch_d0
    sget-object v0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 448
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    goto/16 :goto_0

    .line 449
    :sswitch_d1
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    goto/16 :goto_0

    .line 450
    :sswitch_d2
    sget-object v0, Lcom/p1/mobile/putong/core/data/CountdownItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 451
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    goto/16 :goto_0

    .line 452
    :sswitch_d3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Picks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Picks;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    goto/16 :goto_0

    .line 453
    :sswitch_d4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicksUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 454
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 455
    :sswitch_d5
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    goto/16 :goto_0

    .line 456
    :sswitch_d6
    sget-object v0, Lcom/p1/mobile/putong/core/data/OrderInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 457
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 458
    :sswitch_d7
    sget-object v0, Lcom/p1/mobile/putong/core/data/RecentConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 459
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    goto/16 :goto_0

    .line 460
    :sswitch_d8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReadMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 461
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    goto/16 :goto_0

    .line 462
    :sswitch_d9
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 463
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 464
    :sswitch_da
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    goto/16 :goto_0

    .line 465
    :sswitch_db
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    goto/16 :goto_0

    .line 466
    :sswitch_dc
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingPermission;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 467
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    goto/16 :goto_0

    .line 468
    :sswitch_dd
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingCounter;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    goto/16 :goto_0

    .line 469
    :sswitch_de
    sget-object v0, Lcom/p1/mobile/putong/core/data/Greeting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    goto/16 :goto_0

    .line 470
    :sswitch_df
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 471
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    goto/16 :goto_0

    .line 472
    :sswitch_e0
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftWallTitle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 473
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    goto/16 :goto_0

    .line 474
    :sswitch_e1
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 475
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 476
    :sswitch_e2
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 477
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    goto/16 :goto_0

    .line 478
    :sswitch_e3
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 479
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    goto/16 :goto_0

    .line 480
    :sswitch_e4
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    goto/16 :goto_0

    .line 481
    :sswitch_e5
    sget-object v0, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 482
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    goto/16 :goto_0

    .line 483
    :sswitch_e6
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 484
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    goto/16 :goto_0

    .line 485
    :sswitch_e7
    sget-object v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 486
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    goto/16 :goto_0

    .line 487
    :sswitch_e8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationDiff;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationDiff;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    goto/16 :goto_0

    .line 488
    :sswitch_e9
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    goto/16 :goto_0

    .line 489
    :sswitch_ea
    sget-object v0, Lcom/p1/mobile/putong/core/data/FriendInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    goto/16 :goto_0

    .line 490
    :sswitch_eb
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveSchema;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 491
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    goto/16 :goto_0

    .line 492
    :sswitch_ec
    sget-object v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 493
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CounterVerification;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    goto/16 :goto_0

    .line 494
    :sswitch_ed
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 495
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 496
    :sswitch_ee
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacket;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 497
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    goto/16 :goto_0

    .line 498
    :sswitch_ef
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 499
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    goto/16 :goto_0

    .line 500
    :sswitch_f0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Couponbag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Couponbag;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    goto/16 :goto_0

    .line 501
    :sswitch_f1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PriorityLike;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/PriorityLike;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    goto/16 :goto_0

    .line 502
    :sswitch_f2
    sget-object v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 503
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    goto/16 :goto_0

    .line 504
    :sswitch_f3
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 505
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    goto/16 :goto_0

    .line 506
    :sswitch_f4
    sget-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    goto/16 :goto_0

    .line 507
    :sswitch_f5
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 508
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 509
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    goto/16 :goto_0

    .line 510
    :sswitch_f6
    sget-object v0, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 511
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    goto/16 :goto_0

    .line 512
    :sswitch_f7
    sget-object v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 513
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 514
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    goto/16 :goto_0

    .line 515
    :sswitch_f8
    sget-object v0, Lcom/p1/mobile/putong/core/data/OfficialAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 516
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    goto/16 :goto_0

    .line 517
    :sswitch_f9
    sget-object v0, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    goto/16 :goto_0

    .line 518
    :sswitch_fa
    sget-object v0, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 519
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    goto/16 :goto_0

    .line 520
    :sswitch_fb
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 521
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    goto/16 :goto_0

    .line 522
    :sswitch_fc
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 523
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    goto/16 :goto_0

    .line 524
    :sswitch_fd
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupTab;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    goto/16 :goto_0

    .line 525
    :sswitch_fe
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 526
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    goto/16 :goto_0

    .line 527
    :sswitch_ff
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupAttribute;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 528
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    goto/16 :goto_0

    .line 529
    :sswitch_100
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupNotification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 530
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    goto/16 :goto_0

    .line 531
    :sswitch_101
    sget-object v0, Lcom/p1/mobile/putong/core/data/NotificationCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 532
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    goto/16 :goto_0

    .line 533
    :sswitch_102
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupApply;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 534
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    goto/16 :goto_0

    .line 535
    :sswitch_103
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 536
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    goto/16 :goto_0

    .line 537
    :sswitch_104
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 538
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    goto/16 :goto_0

    .line 539
    :sswitch_105
    sget-object v0, Lcom/p1/mobile/putong/core/data/ContractInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 540
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 541
    :sswitch_106
    sget-object v0, Lcom/p1/mobile/putong/core/data/HeartBeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 542
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    goto/16 :goto_0

    .line 543
    :sswitch_107
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 544
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    goto/16 :goto_0

    .line 545
    :sswitch_108
    sget-object v0, Lcom/p1/mobile/putong/data/Contract;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Contract;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    goto/16 :goto_0

    .line 546
    :sswitch_109
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 547
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    goto/16 :goto_0

    .line 548
    :sswitch_10a
    sget-object v0, Lcom/p1/mobile/putong/core/data/AccountRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 549
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    goto/16 :goto_0

    .line 550
    :sswitch_10b
    sget-object v0, Lcom/p1/mobile/putong/core/data/WalletAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 551
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    goto/16 :goto_0

    .line 552
    :sswitch_10c
    sget-object v0, Lcom/p1/mobile/putong/core/data/RefundDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 553
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    goto/16 :goto_0

    .line 554
    :sswitch_10d
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikedUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 555
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    goto/16 :goto_0

    .line 556
    :sswitch_10e
    sget-object v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 557
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    goto/16 :goto_0

    .line 558
    :sswitch_10f
    sget-object v0, Lcom/p1/mobile/putong/core/data/Complain;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    goto/16 :goto_0

    .line 559
    :sswitch_110
    sget-object v0, Lcom/p1/mobile/putong/core/data/VoiceCall;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    goto/16 :goto_0

    .line 560
    :sswitch_111
    sget-object v0, Lcom/p1/mobile/putong/core/data/AutoDeducts;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 561
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    goto/16 :goto_0

    .line 562
    :sswitch_112
    sget-object v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 563
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    goto/16 :goto_0

    .line 564
    :sswitch_113
    sget-object v0, Lcom/p1/mobile/putong/core/data/Surveys;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    goto/16 :goto_0

    .line 565
    :sswitch_114
    sget-object v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 566
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    goto/16 :goto_0

    .line 567
    :sswitch_115
    sget-object v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 568
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 569
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    goto/16 :goto_0

    .line 570
    :sswitch_116
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 571
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    goto/16 :goto_0

    .line 572
    :sswitch_117
    sget-object v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    goto/16 :goto_0

    .line 573
    :sswitch_118
    sget-object v0, Lcom/p1/mobile/putong/core/data/Figure;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    goto/16 :goto_0

    .line 574
    :sswitch_119
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 575
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    .line 576
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    goto/16 :goto_0

    .line 577
    :sswitch_11a
    sget-object v0, Lcom/p1/mobile/putong/core/data/Merchandise;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 578
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    goto/16 :goto_0

    .line 579
    :sswitch_11b
    sget-object v0, Lcom/p1/mobile/putong/core/data/FaceidToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 580
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    goto/16 :goto_0

    .line 581
    :sswitch_11c
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 582
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    goto/16 :goto_0

    .line 583
    :sswitch_11d
    sget-object v0, Lcom/p1/mobile/putong/core/data/Coin;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Coin;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    goto/16 :goto_0

    .line 584
    :sswitch_11e
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 585
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    goto/16 :goto_0

    .line 586
    :sswitch_11f
    sget-object v0, Lcom/p1/mobile/putong/core/data/Wallet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Wallet;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    goto/16 :goto_0

    .line 587
    :sswitch_120
    sget-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 588
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    goto/16 :goto_0

    .line 589
    :sswitch_121
    sget-object v0, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    goto/16 :goto_0

    .line 590
    :sswitch_122
    sget-object v0, Lcom/p1/mobile/putong/core/data/School;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    goto/16 :goto_0

    .line 591
    :sswitch_123
    sget-object v0, Lcom/p1/mobile/putong/data/Link;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    goto/16 :goto_0

    .line 592
    :sswitch_124
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerBundle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 593
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    goto/16 :goto_0

    .line 594
    :sswitch_125
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 595
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    goto/16 :goto_0

    .line 596
    :sswitch_126
    sget-object v0, Lcom/p1/mobile/putong/core/data/Sticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    goto/16 :goto_0

    .line 597
    :sswitch_127
    sget-object v0, Lcom/p1/mobile/putong/core/data/Question;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    goto/16 :goto_0

    .line 598
    :sswitch_128
    sget-object v0, Lcom/p1/mobile/putong/data/Contact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    goto/16 :goto_0

    .line 599
    :sswitch_129
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    goto/16 :goto_0

    .line 600
    :sswitch_12a
    sget-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 601
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    goto/16 :goto_0

    .line 602
    :sswitch_12b
    sget-object v0, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 603
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    goto/16 :goto_0

    .line 604
    :sswitch_12c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    if-nez p1, :cond_80

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 605
    :cond_80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    if-nez p1, :cond_81

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 606
    :cond_81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    if-nez p1, :cond_82

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 607
    :cond_82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    if-nez p1, :cond_83

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 608
    :cond_83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    if-nez p1, :cond_84

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 609
    :cond_84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    if-nez p1, :cond_85

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 610
    :cond_85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    if-nez p1, :cond_86

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 611
    :cond_86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    if-nez p1, :cond_87

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 612
    :cond_87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    if-nez p1, :cond_88

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 613
    :cond_88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    if-nez p1, :cond_89

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 614
    :cond_89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    if-nez p1, :cond_8a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 615
    :cond_8a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    if-nez p1, :cond_8b

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 616
    :cond_8b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    if-nez p1, :cond_8c

    invoke-static {}, Lcom/p1/mobile/putong/core/data/Wallet;->new_()Lcom/p1/mobile/putong/core/data/Wallet;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 617
    :cond_8c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    if-nez p1, :cond_8d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 618
    :cond_8d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    if-nez p1, :cond_8e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 619
    :cond_8e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    if-nez p1, :cond_8f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 620
    :cond_8f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    if-nez p1, :cond_90

    invoke-static {}, Lcom/p1/mobile/putong/data/Contract;->new_()Lcom/p1/mobile/putong/data/Contract;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 621
    :cond_90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    if-nez p1, :cond_91

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 622
    :cond_91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    if-nez p1, :cond_92

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 623
    :cond_92
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    if-nez p1, :cond_93

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 624
    :cond_93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    if-nez p1, :cond_94

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 625
    :cond_94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    if-nez p1, :cond_95

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 626
    :cond_95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    if-nez p1, :cond_96

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 627
    :cond_96
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    if-nez p1, :cond_97

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 628
    :cond_97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    if-nez p1, :cond_98

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 629
    :cond_98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    if-nez p1, :cond_99

    .line 630
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CounterVerification;->new_()Lcom/p1/mobile/putong/core/data/CounterVerification;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 631
    :cond_99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    if-nez p1, :cond_9a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 632
    :cond_9a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    if-nez p1, :cond_9b

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationDiff;->new_()Lcom/p1/mobile/putong/core/data/ConversationDiff;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 633
    :cond_9b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    if-nez p1, :cond_9c

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 634
    :cond_9c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    if-nez p1, :cond_9d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 635
    :cond_9d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    if-nez p1, :cond_9e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 636
    :cond_9e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    if-nez p1, :cond_9f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 637
    :cond_9f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    if-nez p1, :cond_a0

    invoke-static {}, Lcom/p1/mobile/putong/core/data/Picks;->new_()Lcom/p1/mobile/putong/core/data/Picks;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 638
    :cond_a0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    if-nez p1, :cond_a1

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 639
    :cond_a1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    if-nez p1, :cond_a2

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 640
    :cond_a2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    if-nez p1, :cond_a3

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 641
    :cond_a3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    if-nez p1, :cond_a4

    invoke-static {}, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->new_()Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 642
    :cond_a4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    if-nez p1, :cond_a5

    .line 643
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->new_()Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 644
    :cond_a5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    if-nez p1, :cond_a6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 645
    :cond_a6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    if-nez p1, :cond_a7

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->new_()Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 646
    :cond_a7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    if-nez p1, :cond_a8

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 647
    :cond_a8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    if-nez p1, :cond_a9

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 648
    :cond_a9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    if-nez p1, :cond_aa

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 649
    :cond_aa
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    if-nez p1, :cond_ab

    invoke-static {}, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->new_()Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 650
    :cond_ab
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    if-nez p1, :cond_ac

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 651
    :cond_ac
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    if-nez p1, :cond_ad

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 652
    :cond_ad
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    if-nez p1, :cond_ae

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 653
    :cond_ae
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    if-nez p1, :cond_af

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->new_()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 654
    :cond_af
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    if-nez p1, :cond_b0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 655
    :cond_b0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    if-nez p1, :cond_b1

    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 656
    :cond_b1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-nez p1, :cond_b2

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 657
    :cond_b2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    if-nez p1, :cond_b3

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 658
    :cond_b3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-nez p1, :cond_b4

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 659
    :cond_b4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    if-nez p1, :cond_b5

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 660
    :cond_b5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    if-nez p1, :cond_b6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 661
    :cond_b6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    if-nez p1, :cond_b7

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 662
    :cond_b7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    if-nez p1, :cond_b8

    .line 663
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->new_()Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 664
    :cond_b8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    if-nez p1, :cond_b9

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 665
    :cond_b9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    if-nez p1, :cond_ba

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 666
    :cond_ba
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    if-nez p1, :cond_bb

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 667
    :cond_bb
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    if-nez p1, :cond_bc

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 668
    :cond_bc
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    if-nez p1, :cond_bd

    .line 669
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->new_()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 670
    :cond_bd
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    if-nez p1, :cond_be

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->new_()Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 671
    :cond_be
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    if-nez p1, :cond_bf

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->new_()Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 672
    :cond_bf
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    if-nez p1, :cond_c0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 673
    :cond_c0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    if-nez p1, :cond_c1

    invoke-static {}, Lcom/p1/mobile/putong/core/data/CipherId;->new_()Lcom/p1/mobile/putong/core/data/CipherId;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 674
    :cond_c1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    if-nez p1, :cond_c2

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ShareId;->new_()Lcom/p1/mobile/putong/core/data/ShareId;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 675
    :cond_c2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    if-nez p1, :cond_c3

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 676
    :cond_c3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    if-nez p1, :cond_c4

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->new_()Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 677
    :cond_c4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    if-nez p1, :cond_c5

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 678
    :cond_c5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    if-nez p1, :cond_c6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 679
    :cond_c6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    if-nez p1, :cond_c7

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 680
    :cond_c7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    if-nez p1, :cond_c8

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 681
    :cond_c8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    if-nez p1, :cond_c9

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingResult;->new_()Lcom/p1/mobile/putong/core/data/GreetingResult;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 682
    :cond_c9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    if-nez p1, :cond_ca

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 683
    :cond_ca
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    if-nez p1, :cond_cb

    invoke-static {}, Lcom/p1/mobile/putong/core/data/JmpTarget;->new_()Lcom/p1/mobile/putong/core/data/JmpTarget;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 684
    :cond_cb
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    if-nez p1, :cond_cc

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 685
    :cond_cc
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    if-nez p1, :cond_cd

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 686
    :cond_cd
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    if-nez p1, :cond_ce

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PopGuide;->new_()Lcom/p1/mobile/putong/core/data/PopGuide;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 687
    :cond_ce
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    if-nez p1, :cond_cf

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 688
    :cond_cf
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    if-nez p1, :cond_d0

    invoke-static {}, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->new_()Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 689
    :cond_d0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    if-nez p1, :cond_d1

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 690
    :cond_d1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    if-nez p1, :cond_d2

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->new_()Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 691
    :cond_d2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    if-nez p1, :cond_d3

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 692
    :cond_d3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    if-nez p1, :cond_d4

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 693
    :cond_d4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    if-nez p1, :cond_d5

    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 694
    :cond_d5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    if-nez p1, :cond_d6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 695
    :cond_d6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    if-nez p1, :cond_d7

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->new_()Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 696
    :cond_d7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    if-nez p1, :cond_d8

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 697
    :cond_d8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    if-nez p1, :cond_d9

    invoke-static {}, Lcom/p1/mobile/putong/core/data/RecallMatch;->new_()Lcom/p1/mobile/putong/core/data/RecallMatch;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 698
    :cond_d9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    if-nez p1, :cond_da

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 699
    :cond_da
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    if-nez p1, :cond_db

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 700
    :cond_db
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    if-nez p1, :cond_dc

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 701
    :cond_dc
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    if-nez p1, :cond_dd

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 702
    :cond_dd
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    if-nez p1, :cond_de

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 703
    :cond_de
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    if-nez p1, :cond_df

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->new_()Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 704
    :cond_df
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    if-nez p1, :cond_e0

    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->new_()Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 705
    :cond_e0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    if-nez p1, :cond_e1

    invoke-static {}, Lcom/p1/mobile/putong/core/data/MatchInfo;->new_()Lcom/p1/mobile/putong/core/data/MatchInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 706
    :cond_e1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    if-nez p1, :cond_e2

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 707
    :cond_e2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    if-nez p1, :cond_e3

    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->new_()Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 708
    :cond_e3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    if-nez p1, :cond_e4

    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->new_()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 709
    :cond_e4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    if-nez p1, :cond_e5

    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthPartner;->new_()Lcom/p1/mobile/putong/core/data/GrowthPartner;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 710
    :cond_e5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    if-nez p1, :cond_e6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 711
    :cond_e6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    if-nez p1, :cond_e7

    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCBanner;->new_()Lcom/p1/mobile/putong/core/data/CityCBanner;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 712
    :cond_e7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    if-nez p1, :cond_e8

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartners;->new_()Lcom/p1/mobile/putong/core/data/ChatPartners;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 713
    :cond_e8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    if-nez p1, :cond_e9

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 714
    :cond_e9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_ea

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 715
    :cond_ea
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    if-nez p1, :cond_eb

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 716
    :cond_eb
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    if-nez p1, :cond_ec

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 717
    :cond_ec
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-nez p1, :cond_ed

    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 718
    :cond_ed
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    if-nez p1, :cond_ee

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 719
    :cond_ee
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    if-nez p1, :cond_ef

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 720
    :cond_ef
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    if-nez p1, :cond_f0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 721
    :cond_f0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    if-nez p1, :cond_f1

    invoke-static {}, Lcom/p1/mobile/putong/core/data/FateRadar;->new_()Lcom/p1/mobile/putong/core/data/FateRadar;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 722
    :cond_f1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    if-nez p1, :cond_f2

    invoke-static {}, Lcom/p1/mobile/putong/core/data/Explore;->new_()Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 723
    :cond_f2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_f3

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 724
    :cond_f3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_f4

    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 725
    :cond_f4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    if-nez p1, :cond_f5

    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->new_()Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 726
    :cond_f5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    if-nez p1, :cond_f6

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 727
    :cond_f6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    if-nez p1, :cond_f7

    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPage;->new_()Lcom/p1/mobile/putong/core/data/ChatPage;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 728
    :cond_f7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    if-nez p1, :cond_f8

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 729
    :cond_f8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-nez p1, :cond_f9

    .line 730
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 731
    :cond_f9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    if-nez p1, :cond_fa

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 732
    :cond_fa
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    if-nez p1, :cond_fb

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->new_()Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 733
    :cond_fb
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    if-nez p1, :cond_fc

    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->new_()Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 734
    :cond_fc
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    if-nez p1, :cond_fd

    invoke-static {}, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->new_()Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 735
    :cond_fd
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    if-nez p1, :cond_fe

    invoke-static {}, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->new_()Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 736
    :cond_fe
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    if-nez p1, :cond_ff

    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->new_()Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 737
    :cond_ff
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    if-nez p1, :cond_100

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    :cond_100
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12c
        0xa -> :sswitch_12b
        0x12 -> :sswitch_12a
        0x1a -> :sswitch_129
        0x22 -> :sswitch_128
        0x2a -> :sswitch_127
        0x32 -> :sswitch_126
        0x3a -> :sswitch_125
        0x42 -> :sswitch_124
        0x4a -> :sswitch_123
        0x52 -> :sswitch_122
        0x5a -> :sswitch_121
        0x62 -> :sswitch_120
        0x6a -> :sswitch_11f
        0x72 -> :sswitch_11e
        0x7a -> :sswitch_11d
        0x82 -> :sswitch_11c
        0x8a -> :sswitch_11b
        0x92 -> :sswitch_11a
        0x9a -> :sswitch_119
        0xa2 -> :sswitch_118
        0xaa -> :sswitch_117
        0xb2 -> :sswitch_116
        0xba -> :sswitch_115
        0xc2 -> :sswitch_114
        0xca -> :sswitch_113
        0xd2 -> :sswitch_112
        0xda -> :sswitch_111
        0xe2 -> :sswitch_110
        0xea -> :sswitch_10f
        0xf2 -> :sswitch_10e
        0xfa -> :sswitch_10d
        0x102 -> :sswitch_10c
        0x10a -> :sswitch_10b
        0x112 -> :sswitch_10a
        0x11a -> :sswitch_109
        0x122 -> :sswitch_108
        0x12a -> :sswitch_107
        0x132 -> :sswitch_106
        0x13a -> :sswitch_105
        0x142 -> :sswitch_104
        0x14a -> :sswitch_103
        0x152 -> :sswitch_102
        0x15a -> :sswitch_101
        0x162 -> :sswitch_100
        0x16a -> :sswitch_ff
        0x172 -> :sswitch_fe
        0x17a -> :sswitch_fd
        0x182 -> :sswitch_fc
        0x18a -> :sswitch_fb
        0x192 -> :sswitch_fa
        0x19a -> :sswitch_f9
        0x1a2 -> :sswitch_f8
        0x1aa -> :sswitch_f7
        0x1b2 -> :sswitch_f6
        0x1ba -> :sswitch_f5
        0x1c2 -> :sswitch_f4
        0x1ca -> :sswitch_f3
        0x1d2 -> :sswitch_f2
        0x1da -> :sswitch_f1
        0x1e2 -> :sswitch_f0
        0x1ea -> :sswitch_ef
        0x1f2 -> :sswitch_ee
        0x1fa -> :sswitch_ed
        0x202 -> :sswitch_ec
        0x20a -> :sswitch_eb
        0x212 -> :sswitch_ea
        0x219 -> :sswitch_e9
        0x222 -> :sswitch_e8
        0x22a -> :sswitch_e7
        0x232 -> :sswitch_e6
        0x23a -> :sswitch_e5
        0x242 -> :sswitch_e4
        0x24a -> :sswitch_e3
        0x252 -> :sswitch_e2
        0x25a -> :sswitch_e1
        0x262 -> :sswitch_e0
        0x26a -> :sswitch_df
        0x272 -> :sswitch_de
        0x27a -> :sswitch_dd
        0x282 -> :sswitch_dc
        0x28a -> :sswitch_db
        0x290 -> :sswitch_da
        0x29a -> :sswitch_d9
        0x2a2 -> :sswitch_d8
        0x2aa -> :sswitch_d7
        0x2b2 -> :sswitch_d6
        0x2ba -> :sswitch_d5
        0x2c2 -> :sswitch_d4
        0x2ca -> :sswitch_d3
        0x2d2 -> :sswitch_d2
        0x2da -> :sswitch_d1
        0x2e2 -> :sswitch_d0
        0x2ea -> :sswitch_cf
        0x2f2 -> :sswitch_ce
        0x2fa -> :sswitch_cd
        0x302 -> :sswitch_cc
        0x30a -> :sswitch_cb
        0x310 -> :sswitch_ca
        0x31a -> :sswitch_c9
        0x322 -> :sswitch_c8
        0x32a -> :sswitch_c7
        0x332 -> :sswitch_c6
        0x33a -> :sswitch_c5
        0x342 -> :sswitch_c4
        0x34a -> :sswitch_c3
        0x352 -> :sswitch_c2
        0x35a -> :sswitch_c1
        0x362 -> :sswitch_c0
        0x36a -> :sswitch_bf
        0x372 -> :sswitch_be
        0x37a -> :sswitch_bd
        0x382 -> :sswitch_bc
        0x38a -> :sswitch_bb
        0x392 -> :sswitch_ba
        0x39a -> :sswitch_b9
        0x3a2 -> :sswitch_b8
        0x3aa -> :sswitch_b7
        0x3b2 -> :sswitch_b6
        0x3ba -> :sswitch_b5
        0x3c2 -> :sswitch_b4
        0x3ca -> :sswitch_b3
        0x3d2 -> :sswitch_b2
        0x3da -> :sswitch_b1
        0x3e2 -> :sswitch_b0
        0x3ea -> :sswitch_af
        0x3f2 -> :sswitch_ae
        0x3fa -> :sswitch_ad
        0x402 -> :sswitch_ac
        0x40a -> :sswitch_ab
        0x412 -> :sswitch_aa
        0x41a -> :sswitch_a9
        0x422 -> :sswitch_a8
        0x42a -> :sswitch_a7
        0x432 -> :sswitch_a6
        0x43a -> :sswitch_a5
        0x442 -> :sswitch_a4
        0x44a -> :sswitch_a3
        0x452 -> :sswitch_a2
        0x45a -> :sswitch_a1
        0x462 -> :sswitch_a0
        0x46a -> :sswitch_9f
        0x472 -> :sswitch_9e
        0x47a -> :sswitch_9d
        0x480 -> :sswitch_9c
        0x48a -> :sswitch_9b
        0x492 -> :sswitch_9a
        0x49a -> :sswitch_99
        0x4a2 -> :sswitch_98
        0x4aa -> :sswitch_97
        0x4b2 -> :sswitch_96
        0x4ba -> :sswitch_95
        0x4c2 -> :sswitch_94
        0x4ca -> :sswitch_93
        0x4d2 -> :sswitch_92
        0x4da -> :sswitch_91
        0x4e2 -> :sswitch_90
        0x4ea -> :sswitch_8f
        0x4f2 -> :sswitch_8e
        0x4fa -> :sswitch_8d
        0x502 -> :sswitch_8c
        0x50a -> :sswitch_8b
        0x512 -> :sswitch_8a
        0x51a -> :sswitch_89
        0x522 -> :sswitch_88
        0x52a -> :sswitch_87
        0x532 -> :sswitch_86
        0x53a -> :sswitch_85
        0x542 -> :sswitch_84
        0x54a -> :sswitch_83
        0x552 -> :sswitch_82
        0x55a -> :sswitch_81
        0x562 -> :sswitch_80
        0x56a -> :sswitch_7f
        0x572 -> :sswitch_7e
        0x57a -> :sswitch_7d
        0x580 -> :sswitch_7c
        0x58a -> :sswitch_7b
        0x592 -> :sswitch_7a
        0x59a -> :sswitch_79
        0x5a0 -> :sswitch_78
        0x5aa -> :sswitch_77
        0x5b2 -> :sswitch_76
        0x5ba -> :sswitch_75
        0x5c2 -> :sswitch_74
        0x5ca -> :sswitch_73
        0x5d2 -> :sswitch_72
        0x5da -> :sswitch_71
        0x5e2 -> :sswitch_70
        0x5ea -> :sswitch_6f
        0x5f2 -> :sswitch_6e
        0x5fa -> :sswitch_6d
        0x602 -> :sswitch_6c
        0x60a -> :sswitch_6b
        0x612 -> :sswitch_6a
        0x61a -> :sswitch_69
        0x622 -> :sswitch_68
        0x62a -> :sswitch_67
        0x632 -> :sswitch_66
        0x638 -> :sswitch_65
        0x642 -> :sswitch_64
        0x64a -> :sswitch_63
        0x652 -> :sswitch_62
        0x65a -> :sswitch_61
        0x662 -> :sswitch_60
        0x66a -> :sswitch_5f
        0x672 -> :sswitch_5e
        0x67a -> :sswitch_5d
        0x682 -> :sswitch_5c
        0x68a -> :sswitch_5b
        0x692 -> :sswitch_5a
        0x69a -> :sswitch_59
        0x6a2 -> :sswitch_58
        0x6aa -> :sswitch_57
        0x6b2 -> :sswitch_56
        0x6ba -> :sswitch_55
        0x6c2 -> :sswitch_54
        0x6c8 -> :sswitch_53
        0x6d2 -> :sswitch_52
        0x6da -> :sswitch_51
        0x6e2 -> :sswitch_50
        0x6ea -> :sswitch_4f
        0x6f2 -> :sswitch_4e
        0x6fa -> :sswitch_4d
        0x702 -> :sswitch_4c
        0x70a -> :sswitch_4b
        0x712 -> :sswitch_4a
        0x71a -> :sswitch_49
        0x722 -> :sswitch_48
        0x72a -> :sswitch_47
        0x732 -> :sswitch_46
        0x73a -> :sswitch_45
        0x742 -> :sswitch_44
        0x74a -> :sswitch_43
        0x752 -> :sswitch_42
        0x75a -> :sswitch_41
        0x762 -> :sswitch_40
        0x76a -> :sswitch_3f
        0x772 -> :sswitch_3e
        0x77a -> :sswitch_3d
        0x782 -> :sswitch_3c
        0x78a -> :sswitch_3b
        0x792 -> :sswitch_3a
        0x79a -> :sswitch_39
        0x7a2 -> :sswitch_38
        0x7aa -> :sswitch_37
        0x7b2 -> :sswitch_36
        0x7ba -> :sswitch_35
        0x7c2 -> :sswitch_34
        0x7ca -> :sswitch_33
        0x7d2 -> :sswitch_32
        0x7da -> :sswitch_31
        0x7e2 -> :sswitch_30
        0x7ea -> :sswitch_2f
        0x7f2 -> :sswitch_2e
        0x7fa -> :sswitch_2d
        0x802 -> :sswitch_2c
        0x80a -> :sswitch_2b
        0x812 -> :sswitch_2a
        0x81a -> :sswitch_29
        0x822 -> :sswitch_28
        0x82a -> :sswitch_27
        0x832 -> :sswitch_26
        0x83a -> :sswitch_25
        0x842 -> :sswitch_24
        0x848 -> :sswitch_23
        0x852 -> :sswitch_22
        0x858 -> :sswitch_21
        0x862 -> :sswitch_20
        0x86a -> :sswitch_1f
        0x872 -> :sswitch_1e
        0x87a -> :sswitch_1d
        0x882 -> :sswitch_1c
        0x88a -> :sswitch_1b
        0x890 -> :sswitch_1a
        0x898 -> :sswitch_19
        0x8a2 -> :sswitch_18
        0x8aa -> :sswitch_17
        0x8b2 -> :sswitch_16
        0x8ba -> :sswitch_15
        0x8c2 -> :sswitch_14
        0x8ca -> :sswitch_13
        0x8d2 -> :sswitch_12
        0x8da -> :sswitch_11
        0x8e2 -> :sswitch_10
        0x8ea -> :sswitch_f
        0x8f2 -> :sswitch_e
        0x8fa -> :sswitch_d
        0x902 -> :sswitch_c
        0x908 -> :sswitch_b
        0x910 -> :sswitch_a
        0x919 -> :sswitch_9
        0x921 -> :sswitch_8
        0x929 -> :sswitch_7
        0x932 -> :sswitch_6
        0x93a -> :sswitch_5
        0x942 -> :sswitch_4
        0x94a -> :sswitch_3
        0x952 -> :sswitch_2
        0x95a -> :sswitch_1
        0x962 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 738
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x2

    .line 26
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x3

    .line 40
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/data/Contact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x4

    .line 54
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/data/Question;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v1, 0x5

    .line 68
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_5

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/data/Sticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x6

    .line 82
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_6

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v1, 0x7

    .line 96
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerBundle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const/16 v1, 0x8

    .line 110
    .line 111
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 112
    .line 113
    .line 114
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_8

    .line 117
    .line 118
    sget-object v0, Lcom/p1/mobile/putong/data/Link;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const/16 v1, 0x9

    .line 125
    .line 126
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 127
    .line 128
    .line 129
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 130
    .line 131
    if-eqz p0, :cond_9

    .line 132
    .line 133
    sget-object v0, Lcom/p1/mobile/putong/core/data/School;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const/16 v1, 0xa

    .line 140
    .line 141
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 142
    .line 143
    .line 144
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 145
    .line 146
    if-eqz p0, :cond_a

    .line 147
    .line 148
    sget-object v0, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const/16 v1, 0xb

    .line 155
    .line 156
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 157
    .line 158
    .line 159
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 160
    .line 161
    if-eqz p0, :cond_b

    .line 162
    .line 163
    sget-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    const/16 v1, 0xc

    .line 170
    .line 171
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 172
    .line 173
    .line 174
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 175
    .line 176
    if-eqz p0, :cond_c

    .line 177
    .line 178
    const/16 v0, 0xd

    .line 179
    .line 180
    sget-object v1, Lcom/p1/mobile/putong/core/data/Wallet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 183
    .line 184
    .line 185
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 186
    .line 187
    if-eqz p0, :cond_d

    .line 188
    .line 189
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 190
    .line 191
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    const/16 v1, 0xe

    .line 196
    .line 197
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 198
    .line 199
    .line 200
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    .line 201
    .line 202
    if-eqz p0, :cond_e

    .line 203
    .line 204
    const/16 v0, 0xf

    .line 205
    .line 206
    sget-object v1, Lcom/p1/mobile/putong/core/data/Coin;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 209
    .line 210
    .line 211
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 212
    .line 213
    if-eqz p0, :cond_f

    .line 214
    .line 215
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    const/16 v1, 0x10

    .line 222
    .line 223
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 224
    .line 225
    .line 226
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    .line 227
    .line 228
    if-eqz p0, :cond_10

    .line 229
    .line 230
    sget-object v0, Lcom/p1/mobile/putong/core/data/FaceidToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const/16 v1, 0x11

    .line 237
    .line 238
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 239
    .line 240
    .line 241
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 242
    .line 243
    if-eqz p0, :cond_11

    .line 244
    .line 245
    sget-object v0, Lcom/p1/mobile/putong/core/data/Merchandise;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    const/16 v1, 0x12

    .line 252
    .line 253
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 254
    .line 255
    .line 256
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    .line 257
    .line 258
    if-eqz p0, :cond_12

    .line 259
    .line 260
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 261
    .line 262
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    const/16 v1, 0x13

    .line 267
    .line 268
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 269
    .line 270
    .line 271
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    .line 272
    .line 273
    if-eqz p0, :cond_13

    .line 274
    .line 275
    sget-object v0, Lcom/p1/mobile/putong/core/data/Figure;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 276
    .line 277
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    const/16 v1, 0x14

    .line 282
    .line 283
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 284
    .line 285
    .line 286
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 287
    .line 288
    if-eqz p0, :cond_14

    .line 289
    .line 290
    sget-object v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 291
    .line 292
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    const/16 v1, 0x15

    .line 297
    .line 298
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 299
    .line 300
    .line 301
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    .line 302
    .line 303
    if-eqz p0, :cond_15

    .line 304
    .line 305
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 306
    .line 307
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    const/16 v1, 0x16

    .line 312
    .line 313
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 314
    .line 315
    .line 316
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 317
    .line 318
    if-eqz p0, :cond_16

    .line 319
    .line 320
    sget-object v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 321
    .line 322
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    const/16 v1, 0x17

    .line 327
    .line 328
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 329
    .line 330
    .line 331
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    .line 332
    .line 333
    if-eqz p0, :cond_17

    .line 334
    .line 335
    sget-object v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    const/16 v1, 0x18

    .line 342
    .line 343
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 344
    .line 345
    .line 346
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    .line 347
    .line 348
    if-eqz p0, :cond_18

    .line 349
    .line 350
    sget-object v0, Lcom/p1/mobile/putong/core/data/Surveys;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 351
    .line 352
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    const/16 v1, 0x19

    .line 357
    .line 358
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 359
    .line 360
    .line 361
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    .line 362
    .line 363
    if-eqz p0, :cond_19

    .line 364
    .line 365
    sget-object v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 366
    .line 367
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    const/16 v1, 0x1a

    .line 372
    .line 373
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 374
    .line 375
    .line 376
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    .line 377
    .line 378
    if-eqz p0, :cond_1a

    .line 379
    .line 380
    sget-object v0, Lcom/p1/mobile/putong/core/data/AutoDeducts;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 381
    .line 382
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    const/16 v1, 0x1b

    .line 387
    .line 388
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 389
    .line 390
    .line 391
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 392
    .line 393
    if-eqz p0, :cond_1b

    .line 394
    .line 395
    sget-object v0, Lcom/p1/mobile/putong/core/data/VoiceCall;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 396
    .line 397
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    const/16 v1, 0x1c

    .line 402
    .line 403
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 404
    .line 405
    .line 406
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    .line 407
    .line 408
    if-eqz p0, :cond_1c

    .line 409
    .line 410
    sget-object v0, Lcom/p1/mobile/putong/core/data/Complain;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 411
    .line 412
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    const/16 v1, 0x1d

    .line 417
    .line 418
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 419
    .line 420
    .line 421
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    .line 422
    .line 423
    if-eqz p0, :cond_1d

    .line 424
    .line 425
    sget-object v0, Lcom/p1/mobile/putong/data/UserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    const/16 v1, 0x1e

    .line 432
    .line 433
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 434
    .line 435
    .line 436
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 437
    .line 438
    if-eqz p0, :cond_1e

    .line 439
    .line 440
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikedUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 441
    .line 442
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    const/16 v1, 0x1f

    .line 447
    .line 448
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 449
    .line 450
    .line 451
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    .line 452
    .line 453
    if-eqz p0, :cond_1f

    .line 454
    .line 455
    sget-object v0, Lcom/p1/mobile/putong/core/data/RefundDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 456
    .line 457
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    const/16 v1, 0x20

    .line 462
    .line 463
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 464
    .line 465
    .line 466
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    .line 467
    .line 468
    if-eqz p0, :cond_20

    .line 469
    .line 470
    sget-object v0, Lcom/p1/mobile/putong/core/data/WalletAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 471
    .line 472
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    const/16 v1, 0x21

    .line 477
    .line 478
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 479
    .line 480
    .line 481
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    .line 482
    .line 483
    if-eqz p0, :cond_21

    .line 484
    .line 485
    sget-object v0, Lcom/p1/mobile/putong/core/data/AccountRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 486
    .line 487
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    const/16 v1, 0x22

    .line 492
    .line 493
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 494
    .line 495
    .line 496
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 497
    .line 498
    if-eqz p0, :cond_22

    .line 499
    .line 500
    const/16 v0, 0x23

    .line 501
    .line 502
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 503
    .line 504
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 505
    .line 506
    .line 507
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 508
    .line 509
    if-eqz p0, :cond_23

    .line 510
    .line 511
    const/16 v0, 0x24

    .line 512
    .line 513
    sget-object v1, Lcom/p1/mobile/putong/data/Contract;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 514
    .line 515
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 516
    .line 517
    .line 518
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    .line 519
    .line 520
    if-eqz p0, :cond_24

    .line 521
    .line 522
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 523
    .line 524
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    const/16 v1, 0x25

    .line 529
    .line 530
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 531
    .line 532
    .line 533
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    .line 534
    .line 535
    if-eqz p0, :cond_25

    .line 536
    .line 537
    sget-object v0, Lcom/p1/mobile/putong/core/data/HeartBeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 538
    .line 539
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    const/16 v1, 0x26

    .line 544
    .line 545
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 546
    .line 547
    .line 548
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    .line 549
    .line 550
    if-eqz p0, :cond_26

    .line 551
    .line 552
    sget-object v0, Lcom/p1/mobile/putong/core/data/ContractInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 553
    .line 554
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    const/16 v1, 0x27

    .line 559
    .line 560
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 561
    .line 562
    .line 563
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 564
    .line 565
    if-eqz p0, :cond_27

    .line 566
    .line 567
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 568
    .line 569
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 570
    .line 571
    .line 572
    move-result-object v0

    .line 573
    const/16 v1, 0x28

    .line 574
    .line 575
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 576
    .line 577
    .line 578
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 579
    .line 580
    if-eqz p0, :cond_28

    .line 581
    .line 582
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 583
    .line 584
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    const/16 v1, 0x29

    .line 589
    .line 590
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 591
    .line 592
    .line 593
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 594
    .line 595
    if-eqz p0, :cond_29

    .line 596
    .line 597
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupApply;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 598
    .line 599
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    const/16 v1, 0x2a

    .line 604
    .line 605
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 606
    .line 607
    .line 608
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    .line 609
    .line 610
    if-eqz p0, :cond_2a

    .line 611
    .line 612
    sget-object v0, Lcom/p1/mobile/putong/core/data/NotificationCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 613
    .line 614
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    const/16 v1, 0x2b

    .line 619
    .line 620
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 621
    .line 622
    .line 623
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    .line 624
    .line 625
    if-eqz p0, :cond_2b

    .line 626
    .line 627
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupNotification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 628
    .line 629
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 630
    .line 631
    .line 632
    move-result-object v0

    .line 633
    const/16 v1, 0x2c

    .line 634
    .line 635
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 636
    .line 637
    .line 638
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    .line 639
    .line 640
    if-eqz p0, :cond_2c

    .line 641
    .line 642
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupAttribute;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 643
    .line 644
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 645
    .line 646
    .line 647
    move-result-object v0

    .line 648
    const/16 v1, 0x2d

    .line 649
    .line 650
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 651
    .line 652
    .line 653
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 654
    .line 655
    if-eqz p0, :cond_2d

    .line 656
    .line 657
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 658
    .line 659
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 660
    .line 661
    .line 662
    move-result-object v0

    .line 663
    const/16 v1, 0x2e

    .line 664
    .line 665
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 666
    .line 667
    .line 668
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 669
    .line 670
    if-eqz p0, :cond_2e

    .line 671
    .line 672
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupTab;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 673
    .line 674
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    const/16 v1, 0x2f

    .line 679
    .line 680
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 681
    .line 682
    .line 683
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 684
    .line 685
    if-eqz p0, :cond_2f

    .line 686
    .line 687
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 688
    .line 689
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 690
    .line 691
    .line 692
    move-result-object v0

    .line 693
    const/16 v1, 0x30

    .line 694
    .line 695
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 696
    .line 697
    .line 698
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    .line 699
    .line 700
    if-eqz p0, :cond_30

    .line 701
    .line 702
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 703
    .line 704
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 705
    .line 706
    .line 707
    move-result-object v0

    .line 708
    const/16 v1, 0x31

    .line 709
    .line 710
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 711
    .line 712
    .line 713
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 714
    .line 715
    if-eqz p0, :cond_31

    .line 716
    .line 717
    sget-object v0, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 718
    .line 719
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 720
    .line 721
    .line 722
    move-result-object v0

    .line 723
    const/16 v1, 0x32

    .line 724
    .line 725
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 726
    .line 727
    .line 728
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    .line 729
    .line 730
    if-eqz p0, :cond_32

    .line 731
    .line 732
    sget-object v0, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 733
    .line 734
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    const/16 v1, 0x33

    .line 739
    .line 740
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 741
    .line 742
    .line 743
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    .line 744
    .line 745
    if-eqz p0, :cond_33

    .line 746
    .line 747
    sget-object v0, Lcom/p1/mobile/putong/core/data/OfficialAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 748
    .line 749
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 750
    .line 751
    .line 752
    move-result-object v0

    .line 753
    const/16 v1, 0x34

    .line 754
    .line 755
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 756
    .line 757
    .line 758
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    .line 759
    .line 760
    if-eqz p0, :cond_34

    .line 761
    .line 762
    sget-object v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 763
    .line 764
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 765
    .line 766
    .line 767
    move-result-object v0

    .line 768
    const/16 v1, 0x35

    .line 769
    .line 770
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 771
    .line 772
    .line 773
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    .line 774
    .line 775
    if-eqz p0, :cond_35

    .line 776
    .line 777
    sget-object v0, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 778
    .line 779
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 780
    .line 781
    .line 782
    move-result-object v0

    .line 783
    const/16 v1, 0x36

    .line 784
    .line 785
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 786
    .line 787
    .line 788
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    .line 789
    .line 790
    if-eqz p0, :cond_36

    .line 791
    .line 792
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 793
    .line 794
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 795
    .line 796
    .line 797
    move-result-object v0

    .line 798
    const/16 v1, 0x37

    .line 799
    .line 800
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 801
    .line 802
    .line 803
    :cond_36
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    .line 804
    .line 805
    if-eqz p0, :cond_37

    .line 806
    .line 807
    sget-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 808
    .line 809
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 810
    .line 811
    .line 812
    move-result-object v0

    .line 813
    const/16 v1, 0x38

    .line 814
    .line 815
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 816
    .line 817
    .line 818
    :cond_37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    .line 819
    .line 820
    if-eqz p0, :cond_38

    .line 821
    .line 822
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 823
    .line 824
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 825
    .line 826
    .line 827
    move-result-object v0

    .line 828
    const/16 v1, 0x39

    .line 829
    .line 830
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 831
    .line 832
    .line 833
    :cond_38
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    .line 834
    .line 835
    if-eqz p0, :cond_39

    .line 836
    .line 837
    sget-object v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 838
    .line 839
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 840
    .line 841
    .line 842
    move-result-object v0

    .line 843
    const/16 v1, 0x3a

    .line 844
    .line 845
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 846
    .line 847
    .line 848
    :cond_39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    .line 849
    .line 850
    if-eqz p0, :cond_3a

    .line 851
    .line 852
    const/16 v0, 0x3b

    .line 853
    .line 854
    sget-object v1, Lcom/p1/mobile/putong/core/data/PriorityLike;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 855
    .line 856
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 857
    .line 858
    .line 859
    :cond_3a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    .line 860
    .line 861
    if-eqz p0, :cond_3b

    .line 862
    .line 863
    const/16 v0, 0x3c

    .line 864
    .line 865
    sget-object v1, Lcom/p1/mobile/putong/core/data/Couponbag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 866
    .line 867
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 868
    .line 869
    .line 870
    :cond_3b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 871
    .line 872
    if-eqz p0, :cond_3c

    .line 873
    .line 874
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 875
    .line 876
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 877
    .line 878
    .line 879
    move-result-object v0

    .line 880
    const/16 v1, 0x3d

    .line 881
    .line 882
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 883
    .line 884
    .line 885
    :cond_3c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 886
    .line 887
    if-eqz p0, :cond_3d

    .line 888
    .line 889
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacket;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 890
    .line 891
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 892
    .line 893
    .line 894
    move-result-object v0

    .line 895
    const/16 v1, 0x3e

    .line 896
    .line 897
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 898
    .line 899
    .line 900
    :cond_3d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    .line 901
    .line 902
    if-eqz p0, :cond_3e

    .line 903
    .line 904
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 905
    .line 906
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 907
    .line 908
    .line 909
    move-result-object v0

    .line 910
    const/16 v1, 0x3f

    .line 911
    .line 912
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 913
    .line 914
    .line 915
    :cond_3e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 916
    .line 917
    if-eqz p0, :cond_3f

    .line 918
    .line 919
    const/16 v0, 0x40

    .line 920
    .line 921
    sget-object v1, Lcom/p1/mobile/putong/core/data/CounterVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 922
    .line 923
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 924
    .line 925
    .line 926
    :cond_3f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 927
    .line 928
    if-eqz p0, :cond_40

    .line 929
    .line 930
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveSchema;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 931
    .line 932
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 933
    .line 934
    .line 935
    move-result-object v0

    .line 936
    const/16 v1, 0x41

    .line 937
    .line 938
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 939
    .line 940
    .line 941
    :cond_40
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 942
    .line 943
    if-eqz p0, :cond_41

    .line 944
    .line 945
    sget-object v0, Lcom/p1/mobile/putong/core/data/FriendInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 946
    .line 947
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 948
    .line 949
    .line 950
    move-result-object v0

    .line 951
    const/16 v1, 0x42

    .line 952
    .line 953
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 954
    .line 955
    .line 956
    :cond_41
    const/16 p0, 0x43

    .line 957
    .line 958
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    .line 959
    .line 960
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 961
    .line 962
    .line 963
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 964
    .line 965
    if-eqz p0, :cond_42

    .line 966
    .line 967
    const/16 v0, 0x44

    .line 968
    .line 969
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationDiff;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 970
    .line 971
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 972
    .line 973
    .line 974
    :cond_42
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    .line 975
    .line 976
    if-eqz p0, :cond_43

    .line 977
    .line 978
    sget-object v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 979
    .line 980
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 981
    .line 982
    .line 983
    move-result-object v0

    .line 984
    const/16 v1, 0x45

    .line 985
    .line 986
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 987
    .line 988
    .line 989
    :cond_43
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 990
    .line 991
    if-eqz p0, :cond_44

    .line 992
    .line 993
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 994
    .line 995
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 996
    .line 997
    .line 998
    move-result-object v0

    .line 999
    const/16 v1, 0x46

    .line 1000
    .line 1001
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1002
    .line 1003
    .line 1004
    :cond_44
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 1005
    .line 1006
    if-eqz p0, :cond_45

    .line 1007
    .line 1008
    sget-object v0, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1009
    .line 1010
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v0

    .line 1014
    const/16 v1, 0x47

    .line 1015
    .line 1016
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1017
    .line 1018
    .line 1019
    :cond_45
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    .line 1020
    .line 1021
    if-eqz p0, :cond_46

    .line 1022
    .line 1023
    const/16 v0, 0x48

    .line 1024
    .line 1025
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1026
    .line 1027
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1028
    .line 1029
    .line 1030
    :cond_46
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    .line 1031
    .line 1032
    if-eqz p0, :cond_47

    .line 1033
    .line 1034
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1035
    .line 1036
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v0

    .line 1040
    const/16 v1, 0x49

    .line 1041
    .line 1042
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1043
    .line 1044
    .line 1045
    :cond_47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    .line 1046
    .line 1047
    if-eqz p0, :cond_48

    .line 1048
    .line 1049
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1050
    .line 1051
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v0

    .line 1055
    const/16 v1, 0x4a

    .line 1056
    .line 1057
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1058
    .line 1059
    .line 1060
    :cond_48
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    .line 1061
    .line 1062
    if-eqz p0, :cond_49

    .line 1063
    .line 1064
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1065
    .line 1066
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v0

    .line 1070
    const/16 v1, 0x4b

    .line 1071
    .line 1072
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1073
    .line 1074
    .line 1075
    :cond_49
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    .line 1076
    .line 1077
    if-eqz p0, :cond_4a

    .line 1078
    .line 1079
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftWallTitle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1080
    .line 1081
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1082
    .line 1083
    .line 1084
    move-result-object v0

    .line 1085
    const/16 v1, 0x4c

    .line 1086
    .line 1087
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1088
    .line 1089
    .line 1090
    :cond_4a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    .line 1091
    .line 1092
    if-eqz p0, :cond_4b

    .line 1093
    .line 1094
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1095
    .line 1096
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v0

    .line 1100
    const/16 v1, 0x4d

    .line 1101
    .line 1102
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1103
    .line 1104
    .line 1105
    :cond_4b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 1106
    .line 1107
    if-eqz p0, :cond_4c

    .line 1108
    .line 1109
    sget-object v0, Lcom/p1/mobile/putong/core/data/Greeting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1110
    .line 1111
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v0

    .line 1115
    const/16 v1, 0x4e

    .line 1116
    .line 1117
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1118
    .line 1119
    .line 1120
    :cond_4c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    .line 1121
    .line 1122
    if-eqz p0, :cond_4d

    .line 1123
    .line 1124
    const/16 v0, 0x4f

    .line 1125
    .line 1126
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1127
    .line 1128
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1129
    .line 1130
    .line 1131
    :cond_4d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    .line 1132
    .line 1133
    if-eqz p0, :cond_4e

    .line 1134
    .line 1135
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingPermission;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1136
    .line 1137
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v0

    .line 1141
    const/16 v1, 0x50

    .line 1142
    .line 1143
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1144
    .line 1145
    .line 1146
    :cond_4e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1147
    .line 1148
    if-eqz p0, :cond_4f

    .line 1149
    .line 1150
    const/16 v0, 0x51

    .line 1151
    .line 1152
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1153
    .line 1154
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1155
    .line 1156
    .line 1157
    :cond_4f
    const/16 p0, 0x52

    .line 1158
    .line 1159
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    .line 1160
    .line 1161
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1162
    .line 1163
    .line 1164
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    .line 1165
    .line 1166
    if-eqz p0, :cond_50

    .line 1167
    .line 1168
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1169
    .line 1170
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v0

    .line 1174
    const/16 v1, 0x53

    .line 1175
    .line 1176
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1177
    .line 1178
    .line 1179
    :cond_50
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    .line 1180
    .line 1181
    if-eqz p0, :cond_51

    .line 1182
    .line 1183
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReadMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1184
    .line 1185
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1186
    .line 1187
    .line 1188
    move-result-object v0

    .line 1189
    const/16 v1, 0x54

    .line 1190
    .line 1191
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1192
    .line 1193
    .line 1194
    :cond_51
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 1195
    .line 1196
    if-eqz p0, :cond_52

    .line 1197
    .line 1198
    sget-object v0, Lcom/p1/mobile/putong/core/data/RecentConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1199
    .line 1200
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1201
    .line 1202
    .line 1203
    move-result-object v0

    .line 1204
    const/16 v1, 0x55

    .line 1205
    .line 1206
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1207
    .line 1208
    .line 1209
    :cond_52
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    .line 1210
    .line 1211
    if-eqz p0, :cond_53

    .line 1212
    .line 1213
    sget-object v0, Lcom/p1/mobile/putong/core/data/OrderInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1214
    .line 1215
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1216
    .line 1217
    .line 1218
    move-result-object v0

    .line 1219
    const/16 v1, 0x56

    .line 1220
    .line 1221
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1222
    .line 1223
    .line 1224
    :cond_53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 1225
    .line 1226
    if-eqz p0, :cond_54

    .line 1227
    .line 1228
    const/16 v0, 0x57

    .line 1229
    .line 1230
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1231
    .line 1232
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1233
    .line 1234
    .line 1235
    :cond_54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 1236
    .line 1237
    if-eqz p0, :cond_55

    .line 1238
    .line 1239
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicksUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1240
    .line 1241
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v0

    .line 1245
    const/16 v1, 0x58

    .line 1246
    .line 1247
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1248
    .line 1249
    .line 1250
    :cond_55
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 1251
    .line 1252
    if-eqz p0, :cond_56

    .line 1253
    .line 1254
    const/16 v0, 0x59

    .line 1255
    .line 1256
    sget-object v1, Lcom/p1/mobile/putong/core/data/Picks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1257
    .line 1258
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1259
    .line 1260
    .line 1261
    :cond_56
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    .line 1262
    .line 1263
    if-eqz p0, :cond_57

    .line 1264
    .line 1265
    sget-object v0, Lcom/p1/mobile/putong/core/data/CountdownItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1266
    .line 1267
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1268
    .line 1269
    .line 1270
    move-result-object v0

    .line 1271
    const/16 v1, 0x5a

    .line 1272
    .line 1273
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1274
    .line 1275
    .line 1276
    :cond_57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    .line 1277
    .line 1278
    if-eqz p0, :cond_58

    .line 1279
    .line 1280
    const/16 v0, 0x5b

    .line 1281
    .line 1282
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1283
    .line 1284
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1285
    .line 1286
    .line 1287
    :cond_58
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    .line 1288
    .line 1289
    if-eqz p0, :cond_59

    .line 1290
    .line 1291
    const/16 v0, 0x5c

    .line 1292
    .line 1293
    sget-object v1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1294
    .line 1295
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1296
    .line 1297
    .line 1298
    :cond_59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 1299
    .line 1300
    if-eqz p0, :cond_5a

    .line 1301
    .line 1302
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1303
    .line 1304
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1305
    .line 1306
    .line 1307
    move-result-object v0

    .line 1308
    const/16 v1, 0x5d

    .line 1309
    .line 1310
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1311
    .line 1312
    .line 1313
    :cond_5a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    .line 1314
    .line 1315
    if-eqz p0, :cond_5b

    .line 1316
    .line 1317
    const/16 v0, 0x5e

    .line 1318
    .line 1319
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1320
    .line 1321
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1322
    .line 1323
    .line 1324
    :cond_5b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 1325
    .line 1326
    if-eqz p0, :cond_5c

    .line 1327
    .line 1328
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1329
    .line 1330
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1331
    .line 1332
    .line 1333
    move-result-object v0

    .line 1334
    const/16 v1, 0x5f

    .line 1335
    .line 1336
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1337
    .line 1338
    .line 1339
    :cond_5c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    .line 1340
    .line 1341
    if-eqz p0, :cond_5d

    .line 1342
    .line 1343
    const/16 v0, 0x60

    .line 1344
    .line 1345
    sget-object v1, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1346
    .line 1347
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1348
    .line 1349
    .line 1350
    :cond_5d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    .line 1351
    .line 1352
    if-eqz p0, :cond_5e

    .line 1353
    .line 1354
    const/16 v0, 0x61

    .line 1355
    .line 1356
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1357
    .line 1358
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1359
    .line 1360
    .line 1361
    :cond_5e
    const/16 p0, 0x62

    .line 1362
    .line 1363
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    .line 1364
    .line 1365
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1366
    .line 1367
    .line 1368
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    .line 1369
    .line 1370
    if-eqz p0, :cond_5f

    .line 1371
    .line 1372
    const/16 v0, 0x63

    .line 1373
    .line 1374
    sget-object v1, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1375
    .line 1376
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1377
    .line 1378
    .line 1379
    :cond_5f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 1380
    .line 1381
    if-eqz p0, :cond_60

    .line 1382
    .line 1383
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1384
    .line 1385
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1386
    .line 1387
    .line 1388
    move-result-object v0

    .line 1389
    const/16 v1, 0x64

    .line 1390
    .line 1391
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1392
    .line 1393
    .line 1394
    :cond_60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 1395
    .line 1396
    if-eqz p0, :cond_61

    .line 1397
    .line 1398
    sget-object v0, Lcom/p1/mobile/putong/core/data/Literatures;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1399
    .line 1400
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1401
    .line 1402
    .line 1403
    move-result-object v0

    .line 1404
    const/16 v1, 0x65

    .line 1405
    .line 1406
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1407
    .line 1408
    .line 1409
    :cond_61
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    .line 1410
    .line 1411
    if-eqz p0, :cond_62

    .line 1412
    .line 1413
    sget-object v0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1414
    .line 1415
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1416
    .line 1417
    .line 1418
    move-result-object v0

    .line 1419
    const/16 v1, 0x66

    .line 1420
    .line 1421
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1422
    .line 1423
    .line 1424
    :cond_62
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 1425
    .line 1426
    if-eqz p0, :cond_63

    .line 1427
    .line 1428
    const/16 v0, 0x67

    .line 1429
    .line 1430
    sget-object v1, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1431
    .line 1432
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1433
    .line 1434
    .line 1435
    :cond_63
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 1436
    .line 1437
    if-eqz p0, :cond_64

    .line 1438
    .line 1439
    const/16 v0, 0x68

    .line 1440
    .line 1441
    sget-object v1, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1442
    .line 1443
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1444
    .line 1445
    .line 1446
    :cond_64
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    .line 1447
    .line 1448
    if-eqz p0, :cond_65

    .line 1449
    .line 1450
    const/16 v0, 0x69

    .line 1451
    .line 1452
    sget-object v1, Lcom/p1/mobile/putong/core/data/Note;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1453
    .line 1454
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1455
    .line 1456
    .line 1457
    :cond_65
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 1458
    .line 1459
    if-eqz p0, :cond_66

    .line 1460
    .line 1461
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1462
    .line 1463
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1464
    .line 1465
    .line 1466
    move-result-object v0

    .line 1467
    const/16 v1, 0x6a

    .line 1468
    .line 1469
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1470
    .line 1471
    .line 1472
    :cond_66
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 1473
    .line 1474
    if-eqz p0, :cond_67

    .line 1475
    .line 1476
    const/16 v0, 0x6b

    .line 1477
    .line 1478
    sget-object v1, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1479
    .line 1480
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1481
    .line 1482
    .line 1483
    :cond_67
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    .line 1484
    .line 1485
    if-eqz p0, :cond_68

    .line 1486
    .line 1487
    sget-object v0, Lcom/p1/mobile/putong/core/data/Evaluation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1488
    .line 1489
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1490
    .line 1491
    .line 1492
    move-result-object v0

    .line 1493
    const/16 v1, 0x6c

    .line 1494
    .line 1495
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1496
    .line 1497
    .line 1498
    :cond_68
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    .line 1499
    .line 1500
    if-eqz p0, :cond_69

    .line 1501
    .line 1502
    sget-object v0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1503
    .line 1504
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1505
    .line 1506
    .line 1507
    move-result-object v0

    .line 1508
    const/16 v1, 0x6d

    .line 1509
    .line 1510
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1511
    .line 1512
    .line 1513
    :cond_69
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 1514
    .line 1515
    if-eqz p0, :cond_6a

    .line 1516
    .line 1517
    const/16 v0, 0x6e

    .line 1518
    .line 1519
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1520
    .line 1521
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1522
    .line 1523
    .line 1524
    :cond_6a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    .line 1525
    .line 1526
    if-eqz p0, :cond_6b

    .line 1527
    .line 1528
    const/16 v0, 0x6f

    .line 1529
    .line 1530
    sget-object v1, Lcom/p1/mobile/putong/core/data/Evaluation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1531
    .line 1532
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1533
    .line 1534
    .line 1535
    :cond_6b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 1536
    .line 1537
    if-eqz p0, :cond_6c

    .line 1538
    .line 1539
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1540
    .line 1541
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1542
    .line 1543
    .line 1544
    move-result-object v0

    .line 1545
    const/16 v1, 0x70

    .line 1546
    .line 1547
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1548
    .line 1549
    .line 1550
    :cond_6c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 1551
    .line 1552
    if-eqz p0, :cond_6d

    .line 1553
    .line 1554
    sget-object v0, Lcom/p1/mobile/putong/data/RecommendMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1555
    .line 1556
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1557
    .line 1558
    .line 1559
    move-result-object v0

    .line 1560
    const/16 v1, 0x71

    .line 1561
    .line 1562
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1563
    .line 1564
    .line 1565
    :cond_6d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 1566
    .line 1567
    if-eqz p0, :cond_6e

    .line 1568
    .line 1569
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserGreetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1570
    .line 1571
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1572
    .line 1573
    .line 1574
    move-result-object v0

    .line 1575
    const/16 v1, 0x72

    .line 1576
    .line 1577
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1578
    .line 1579
    .line 1580
    :cond_6e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    .line 1581
    .line 1582
    if-eqz p0, :cond_6f

    .line 1583
    .line 1584
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1585
    .line 1586
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1587
    .line 1588
    .line 1589
    move-result-object v0

    .line 1590
    const/16 v1, 0x73

    .line 1591
    .line 1592
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1593
    .line 1594
    .line 1595
    :cond_6f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 1596
    .line 1597
    if-eqz p0, :cond_70

    .line 1598
    .line 1599
    const/16 v0, 0x74

    .line 1600
    .line 1601
    sget-object v1, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1602
    .line 1603
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1604
    .line 1605
    .line 1606
    :cond_70
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    .line 1607
    .line 1608
    if-eqz p0, :cond_71

    .line 1609
    .line 1610
    const/16 v0, 0x75

    .line 1611
    .line 1612
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1613
    .line 1614
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1615
    .line 1616
    .line 1617
    :cond_71
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    .line 1618
    .line 1619
    if-eqz p0, :cond_72

    .line 1620
    .line 1621
    const/16 v0, 0x76

    .line 1622
    .line 1623
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1624
    .line 1625
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1626
    .line 1627
    .line 1628
    :cond_72
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 1629
    .line 1630
    if-eqz p0, :cond_73

    .line 1631
    .line 1632
    const/16 v0, 0x77

    .line 1633
    .line 1634
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1635
    .line 1636
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1637
    .line 1638
    .line 1639
    :cond_73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 1640
    .line 1641
    if-eqz p0, :cond_74

    .line 1642
    .line 1643
    sget-object v0, Lcom/p1/mobile/putong/core/data/InsertCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1644
    .line 1645
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1646
    .line 1647
    .line 1648
    move-result-object v0

    .line 1649
    const/16 v1, 0x78

    .line 1650
    .line 1651
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1652
    .line 1653
    .line 1654
    :cond_74
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 1655
    .line 1656
    if-eqz p0, :cond_75

    .line 1657
    .line 1658
    sget-object v0, Lcom/p1/mobile/putong/core/data/Active;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1659
    .line 1660
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1661
    .line 1662
    .line 1663
    move-result-object v0

    .line 1664
    const/16 v1, 0x79

    .line 1665
    .line 1666
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1667
    .line 1668
    .line 1669
    :cond_75
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 1670
    .line 1671
    if-eqz p0, :cond_76

    .line 1672
    .line 1673
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardsIcons;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1674
    .line 1675
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1676
    .line 1677
    .line 1678
    move-result-object v0

    .line 1679
    const/16 v1, 0x7a

    .line 1680
    .line 1681
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1682
    .line 1683
    .line 1684
    :cond_76
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 1685
    .line 1686
    if-eqz p0, :cond_77

    .line 1687
    .line 1688
    const/16 v0, 0x7b

    .line 1689
    .line 1690
    sget-object v1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1691
    .line 1692
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1693
    .line 1694
    .line 1695
    :cond_77
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 1696
    .line 1697
    if-eqz p0, :cond_78

    .line 1698
    .line 1699
    sget-object v0, Lcom/p1/mobile/putong/core/data/BreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1700
    .line 1701
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1702
    .line 1703
    .line 1704
    move-result-object v0

    .line 1705
    const/16 v1, 0x7c

    .line 1706
    .line 1707
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1708
    .line 1709
    .line 1710
    :cond_78
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    .line 1711
    .line 1712
    if-eqz p0, :cond_79

    .line 1713
    .line 1714
    const/16 v0, 0x7d

    .line 1715
    .line 1716
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1717
    .line 1718
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1719
    .line 1720
    .line 1721
    :cond_79
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    .line 1722
    .line 1723
    if-eqz p0, :cond_7a

    .line 1724
    .line 1725
    sget-object v0, Lcom/p1/mobile/putong/core/data/Voice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1726
    .line 1727
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1728
    .line 1729
    .line 1730
    move-result-object v0

    .line 1731
    const/16 v1, 0x7e

    .line 1732
    .line 1733
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1734
    .line 1735
    .line 1736
    :cond_7a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 1737
    .line 1738
    if-eqz p0, :cond_7b

    .line 1739
    .line 1740
    const/16 v0, 0x7f

    .line 1741
    .line 1742
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 1743
    .line 1744
    .line 1745
    :cond_7b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    .line 1746
    .line 1747
    if-eqz p0, :cond_7c

    .line 1748
    .line 1749
    sget-object v0, Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1750
    .line 1751
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1752
    .line 1753
    .line 1754
    move-result-object v0

    .line 1755
    const/16 v1, 0x80

    .line 1756
    .line 1757
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1758
    .line 1759
    .line 1760
    :cond_7c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 1761
    .line 1762
    if-eqz p0, :cond_7d

    .line 1763
    .line 1764
    const/16 v0, 0x81

    .line 1765
    .line 1766
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1767
    .line 1768
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1769
    .line 1770
    .line 1771
    :cond_7d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 1772
    .line 1773
    if-eqz p0, :cond_7e

    .line 1774
    .line 1775
    const/16 v0, 0x82

    .line 1776
    .line 1777
    sget-object v1, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1778
    .line 1779
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1780
    .line 1781
    .line 1782
    :cond_7e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 1783
    .line 1784
    if-eqz p0, :cond_7f

    .line 1785
    .line 1786
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1787
    .line 1788
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1789
    .line 1790
    .line 1791
    move-result-object v0

    .line 1792
    const/16 v1, 0x83

    .line 1793
    .line 1794
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1795
    .line 1796
    .line 1797
    :cond_7f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 1798
    .line 1799
    if-eqz p0, :cond_80

    .line 1800
    .line 1801
    const/16 v0, 0x84

    .line 1802
    .line 1803
    sget-object v1, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1804
    .line 1805
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1806
    .line 1807
    .line 1808
    :cond_80
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 1809
    .line 1810
    if-eqz p0, :cond_81

    .line 1811
    .line 1812
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagCategories;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1813
    .line 1814
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1815
    .line 1816
    .line 1817
    move-result-object v0

    .line 1818
    const/16 v1, 0x85

    .line 1819
    .line 1820
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1821
    .line 1822
    .line 1823
    :cond_81
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 1824
    .line 1825
    if-eqz p0, :cond_82

    .line 1826
    .line 1827
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagUserCounts;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1828
    .line 1829
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1830
    .line 1831
    .line 1832
    move-result-object v0

    .line 1833
    const/16 v1, 0x86

    .line 1834
    .line 1835
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1836
    .line 1837
    .line 1838
    :cond_82
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 1839
    .line 1840
    if-eqz p0, :cond_83

    .line 1841
    .line 1842
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1843
    .line 1844
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1845
    .line 1846
    .line 1847
    move-result-object v0

    .line 1848
    const/16 v1, 0x87

    .line 1849
    .line 1850
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1851
    .line 1852
    .line 1853
    :cond_83
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 1854
    .line 1855
    if-eqz p0, :cond_84

    .line 1856
    .line 1857
    const/16 v0, 0x88

    .line 1858
    .line 1859
    sget-object v1, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1860
    .line 1861
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1862
    .line 1863
    .line 1864
    :cond_84
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1865
    .line 1866
    if-eqz p0, :cond_85

    .line 1867
    .line 1868
    const/16 v0, 0x89

    .line 1869
    .line 1870
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1871
    .line 1872
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1873
    .line 1874
    .line 1875
    :cond_85
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 1876
    .line 1877
    if-eqz p0, :cond_86

    .line 1878
    .line 1879
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1880
    .line 1881
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1882
    .line 1883
    .line 1884
    move-result-object v0

    .line 1885
    const/16 v1, 0x8a

    .line 1886
    .line 1887
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1888
    .line 1889
    .line 1890
    :cond_86
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 1891
    .line 1892
    if-eqz p0, :cond_87

    .line 1893
    .line 1894
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1895
    .line 1896
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1897
    .line 1898
    .line 1899
    move-result-object v0

    .line 1900
    const/16 v1, 0x8b

    .line 1901
    .line 1902
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1903
    .line 1904
    .line 1905
    :cond_87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 1906
    .line 1907
    if-eqz p0, :cond_88

    .line 1908
    .line 1909
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeePortrait;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1910
    .line 1911
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1912
    .line 1913
    .line 1914
    move-result-object v0

    .line 1915
    const/16 v1, 0x8c

    .line 1916
    .line 1917
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1918
    .line 1919
    .line 1920
    :cond_88
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 1921
    .line 1922
    if-eqz p0, :cond_89

    .line 1923
    .line 1924
    const/16 v0, 0x8d

    .line 1925
    .line 1926
    sget-object v1, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1927
    .line 1928
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1929
    .line 1930
    .line 1931
    :cond_89
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 1932
    .line 1933
    if-eqz p0, :cond_8a

    .line 1934
    .line 1935
    const/16 v0, 0x8e

    .line 1936
    .line 1937
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1938
    .line 1939
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1940
    .line 1941
    .line 1942
    :cond_8a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 1943
    .line 1944
    if-eqz p0, :cond_8b

    .line 1945
    .line 1946
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikeUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1947
    .line 1948
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1949
    .line 1950
    .line 1951
    move-result-object v0

    .line 1952
    const/16 v1, 0x8f

    .line 1953
    .line 1954
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1955
    .line 1956
    .line 1957
    :cond_8b
    const/16 p0, 0x90

    .line 1958
    .line 1959
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    .line 1960
    .line 1961
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 1962
    .line 1963
    .line 1964
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 1965
    .line 1966
    if-eqz p0, :cond_8c

    .line 1967
    .line 1968
    const/16 v0, 0x91

    .line 1969
    .line 1970
    sget-object v1, Lcom/p1/mobile/putong/core/data/CipherId;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1971
    .line 1972
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1973
    .line 1974
    .line 1975
    :cond_8c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 1976
    .line 1977
    if-eqz p0, :cond_8d

    .line 1978
    .line 1979
    const/16 v0, 0x92

    .line 1980
    .line 1981
    sget-object v1, Lcom/p1/mobile/putong/core/data/ShareId;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1982
    .line 1983
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1984
    .line 1985
    .line 1986
    :cond_8d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 1987
    .line 1988
    if-eqz p0, :cond_8e

    .line 1989
    .line 1990
    sget-object v0, Lcom/p1/mobile/putong/data/StateEmotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1991
    .line 1992
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1993
    .line 1994
    .line 1995
    move-result-object v0

    .line 1996
    const/16 v1, 0x93

    .line 1997
    .line 1998
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 1999
    .line 2000
    .line 2001
    :cond_8e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 2002
    .line 2003
    if-eqz p0, :cond_8f

    .line 2004
    .line 2005
    const/16 v0, 0x94

    .line 2006
    .line 2007
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2008
    .line 2009
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2010
    .line 2011
    .line 2012
    :cond_8f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 2013
    .line 2014
    if-eqz p0, :cond_90

    .line 2015
    .line 2016
    sget-object v0, Lcom/p1/mobile/putong/core/data/Recommended;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2017
    .line 2018
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2019
    .line 2020
    .line 2021
    move-result-object v0

    .line 2022
    const/16 v1, 0x95

    .line 2023
    .line 2024
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2025
    .line 2026
    .line 2027
    :cond_90
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 2028
    .line 2029
    if-eqz p0, :cond_91

    .line 2030
    .line 2031
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2032
    .line 2033
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2034
    .line 2035
    .line 2036
    move-result-object v0

    .line 2037
    const/16 v1, 0x96

    .line 2038
    .line 2039
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2040
    .line 2041
    .line 2042
    :cond_91
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 2043
    .line 2044
    if-eqz p0, :cond_92

    .line 2045
    .line 2046
    sget-object v0, Lcom/p1/mobile/putong/core/data/PermissionsItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2047
    .line 2048
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2049
    .line 2050
    .line 2051
    move-result-object v0

    .line 2052
    const/16 v1, 0x97

    .line 2053
    .line 2054
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2055
    .line 2056
    .line 2057
    :cond_92
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 2058
    .line 2059
    if-eqz p0, :cond_93

    .line 2060
    .line 2061
    sget-object v0, Lcom/p1/mobile/putong/core/data/ResourceTriggers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2062
    .line 2063
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2064
    .line 2065
    .line 2066
    move-result-object v0

    .line 2067
    const/16 v1, 0x98

    .line 2068
    .line 2069
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2070
    .line 2071
    .line 2072
    :cond_93
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 2073
    .line 2074
    if-eqz p0, :cond_94

    .line 2075
    .line 2076
    const/16 v0, 0x99

    .line 2077
    .line 2078
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2079
    .line 2080
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2081
    .line 2082
    .line 2083
    :cond_94
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 2084
    .line 2085
    if-eqz p0, :cond_95

    .line 2086
    .line 2087
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2088
    .line 2089
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2090
    .line 2091
    .line 2092
    move-result-object v0

    .line 2093
    const/16 v1, 0x9a

    .line 2094
    .line 2095
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2096
    .line 2097
    .line 2098
    :cond_95
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 2099
    .line 2100
    if-eqz p0, :cond_96

    .line 2101
    .line 2102
    const/16 v0, 0x9b

    .line 2103
    .line 2104
    sget-object v1, Lcom/p1/mobile/putong/core/data/JmpTarget;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2105
    .line 2106
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2107
    .line 2108
    .line 2109
    :cond_96
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 2110
    .line 2111
    if-eqz p0, :cond_97

    .line 2112
    .line 2113
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2114
    .line 2115
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2116
    .line 2117
    .line 2118
    move-result-object v0

    .line 2119
    const/16 v1, 0x9c

    .line 2120
    .line 2121
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2122
    .line 2123
    .line 2124
    :cond_97
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 2125
    .line 2126
    if-eqz p0, :cond_98

    .line 2127
    .line 2128
    const/16 v0, 0x9d

    .line 2129
    .line 2130
    sget-object v1, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2131
    .line 2132
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2133
    .line 2134
    .line 2135
    :cond_98
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 2136
    .line 2137
    if-eqz p0, :cond_99

    .line 2138
    .line 2139
    const/16 v0, 0x9e

    .line 2140
    .line 2141
    sget-object v1, Lcom/p1/mobile/putong/core/data/PopGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2142
    .line 2143
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2144
    .line 2145
    .line 2146
    :cond_99
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    .line 2147
    .line 2148
    if-eqz p0, :cond_9a

    .line 2149
    .line 2150
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuperLikeCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2151
    .line 2152
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2153
    .line 2154
    .line 2155
    move-result-object v0

    .line 2156
    const/16 v1, 0x9f

    .line 2157
    .line 2158
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2159
    .line 2160
    .line 2161
    :cond_9a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 2162
    .line 2163
    if-eqz p0, :cond_9b

    .line 2164
    .line 2165
    sget-object v0, Lcom/p1/mobile/putong/core/data/FloatsCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2166
    .line 2167
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2168
    .line 2169
    .line 2170
    move-result-object v0

    .line 2171
    const/16 v1, 0xa0

    .line 2172
    .line 2173
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2174
    .line 2175
    .line 2176
    :cond_9b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 2177
    .line 2178
    if-eqz p0, :cond_9c

    .line 2179
    .line 2180
    const/16 v0, 0xa1

    .line 2181
    .line 2182
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2183
    .line 2184
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2185
    .line 2186
    .line 2187
    :cond_9c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    .line 2188
    .line 2189
    if-eqz p0, :cond_9d

    .line 2190
    .line 2191
    const/16 v0, 0xa2

    .line 2192
    .line 2193
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 2194
    .line 2195
    .line 2196
    :cond_9d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 2197
    .line 2198
    if-eqz p0, :cond_9e

    .line 2199
    .line 2200
    const/16 v0, 0xa3

    .line 2201
    .line 2202
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2203
    .line 2204
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2205
    .line 2206
    .line 2207
    :cond_9e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 2208
    .line 2209
    if-eqz p0, :cond_9f

    .line 2210
    .line 2211
    const/16 v0, 0xa4

    .line 2212
    .line 2213
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2214
    .line 2215
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2216
    .line 2217
    .line 2218
    :cond_9f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 2219
    .line 2220
    if-eqz p0, :cond_a0

    .line 2221
    .line 2222
    const/16 v0, 0xa5

    .line 2223
    .line 2224
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2225
    .line 2226
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2227
    .line 2228
    .line 2229
    :cond_a0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 2230
    .line 2231
    if-eqz p0, :cond_a1

    .line 2232
    .line 2233
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2234
    .line 2235
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2236
    .line 2237
    .line 2238
    move-result-object v0

    .line 2239
    const/16 v1, 0xa6

    .line 2240
    .line 2241
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2242
    .line 2243
    .line 2244
    :cond_a1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 2245
    .line 2246
    if-eqz p0, :cond_a2

    .line 2247
    .line 2248
    const/16 v0, 0xa7

    .line 2249
    .line 2250
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 2251
    .line 2252
    .line 2253
    :cond_a2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 2254
    .line 2255
    if-eqz p0, :cond_a3

    .line 2256
    .line 2257
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExtremePickItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2258
    .line 2259
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2260
    .line 2261
    .line 2262
    move-result-object v0

    .line 2263
    const/16 v1, 0xa8

    .line 2264
    .line 2265
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2266
    .line 2267
    .line 2268
    :cond_a3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 2269
    .line 2270
    if-eqz p0, :cond_a4

    .line 2271
    .line 2272
    const/16 v0, 0xa9

    .line 2273
    .line 2274
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2275
    .line 2276
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2277
    .line 2278
    .line 2279
    :cond_a4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 2280
    .line 2281
    if-eqz p0, :cond_a5

    .line 2282
    .line 2283
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2284
    .line 2285
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2286
    .line 2287
    .line 2288
    move-result-object v0

    .line 2289
    const/16 v1, 0xaa

    .line 2290
    .line 2291
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2292
    .line 2293
    .line 2294
    :cond_a5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 2295
    .line 2296
    if-eqz p0, :cond_a6

    .line 2297
    .line 2298
    const/16 v0, 0xab

    .line 2299
    .line 2300
    sget-object v1, Lcom/p1/mobile/putong/core/data/RecallMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2301
    .line 2302
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2303
    .line 2304
    .line 2305
    :cond_a6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    .line 2306
    .line 2307
    if-eqz p0, :cond_a7

    .line 2308
    .line 2309
    sget-object v0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2310
    .line 2311
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2312
    .line 2313
    .line 2314
    move-result-object v0

    .line 2315
    const/16 v1, 0xac

    .line 2316
    .line 2317
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2318
    .line 2319
    .line 2320
    :cond_a7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 2321
    .line 2322
    if-eqz p0, :cond_a8

    .line 2323
    .line 2324
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2325
    .line 2326
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2327
    .line 2328
    .line 2329
    move-result-object v0

    .line 2330
    const/16 v1, 0xad

    .line 2331
    .line 2332
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2333
    .line 2334
    .line 2335
    :cond_a8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    .line 2336
    .line 2337
    if-eqz p0, :cond_a9

    .line 2338
    .line 2339
    const/16 v0, 0xae

    .line 2340
    .line 2341
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2342
    .line 2343
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2344
    .line 2345
    .line 2346
    :cond_a9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 2347
    .line 2348
    if-eqz p0, :cond_aa

    .line 2349
    .line 2350
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlVisitor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2351
    .line 2352
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2353
    .line 2354
    .line 2355
    move-result-object v0

    .line 2356
    const/16 v1, 0xaf

    .line 2357
    .line 2358
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2359
    .line 2360
    .line 2361
    :cond_aa
    const/16 p0, 0xb0

    .line 2362
    .line 2363
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    .line 2364
    .line 2365
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 2366
    .line 2367
    .line 2368
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 2369
    .line 2370
    if-eqz p0, :cond_ab

    .line 2371
    .line 2372
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2373
    .line 2374
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2375
    .line 2376
    .line 2377
    move-result-object v0

    .line 2378
    const/16 v1, 0xb1

    .line 2379
    .line 2380
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2381
    .line 2382
    .line 2383
    :cond_ab
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 2384
    .line 2385
    if-eqz p0, :cond_ac

    .line 2386
    .line 2387
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2388
    .line 2389
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2390
    .line 2391
    .line 2392
    move-result-object v0

    .line 2393
    const/16 v1, 0xb2

    .line 2394
    .line 2395
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2396
    .line 2397
    .line 2398
    :cond_ac
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 2399
    .line 2400
    if-eqz p0, :cond_ad

    .line 2401
    .line 2402
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2403
    .line 2404
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2405
    .line 2406
    .line 2407
    move-result-object v0

    .line 2408
    const/16 v1, 0xb3

    .line 2409
    .line 2410
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2411
    .line 2412
    .line 2413
    :cond_ad
    const/16 p0, 0xb4

    .line 2414
    .line 2415
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    .line 2416
    .line 2417
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 2418
    .line 2419
    .line 2420
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 2421
    .line 2422
    if-eqz p0, :cond_ae

    .line 2423
    .line 2424
    const/16 v0, 0xb5

    .line 2425
    .line 2426
    sget-object v1, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2427
    .line 2428
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2429
    .line 2430
    .line 2431
    :cond_ae
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    .line 2432
    .line 2433
    if-eqz p0, :cond_af

    .line 2434
    .line 2435
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserIdType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2436
    .line 2437
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2438
    .line 2439
    .line 2440
    move-result-object v0

    .line 2441
    const/16 v1, 0xb6

    .line 2442
    .line 2443
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2444
    .line 2445
    .line 2446
    :cond_af
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    .line 2447
    .line 2448
    if-eqz p0, :cond_b0

    .line 2449
    .line 2450
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2451
    .line 2452
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2453
    .line 2454
    .line 2455
    move-result-object v0

    .line 2456
    const/16 v1, 0xb7

    .line 2457
    .line 2458
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2459
    .line 2460
    .line 2461
    :cond_b0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 2462
    .line 2463
    if-eqz p0, :cond_b1

    .line 2464
    .line 2465
    const/16 v0, 0xb8

    .line 2466
    .line 2467
    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2468
    .line 2469
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2470
    .line 2471
    .line 2472
    :cond_b1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 2473
    .line 2474
    if-eqz p0, :cond_b2

    .line 2475
    .line 2476
    const/16 v0, 0xb9

    .line 2477
    .line 2478
    sget-object v1, Lcom/p1/mobile/putong/core/data/MatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2479
    .line 2480
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2481
    .line 2482
    .line 2483
    :cond_b2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 2484
    .line 2485
    if-eqz p0, :cond_b3

    .line 2486
    .line 2487
    const/16 v0, 0xba

    .line 2488
    .line 2489
    sget-object v1, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2490
    .line 2491
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2492
    .line 2493
    .line 2494
    :cond_b3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 2495
    .line 2496
    if-eqz p0, :cond_b4

    .line 2497
    .line 2498
    const/16 v0, 0xbb

    .line 2499
    .line 2500
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2501
    .line 2502
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2503
    .line 2504
    .line 2505
    :cond_b4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    .line 2506
    .line 2507
    if-eqz p0, :cond_b5

    .line 2508
    .line 2509
    const/16 v0, 0xbc

    .line 2510
    .line 2511
    sget-object v1, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2512
    .line 2513
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2514
    .line 2515
    .line 2516
    :cond_b5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 2517
    .line 2518
    if-eqz p0, :cond_b6

    .line 2519
    .line 2520
    const/16 v0, 0xbd

    .line 2521
    .line 2522
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2523
    .line 2524
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2525
    .line 2526
    .line 2527
    :cond_b6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 2528
    .line 2529
    if-eqz p0, :cond_b7

    .line 2530
    .line 2531
    const/16 v0, 0xbe

    .line 2532
    .line 2533
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2534
    .line 2535
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2536
    .line 2537
    .line 2538
    :cond_b7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 2539
    .line 2540
    if-eqz p0, :cond_b8

    .line 2541
    .line 2542
    const/16 v0, 0xbf

    .line 2543
    .line 2544
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthPartner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2545
    .line 2546
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2547
    .line 2548
    .line 2549
    :cond_b8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 2550
    .line 2551
    if-eqz p0, :cond_b9

    .line 2552
    .line 2553
    sget-object v0, Lcom/p1/mobile/putong/core/data/CityCData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2554
    .line 2555
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2556
    .line 2557
    .line 2558
    move-result-object v0

    .line 2559
    const/16 v1, 0xc0

    .line 2560
    .line 2561
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2562
    .line 2563
    .line 2564
    :cond_b9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    .line 2565
    .line 2566
    if-eqz p0, :cond_ba

    .line 2567
    .line 2568
    const/16 v0, 0xc1

    .line 2569
    .line 2570
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2571
    .line 2572
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2573
    .line 2574
    .line 2575
    :cond_ba
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    .line 2576
    .line 2577
    if-eqz p0, :cond_bb

    .line 2578
    .line 2579
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2580
    .line 2581
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2582
    .line 2583
    .line 2584
    move-result-object v0

    .line 2585
    const/16 v1, 0xc2

    .line 2586
    .line 2587
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2588
    .line 2589
    .line 2590
    :cond_bb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 2591
    .line 2592
    if-eqz p0, :cond_bc

    .line 2593
    .line 2594
    const/16 v0, 0xc3

    .line 2595
    .line 2596
    sget-object v1, Lcom/p1/mobile/putong/core/data/CityCBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2597
    .line 2598
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2599
    .line 2600
    .line 2601
    :cond_bc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2602
    .line 2603
    if-eqz p0, :cond_bd

    .line 2604
    .line 2605
    const/16 v0, 0xc4

    .line 2606
    .line 2607
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPartners;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2608
    .line 2609
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2610
    .line 2611
    .line 2612
    :cond_bd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 2613
    .line 2614
    if-eqz p0, :cond_be

    .line 2615
    .line 2616
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2617
    .line 2618
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2619
    .line 2620
    .line 2621
    move-result-object v0

    .line 2622
    const/16 v1, 0xc5

    .line 2623
    .line 2624
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2625
    .line 2626
    .line 2627
    :cond_be
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    .line 2628
    .line 2629
    if-eqz p0, :cond_bf

    .line 2630
    .line 2631
    const/16 v0, 0xc6

    .line 2632
    .line 2633
    sget-object v1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2634
    .line 2635
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2636
    .line 2637
    .line 2638
    :cond_bf
    const/16 p0, 0xc7

    .line 2639
    .line 2640
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    .line 2641
    .line 2642
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 2643
    .line 2644
    .line 2645
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    .line 2646
    .line 2647
    if-eqz p0, :cond_c0

    .line 2648
    .line 2649
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardCornerMark;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2650
    .line 2651
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2652
    .line 2653
    .line 2654
    move-result-object v0

    .line 2655
    const/16 v1, 0xc8

    .line 2656
    .line 2657
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2658
    .line 2659
    .line 2660
    :cond_c0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 2661
    .line 2662
    if-eqz p0, :cond_c1

    .line 2663
    .line 2664
    const/16 v0, 0xc9

    .line 2665
    .line 2666
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2667
    .line 2668
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2669
    .line 2670
    .line 2671
    :cond_c1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 2672
    .line 2673
    if-eqz p0, :cond_c2

    .line 2674
    .line 2675
    sget-object v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2676
    .line 2677
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2678
    .line 2679
    .line 2680
    move-result-object v0

    .line 2681
    const/16 v1, 0xca

    .line 2682
    .line 2683
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2684
    .line 2685
    .line 2686
    :cond_c2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    .line 2687
    .line 2688
    if-eqz p0, :cond_c3

    .line 2689
    .line 2690
    const/16 v0, 0xcb

    .line 2691
    .line 2692
    sget-object v1, Lcom/p1/mobile/putong/core/data/CityCConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2693
    .line 2694
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2695
    .line 2696
    .line 2697
    :cond_c3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 2698
    .line 2699
    if-eqz p0, :cond_c4

    .line 2700
    .line 2701
    const/16 v0, 0xcc

    .line 2702
    .line 2703
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2704
    .line 2705
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2706
    .line 2707
    .line 2708
    :cond_c4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 2709
    .line 2710
    if-eqz p0, :cond_c5

    .line 2711
    .line 2712
    const/16 v0, 0xcd

    .line 2713
    .line 2714
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2715
    .line 2716
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2717
    .line 2718
    .line 2719
    :cond_c5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    .line 2720
    .line 2721
    if-eqz p0, :cond_c6

    .line 2722
    .line 2723
    const/16 v0, 0xce

    .line 2724
    .line 2725
    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2726
    .line 2727
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2728
    .line 2729
    .line 2730
    :cond_c6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    .line 2731
    .line 2732
    if-eqz p0, :cond_c7

    .line 2733
    .line 2734
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorHidden;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2735
    .line 2736
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2737
    .line 2738
    .line 2739
    move-result-object v0

    .line 2740
    const/16 v1, 0xcf

    .line 2741
    .line 2742
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2743
    .line 2744
    .line 2745
    :cond_c7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    .line 2746
    .line 2747
    if-eqz p0, :cond_c8

    .line 2748
    .line 2749
    const/16 v0, 0xd0

    .line 2750
    .line 2751
    sget-object v1, Lcom/p1/mobile/putong/core/data/MarriageGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2752
    .line 2753
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2754
    .line 2755
    .line 2756
    :cond_c8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    .line 2757
    .line 2758
    if-eqz p0, :cond_c9

    .line 2759
    .line 2760
    sget-object v0, Lcom/p1/mobile/putong/core/data/SelectionUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2761
    .line 2762
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2763
    .line 2764
    .line 2765
    move-result-object v0

    .line 2766
    const/16 v1, 0xd1

    .line 2767
    .line 2768
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2769
    .line 2770
    .line 2771
    :cond_c9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    .line 2772
    .line 2773
    if-eqz p0, :cond_ca

    .line 2774
    .line 2775
    const/16 v0, 0xd2

    .line 2776
    .line 2777
    sget-object v1, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2778
    .line 2779
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2780
    .line 2781
    .line 2782
    :cond_ca
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    .line 2783
    .line 2784
    if-eqz p0, :cond_cb

    .line 2785
    .line 2786
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserAudits;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2787
    .line 2788
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2789
    .line 2790
    .line 2791
    move-result-object v0

    .line 2792
    const/16 v1, 0xd3

    .line 2793
    .line 2794
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2795
    .line 2796
    .line 2797
    :cond_cb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    .line 2798
    .line 2799
    if-eqz p0, :cond_cc

    .line 2800
    .line 2801
    sget-object v0, Lcom/p1/mobile/putong/core/data/DynamicLable;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2802
    .line 2803
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2804
    .line 2805
    .line 2806
    move-result-object v0

    .line 2807
    const/16 v1, 0xd4

    .line 2808
    .line 2809
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2810
    .line 2811
    .line 2812
    :cond_cc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    .line 2813
    .line 2814
    if-eqz p0, :cond_cd

    .line 2815
    .line 2816
    sget-object v0, Lcom/p1/mobile/putong/data/DetectText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2817
    .line 2818
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2819
    .line 2820
    .line 2821
    move-result-object v0

    .line 2822
    const/16 v1, 0xd5

    .line 2823
    .line 2824
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2825
    .line 2826
    .line 2827
    :cond_cd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    .line 2828
    .line 2829
    if-eqz p0, :cond_ce

    .line 2830
    .line 2831
    const/16 v0, 0xd6

    .line 2832
    .line 2833
    sget-object v1, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2834
    .line 2835
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2836
    .line 2837
    .line 2838
    :cond_ce
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 2839
    .line 2840
    if-eqz p0, :cond_cf

    .line 2841
    .line 2842
    sget-object v0, Lcom/p1/mobile/putong/core/data/AuditPictureTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2843
    .line 2844
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2845
    .line 2846
    .line 2847
    move-result-object v0

    .line 2848
    const/16 v1, 0xd7

    .line 2849
    .line 2850
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2851
    .line 2852
    .line 2853
    :cond_cf
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2854
    .line 2855
    if-eqz p0, :cond_d0

    .line 2856
    .line 2857
    const/16 v0, 0xd8

    .line 2858
    .line 2859
    sget-object v1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2860
    .line 2861
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2862
    .line 2863
    .line 2864
    :cond_d0
    const/16 p0, 0xd9

    .line 2865
    .line 2866
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    .line 2867
    .line 2868
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 2869
    .line 2870
    .line 2871
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 2872
    .line 2873
    if-eqz p0, :cond_d1

    .line 2874
    .line 2875
    const/16 v0, 0xda

    .line 2876
    .line 2877
    sget-object v1, Lcom/p1/mobile/putong/core/data/TagStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2878
    .line 2879
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2880
    .line 2881
    .line 2882
    :cond_d1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 2883
    .line 2884
    if-eqz p0, :cond_d2

    .line 2885
    .line 2886
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2887
    .line 2888
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2889
    .line 2890
    .line 2891
    move-result-object v0

    .line 2892
    const/16 v1, 0xdb

    .line 2893
    .line 2894
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2895
    .line 2896
    .line 2897
    :cond_d2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    .line 2898
    .line 2899
    if-eqz p0, :cond_d3

    .line 2900
    .line 2901
    const/16 v0, 0xdc

    .line 2902
    .line 2903
    sget-object v1, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2904
    .line 2905
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2906
    .line 2907
    .line 2908
    :cond_d3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 2909
    .line 2910
    if-eqz p0, :cond_d4

    .line 2911
    .line 2912
    const/16 v0, 0xdd

    .line 2913
    .line 2914
    sget-object v1, Lcom/p1/mobile/putong/core/data/RiskOtherData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2915
    .line 2916
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2917
    .line 2918
    .line 2919
    :cond_d4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 2920
    .line 2921
    if-eqz p0, :cond_d5

    .line 2922
    .line 2923
    const/16 v0, 0xde

    .line 2924
    .line 2925
    sget-object v1, Lcom/p1/mobile/putong/core/data/RiskOtherData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2926
    .line 2927
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2928
    .line 2929
    .line 2930
    :cond_d5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    .line 2931
    .line 2932
    if-eqz p0, :cond_d6

    .line 2933
    .line 2934
    sget-object v0, Lcom/p1/mobile/putong/core/data/RiskSelfData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2935
    .line 2936
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2937
    .line 2938
    .line 2939
    move-result-object v0

    .line 2940
    const/16 v1, 0xdf

    .line 2941
    .line 2942
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2943
    .line 2944
    .line 2945
    :cond_d6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 2946
    .line 2947
    if-eqz p0, :cond_d7

    .line 2948
    .line 2949
    sget-object v0, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2950
    .line 2951
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2952
    .line 2953
    .line 2954
    move-result-object v0

    .line 2955
    const/16 v1, 0xe0

    .line 2956
    .line 2957
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2958
    .line 2959
    .line 2960
    :cond_d7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 2961
    .line 2962
    if-eqz p0, :cond_d8

    .line 2963
    .line 2964
    sget-object v0, Lcom/p1/mobile/putong/core/data/BarLoverCitys;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2965
    .line 2966
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2967
    .line 2968
    .line 2969
    move-result-object v0

    .line 2970
    const/16 v1, 0xe1

    .line 2971
    .line 2972
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2973
    .line 2974
    .line 2975
    :cond_d8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2976
    .line 2977
    if-eqz p0, :cond_d9

    .line 2978
    .line 2979
    const/16 v0, 0xe2

    .line 2980
    .line 2981
    sget-object v1, Lcom/p1/mobile/putong/core/data/FateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2982
    .line 2983
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2984
    .line 2985
    .line 2986
    :cond_d9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 2987
    .line 2988
    if-eqz p0, :cond_da

    .line 2989
    .line 2990
    const/16 v0, 0xe3

    .line 2991
    .line 2992
    sget-object v1, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2993
    .line 2994
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 2995
    .line 2996
    .line 2997
    :cond_da
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 2998
    .line 2999
    if-eqz p0, :cond_db

    .line 3000
    .line 3001
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3002
    .line 3003
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3004
    .line 3005
    .line 3006
    move-result-object v0

    .line 3007
    const/16 v1, 0xe4

    .line 3008
    .line 3009
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3010
    .line 3011
    .line 3012
    :cond_db
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 3013
    .line 3014
    if-eqz p0, :cond_dc

    .line 3015
    .line 3016
    const/16 v0, 0xe5

    .line 3017
    .line 3018
    sget-object v1, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3019
    .line 3020
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3021
    .line 3022
    .line 3023
    :cond_dc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    .line 3024
    .line 3025
    if-eqz p0, :cond_dd

    .line 3026
    .line 3027
    const/16 v0, 0xe6

    .line 3028
    .line 3029
    sget-object v1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3030
    .line 3031
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3032
    .line 3033
    .line 3034
    :cond_dd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 3035
    .line 3036
    if-eqz p0, :cond_de

    .line 3037
    .line 3038
    const/16 v0, 0xe7

    .line 3039
    .line 3040
    sget-object v1, Lcom/p1/mobile/putong/core/data/Explore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3041
    .line 3042
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3043
    .line 3044
    .line 3045
    :cond_de
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    .line 3046
    .line 3047
    if-eqz p0, :cond_df

    .line 3048
    .line 3049
    const/16 v0, 0xe8

    .line 3050
    .line 3051
    sget-object v1, Lcom/p1/mobile/putong/core/data/VipSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3052
    .line 3053
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3054
    .line 3055
    .line 3056
    :cond_df
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    .line 3057
    .line 3058
    if-eqz p0, :cond_e0

    .line 3059
    .line 3060
    sget-object v0, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3061
    .line 3062
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3063
    .line 3064
    .line 3065
    move-result-object v0

    .line 3066
    const/16 v1, 0xe9

    .line 3067
    .line 3068
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3069
    .line 3070
    .line 3071
    :cond_e0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    .line 3072
    .line 3073
    if-eqz p0, :cond_e1

    .line 3074
    .line 3075
    const/16 v0, 0xea

    .line 3076
    .line 3077
    sget-object v1, Lcom/p1/mobile/putong/core/data/FakeGuideData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3078
    .line 3079
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3080
    .line 3081
    .line 3082
    :cond_e1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    .line 3083
    .line 3084
    if-eqz p0, :cond_e2

    .line 3085
    .line 3086
    sget-object v0, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3087
    .line 3088
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3089
    .line 3090
    .line 3091
    move-result-object v0

    .line 3092
    const/16 v1, 0xeb

    .line 3093
    .line 3094
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3095
    .line 3096
    .line 3097
    :cond_e2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 3098
    .line 3099
    if-eqz p0, :cond_e3

    .line 3100
    .line 3101
    const/16 v0, 0xec

    .line 3102
    .line 3103
    sget-object v1, Lcom/p1/mobile/putong/core/data/Questionnaire;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3104
    .line 3105
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3106
    .line 3107
    .line 3108
    :cond_e3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    .line 3109
    .line 3110
    if-eqz p0, :cond_e4

    .line 3111
    .line 3112
    const/16 v0, 0xed

    .line 3113
    .line 3114
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3115
    .line 3116
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3117
    .line 3118
    .line 3119
    :cond_e4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    .line 3120
    .line 3121
    if-eqz p0, :cond_e5

    .line 3122
    .line 3123
    const/16 v0, 0xee

    .line 3124
    .line 3125
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3126
    .line 3127
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3128
    .line 3129
    .line 3130
    :cond_e5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    .line 3131
    .line 3132
    if-eqz p0, :cond_e6

    .line 3133
    .line 3134
    sget-object v0, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3135
    .line 3136
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3137
    .line 3138
    .line 3139
    move-result-object v0

    .line 3140
    const/16 v1, 0xef

    .line 3141
    .line 3142
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3143
    .line 3144
    .line 3145
    :cond_e6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 3146
    .line 3147
    if-eqz p0, :cond_e7

    .line 3148
    .line 3149
    const/16 v0, 0xf0

    .line 3150
    .line 3151
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3152
    .line 3153
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3154
    .line 3155
    .line 3156
    :cond_e7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 3157
    .line 3158
    if-eqz p0, :cond_e8

    .line 3159
    .line 3160
    const/16 v0, 0xf1

    .line 3161
    .line 3162
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3163
    .line 3164
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3165
    .line 3166
    .line 3167
    :cond_e8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 3168
    .line 3169
    if-eqz p0, :cond_e9

    .line 3170
    .line 3171
    const/16 v0, 0xf2

    .line 3172
    .line 3173
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3174
    .line 3175
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3176
    .line 3177
    .line 3178
    :cond_e9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    .line 3179
    .line 3180
    if-eqz p0, :cond_ea

    .line 3181
    .line 3182
    sget-object v0, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3183
    .line 3184
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3185
    .line 3186
    .line 3187
    move-result-object v0

    .line 3188
    const/16 v1, 0xf3

    .line 3189
    .line 3190
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3191
    .line 3192
    .line 3193
    :cond_ea
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 3194
    .line 3195
    if-eqz p0, :cond_eb

    .line 3196
    .line 3197
    const/16 v0, 0xf4

    .line 3198
    .line 3199
    sget-object v1, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3200
    .line 3201
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3202
    .line 3203
    .line 3204
    :cond_eb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    .line 3205
    .line 3206
    if-eqz p0, :cond_ec

    .line 3207
    .line 3208
    sget-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3209
    .line 3210
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3211
    .line 3212
    .line 3213
    move-result-object v0

    .line 3214
    const/16 v1, 0xf5

    .line 3215
    .line 3216
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3217
    .line 3218
    .line 3219
    :cond_ec
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 3220
    .line 3221
    if-eqz p0, :cond_ed

    .line 3222
    .line 3223
    sget-object v0, Lcom/p1/mobile/putong/core/data/UrlTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3224
    .line 3225
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3226
    .line 3227
    .line 3228
    move-result-object v0

    .line 3229
    const/16 v1, 0xf6

    .line 3230
    .line 3231
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3232
    .line 3233
    .line 3234
    :cond_ed
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    .line 3235
    .line 3236
    if-eqz p0, :cond_ee

    .line 3237
    .line 3238
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3239
    .line 3240
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3241
    .line 3242
    .line 3243
    move-result-object v0

    .line 3244
    const/16 v1, 0xf7

    .line 3245
    .line 3246
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3247
    .line 3248
    .line 3249
    :cond_ee
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 3250
    .line 3251
    if-eqz p0, :cond_ef

    .line 3252
    .line 3253
    const/16 v0, 0xf8

    .line 3254
    .line 3255
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3256
    .line 3257
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3258
    .line 3259
    .line 3260
    :cond_ef
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    .line 3261
    .line 3262
    if-eqz p0, :cond_f0

    .line 3263
    .line 3264
    const/16 v0, 0xf9

    .line 3265
    .line 3266
    sget-object v1, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3267
    .line 3268
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3269
    .line 3270
    .line 3271
    :cond_f0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    .line 3272
    .line 3273
    if-eqz p0, :cond_f1

    .line 3274
    .line 3275
    const/16 v0, 0xfa

    .line 3276
    .line 3277
    sget-object v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3278
    .line 3279
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3280
    .line 3281
    .line 3282
    :cond_f1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 3283
    .line 3284
    if-eqz p0, :cond_f2

    .line 3285
    .line 3286
    const/16 v0, 0xfb

    .line 3287
    .line 3288
    sget-object v1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3289
    .line 3290
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3291
    .line 3292
    .line 3293
    :cond_f2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    .line 3294
    .line 3295
    if-eqz p0, :cond_f3

    .line 3296
    .line 3297
    sget-object v0, Lcom/p1/mobile/putong/core/data/IPRegion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3298
    .line 3299
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3300
    .line 3301
    .line 3302
    move-result-object v0

    .line 3303
    const/16 v1, 0xfc

    .line 3304
    .line 3305
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3306
    .line 3307
    .line 3308
    :cond_f3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    .line 3309
    .line 3310
    if-eqz p0, :cond_f4

    .line 3311
    .line 3312
    const/16 v0, 0xfd

    .line 3313
    .line 3314
    sget-object v1, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3315
    .line 3316
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3317
    .line 3318
    .line 3319
    :cond_f4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 3320
    .line 3321
    if-eqz p0, :cond_f5

    .line 3322
    .line 3323
    const/16 v0, 0xfe

    .line 3324
    .line 3325
    sget-object v1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3326
    .line 3327
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3328
    .line 3329
    .line 3330
    :cond_f5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    .line 3331
    .line 3332
    if-eqz p0, :cond_f6

    .line 3333
    .line 3334
    const/16 v0, 0xff

    .line 3335
    .line 3336
    sget-object v1, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3337
    .line 3338
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3339
    .line 3340
    .line 3341
    :cond_f6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 3342
    .line 3343
    if-eqz p0, :cond_f7

    .line 3344
    .line 3345
    const/16 v0, 0x100

    .line 3346
    .line 3347
    sget-object v1, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3348
    .line 3349
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3350
    .line 3351
    .line 3352
    :cond_f7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 3353
    .line 3354
    if-eqz p0, :cond_f8

    .line 3355
    .line 3356
    const/16 v0, 0x101

    .line 3357
    .line 3358
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3359
    .line 3360
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3361
    .line 3362
    .line 3363
    :cond_f8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 3364
    .line 3365
    if-eqz p0, :cond_f9

    .line 3366
    .line 3367
    sget-object v0, Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3368
    .line 3369
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3370
    .line 3371
    .line 3372
    move-result-object v0

    .line 3373
    const/16 v1, 0x102

    .line 3374
    .line 3375
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3376
    .line 3377
    .line 3378
    :cond_f9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 3379
    .line 3380
    if-eqz p0, :cond_fa

    .line 3381
    .line 3382
    const/16 v0, 0x103

    .line 3383
    .line 3384
    sget-object v1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3385
    .line 3386
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3387
    .line 3388
    .line 3389
    :cond_fa
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 3390
    .line 3391
    if-eqz p0, :cond_fb

    .line 3392
    .line 3393
    const/16 v0, 0x104

    .line 3394
    .line 3395
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3396
    .line 3397
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3398
    .line 3399
    .line 3400
    :cond_fb
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 3401
    .line 3402
    if-eqz p0, :cond_fc

    .line 3403
    .line 3404
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3405
    .line 3406
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3407
    .line 3408
    .line 3409
    move-result-object v0

    .line 3410
    const/16 v1, 0x105

    .line 3411
    .line 3412
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3413
    .line 3414
    .line 3415
    :cond_fc
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    .line 3416
    .line 3417
    if-eqz p0, :cond_fd

    .line 3418
    .line 3419
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3420
    .line 3421
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3422
    .line 3423
    .line 3424
    move-result-object v0

    .line 3425
    const/16 v1, 0x106

    .line 3426
    .line 3427
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3428
    .line 3429
    .line 3430
    :cond_fd
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 3431
    .line 3432
    if-eqz p0, :cond_fe

    .line 3433
    .line 3434
    const/16 v0, 0x107

    .line 3435
    .line 3436
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3437
    .line 3438
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3439
    .line 3440
    .line 3441
    :cond_fe
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 3442
    .line 3443
    if-eqz p0, :cond_ff

    .line 3444
    .line 3445
    const/16 v0, 0x108

    .line 3446
    .line 3447
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3448
    .line 3449
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3450
    .line 3451
    .line 3452
    :cond_ff
    const/16 p0, 0x109

    .line 3453
    .line 3454
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    .line 3455
    .line 3456
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 3457
    .line 3458
    .line 3459
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    .line 3460
    .line 3461
    if-eqz p0, :cond_100

    .line 3462
    .line 3463
    sget-object v0, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3464
    .line 3465
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3466
    .line 3467
    .line 3468
    move-result-object v0

    .line 3469
    const/16 v1, 0x10a

    .line 3470
    .line 3471
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3472
    .line 3473
    .line 3474
    :cond_100
    const/16 p0, 0x10b

    .line 3475
    .line 3476
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    .line 3477
    .line 3478
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 3479
    .line 3480
    .line 3481
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    .line 3482
    .line 3483
    if-eqz p0, :cond_101

    .line 3484
    .line 3485
    const/16 v0, 0x10c

    .line 3486
    .line 3487
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3488
    .line 3489
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3490
    .line 3491
    .line 3492
    :cond_101
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 3493
    .line 3494
    if-eqz p0, :cond_102

    .line 3495
    .line 3496
    const/16 v0, 0x10d

    .line 3497
    .line 3498
    sget-object v1, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3499
    .line 3500
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3501
    .line 3502
    .line 3503
    :cond_102
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 3504
    .line 3505
    if-eqz p0, :cond_103

    .line 3506
    .line 3507
    const/16 v0, 0x10e

    .line 3508
    .line 3509
    sget-object v1, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3510
    .line 3511
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3512
    .line 3513
    .line 3514
    :cond_103
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    .line 3515
    .line 3516
    if-eqz p0, :cond_104

    .line 3517
    .line 3518
    const/16 v0, 0x10f

    .line 3519
    .line 3520
    sget-object v1, Lcom/p1/mobile/putong/core/data/InvitationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3521
    .line 3522
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3523
    .line 3524
    .line 3525
    :cond_104
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    .line 3526
    .line 3527
    if-eqz p0, :cond_105

    .line 3528
    .line 3529
    const/16 v0, 0x110

    .line 3530
    .line 3531
    sget-object v1, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3532
    .line 3533
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3534
    .line 3535
    .line 3536
    :cond_105
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 3537
    .line 3538
    if-eqz p0, :cond_106

    .line 3539
    .line 3540
    const/16 v0, 0x111

    .line 3541
    .line 3542
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3543
    .line 3544
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3545
    .line 3546
    .line 3547
    :cond_106
    const/16 p0, 0x112

    .line 3548
    .line 3549
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    .line 3550
    .line 3551
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 3552
    .line 3553
    .line 3554
    const/16 p0, 0x113

    .line 3555
    .line 3556
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    .line 3557
    .line 3558
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 3559
    .line 3560
    .line 3561
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    .line 3562
    .line 3563
    if-eqz p0, :cond_107

    .line 3564
    .line 3565
    sget-object v0, Lcom/p1/mobile/putong/core/data/Prologue;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3566
    .line 3567
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3568
    .line 3569
    .line 3570
    move-result-object v0

    .line 3571
    const/16 v1, 0x114

    .line 3572
    .line 3573
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3574
    .line 3575
    .line 3576
    :cond_107
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    .line 3577
    .line 3578
    if-eqz p0, :cond_108

    .line 3579
    .line 3580
    sget-object v0, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3581
    .line 3582
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3583
    .line 3584
    .line 3585
    move-result-object v0

    .line 3586
    const/16 v1, 0x115

    .line 3587
    .line 3588
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3589
    .line 3590
    .line 3591
    :cond_108
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    .line 3592
    .line 3593
    if-eqz p0, :cond_109

    .line 3594
    .line 3595
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreditScoreData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3596
    .line 3597
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3598
    .line 3599
    .line 3600
    move-result-object v0

    .line 3601
    const/16 v1, 0x116

    .line 3602
    .line 3603
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3604
    .line 3605
    .line 3606
    :cond_109
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    .line 3607
    .line 3608
    if-eqz p0, :cond_10a

    .line 3609
    .line 3610
    sget-object v0, Lcom/p1/mobile/putong/core/data/DislikedUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3611
    .line 3612
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3613
    .line 3614
    .line 3615
    move-result-object v0

    .line 3616
    const/16 v1, 0x117

    .line 3617
    .line 3618
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3619
    .line 3620
    .line 3621
    :cond_10a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    .line 3622
    .line 3623
    if-eqz p0, :cond_10b

    .line 3624
    .line 3625
    const/16 v0, 0x118

    .line 3626
    .line 3627
    sget-object v1, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3628
    .line 3629
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3630
    .line 3631
    .line 3632
    :cond_10b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    .line 3633
    .line 3634
    if-eqz p0, :cond_10c

    .line 3635
    .line 3636
    const/16 v0, 0x119

    .line 3637
    .line 3638
    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3639
    .line 3640
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3641
    .line 3642
    .line 3643
    :cond_10c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    .line 3644
    .line 3645
    if-eqz p0, :cond_10d

    .line 3646
    .line 3647
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3648
    .line 3649
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3650
    .line 3651
    .line 3652
    move-result-object v0

    .line 3653
    const/16 v1, 0x11a

    .line 3654
    .line 3655
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3656
    .line 3657
    .line 3658
    :cond_10d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    .line 3659
    .line 3660
    if-eqz p0, :cond_10e

    .line 3661
    .line 3662
    sget-object v0, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3663
    .line 3664
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3665
    .line 3666
    .line 3667
    move-result-object v0

    .line 3668
    const/16 v1, 0x11b

    .line 3669
    .line 3670
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3671
    .line 3672
    .line 3673
    :cond_10e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    .line 3674
    .line 3675
    if-eqz p0, :cond_10f

    .line 3676
    .line 3677
    sget-object v0, Lcom/p1/mobile/putong/core/data/TribeSubset;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3678
    .line 3679
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3680
    .line 3681
    .line 3682
    move-result-object v0

    .line 3683
    const/16 v1, 0x11c

    .line 3684
    .line 3685
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3686
    .line 3687
    .line 3688
    :cond_10f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    .line 3689
    .line 3690
    if-eqz p0, :cond_110

    .line 3691
    .line 3692
    const/16 v0, 0x11d

    .line 3693
    .line 3694
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3695
    .line 3696
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3697
    .line 3698
    .line 3699
    :cond_110
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    .line 3700
    .line 3701
    if-eqz p0, :cond_111

    .line 3702
    .line 3703
    const/16 v0, 0x11e

    .line 3704
    .line 3705
    sget-object v1, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3706
    .line 3707
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3708
    .line 3709
    .line 3710
    :cond_111
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 3711
    .line 3712
    if-eqz p0, :cond_112

    .line 3713
    .line 3714
    const/16 v0, 0x11f

    .line 3715
    .line 3716
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3717
    .line 3718
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3719
    .line 3720
    .line 3721
    :cond_112
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    .line 3722
    .line 3723
    if-eqz p0, :cond_113

    .line 3724
    .line 3725
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3726
    .line 3727
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3728
    .line 3729
    .line 3730
    move-result-object v0

    .line 3731
    const/16 v1, 0x120

    .line 3732
    .line 3733
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3734
    .line 3735
    .line 3736
    :cond_113
    const/16 p0, 0x121

    .line 3737
    .line 3738
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    .line 3739
    .line 3740
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 3741
    .line 3742
    .line 3743
    const/16 p0, 0x122

    .line 3744
    .line 3745
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    .line 3746
    .line 3747
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 3748
    .line 3749
    .line 3750
    const/16 p0, 0x123

    .line 3751
    .line 3752
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    .line 3753
    .line 3754
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 3755
    .line 3756
    .line 3757
    const/16 p0, 0x124

    .line 3758
    .line 3759
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    .line 3760
    .line 3761
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 3762
    .line 3763
    .line 3764
    const/16 p0, 0x125

    .line 3765
    .line 3766
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    .line 3767
    .line 3768
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 3769
    .line 3770
    .line 3771
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    .line 3772
    .line 3773
    if-eqz p0, :cond_114

    .line 3774
    .line 3775
    sget-object v0, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3776
    .line 3777
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3778
    .line 3779
    .line 3780
    move-result-object v0

    .line 3781
    const/16 v1, 0x126

    .line 3782
    .line 3783
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3784
    .line 3785
    .line 3786
    :cond_114
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    .line 3787
    .line 3788
    if-eqz p0, :cond_115

    .line 3789
    .line 3790
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3791
    .line 3792
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3793
    .line 3794
    .line 3795
    move-result-object v0

    .line 3796
    const/16 v1, 0x127

    .line 3797
    .line 3798
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3799
    .line 3800
    .line 3801
    :cond_115
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    .line 3802
    .line 3803
    if-eqz p0, :cond_116

    .line 3804
    .line 3805
    const/16 v0, 0x128

    .line 3806
    .line 3807
    sget-object v1, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3808
    .line 3809
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3810
    .line 3811
    .line 3812
    :cond_116
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    .line 3813
    .line 3814
    if-eqz p0, :cond_117

    .line 3815
    .line 3816
    sget-object v0, Lcom/p1/mobile/putong/core/data/ComplimentText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3817
    .line 3818
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3819
    .line 3820
    .line 3821
    move-result-object v0

    .line 3822
    const/16 v1, 0x129

    .line 3823
    .line 3824
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3825
    .line 3826
    .line 3827
    :cond_117
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 3828
    .line 3829
    if-eqz p0, :cond_118

    .line 3830
    .line 3831
    const/16 v0, 0x12a

    .line 3832
    .line 3833
    sget-object v1, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3834
    .line 3835
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3836
    .line 3837
    .line 3838
    :cond_118
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    .line 3839
    .line 3840
    if-eqz p0, :cond_119

    .line 3841
    .line 3842
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3843
    .line 3844
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3845
    .line 3846
    .line 3847
    move-result-object v0

    .line 3848
    const/16 v1, 0x12b

    .line 3849
    .line 3850
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3851
    .line 3852
    .line 3853
    :cond_119
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    .line 3854
    .line 3855
    if-eqz p0, :cond_11a

    .line 3856
    .line 3857
    sget-object p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3858
    .line 3859
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 3860
    .line 3861
    .line 3862
    move-result-object p1

    .line 3863
    const/16 v0, 0x12c

    .line 3864
    .line 3865
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 3866
    .line 3867
    .line 3868
    :cond_11a
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3869
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreData$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
