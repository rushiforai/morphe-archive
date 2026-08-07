.class public Lcom/p1/mobile/putong/core/data/ChatGroupMember;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final AVATAR:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final GENDER:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            "Lcom/p1/mobile/putong/data/Gender;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final INMODERATION_DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final INMODERATION_NAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final INMODERATION_NICKNAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final JOINTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final NICKNAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final NICKNAMEPINYIN:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPERATIONSILENCE_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPERATIONSILENCE_ENABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPERATIONSILENCE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEARCHCATEGORY:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEARCHINDICES:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final SILENCE_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final SILENCE_ENABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final SILENCE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "chatgroupmember"

.field public static final UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final USERID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final USERNAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public avatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public gender:Lcom/p1/mobile/putong/data/Gender;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public groupId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public inModeration:Lcom/p1/mobile/putong/core/data/InModeration;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public joinTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public nickName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public nickNamePinyin:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
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

.field public searchCategory:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public searchIndices:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public updatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$5;

    .line 34
    .line 35
    const-string v1, "groupId_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->GROUPID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$6;

    .line 43
    .line 44
    const-string v1, "userId_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->USERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$7;

    .line 52
    .line 53
    const-string v1, "nickName_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->NICKNAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$8;

    .line 61
    .line 62
    const-string v1, "userName_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->USERNAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$9;

    .line 70
    .line 71
    const-string v1, "nickNamePinyin_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->NICKNAMEPINYIN:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$10;

    .line 79
    .line 80
    const-string v1, "avatar_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->AVATAR:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$11;

    .line 88
    .line 89
    const-string v1, "searchIndices_c"

    .line 90
    .line 91
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$11;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->SEARCHINDICES:Lcom/tantanapp/common/data/orm/Column;

    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$12;

    .line 97
    .line 98
    const-string v1, "searchCategory_c"

    .line 99
    .line 100
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$12;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->SEARCHCATEGORY:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 104
    .line 105
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$13;

    .line 106
    .line 107
    const-string v1, "status_c"

    .line 108
    .line 109
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 110
    .line 111
    const-string v3, "str_status_c"

    .line 112
    .line 113
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$13;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 114
    .line 115
    .line 116
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 117
    .line 118
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$14;

    .line 119
    .line 120
    const-string v1, "joinTime_c"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$14;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->JOINTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 126
    .line 127
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$15;

    .line 128
    .line 129
    const-string v1, "createdTime_c"

    .line 130
    .line 131
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$15;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 135
    .line 136
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$16;

    .line 137
    .line 138
    const-string v1, "updatedTime_c"

    .line 139
    .line 140
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$16;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 144
    .line 145
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$17;

    .line 146
    .line 147
    const-string v1, "silence_enable_c"

    .line 148
    .line 149
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$17;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->SILENCE_ENABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 153
    .line 154
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$18;

    .line 155
    .line 156
    const-string v1, "silence_duration_c"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$18;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->SILENCE_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 162
    .line 163
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$19;

    .line 164
    .line 165
    const-string v1, "silence_until_c"

    .line 166
    .line 167
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$19;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->SILENCE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 171
    .line 172
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$20;

    .line 173
    .line 174
    const-string v1, "operationSilence_enable_c"

    .line 175
    .line 176
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$20;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->OPERATIONSILENCE_ENABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 180
    .line 181
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$21;

    .line 182
    .line 183
    const-string v1, "operationSilence_duration_c"

    .line 184
    .line 185
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$21;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->OPERATIONSILENCE_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 189
    .line 190
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$22;

    .line 191
    .line 192
    const-string v1, "operationSilence_until_c"

    .line 193
    .line 194
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$22;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->OPERATIONSILENCE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 198
    .line 199
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$23;

    .line 200
    .line 201
    const-string v1, "gender_c"

    .line 202
    .line 203
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 204
    .line 205
    const-string v3, "str_gender_c"

    .line 206
    .line 207
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$23;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 208
    .line 209
    .line 210
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->GENDER:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 211
    .line 212
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$24;

    .line 213
    .line 214
    const-string v1, "inModeration_nickName_c"

    .line 215
    .line 216
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$24;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->INMODERATION_NICKNAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 220
    .line 221
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$25;

    .line 222
    .line 223
    const-string v1, "inModeration_name_c"

    .line 224
    .line 225
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$25;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->INMODERATION_NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 229
    .line 230
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$26;

    .line 231
    .line 232
    const-string v1, "inModeration_description_c"

    .line 233
    .line 234
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$26;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->INMODERATION_DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 238
    .line 239
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember$27;

    .line 240
    .line 241
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$27;-><init>()V

    .line 242
    .line 243
    .line 244
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->DB_ADAPTER:Ll/vzf0;

    .line 245
    .line 246
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nullCheck()V

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

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    new-instance v2, Ll/vu4;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/vu4;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 52
    .line 53
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 60
    .line 61
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 62
    .line 63
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 64
    .line 65
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 66
    .line 67
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 68
    .line 69
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 70
    .line 71
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 82
    .line 83
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 84
    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 92
    .line 93
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 94
    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 98
    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/InModeration;->clone()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 106
    .line 107
    :cond_3
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 102
    .line 103
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 104
    .line 105
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 112
    .line 113
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 114
    .line 115
    cmpl-double p1, v3, v5

    .line 116
    .line 117
    if-nez p1, :cond_3

    .line 118
    .line 119
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 120
    .line 121
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 122
    .line 123
    cmpl-double p1, v3, v5

    .line 124
    .line 125
    if-nez p1, :cond_3

    .line 126
    .line 127
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 128
    .line 129
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 130
    .line 131
    cmpl-double p1, v3, v5

    .line 132
    .line 133
    if-nez p1, :cond_3

    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 136
    .line 137
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 138
    .line 139
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_3

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 146
    .line 147
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 148
    .line 149
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_3

    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 156
    .line 157
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 158
    .line 159
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_3

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 166
    .line 167
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 168
    .line 169
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_3

    .line 174
    .line 175
    return v0

    .line 176
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "chatgroupmember"

    .line 2
    .line 3
    return-object p0
.end method

.method public groupMemberName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_d

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    goto :goto_8

    .line 125
    :cond_8
    move v1, v2

    .line 126
    :goto_8
    add-int/2addr v0, v1

    .line 127
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 128
    .line 129
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 130
    .line 131
    .line 132
    move-result-wide v3

    .line 133
    mul-int/lit8 v0, v0, 0x29

    .line 134
    .line 135
    const/16 v1, 0x20

    .line 136
    .line 137
    ushr-long v5, v3, v1

    .line 138
    .line 139
    xor-long/2addr v3, v5

    .line 140
    long-to-int v3, v3

    .line 141
    add-int/2addr v0, v3

    .line 142
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 143
    .line 144
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 145
    .line 146
    .line 147
    move-result-wide v3

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    ushr-long v5, v3, v1

    .line 151
    .line 152
    xor-long/2addr v3, v5

    .line 153
    long-to-int v3, v3

    .line 154
    add-int/2addr v0, v3

    .line 155
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 156
    .line 157
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 158
    .line 159
    .line 160
    move-result-wide v3

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    ushr-long v5, v3, v1

    .line 164
    .line 165
    xor-long/2addr v3, v5

    .line 166
    long-to-int v1, v3

    .line 167
    add-int/2addr v0, v1

    .line 168
    mul-int/lit8 v0, v0, 0x29

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 171
    .line 172
    if-eqz v1, :cond_9

    .line 173
    .line 174
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->hashCode()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    goto :goto_9

    .line 179
    :cond_9
    move v1, v2

    .line 180
    :goto_9
    add-int/2addr v0, v1

    .line 181
    mul-int/lit8 v0, v0, 0x29

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 184
    .line 185
    if-eqz v1, :cond_a

    .line 186
    .line 187
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    goto :goto_a

    .line 192
    :cond_a
    move v1, v2

    .line 193
    :goto_a
    add-int/2addr v0, v1

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 197
    .line 198
    if-eqz v1, :cond_b

    .line 199
    .line 200
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    goto :goto_b

    .line 205
    :cond_b
    move v1, v2

    .line 206
    :goto_b
    add-int/2addr v0, v1

    .line 207
    mul-int/lit8 v0, v0, 0x29

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 210
    .line 211
    if-eqz v1, :cond_c

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/InModeration;->hashCode()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    :cond_c
    add-int/2addr v0, v2

    .line 218
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 219
    .line 220
    :cond_d
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->parseFieldSet:Ljava/util/HashSet;

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

.method public isMe()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_11

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "groupId"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "userId"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    const-string v0, "nickName"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "userName"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 62
    .line 63
    :cond_4
    const-string v0, "nickNamePinyin"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 74
    .line 75
    :cond_5
    const-string v0, "avatar"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 86
    .line 87
    :cond_6
    const-string v0, "searchIndices"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 98
    .line 99
    :cond_7
    const-string v0, "searchCategory"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 110
    .line 111
    :cond_8
    const-string v0, "status"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 122
    .line 123
    :cond_9
    const-string v0, "joinTime"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 132
    .line 133
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 134
    .line 135
    :cond_a
    const-string v0, "createdTime"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 144
    .line 145
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 146
    .line 147
    :cond_b
    const-string v0, "updatedTime"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 156
    .line 157
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 158
    .line 159
    :cond_c
    const-string v0, "silence"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 170
    .line 171
    :cond_d
    const-string v0, "operationSilence"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 182
    .line 183
    :cond_e
    const-string v0, "gender"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 194
    .line 195
    :cond_f
    const-string v0, "inModeration"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 204
    .line 205
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 206
    .line 207
    :cond_10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->parseFieldSet:Ljava/util/HashSet;

    .line 208
    .line 209
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 210
    .line 211
    .line 212
    :cond_11
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 213
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->mergeData(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 23
    .line 24
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 29
    .line 30
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 31
    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 35
    .line 36
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v0, :cond_5

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 41
    .line 42
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 43
    .line 44
    if-nez v0, :cond_6

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 52
    .line 53
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 54
    .line 55
    if-nez v0, :cond_7

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 58
    .line 59
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 60
    .line 61
    if-nez v0, :cond_8

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 72
    .line 73
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 74
    .line 75
    if-nez v0, :cond_9

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 82
    .line 83
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 84
    .line 85
    if-nez v0, :cond_a

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 92
    .line 93
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 94
    .line 95
    if-nez v0, :cond_b

    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lcom/p1/mobile/putong/data/Gender;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 106
    .line 107
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 108
    .line 109
    if-nez v0, :cond_c

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 116
    .line 117
    :cond_c
    return-void
.end method

.method public onApiParseComplete()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->onApiParseComplete()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
