.class public Lcom/p1/mobile/putong/feed/data/Group;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "group"


# instance fields
.field public backgroundColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public description:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public groupType:Lcom/p1/mobile/putong/feed/data/GroupType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public headIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public hotTopics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/TopicMomentIdBox;",
            ">;"
        }
    .end annotation
.end field

.field public hotTopicsModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public joined:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public memberRole:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public preViewContent:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public relatedTopics:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public topics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/TopicMomentIdBox;",
            ">;"
        }
    .end annotation
.end field

.field public unReadMomentCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public userCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public userIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
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
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Group$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Group$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/Group;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Group$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Group$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/Group;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->relatedTopics:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopicsModels:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashSet;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->parseFieldSet:Ljava/util/HashSet;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/TopicMomentIdBox;)Lcom/p1/mobile/putong/data/TopicMomentIdBox;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->clone()Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/TopicMomentIdBox;)Lcom/p1/mobile/putong/data/TopicMomentIdBox;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->clone()Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/Group;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Group;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Group;->nullCheck()V

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

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Group;->clone()Lcom/p1/mobile/putong/feed/data/Group;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/Group;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Group;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    new-instance v2, Ll/sdk;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/sdk;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 56
    .line 57
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 58
    .line 59
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 62
    .line 63
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 66
    .line 67
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 74
    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 76
    .line 77
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 78
    .line 79
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 82
    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    new-instance v2, Ll/tdk;

    .line 86
    .line 87
    invoke-direct {v2}, Ll/tdk;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 95
    .line 96
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 97
    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    new-instance v2, Ll/udk;

    .line 101
    .line 102
    invoke-direct {v2}, Ll/udk;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 110
    .line 111
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v1, :cond_3

    .line 114
    .line 115
    new-instance v2, Ll/vdk;

    .line 116
    .line 117
    invoke-direct {v2}, Ll/vdk;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 125
    .line 126
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 127
    .line 128
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 129
    .line 130
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Group;->clone()Lcom/p1/mobile/putong/feed/data/Group;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/Group;

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
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Group;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 94
    .line 95
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    iget p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 102
    .line 103
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 104
    .line 105
    if-ne p1, v3, :cond_3

    .line 106
    .line 107
    iget p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 108
    .line 109
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 110
    .line 111
    if-ne p1, v3, :cond_3

    .line 112
    .line 113
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 114
    .line 115
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 116
    .line 117
    if-ne p1, v3, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_3

    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 130
    .line 131
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 132
    .line 133
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 140
    .line 141
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 142
    .line 143
    cmpl-double p1, v3, v5

    .line 144
    .line 145
    if-nez p1, :cond_3

    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 148
    .line 149
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 150
    .line 151
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_3

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 158
    .line 159
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 160
    .line 161
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_3

    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 168
    .line 169
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 170
    .line 171
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_3

    .line 176
    .line 177
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 178
    .line 179
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_3

    .line 186
    .line 187
    return v0

    .line 188
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "group"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_4

    .line 73
    :cond_4
    move v1, v2

    .line 74
    :goto_4
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    goto :goto_5

    .line 86
    :cond_5
    move v1, v2

    .line 87
    :goto_5
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    goto :goto_6

    .line 99
    :cond_6
    move v1, v2

    .line 100
    :goto_6
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_7

    .line 112
    :cond_7
    move v1, v2

    .line 113
    :goto_7
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 117
    .line 118
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 122
    .line 123
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x4cf

    .line 131
    .line 132
    goto :goto_8

    .line 133
    :cond_8
    const/16 v1, 0x4d5

    .line 134
    .line 135
    :goto_8
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 152
    .line 153
    if-eqz v1, :cond_a

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 163
    .line 164
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 165
    .line 166
    .line 167
    move-result-wide v3

    .line 168
    mul-int/lit8 v0, v0, 0x29

    .line 169
    .line 170
    const/16 v1, 0x20

    .line 171
    .line 172
    ushr-long v5, v3, v1

    .line 173
    .line 174
    xor-long/2addr v3, v5

    .line 175
    long-to-int v1, v3

    .line 176
    add-int/2addr v0, v1

    .line 177
    mul-int/lit8 v0, v0, 0x29

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 180
    .line 181
    if-eqz v1, :cond_b

    .line 182
    .line 183
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    goto :goto_b

    .line 188
    :cond_b
    move v1, v2

    .line 189
    :goto_b
    add-int/2addr v0, v1

    .line 190
    mul-int/lit8 v0, v0, 0x29

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 193
    .line 194
    if-eqz v1, :cond_c

    .line 195
    .line 196
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    goto :goto_c

    .line 201
    :cond_c
    move v1, v2

    .line 202
    :goto_c
    add-int/2addr v0, v1

    .line 203
    mul-int/lit8 v0, v0, 0x29

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 206
    .line 207
    if-eqz v1, :cond_d

    .line 208
    .line 209
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    goto :goto_d

    .line 214
    :cond_d
    move v1, v2

    .line 215
    :goto_d
    add-int/2addr v0, v1

    .line 216
    mul-int/lit8 v0, v0, 0x29

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 219
    .line 220
    if-eqz v1, :cond_e

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    :cond_e
    add-int/2addr v0, v2

    .line 227
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 228
    .line 229
    :cond_f
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isGroupAnonymousType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 2
    .line 3
    const-string v0, "anonymous_group"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_13

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Group;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "name"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "description"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    const-string v0, "preViewContent"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "memberRole"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 62
    .line 63
    :cond_4
    const-string v0, "state"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 74
    .line 75
    :cond_5
    const-string v0, "icon"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 86
    .line 87
    :cond_6
    const-string v0, "headIcon"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 98
    .line 99
    :cond_7
    const-string v0, "backgroundColors"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 110
    .line 111
    :cond_8
    const-string v0, "userCounter"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 120
    .line 121
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 122
    .line 123
    :cond_9
    const-string v0, "unReadMomentCounter"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 132
    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 134
    .line 135
    :cond_a
    const-string v0, "joined"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 144
    .line 145
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 146
    .line 147
    :cond_b
    const-string v0, "status"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 158
    .line 159
    :cond_c
    const-string v0, "groupType"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 170
    .line 171
    :cond_d
    const-string v0, "createdTime"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 180
    .line 181
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 182
    .line 183
    :cond_e
    const-string v0, "userIds"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 194
    .line 195
    :cond_f
    const-string v0, "topics"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 206
    .line 207
    :cond_10
    const-string v0, "hotTopics"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 218
    .line 219
    :cond_11
    const-string v0, "owner"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Group;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 228
    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 230
    .line 231
    :cond_12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->parseFieldSet:Ljava/util/HashSet;

    .line 232
    .line 233
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 234
    .line 235
    .line 236
    :cond_13
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Group;->mergeData(Lcom/p1/mobile/putong/feed/data/Group;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 23
    .line 24
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 29
    .line 30
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 31
    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 35
    .line 36
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v0, :cond_5

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 41
    .line 42
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 43
    .line 44
    if-nez v0, :cond_6

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 47
    .line 48
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 49
    .line 50
    if-nez v0, :cond_7

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 58
    .line 59
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 60
    .line 61
    if-nez v0, :cond_8

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 64
    .line 65
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 66
    .line 67
    if-nez v0, :cond_9

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 78
    .line 79
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 80
    .line 81
    if-nez v0, :cond_a

    .line 82
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 89
    .line 90
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 91
    .line 92
    if-nez v0, :cond_b

    .line 93
    .line 94
    new-instance v0, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 100
    .line 101
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 102
    .line 103
    if-nez v0, :cond_c

    .line 104
    .line 105
    new-instance v0, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 111
    .line 112
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 113
    .line 114
    if-nez v0, :cond_d

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 117
    .line 118
    :cond_d
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Group;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
