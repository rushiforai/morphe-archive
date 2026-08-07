.class public Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivestickermetadataitem"


# instance fields
.field public adminUserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public animationUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public boldText:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public category:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public clickable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public color:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public contentArea:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public defaultContent:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public fontSize:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isSelected:Z

.field public maxWordCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public rank:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public updatedTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public version:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->isSelected:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->nullCheck()V

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

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 51
    .line 52
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 53
    .line 54
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 55
    .line 56
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 57
    .line 58
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 59
    .line 60
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 61
    .line 62
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 71
    .line 72
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 73
    .line 74
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 85
    .line 86
    if-eqz v1, :cond_1

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 93
    .line 94
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 95
    .line 96
    if-eqz v1, :cond_2

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 103
    .line 104
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 105
    .line 106
    if-eqz p0, :cond_3

    .line 107
    .line 108
    new-instance v1, Ll/k62;

    .line 109
    .line 110
    invoke-direct {v1}, Ll/k62;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 118
    .line 119
    :cond_3
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 64
    .line 65
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 66
    .line 67
    if-ne v1, v3, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 80
    .line 81
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 82
    .line 83
    if-ne v1, v3, :cond_2

    .line 84
    .line 85
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 86
    .line 87
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 88
    .line 89
    if-ne v1, v3, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 102
    .line 103
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 104
    .line 105
    cmp-long v1, v3, v5

    .line 106
    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 110
    .line 111
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 112
    .line 113
    cmp-long v1, v3, v5

    .line 114
    .line 115
    if-nez v1, :cond_2

    .line 116
    .line 117
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 118
    .line 119
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 120
    .line 121
    cmp-long v1, v3, v5

    .line 122
    .line 123
    if-nez v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 146
    .line 147
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 148
    .line 149
    if-ne v1, v3, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 162
    .line 163
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 164
    .line 165
    if-ne v1, v3, :cond_2

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 168
    .line 169
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 170
    .line 171
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 180
    .line 181
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_2

    .line 186
    .line 187
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 188
    .line 189
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 190
    .line 191
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    if-eqz p0, :cond_2

    .line 196
    .line 197
    return v0

    .line 198
    :cond_2
    return v2
.end method

.method public fillResult(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 14
    .line 15
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 18
    .line 19
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 26
    .line 27
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 34
    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 38
    .line 39
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 40
    .line 41
    return-object p1
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivestickermetadataitem"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

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
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 74
    .line 75
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    goto :goto_5

    .line 87
    :cond_5
    move v1, v2

    .line 88
    :goto_5
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 92
    .line 93
    add-int/2addr v0, v1

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 97
    .line 98
    const/16 v3, 0x4d5

    .line 99
    .line 100
    const/16 v4, 0x4cf

    .line 101
    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    move v1, v4

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v1, v3

    .line 107
    :goto_6
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    goto :goto_7

    .line 119
    :cond_7
    move v1, v2

    .line 120
    :goto_7
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 124
    .line 125
    const/16 v1, 0x20

    .line 126
    .line 127
    ushr-long v7, v5, v1

    .line 128
    .line 129
    xor-long/2addr v5, v7

    .line 130
    long-to-int v5, v5

    .line 131
    add-int/2addr v0, v5

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 135
    .line 136
    ushr-long v7, v5, v1

    .line 137
    .line 138
    xor-long/2addr v5, v7

    .line 139
    long-to-int v5, v5

    .line 140
    add-int/2addr v0, v5

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 144
    .line 145
    ushr-long v7, v5, v1

    .line 146
    .line 147
    xor-long/2addr v5, v7

    .line 148
    long-to-int v1, v5

    .line 149
    add-int/2addr v0, v1

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz v1, :cond_8

    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_8

    .line 161
    :cond_8
    move v1, v2

    .line 162
    :goto_8
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz v1, :cond_9

    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    goto :goto_9

    .line 174
    :cond_9
    move v1, v2

    .line 175
    :goto_9
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 179
    .line 180
    add-int/2addr v0, v1

    .line 181
    mul-int/lit8 v0, v0, 0x29

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz v1, :cond_a

    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    goto :goto_a

    .line 192
    :cond_a
    move v1, v2

    .line 193
    :goto_a
    add-int/2addr v0, v1

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 197
    .line 198
    if-eqz v1, :cond_b

    .line 199
    .line 200
    move v3, v4

    .line 201
    :cond_b
    add-int/2addr v0, v3

    .line 202
    mul-int/lit8 v0, v0, 0x29

    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 205
    .line 206
    if-eqz v1, :cond_c

    .line 207
    .line 208
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->hashCode()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    goto :goto_b

    .line 213
    :cond_c
    move v1, v2

    .line 214
    :goto_b
    add-int/2addr v0, v1

    .line 215
    mul-int/lit8 v0, v0, 0x29

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 218
    .line 219
    if-eqz v1, :cond_d

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->hashCode()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    goto :goto_c

    .line 226
    :cond_d
    move v1, v2

    .line 227
    :goto_c
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 231
    .line 232
    if-eqz v1, :cond_e

    .line 233
    .line 234
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    :cond_e
    add-int/2addr v0, v2

    .line 239
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 240
    .line 241
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 60
    .line 61
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_9

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 66
    .line 67
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 68
    .line 69
    if-nez v0, :cond_a

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 76
    .line 77
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 78
    .line 79
    if-nez v0, :cond_b

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 86
    .line 87
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 88
    .line 89
    if-nez v0, :cond_c

    .line 90
    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 97
    .line 98
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
