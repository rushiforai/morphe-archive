.class public Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;",
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
            "Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "momentvoiceliveinfos"


# instance fields
.field public anchorUserID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public audienceCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public liveID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public memberCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public memberUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MemberUsers;",
            ">;"
        }
    .end annotation
.end field

.field public momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
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

.field private requestUrl:Ljava/lang/String;

.field public roomID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public schemaSearch:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/feed/data/LiveType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public topicID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public topicName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/MemberUsers;)Lcom/p1/mobile/putong/feed/data/MemberUsers;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MemberUsers;->clone()Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->nullCheck()V

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

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->clone()Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    new-instance v2, Ll/vu00;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/vu00;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 60
    .line 61
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 62
    .line 63
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 70
    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->clone()Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 78
    .line 79
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->clone()Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

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
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

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
    iget p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 62
    .line 63
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 64
    .line 65
    if-ne p1, v3, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 68
    .line 69
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 70
    .line 71
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_3

    .line 106
    .line 107
    iget p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 108
    .line 109
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 110
    .line 111
    if-ne p1, v3, :cond_3

    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_3

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 124
    .line 125
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 126
    .line 127
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_3

    .line 132
    .line 133
    return v0

    .line 134
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "momentvoiceliveinfos"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 65
    .line 66
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    goto :goto_4

    .line 78
    :cond_4
    move v1, v2

    .line 79
    :goto_4
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    goto :goto_5

    .line 91
    :cond_5
    move v1, v2

    .line 92
    :goto_5
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    goto :goto_6

    .line 104
    :cond_6
    move v1, v2

    .line 105
    :goto_6
    add-int/2addr v0, v1

    .line 106
    mul-int/lit8 v0, v0, 0x29

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 109
    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    goto :goto_7

    .line 117
    :cond_7
    move v1, v2

    .line 118
    :goto_7
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 122
    .line 123
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_8

    .line 135
    :cond_8
    move v1, v2

    .line 136
    :goto_8
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 140
    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    :cond_9
    add-int/2addr v0, v2

    .line 148
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 149
    .line 150
    :cond_a
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->parseFieldSet:Ljava/util/HashSet;

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

.method public mergeData(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_d

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "anchorUserID"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "liveID"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    const-string v0, "roomID"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "schemaSearch"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 62
    .line 63
    :cond_4
    const-string v0, "memberCount"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 72
    .line 73
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 74
    .line 75
    :cond_5
    const-string v0, "state"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 86
    .line 87
    :cond_6
    const-string v0, "title"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 98
    .line 99
    :cond_7
    const-string v0, "topicID"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 110
    .line 111
    :cond_8
    const-string v0, "memberUsers"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 122
    .line 123
    :cond_9
    const-string v0, "audienceCount"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 132
    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 134
    .line 135
    :cond_a
    const-string v0, "topicName"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 146
    .line 147
    :cond_b
    const-string v0, "momentVoiceUser"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 156
    .line 157
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 158
    .line 159
    :cond_c
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->parseFieldSet:Ljava/util/HashSet;

    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 162
    .line 163
    .line 164
    :cond_d
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->mergeData(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 23
    .line 24
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 29
    .line 30
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 31
    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 43
    .line 44
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_5

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 49
    .line 50
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_6

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 55
    .line 56
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 57
    .line 58
    if-nez v0, :cond_7

    .line 59
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 66
    .line 67
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_8

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 72
    .line 73
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 74
    .line 75
    if-nez v0, :cond_9

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->new_()Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 82
    .line 83
    :cond_9
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
