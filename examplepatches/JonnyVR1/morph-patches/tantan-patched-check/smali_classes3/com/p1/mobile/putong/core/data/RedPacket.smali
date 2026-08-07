.class public Lcom/p1/mobile/putong/core/data/RedPacket;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/RedPacket;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/RedPacket;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "redpacket"


# instance fields
.field public assignAmount:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public assignQuantity:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public createTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public expireTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public payExpireTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public paySign:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public quantity:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public receiveRecords:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ReceiveRecords;",
            ">;"
        }
    .end annotation
.end field

.field public showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public splitType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public totalAmount:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RedPacket$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RedPacket$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/RedPacket;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/RedPacket$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RedPacket$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/RedPacket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/ReceiveRecords;)Lcom/p1/mobile/putong/core/data/ReceiveRecords;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->clone()Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/RedPacket;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RedPacket;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/RedPacket;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RedPacket;->clone()Lcom/p1/mobile/putong/core/data/RedPacket;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/RedPacket;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RedPacket;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->clone()Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->clone()Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 29
    .line 30
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 59
    .line 60
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    new-instance v2, Ll/psc0;

    .line 67
    .line 68
    invoke-direct {v2}, Ll/psc0;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 76
    .line 77
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 78
    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->clone()Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 86
    .line 87
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 92
    .line 93
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 94
    .line 95
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RedPacket;->clone()Lcom/p1/mobile/putong/core/data/RedPacket;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 86
    .line 87
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 88
    .line 89
    cmp-long v1, v3, v5

    .line 90
    .line 91
    if-nez v1, :cond_2

    .line 92
    .line 93
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 94
    .line 95
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 96
    .line 97
    cmp-long v1, v3, v5

    .line 98
    .line 99
    if-nez v1, :cond_2

    .line 100
    .line 101
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 102
    .line 103
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 104
    .line 105
    cmp-long v1, v3, v5

    .line 106
    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 112
    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 122
    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_2

    .line 148
    .line 149
    return v0

    .line 150
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "redpacket"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 48
    .line 49
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 53
    .line 54
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move v1, v2

    .line 67
    :goto_3
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    goto :goto_4

    .line 79
    :cond_4
    move v1, v2

    .line 80
    :goto_4
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    goto :goto_5

    .line 92
    :cond_5
    move v1, v2

    .line 93
    :goto_5
    add-int/2addr v0, v1

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 97
    .line 98
    const/16 v1, 0x20

    .line 99
    .line 100
    ushr-long v5, v3, v1

    .line 101
    .line 102
    xor-long/2addr v3, v5

    .line 103
    long-to-int v3, v3

    .line 104
    add-int/2addr v0, v3

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 108
    .line 109
    ushr-long v5, v3, v1

    .line 110
    .line 111
    xor-long/2addr v3, v5

    .line 112
    long-to-int v3, v3

    .line 113
    add-int/2addr v0, v3

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 117
    .line 118
    ushr-long v5, v3, v1

    .line 119
    .line 120
    xor-long/2addr v3, v5

    .line 121
    long-to-int v1, v3

    .line 122
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v1, :cond_6

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_6

    .line 134
    :cond_6
    move v1, v2

    .line 135
    :goto_6
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 139
    .line 140
    if-eqz v1, :cond_7

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_7

    .line 147
    :cond_7
    move v1, v2

    .line 148
    :goto_7
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v1, :cond_8

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_8

    .line 160
    :cond_8
    move v1, v2

    .line 161
    :goto_8
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 165
    .line 166
    if-eqz v1, :cond_9

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    :cond_9
    add-int/2addr v0, v2

    .line 173
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 174
    .line 175
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->new_()Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->new_()Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 40
    .line 41
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 42
    .line 43
    if-nez v0, :cond_5

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 46
    .line 47
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 48
    .line 49
    if-nez v0, :cond_6

    .line 50
    .line 51
    new-instance v0, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 57
    .line 58
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 59
    .line 60
    if-nez v0, :cond_7

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->new_()Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 67
    .line 68
    :cond_7
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacket;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
