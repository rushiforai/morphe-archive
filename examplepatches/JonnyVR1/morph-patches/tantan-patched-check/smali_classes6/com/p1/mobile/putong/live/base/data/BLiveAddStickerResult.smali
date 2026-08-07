.class public Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveaddstickerresult"


# instance fields
.field public animationUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public boldText:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public category:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public color:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public content:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public contentArea:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public fontSize:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public giftId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public maxCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public templateId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public version:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->nullCheck()V

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

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 31
    .line 32
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 33
    .line 34
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 49
    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 53
    .line 54
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 61
    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 73
    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 81
    .line 82
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    new-instance v1, Ll/gr1;

    .line 87
    .line 88
    invoke-direct {v1}, Ll/gr1;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 96
    .line 97
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 64
    .line 65
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 66
    .line 67
    cmp-long v1, v3, v5

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 102
    .line 103
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 108
    .line 109
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 110
    .line 111
    if-ne v1, v3, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 124
    .line 125
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 126
    .line 127
    if-ne v1, v3, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 152
    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_2

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 162
    .line 163
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_2

    .line 168
    .line 169
    return v0

    .line 170
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveaddstickerresult"

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
    if-nez v0, :cond_e

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 74
    .line 75
    const/16 v1, 0x20

    .line 76
    .line 77
    ushr-long v5, v3, v1

    .line 78
    .line 79
    xor-long/2addr v3, v5

    .line 80
    long-to-int v1, v3

    .line 81
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    goto :goto_5

    .line 93
    :cond_5
    move v1, v2

    .line 94
    :goto_5
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v1, v2

    .line 107
    :goto_6
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 124
    .line 125
    add-int/2addr v0, v1

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 129
    .line 130
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v1, :cond_8

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    goto :goto_8

    .line 142
    :cond_8
    move v1, v2

    .line 143
    :goto_8
    add-int/2addr v0, v1

    .line 144
    mul-int/lit8 v0, v0, 0x29

    .line 145
    .line 146
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 147
    .line 148
    if-eqz v1, :cond_9

    .line 149
    .line 150
    const/16 v1, 0x4cf

    .line 151
    .line 152
    goto :goto_9

    .line 153
    :cond_9
    const/16 v1, 0x4d5

    .line 154
    .line 155
    :goto_9
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz v1, :cond_a

    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    goto :goto_a

    .line 167
    :cond_a
    move v1, v2

    .line 168
    :goto_a
    add-int/2addr v0, v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz v1, :cond_b

    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    goto :goto_b

    .line 180
    :cond_b
    move v1, v2

    .line 181
    :goto_b
    add-int/2addr v0, v1

    .line 182
    mul-int/lit8 v0, v0, 0x29

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 185
    .line 186
    if-eqz v1, :cond_c

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->hashCode()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    goto :goto_c

    .line 193
    :cond_c
    move v1, v2

    .line 194
    :goto_c
    add-int/2addr v0, v1

    .line 195
    mul-int/lit8 v0, v0, 0x29

    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 198
    .line 199
    if-eqz v1, :cond_d

    .line 200
    .line 201
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    :cond_d
    add-int/2addr v0, v2

    .line 206
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 207
    .line 208
    :cond_e
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 60
    .line 61
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_9

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 66
    .line 67
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_a

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 72
    .line 73
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 74
    .line 75
    if-nez v0, :cond_b

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 82
    .line 83
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 84
    .line 85
    if-nez v0, :cond_c

    .line 86
    .line 87
    new-instance v0, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 93
    .line 94
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
