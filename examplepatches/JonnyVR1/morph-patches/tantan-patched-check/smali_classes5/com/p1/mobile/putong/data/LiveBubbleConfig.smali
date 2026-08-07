.class public Lcom/p1/mobile/putong/data/LiveBubbleConfig;
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
            "Lcom/p1/mobile/putong/data/LiveBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/LiveBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "livebubbleconfig"


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
        index = 0xd
    .end annotation
.end field

.field public bubbleUserShowMaxCount:I
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

.field public needCheckHasEnterLive:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public needCheckHasEnterSquare:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public subType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
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
    new-instance v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/LiveBubbleConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->nullCheck()V

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

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->clone()Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/LiveBubbleConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/d1s;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/d1s;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 46
    .line 47
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 50
    .line 51
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 54
    .line 55
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 58
    .line 59
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 62
    .line 63
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 64
    .line 65
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 66
    .line 67
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 74
    .line 75
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 76
    .line 77
    iget p0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 78
    .line 79
    iput p0, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 80
    .line 81
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->clone()Lcom/p1/mobile/putong/data/LiveBubbleConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 74
    .line 75
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 80
    .line 81
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 82
    .line 83
    if-ne v1, v3, :cond_2

    .line 84
    .line 85
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 86
    .line 87
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 88
    .line 89
    if-ne v1, v3, :cond_2

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 92
    .line 93
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 98
    .line 99
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 104
    .line 105
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 110
    .line 111
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 112
    .line 113
    cmp-long v1, v3, v5

    .line 114
    .line 115
    if-nez v1, :cond_2

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 128
    .line 129
    iget v3, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 130
    .line 131
    if-ne v1, v3, :cond_2

    .line 132
    .line 133
    iget p0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 134
    .line 135
    iget p1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 136
    .line 137
    if-ne p0, p1, :cond_2

    .line 138
    .line 139
    return v0

    .line 140
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "livebubbleconfig"

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
    if-nez v0, :cond_9

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 87
    .line 88
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 92
    .line 93
    add-int/2addr v0, v1

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 97
    .line 98
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 102
    .line 103
    add-int/2addr v0, v1

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 107
    .line 108
    const/16 v3, 0x4d5

    .line 109
    .line 110
    const/16 v4, 0x4cf

    .line 111
    .line 112
    if-eqz v1, :cond_6

    .line 113
    .line 114
    move v1, v4

    .line 115
    goto :goto_6

    .line 116
    :cond_6
    move v1, v3

    .line 117
    :goto_6
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 121
    .line 122
    if-eqz v1, :cond_7

    .line 123
    .line 124
    move v3, v4

    .line 125
    :cond_7
    add-int/2addr v0, v3

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 129
    .line 130
    const/16 v1, 0x20

    .line 131
    .line 132
    ushr-long v5, v3, v1

    .line 133
    .line 134
    xor-long/2addr v3, v5

    .line 135
    long-to-int v1, v3

    .line 136
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v1, :cond_8

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    :cond_8
    add-int/2addr v0, v2

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 151
    .line 152
    add-int/2addr v0, v1

    .line 153
    mul-int/lit8 v0, v0, 0x29

    .line 154
    .line 155
    iget v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 156
    .line 157
    add-int/2addr v0, v1

    .line 158
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 159
    .line 160
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 49
    .line 50
    :cond_6
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
