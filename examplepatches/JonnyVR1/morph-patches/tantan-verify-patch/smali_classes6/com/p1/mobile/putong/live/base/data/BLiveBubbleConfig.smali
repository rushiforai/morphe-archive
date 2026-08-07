.class public Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivebubbleconfig"


# instance fields
.field public bubbleDisappear:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public bubbleEndColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public bubbleEveryDayShowMaxCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public bubbleShowAfterWatch:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public bubbleShowDisappearDays:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public bubbleShowNotMatchedTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public bubbleStartColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public bubbleTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public bubbleTextList:Ljava/util/List;
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

.field public bubbleTimeInterval:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public bubbleUserShowMaxCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public buttonId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public disAppearMod:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public disappearOnClick:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public liveType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public subType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->nullCheck()V

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

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/ks1;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/ks1;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 46
    .line 47
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 50
    .line 51
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 54
    .line 55
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 56
    .line 57
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 58
    .line 59
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 74
    .line 75
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 76
    .line 77
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 78
    .line 79
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disappearOnClick:Z

    .line 82
    .line 83
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disappearOnClick:Z

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 86
    .line 87
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 88
    .line 89
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 74
    .line 75
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 80
    .line 81
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 82
    .line 83
    if-ne v1, v3, :cond_2

    .line 84
    .line 85
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 86
    .line 87
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 88
    .line 89
    if-ne v1, v3, :cond_2

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 92
    .line 93
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 98
    .line 99
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 100
    .line 101
    cmp-long v1, v3, v5

    .line 102
    .line 103
    if-nez v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 136
    .line 137
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 138
    .line 139
    if-ne v1, v3, :cond_2

    .line 140
    .line 141
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 142
    .line 143
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 144
    .line 145
    if-ne v1, v3, :cond_2

    .line 146
    .line 147
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disappearOnClick:Z

    .line 148
    .line 149
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disappearOnClick:Z

    .line 150
    .line 151
    if-ne v1, v3, :cond_2

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-eqz p0, :cond_2

    .line 162
    .line 163
    return v0

    .line 164
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivebubbleconfig"

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
    if-nez v0, :cond_b

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 87
    .line 88
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 92
    .line 93
    add-int/2addr v0, v1

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 97
    .line 98
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 102
    .line 103
    add-int/2addr v0, v1

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 107
    .line 108
    const/16 v1, 0x20

    .line 109
    .line 110
    ushr-long v5, v3, v1

    .line 111
    .line 112
    xor-long/2addr v3, v5

    .line 113
    long-to-int v1, v3

    .line 114
    add-int/2addr v0, v1

    .line 115
    mul-int/lit8 v0, v0, 0x29

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 118
    .line 119
    if-eqz v1, :cond_6

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    goto :goto_6

    .line 126
    :cond_6
    move v1, v2

    .line 127
    :goto_6
    add-int/2addr v0, v1

    .line 128
    mul-int/lit8 v0, v0, 0x29

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 131
    .line 132
    if-eqz v1, :cond_7

    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    goto :goto_7

    .line 139
    :cond_7
    move v1, v2

    .line 140
    :goto_7
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz v1, :cond_8

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    goto :goto_8

    .line 152
    :cond_8
    move v1, v2

    .line 153
    :goto_8
    add-int/2addr v0, v1

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 157
    .line 158
    add-int/2addr v0, v1

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 162
    .line 163
    add-int/2addr v0, v1

    .line 164
    mul-int/lit8 v0, v0, 0x29

    .line 165
    .line 166
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disappearOnClick:Z

    .line 167
    .line 168
    if-eqz v1, :cond_9

    .line 169
    .line 170
    const/16 v1, 0x4cf

    .line 171
    .line 172
    goto :goto_9

    .line 173
    :cond_9
    const/16 v1, 0x4d5

    .line 174
    .line 175
    :goto_9
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v1, :cond_a

    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    :cond_a
    add-int/2addr v0, v2

    .line 187
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 188
    .line 189
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 49
    .line 50
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_7

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 61
    .line 62
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 63
    .line 64
    if-nez v0, :cond_9

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 67
    .line 68
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
