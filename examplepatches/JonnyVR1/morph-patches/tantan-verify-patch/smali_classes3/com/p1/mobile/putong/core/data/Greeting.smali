.class public Lcom/p1/mobile/putong/core/data/Greeting;
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
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "greeting"


# instance fields
.field public actorUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public channel:Lcom/p1/mobile/putong/data/Channel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public clearedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public clearedUntil:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public kankan:Lcom/p1/mobile/putong/data/IdBoxed;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public latestTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public localIsUnread:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public mm:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public moment:Lcom/p1/mobile/putong/data/IdBoxed;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public otherUser:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public readUntil:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public updatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public userMessageCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Greeting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Greeting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/Greeting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/Greeting$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Greeting$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/Greeting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Greeting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Greeting;->nullCheck()V

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

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Greeting;->clone()Lcom/p1/mobile/putong/core/data/Greeting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Greeting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingMessages;->clone()Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 41
    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 45
    .line 46
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IdBoxed;->clone()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 57
    .line 58
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 59
    .line 60
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 63
    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 65
    .line 66
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 67
    .line 68
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 71
    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IdBoxed;->clone()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 79
    .line 80
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 81
    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 87
    .line 88
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 89
    .line 90
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 91
    .line 92
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 93
    .line 94
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 95
    .line 96
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Greeting;->clone()Lcom/p1/mobile/putong/core/data/Greeting;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 84
    .line 85
    iget v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 90
    .line 91
    iget v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 106
    .line 107
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 108
    .line 109
    cmpl-double v1, v3, v5

    .line 110
    .line 111
    if-nez v1, :cond_2

    .line 112
    .line 113
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 114
    .line 115
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 116
    .line 117
    cmpl-double v1, v3, v5

    .line 118
    .line 119
    if-nez v1, :cond_2

    .line 120
    .line 121
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 122
    .line 123
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 124
    .line 125
    cmpl-double v1, v3, v5

    .line 126
    .line 127
    if-nez v1, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 160
    .line 161
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 162
    .line 163
    cmpl-double v1, v3, v5

    .line 164
    .line 165
    if-nez v1, :cond_2

    .line 166
    .line 167
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 168
    .line 169
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 170
    .line 171
    if-ne p0, p1, :cond_2

    .line 172
    .line 173
    return v0

    .line 174
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "greeting"

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
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingMessages;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 100
    .line 101
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 105
    .line 106
    add-int/2addr v0, v1

    .line 107
    mul-int/lit8 v0, v0, 0x29

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 110
    .line 111
    if-eqz v1, :cond_7

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IdBoxed;->hashCode()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    goto :goto_7

    .line 118
    :cond_7
    move v1, v2

    .line 119
    :goto_7
    add-int/2addr v0, v1

    .line 120
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 121
    .line 122
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 123
    .line 124
    .line 125
    move-result-wide v3

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    const/16 v1, 0x20

    .line 129
    .line 130
    ushr-long v5, v3, v1

    .line 131
    .line 132
    xor-long/2addr v3, v5

    .line 133
    long-to-int v3, v3

    .line 134
    add-int/2addr v0, v3

    .line 135
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 136
    .line 137
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 138
    .line 139
    .line 140
    move-result-wide v3

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    ushr-long v5, v3, v1

    .line 144
    .line 145
    xor-long/2addr v3, v5

    .line 146
    long-to-int v3, v3

    .line 147
    add-int/2addr v0, v3

    .line 148
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 149
    .line 150
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 151
    .line 152
    .line 153
    move-result-wide v3

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    ushr-long v5, v3, v1

    .line 157
    .line 158
    xor-long/2addr v3, v5

    .line 159
    long-to-int v3, v3

    .line 160
    add-int/2addr v0, v3

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 164
    .line 165
    if-eqz v3, :cond_8

    .line 166
    .line 167
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/IdBoxed;->hashCode()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    goto :goto_8

    .line 172
    :cond_8
    move v3, v2

    .line 173
    :goto_8
    add-int/2addr v0, v3

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 177
    .line 178
    if-eqz v3, :cond_9

    .line 179
    .line 180
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    goto :goto_9

    .line 185
    :cond_9
    move v3, v2

    .line 186
    :goto_9
    add-int/2addr v0, v3

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz v3, :cond_a

    .line 192
    .line 193
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    :cond_a
    add-int/2addr v0, v2

    .line 198
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 199
    .line 200
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 201
    .line 202
    .line 203
    move-result-wide v2

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    ushr-long v4, v2, v1

    .line 207
    .line 208
    xor-long v1, v2, v4

    .line 209
    .line 210
    long-to-int v1, v1

    .line 211
    add-int/2addr v0, v1

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 215
    .line 216
    if-eqz v1, :cond_b

    .line 217
    .line 218
    const/16 v1, 0x4cf

    .line 219
    .line 220
    goto :goto_a

    .line 221
    :cond_b
    const/16 v1, 0x4d5

    .line 222
    .line 223
    :goto_a
    add-int/2addr v0, v1

    .line 224
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 225
    .line 226
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingMessages;->new_()Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 58
    .line 59
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 60
    .line 61
    if-nez v0, :cond_8

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 68
    .line 69
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 70
    .line 71
    if-nez v0, :cond_9

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/data/Channel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/data/Channel;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 82
    .line 83
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 84
    .line 85
    if-nez v0, :cond_a

    .line 86
    .line 87
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 88
    .line 89
    :cond_a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Greeting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
