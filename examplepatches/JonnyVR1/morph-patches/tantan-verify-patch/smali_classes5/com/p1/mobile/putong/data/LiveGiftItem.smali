.class public Lcom/p1/mobile/putong/data/LiveGiftItem;
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
            "Lcom/p1/mobile/putong/data/LiveGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/LiveGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "livegiftitem"


# instance fields
.field public animationType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public animationUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public combosDuration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public detailInset:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public detailUrl:Ljava/lang/String;

.field public endTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public fastGiftNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public giftLevel:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftSource:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public giftType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public localName:Lcom/p1/mobile/putong/data/LangModel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public localTag:Lcom/p1/mobile/putong/data/LangModel;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public mobileVibration:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public packageId:Ljava/lang/String;

.field public position:I

.field public purchasePrice:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public remain:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public startTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public subtitle:Ljava/lang/String;

.field public tag:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public tagTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public title:Ljava/lang/String;

.field public trayDuration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public unitPrice:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public version:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveGiftItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveGiftItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/LiveGiftItem$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveGiftItem$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/LiveGiftItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveGiftItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveGiftItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LiveGiftItem;->nullCheck()V

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

    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveGiftItem;->clone()Lcom/p1/mobile/putong/data/LiveGiftItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/LiveGiftItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveGiftItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveGiftItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->clone()Lcom/p1/mobile/putong/data/LangModel;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 31
    .line 32
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 33
    .line 34
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 35
    .line 36
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 37
    .line 38
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->clone()Lcom/p1/mobile/putong/data/LangModel;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 57
    .line 58
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 59
    .line 60
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 63
    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 67
    .line 68
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 73
    .line 74
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 75
    .line 76
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 93
    .line 94
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 95
    .line 96
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 97
    .line 98
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 99
    .line 100
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 101
    .line 102
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 103
    .line 104
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 105
    .line 106
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 107
    .line 108
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 109
    .line 110
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 111
    .line 112
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 113
    .line 114
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveGiftItem;->clone()Lcom/p1/mobile/putong/data/LiveGiftItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveGiftItem;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 60
    .line 61
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 62
    .line 63
    cmpl-double v1, v3, v5

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 68
    .line 69
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 70
    .line 71
    cmpl-double v1, v3, v5

    .line 72
    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 98
    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 112
    .line 113
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 114
    .line 115
    cmp-long v1, v3, v5

    .line 116
    .line 117
    if-nez v1, :cond_2

    .line 118
    .line 119
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 120
    .line 121
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 122
    .line 123
    if-ne v1, v3, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 136
    .line 137
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 138
    .line 139
    cmp-long v1, v3, v5

    .line 140
    .line 141
    if-nez v1, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_2

    .line 182
    .line 183
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 184
    .line 185
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 186
    .line 187
    cmp-long v1, v3, v5

    .line 188
    .line 189
    if-nez v1, :cond_2

    .line 190
    .line 191
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 192
    .line 193
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 194
    .line 195
    if-ne v1, v3, :cond_2

    .line 196
    .line 197
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 198
    .line 199
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 200
    .line 201
    if-ne v1, v3, :cond_2

    .line 202
    .line 203
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 204
    .line 205
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 206
    .line 207
    cmp-long v1, v3, v5

    .line 208
    .line 209
    if-nez v1, :cond_2

    .line 210
    .line 211
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 212
    .line 213
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 214
    .line 215
    if-ne p0, p1, :cond_2

    .line 216
    .line 217
    return v0

    .line 218
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "livegiftitem"

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
    if-nez v0, :cond_d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 64
    .line 65
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 66
    .line 67
    .line 68
    move-result-wide v3

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    const/16 v1, 0x20

    .line 72
    .line 73
    ushr-long v5, v3, v1

    .line 74
    .line 75
    xor-long/2addr v3, v5

    .line 76
    long-to-int v3, v3

    .line 77
    add-int/2addr v0, v3

    .line 78
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 79
    .line 80
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    ushr-long v5, v3, v1

    .line 87
    .line 88
    xor-long/2addr v3, v5

    .line 89
    long-to-int v3, v3

    .line 90
    add-int/2addr v0, v3

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v3, :cond_4

    .line 96
    .line 97
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    goto :goto_4

    .line 102
    :cond_4
    move v3, v2

    .line 103
    :goto_4
    add-int/2addr v0, v3

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    goto :goto_5

    .line 115
    :cond_5
    move v3, v2

    .line 116
    :goto_5
    add-int/2addr v0, v3

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 120
    .line 121
    if-eqz v3, :cond_6

    .line 122
    .line 123
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LangModel;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    goto :goto_6

    .line 128
    :cond_6
    move v3, v2

    .line 129
    :goto_6
    add-int/2addr v0, v3

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 133
    .line 134
    add-int/2addr v0, v3

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 138
    .line 139
    ushr-long v5, v3, v1

    .line 140
    .line 141
    xor-long/2addr v3, v5

    .line 142
    long-to-int v3, v3

    .line 143
    add-int/2addr v0, v3

    .line 144
    mul-int/lit8 v0, v0, 0x29

    .line 145
    .line 146
    iget v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 147
    .line 148
    add-int/2addr v0, v3

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v3, :cond_7

    .line 154
    .line 155
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    goto :goto_7

    .line 160
    :cond_7
    move v3, v2

    .line 161
    :goto_7
    add-int/2addr v0, v3

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 165
    .line 166
    ushr-long v5, v3, v1

    .line 167
    .line 168
    xor-long/2addr v3, v5

    .line 169
    long-to-int v3, v3

    .line 170
    add-int/2addr v0, v3

    .line 171
    mul-int/lit8 v0, v0, 0x29

    .line 172
    .line 173
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 174
    .line 175
    if-eqz v3, :cond_8

    .line 176
    .line 177
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    goto :goto_8

    .line 182
    :cond_8
    move v3, v2

    .line 183
    :goto_8
    add-int/2addr v0, v3

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz v3, :cond_9

    .line 189
    .line 190
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    goto :goto_9

    .line 195
    :cond_9
    move v3, v2

    .line 196
    :goto_9
    add-int/2addr v0, v3

    .line 197
    mul-int/lit8 v0, v0, 0x29

    .line 198
    .line 199
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v3, :cond_a

    .line 202
    .line 203
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    goto :goto_a

    .line 208
    :cond_a
    move v3, v2

    .line 209
    :goto_a
    add-int/2addr v0, v3

    .line 210
    mul-int/lit8 v0, v0, 0x29

    .line 211
    .line 212
    iget-object v3, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 213
    .line 214
    if-eqz v3, :cond_b

    .line 215
    .line 216
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    :cond_b
    add-int/2addr v0, v2

    .line 221
    mul-int/lit8 v0, v0, 0x29

    .line 222
    .line 223
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 224
    .line 225
    ushr-long v4, v2, v1

    .line 226
    .line 227
    xor-long/2addr v2, v4

    .line 228
    long-to-int v2, v2

    .line 229
    add-int/2addr v0, v2

    .line 230
    mul-int/lit8 v0, v0, 0x29

    .line 231
    .line 232
    iget v2, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 233
    .line 234
    add-int/2addr v0, v2

    .line 235
    mul-int/lit8 v0, v0, 0x29

    .line 236
    .line 237
    iget v2, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 238
    .line 239
    add-int/2addr v0, v2

    .line 240
    mul-int/lit8 v0, v0, 0x29

    .line 241
    .line 242
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 243
    .line 244
    ushr-long v4, v2, v1

    .line 245
    .line 246
    xor-long v1, v2, v4

    .line 247
    .line 248
    long-to-int v1, v1

    .line 249
    add-int/2addr v0, v1

    .line 250
    mul-int/lit8 v0, v0, 0x29

    .line 251
    .line 252
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 253
    .line 254
    if-eqz v1, :cond_c

    .line 255
    .line 256
    const/16 v1, 0x4cf

    .line 257
    .line 258
    goto :goto_b

    .line 259
    :cond_c
    const/16 v1, 0x4d5

    .line 260
    .line 261
    :goto_b
    add-int/2addr v0, v1

    .line 262
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 263
    .line 264
    :cond_d
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/LangModel;->new_()Lcom/p1/mobile/putong/data/LangModel;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 60
    .line 61
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_9

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 66
    .line 67
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/LiveGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
