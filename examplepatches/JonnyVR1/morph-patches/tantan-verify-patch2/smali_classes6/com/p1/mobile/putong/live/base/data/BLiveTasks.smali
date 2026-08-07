.class public Lcom/p1/mobile/putong/live/base/data/BLiveTasks;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveTasks;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivetasks"


# instance fields
.field public bubbleText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public category:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public completeCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public completed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public headLineText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public imageUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public localTaskId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public preTaskId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public preTaskIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public receivedReward:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public showHeadLineText:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public showRewardCountInHeadLine:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public taskId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public totalCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveTasks;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->nullCheck()V

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

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveTasks;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/z62;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/z62;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completed:Z

    .line 38
    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completed:Z

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->receivedReward:Z

    .line 42
    .line 43
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->receivedReward:Z

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 54
    .line 55
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

    .line 58
    .line 59
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->totalCount:J

    .line 60
    .line 61
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->totalCount:J

    .line 62
    .line 63
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completeCount:J

    .line 64
    .line 65
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completeCount:J

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showHeadLineText:Z

    .line 68
    .line 69
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showHeadLineText:Z

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showRewardCountInHeadLine:Z

    .line 72
    .line 73
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showRewardCountInHeadLine:Z

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 80
    .line 81
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 82
    .line 83
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completed:Z

    .line 64
    .line 65
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completed:Z

    .line 66
    .line 67
    if-ne v1, v3, :cond_2

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->receivedReward:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->receivedReward:Z

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->totalCount:J

    .line 96
    .line 97
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->totalCount:J

    .line 98
    .line 99
    cmp-long v1, v3, v5

    .line 100
    .line 101
    if-nez v1, :cond_2

    .line 102
    .line 103
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completeCount:J

    .line 104
    .line 105
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completeCount:J

    .line 106
    .line 107
    cmp-long v1, v3, v5

    .line 108
    .line 109
    if-nez v1, :cond_2

    .line 110
    .line 111
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showHeadLineText:Z

    .line 112
    .line 113
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showHeadLineText:Z

    .line 114
    .line 115
    if-ne v1, v3, :cond_2

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showRewardCountInHeadLine:Z

    .line 118
    .line 119
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showRewardCountInHeadLine:Z

    .line 120
    .line 121
    if-ne v1, v3, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-eqz p0, :cond_2

    .line 142
    .line 143
    return v0

    .line 144
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivetasks"

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
    if-nez v0, :cond_d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completed:Z

    .line 74
    .line 75
    const/16 v3, 0x4d5

    .line 76
    .line 77
    const/16 v4, 0x4cf

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    move v1, v4

    .line 82
    goto :goto_5

    .line 83
    :cond_5
    move v1, v3

    .line 84
    :goto_5
    add-int/2addr v0, v1

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->receivedReward:Z

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    move v1, v4

    .line 92
    goto :goto_6

    .line 93
    :cond_6
    move v1, v3

    .line 94
    :goto_6
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 98
    .line 99
    if-eqz v1, :cond_7

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    goto :goto_7

    .line 106
    :cond_7
    move v1, v2

    .line 107
    :goto_7
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz v1, :cond_8

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    goto :goto_8

    .line 119
    :cond_8
    move v1, v2

    .line 120
    :goto_8
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->totalCount:J

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
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->completeCount:J

    .line 135
    .line 136
    ushr-long v7, v5, v1

    .line 137
    .line 138
    xor-long/2addr v5, v7

    .line 139
    long-to-int v1, v5

    .line 140
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showHeadLineText:Z

    .line 144
    .line 145
    if-eqz v1, :cond_9

    .line 146
    .line 147
    move v1, v4

    .line 148
    goto :goto_9

    .line 149
    :cond_9
    move v1, v3

    .line 150
    :goto_9
    add-int/2addr v0, v1

    .line 151
    mul-int/lit8 v0, v0, 0x29

    .line 152
    .line 153
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->showRewardCountInHeadLine:Z

    .line 154
    .line 155
    if-eqz v1, :cond_a

    .line 156
    .line 157
    move v3, v4

    .line 158
    :cond_a
    add-int/2addr v0, v3

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

    .line 162
    .line 163
    if-eqz v1, :cond_b

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    goto :goto_a

    .line 170
    :cond_b
    move v1, v2

    .line 171
    :goto_a
    add-int/2addr v0, v1

    .line 172
    mul-int/lit8 v0, v0, 0x29

    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz v1, :cond_c

    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    :cond_c
    add-int/2addr v0, v2

    .line 183
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 184
    .line 185
    :cond_d
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->taskId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->preTaskIds:Ljava/util/List;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->imageUrl:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->category:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 47
    .line 48
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

    .line 49
    .line 50
    if-nez v0, :cond_6

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->headLineText:Ljava/lang/String;

    .line 53
    .line 54
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

    .line 55
    .line 56
    if-nez v0, :cond_7

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->bubbleText:Ljava/lang/String;

    .line 59
    .line 60
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 61
    .line 62
    if-nez v0, :cond_8

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->localTaskId:Ljava/lang/String;

    .line 65
    .line 66
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
