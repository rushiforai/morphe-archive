.class public Lcom/p1/mobile/putong/feed/data/RawFeed;
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
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "rawfeed"


# instance fields
.field public activityName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public canGreeting:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public city:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public duplicateImgs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public isRoamHighlight:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public locationName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation
.end field

.field public recommendReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public recommendReasonBackgroundColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public recommendReasonFontColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public recommendReasonIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public recommendTime:D

.field public relationshipIconUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public relationshipName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public relationshipType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public showLikeSplitLine:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public showUnreadSplitLine:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public states:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/RawFeed$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/RawFeed$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/RawFeed$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/RawFeed$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BubbleInfo;->clone()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/RawFeed;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/RawFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/RawFeed;->nullCheck()V

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

    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/RawFeed;->clone()Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/RawFeed;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/RawFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;->clone()Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 27
    .line 28
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendTime:D

    .line 29
    .line 30
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendTime:D

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 49
    .line 50
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    new-instance v2, Ll/llc0;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/llc0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 70
    .line 71
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 76
    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/InteractionReason;->clone()Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 84
    .line 85
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 86
    .line 87
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 90
    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 92
    .line 93
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 94
    .line 95
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 98
    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 106
    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 110
    .line 111
    if-eqz v1, :cond_3

    .line 112
    .line 113
    new-instance v2, Ll/mlc0;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/mlc0;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 123
    .line 124
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 125
    .line 126
    if-eqz p0, :cond_4

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentExpose;->clone()Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 133
    .line 134
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/RawFeed;->clone()Lcom/p1/mobile/putong/feed/data/RawFeed;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendTime:D

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendTime:D

    .line 52
    .line 53
    cmpl-double v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 98
    .line 99
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 144
    .line 145
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 146
    .line 147
    if-ne v1, v3, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 160
    .line 161
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 162
    .line 163
    if-ne v1, v3, :cond_2

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_2

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_2

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_2

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 196
    .line 197
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 198
    .line 199
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_2

    .line 204
    .line 205
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 208
    .line 209
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_2

    .line 214
    .line 215
    return v0

    .line 216
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "rawfeed"

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
    if-nez v0, :cond_15

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 35
    .line 36
    const/16 v3, 0x4d5

    .line 37
    .line 38
    const/16 v4, 0x4cf

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    move v1, v4

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v3

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v2

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    iget-wide v5, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendTime:D

    .line 60
    .line 61
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 62
    .line 63
    .line 64
    move-result-wide v5

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    const/16 v1, 0x20

    .line 68
    .line 69
    ushr-long v7, v5, v1

    .line 70
    .line 71
    xor-long/2addr v5, v7

    .line 72
    long-to-int v1, v5

    .line 73
    add-int/2addr v0, v1

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    goto :goto_4

    .line 85
    :cond_4
    move v1, v2

    .line 86
    :goto_4
    add-int/2addr v0, v1

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v1, :cond_5

    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    goto :goto_5

    .line 98
    :cond_5
    move v1, v2

    .line 99
    :goto_5
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v1, :cond_6

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    goto :goto_6

    .line 111
    :cond_6
    move v1, v2

    .line 112
    :goto_6
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v1, :cond_7

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    goto :goto_7

    .line 124
    :cond_7
    move v1, v2

    .line 125
    :goto_7
    add-int/2addr v0, v1

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    .line 129
    .line 130
    if-eqz v1, :cond_8

    .line 131
    .line 132
    move v1, v4

    .line 133
    goto :goto_8

    .line 134
    :cond_8
    move v1, v3

    .line 135
    :goto_8
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v1, :cond_9

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_9

    .line 147
    :cond_9
    move v1, v2

    .line 148
    :goto_9
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 152
    .line 153
    if-eqz v1, :cond_a

    .line 154
    .line 155
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_a

    .line 160
    :cond_a
    move v1, v2

    .line 161
    :goto_a
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 165
    .line 166
    if-eqz v1, :cond_b

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    goto :goto_b

    .line 173
    :cond_b
    move v1, v2

    .line 174
    :goto_b
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 178
    .line 179
    if-eqz v1, :cond_c

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/InteractionReason;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_c

    .line 186
    :cond_c
    move v1, v2

    .line 187
    :goto_c
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 191
    .line 192
    if-eqz v1, :cond_d

    .line 193
    .line 194
    move v1, v4

    .line 195
    goto :goto_d

    .line 196
    :cond_d
    move v1, v3

    .line 197
    :goto_d
    add-int/2addr v0, v1

    .line 198
    mul-int/lit8 v0, v0, 0x29

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz v1, :cond_e

    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    goto :goto_e

    .line 209
    :cond_e
    move v1, v2

    .line 210
    :goto_e
    add-int/2addr v0, v1

    .line 211
    mul-int/lit8 v0, v0, 0x29

    .line 212
    .line 213
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 214
    .line 215
    if-eqz v1, :cond_f

    .line 216
    .line 217
    move v3, v4

    .line 218
    :cond_f
    add-int/2addr v0, v3

    .line 219
    mul-int/lit8 v0, v0, 0x29

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 222
    .line 223
    if-eqz v1, :cond_10

    .line 224
    .line 225
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    goto :goto_f

    .line 230
    :cond_10
    move v1, v2

    .line 231
    :goto_f
    add-int/2addr v0, v1

    .line 232
    mul-int/lit8 v0, v0, 0x29

    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 235
    .line 236
    if-eqz v1, :cond_11

    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    goto :goto_10

    .line 243
    :cond_11
    move v1, v2

    .line 244
    :goto_10
    add-int/2addr v0, v1

    .line 245
    mul-int/lit8 v0, v0, 0x29

    .line 246
    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 248
    .line 249
    if-eqz v1, :cond_12

    .line 250
    .line 251
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    goto :goto_11

    .line 256
    :cond_12
    move v1, v2

    .line 257
    :goto_11
    add-int/2addr v0, v1

    .line 258
    mul-int/lit8 v0, v0, 0x29

    .line 259
    .line 260
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 261
    .line 262
    if-eqz v1, :cond_13

    .line 263
    .line 264
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    goto :goto_12

    .line 269
    :cond_13
    move v1, v2

    .line 270
    :goto_12
    add-int/2addr v0, v1

    .line 271
    mul-int/lit8 v0, v0, 0x29

    .line 272
    .line 273
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 274
    .line 275
    if-eqz v1, :cond_14

    .line 276
    .line 277
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentExpose;->hashCode()I

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    :cond_14
    add-int/2addr v0, v2

    .line 282
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 283
    .line 284
    :cond_15
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 61
    .line 62
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 63
    .line 64
    if-nez v0, :cond_9

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/InteractionReason;->new_()Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 71
    .line 72
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 73
    .line 74
    if-nez v0, :cond_a

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 77
    .line 78
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 79
    .line 80
    if-nez v0, :cond_b

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 83
    .line 84
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 85
    .line 86
    if-nez v0, :cond_c

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 89
    .line 90
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 91
    .line 92
    if-nez v0, :cond_d

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 95
    .line 96
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 97
    .line 98
    if-nez v0, :cond_e

    .line 99
    .line 100
    new-instance v0, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 106
    .line 107
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 108
    .line 109
    if-nez v0, :cond_f

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentExpose;->new_()Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 116
    .line 117
    :cond_f
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/data/RawFeed;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/RawFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->extra:Lcom/p1/mobile/putong/feed/data/MomentFeedsExtra;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->activityName:Ljava/lang/String;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_4

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_6

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_7

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipType:Ljava/lang/String;

    .line 117
    .line 118
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 119
    .line 120
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 121
    .line 122
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_8

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 131
    .line 132
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_9

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 145
    .line 146
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 147
    .line 148
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 149
    .line 150
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_a

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 157
    .line 158
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 159
    .line 160
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_b

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->city:Ljava/lang/String;

    .line 173
    .line 174
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 175
    .line 176
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 177
    .line 178
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_c

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 185
    .line 186
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonIcon:Ljava/lang/String;

    .line 187
    .line 188
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 189
    .line 190
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_d

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonBackgroundColor:Ljava/lang/String;

    .line 201
    .line 202
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 203
    .line 204
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_e

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 213
    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReasonFontColor:Ljava/lang/String;

    .line 215
    .line 216
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 217
    .line 218
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 219
    .line 220
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_f

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 227
    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 229
    .line 230
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 231
    .line 232
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 233
    .line 234
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    if-nez p1, :cond_10

    .line 239
    .line 240
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 241
    .line 242
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->momentExpose:Lcom/p1/mobile/putong/feed/data/MomentExpose;

    .line 243
    .line 244
    :cond_10
    new-instance p0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 245
    .line 246
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/RawFeed;-><init>()V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/data/RawFeed;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    if-eqz p0, :cond_11

    .line 254
    .line 255
    const/4 p0, 0x0

    .line 256
    return-object p0

    .line 257
    :cond_11
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
