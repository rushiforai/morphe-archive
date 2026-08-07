.class public Lcom/p1/mobile/putong/core/data/GiftRecord;
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
            "Lcom/p1/mobile/putong/core/data/GiftRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/GiftRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "gift"


# instance fields
.field public action:Lcom/p1/mobile/putong/core/data/GiftAction;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public details:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GiftDetail;",
            ">;"
        }
    .end annotation
.end field

.field public giftGivenTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftMatchNewTag:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public giftReceivedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public giftType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public owner:Lcom/p1/mobile/putong/core/data/GiftUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public revenue:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public share:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/core/data/GiftStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public total:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public unit:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public unitPrice:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GiftRecord$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GiftRecord$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/GiftRecord$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GiftRecord$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/GiftDetail;)Lcom/p1/mobile/putong/core/data/GiftDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftDetail;->clone()Lcom/p1/mobile/putong/core/data/GiftDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/GiftRecord;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GiftRecord;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GiftRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/GiftRecord;->nullCheck()V

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

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftRecord;->clone()Lcom/p1/mobile/putong/core/data/GiftRecord;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/GiftRecord;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GiftRecord;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GiftRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GiftUser;->clone()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GiftUser;->clone()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 59
    .line 60
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 63
    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    new-instance v2, Ll/zwj;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/zwj;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 80
    .line 81
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 82
    .line 83
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 86
    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 90
    .line 91
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 92
    .line 93
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftRecord;->clone()Lcom/p1/mobile/putong/core/data/GiftRecord;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftRecord;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 64
    .line 65
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 66
    .line 67
    cmpl-double v1, v3, v5

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 72
    .line 73
    iget v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 74
    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 88
    .line 89
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 90
    .line 91
    cmpl-double v1, v3, v5

    .line 92
    .line 93
    if-nez v1, :cond_2

    .line 94
    .line 95
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 96
    .line 97
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 98
    .line 99
    cmpl-double v1, v3, v5

    .line 100
    .line 101
    if-nez v1, :cond_2

    .line 102
    .line 103
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 104
    .line 105
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 106
    .line 107
    cmpl-double v1, v3, v5

    .line 108
    .line 109
    if-nez v1, :cond_2

    .line 110
    .line 111
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 112
    .line 113
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 114
    .line 115
    cmpl-double v1, v3, v5

    .line 116
    .line 117
    if-nez v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 130
    .line 131
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 132
    .line 133
    if-ne v1, v3, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_2

    .line 154
    .line 155
    return v0

    .line 156
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "gift"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GiftUser;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GiftUser;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 72
    .line 73
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 74
    .line 75
    .line 76
    move-result-wide v3

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    const/16 v1, 0x20

    .line 80
    .line 81
    ushr-long v5, v3, v1

    .line 82
    .line 83
    xor-long/2addr v3, v5

    .line 84
    long-to-int v3, v3

    .line 85
    add-int/2addr v0, v3

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 89
    .line 90
    add-int/2addr v0, v3

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 94
    .line 95
    if-eqz v3, :cond_5

    .line 96
    .line 97
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    goto :goto_5

    .line 102
    :cond_5
    move v3, v2

    .line 103
    :goto_5
    add-int/2addr v0, v3

    .line 104
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 105
    .line 106
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 107
    .line 108
    .line 109
    move-result-wide v3

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    ushr-long v5, v3, v1

    .line 113
    .line 114
    xor-long/2addr v3, v5

    .line 115
    long-to-int v3, v3

    .line 116
    add-int/2addr v0, v3

    .line 117
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 118
    .line 119
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 120
    .line 121
    .line 122
    move-result-wide v3

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    ushr-long v5, v3, v1

    .line 126
    .line 127
    xor-long/2addr v3, v5

    .line 128
    long-to-int v3, v3

    .line 129
    add-int/2addr v0, v3

    .line 130
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 131
    .line 132
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    ushr-long v5, v3, v1

    .line 139
    .line 140
    xor-long/2addr v3, v5

    .line 141
    long-to-int v3, v3

    .line 142
    add-int/2addr v0, v3

    .line 143
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 144
    .line 145
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 146
    .line 147
    .line 148
    move-result-wide v3

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    ushr-long v5, v3, v1

    .line 152
    .line 153
    xor-long/2addr v3, v5

    .line 154
    long-to-int v1, v3

    .line 155
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 159
    .line 160
    if-eqz v1, :cond_6

    .line 161
    .line 162
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    goto :goto_6

    .line 167
    :cond_6
    move v1, v2

    .line 168
    :goto_6
    add-int/2addr v0, v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 172
    .line 173
    if-eqz v1, :cond_7

    .line 174
    .line 175
    const/16 v1, 0x4cf

    .line 176
    .line 177
    goto :goto_7

    .line 178
    :cond_7
    const/16 v1, 0x4d5

    .line 179
    .line 180
    :goto_7
    add-int/2addr v0, v1

    .line 181
    mul-int/lit8 v0, v0, 0x29

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz v1, :cond_8

    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    goto :goto_8

    .line 192
    :cond_8
    move v1, v2

    .line 193
    :goto_8
    add-int/2addr v0, v1

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 197
    .line 198
    if-eqz v1, :cond_9

    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    :cond_9
    add-int/2addr v0, v2

    .line 205
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 206
    .line 207
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftUser;->new_()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftUser;->new_()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 62
    .line 63
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 64
    .line 65
    if-nez v0, :cond_6

    .line 66
    .line 67
    new-instance v0, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 73
    .line 74
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 75
    .line 76
    if-nez v0, :cond_7

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 79
    .line 80
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 81
    .line 82
    if-nez v0, :cond_8

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 85
    .line 86
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
