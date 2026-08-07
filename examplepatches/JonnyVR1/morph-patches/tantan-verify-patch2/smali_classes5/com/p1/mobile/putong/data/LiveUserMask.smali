.class public Lcom/p1/mobile/putong/data/LiveUserMask;
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
            "Lcom/p1/mobile/putong/data/LiveUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/LiveUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "liveusermask"


# instance fields
.field public avatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public avatarResourceType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public color:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public fakeId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public fakeType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public gender:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isFresh:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public originUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public userId:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserMask$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserMask$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/LiveUserMask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserMask$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserMask$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/LiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/LiveUserMask;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserMask;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserMask;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LiveUserMask;->nullCheck()V

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

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveUserMask;->clone()Lcom/p1/mobile/putong/data/LiveUserMask;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/LiveUserMask;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserMask;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserMask;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->isFresh:Z

    .line 55
    .line 56
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->isFresh:Z

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 59
    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveAvatarConfig;->clone()Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 67
    .line 68
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveProfileConfig;->clone()Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 77
    .line 78
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 79
    .line 80
    iput-object p0, v0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 81
    .line 82
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveUserMask;->clone()Lcom/p1/mobile/putong/data/LiveUserMask;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/LiveUserMask;

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveUserMask;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->isFresh:Z

    .line 134
    .line 135
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->isFresh:Z

    .line 136
    .line 137
    if-ne v1, v3, :cond_2

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

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
    const-string p0, "liveusermask"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_9

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_9
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_a

    .line 147
    :cond_a
    move v1, v2

    .line 148
    :goto_a
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_b

    .line 160
    :cond_b
    move v1, v2

    .line 161
    :goto_b
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->isFresh:Z

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    const/16 v1, 0x4cf

    .line 169
    .line 170
    goto :goto_c

    .line 171
    :cond_c
    const/16 v1, 0x4d5

    .line 172
    .line 173
    :goto_c
    add-int/2addr v0, v1

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 177
    .line 178
    if-eqz v1, :cond_d

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveAvatarConfig;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    goto :goto_d

    .line 185
    :cond_d
    move v1, v2

    .line 186
    :goto_d
    add-int/2addr v0, v1

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 190
    .line 191
    if-eqz v1, :cond_e

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveProfileConfig;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    goto :goto_e

    .line 198
    :cond_e
    move v1, v2

    .line 199
    :goto_e
    add-int/2addr v0, v1

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 203
    .line 204
    if-eqz v1, :cond_f

    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    :cond_f
    add-int/2addr v0, v2

    .line 211
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 212
    .line 213
    :cond_10
    return v0
.end method

.method public isFemale()Z
    .locals 1

    .line 1
    const-string v0, "female"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->originUserId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->type:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->fakeType:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->name:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatar:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->status:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->gender:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->icon:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAvatarConfig;->new_()Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/data/LiveAvatarConfig;

    .line 84
    .line 85
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 86
    .line 87
    if-nez v0, :cond_d

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveProfileConfig;->new_()Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->profileConfig:Lcom/p1/mobile/putong/data/LiveProfileConfig;

    .line 94
    .line 95
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 96
    .line 97
    if-nez v0, :cond_e

    .line 98
    .line 99
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 100
    .line 101
    :cond_e
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
