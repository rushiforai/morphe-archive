.class public Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
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
            "Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "mymeetfeeditem"


# instance fields
.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public lowPopSeeCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public momentId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public momentMediaType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public online:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public passBy:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public pick:Lcom/p1/mobile/putong/core/data/PickInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public readStatus:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public relation:Lcom/p1/mobile/putong/core/data/MeetRelation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public seeCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public sortId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/core/data/FeedType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public userIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->nullCheck()V

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

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->clone()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/l320;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/l320;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetRelation;->clone()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 46
    .line 47
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->clone()Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 56
    .line 57
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 58
    .line 59
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 62
    .line 63
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PickInfo;->clone()Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 74
    .line 75
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 76
    .line 77
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 78
    .line 79
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 80
    .line 81
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 84
    .line 85
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 88
    .line 89
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 90
    .line 91
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->clone()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 84
    .line 85
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 90
    .line 91
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 112
    .line 113
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 114
    .line 115
    if-ne v1, v3, :cond_2

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 118
    .line 119
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 120
    .line 121
    if-ne v1, v3, :cond_2

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_2

    .line 132
    .line 133
    return v0

    .line 134
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mymeetfeeditem"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetRelation;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 100
    .line 101
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 105
    .line 106
    add-int/2addr v0, v1

    .line 107
    mul-int/lit8 v0, v0, 0x29

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 110
    .line 111
    if-eqz v1, :cond_7

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PickInfo;->hashCode()I

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
    mul-int/lit8 v0, v0, 0x29

    .line 121
    .line 122
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 123
    .line 124
    add-int/2addr v0, v1

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 128
    .line 129
    const/16 v3, 0x4d5

    .line 130
    .line 131
    const/16 v4, 0x4cf

    .line 132
    .line 133
    if-eqz v1, :cond_8

    .line 134
    .line 135
    move v1, v4

    .line 136
    goto :goto_8

    .line 137
    :cond_8
    move v1, v3

    .line 138
    :goto_8
    add-int/2addr v0, v1

    .line 139
    mul-int/lit8 v0, v0, 0x29

    .line 140
    .line 141
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    move v3, v4

    .line 146
    :cond_9
    add-int/2addr v0, v3

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz v1, :cond_a

    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    :cond_a
    add-int/2addr v0, v2

    .line 158
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 159
    .line 160
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->new_()Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PickInfo;->new_()Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 75
    .line 76
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 77
    .line 78
    if-nez v0, :cond_8

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 81
    .line 82
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
