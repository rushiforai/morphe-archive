.class public Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
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
            "Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "mymeetentryfeed"


# instance fields
.field public feedType:Lcom/p1/mobile/putong/core/data/FeedType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public highPopSeeCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public liveType:Lcom/p1/mobile/putong/core/data/LiveType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public momentText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public newCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public publishTime:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public publishTimestamp:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public relation:Lcom/p1/mobile/putong/core/data/MeetRelation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public sortId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public subText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public userIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->nullCheck()V

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

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/g320;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/g320;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetRelation;->clone()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 66
    .line 67
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 68
    .line 69
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 70
    .line 71
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 116
    .line 117
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 118
    .line 119
    cmp-long p0, v3, p0

    .line 120
    .line 121
    if-nez p0, :cond_2

    .line 122
    .line 123
    return v0

    .line 124
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mymeetentryfeed"

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
    if-nez v0, :cond_9

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

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
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 66
    .line 67
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    goto :goto_4

    .line 79
    :cond_4
    move v1, v2

    .line 80
    :goto_4
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    goto :goto_5

    .line 92
    :cond_5
    move v1, v2

    .line 93
    :goto_5
    add-int/2addr v0, v1

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    goto :goto_6

    .line 105
    :cond_6
    move v1, v2

    .line 106
    :goto_6
    add-int/2addr v0, v1

    .line 107
    mul-int/lit8 v0, v0, 0x29

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v1, :cond_7

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 123
    .line 124
    if-eqz v1, :cond_8

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetRelation;->hashCode()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    :cond_8
    add-int/2addr v0, v2

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 134
    .line 135
    const/16 v3, 0x20

    .line 136
    .line 137
    ushr-long v3, v1, v3

    .line 138
    .line 139
    xor-long/2addr v1, v3

    .line 140
    long-to-int v1, v1

    .line 141
    add-int/2addr v0, v1

    .line 142
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 143
    .line 144
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, ""

    .line 43
    .line 44
    if-nez v0, :cond_3

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 47
    .line 48
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 49
    .line 50
    if-nez v0, :cond_4

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 53
    .line 54
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 55
    .line 56
    if-nez v0, :cond_5

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 59
    .line 60
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 61
    .line 62
    if-nez v0, :cond_6

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 71
    .line 72
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 73
    .line 74
    if-nez v0, :cond_8

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 81
    .line 82
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
