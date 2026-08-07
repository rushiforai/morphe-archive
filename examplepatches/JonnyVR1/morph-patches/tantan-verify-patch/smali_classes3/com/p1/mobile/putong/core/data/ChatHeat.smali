.class public Lcom/p1/mobile/putong/core/data/ChatHeat;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEGREE:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXCLUSIVECHATENDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXCLUSIVECHATINVITEEXPIRETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXCLUSIVECHATINVITETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXCLUSIVECHATSTARTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final LEVELUP:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final SHOWLEVELDOWN:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPECIALREMIND:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEMPDOWNDEGREE:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "chatheat"

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public degree:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public exclusiveChatEndTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public exclusiveChatInviteExpireTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public exclusiveChatInviteTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public exclusiveChatStartTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public levelUp:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public showLevelDown:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public specialRemind:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public tempDownDegree:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$5;

    .line 34
    .line 35
    const-string v1, "degree_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->DEGREE:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$6;

    .line 43
    .line 44
    const-string v1, "levelUp_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->LEVELUP:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$7;

    .line 52
    .line 53
    const-string v1, "specialRemind_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->SPECIALREMIND:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$8;

    .line 61
    .line 62
    const-string v1, "exclusiveChatInviteTime_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->EXCLUSIVECHATINVITETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$9;

    .line 70
    .line 71
    const-string v1, "exclusiveChatInviteExpireTime_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->EXCLUSIVECHATINVITEEXPIRETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$10;

    .line 79
    .line 80
    const-string v1, "exclusiveChatStartTime_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->EXCLUSIVECHATSTARTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$11;

    .line 88
    .line 89
    const-string v1, "exclusiveChatEndTime_c"

    .line 90
    .line 91
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$11;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->EXCLUSIVECHATENDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$12;

    .line 97
    .line 98
    const-string v1, "showLevelDown_c"

    .line 99
    .line 100
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$12;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->SHOWLEVELDOWN:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 104
    .line 105
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$13;

    .line 106
    .line 107
    const-string v1, "tempDownDegree_c"

    .line 108
    .line 109
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatHeat$13;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->TEMPDOWNDEGREE:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 113
    .line 114
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat$14;

    .line 115
    .line 116
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat$14;-><init>()V

    .line 117
    .line 118
    .line 119
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->DB_ADAPTER:Ll/vzf0;

    .line 120
    .line 121
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->nullCheck()V

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

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat;-><init>()V

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 49
    .line 50
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 22
    .line 23
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 24
    .line 25
    cmpl-double p1, v3, v5

    .line 26
    .line 27
    if-nez p1, :cond_3

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 30
    .line 31
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 32
    .line 33
    if-ne p1, v3, :cond_3

    .line 34
    .line 35
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 36
    .line 37
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 38
    .line 39
    if-ne p1, v3, :cond_3

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 42
    .line 43
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 44
    .line 45
    cmpl-double p1, v3, v5

    .line 46
    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 50
    .line 51
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 52
    .line 53
    cmpl-double p1, v3, v5

    .line 54
    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 58
    .line 59
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 60
    .line 61
    cmpl-double p1, v3, v5

    .line 62
    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 66
    .line 67
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 68
    .line 69
    cmpl-double p1, v3, v5

    .line 70
    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 74
    .line 75
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 76
    .line 77
    if-ne p1, v3, :cond_3

    .line 78
    .line 79
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 80
    .line 81
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 82
    .line 83
    cmpl-double p0, p0, v3

    .line 84
    .line 85
    if-nez p0, :cond_3

    .line 86
    .line 87
    return v0

    .line 88
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "chatheat"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 10
    .line 11
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    const/16 v3, 0x20

    .line 18
    .line 19
    ushr-long v4, v1, v3

    .line 20
    .line 21
    xor-long/2addr v1, v4

    .line 22
    long-to-int v1, v1

    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 27
    .line 28
    const/16 v2, 0x4d5

    .line 29
    .line 30
    const/16 v4, 0x4cf

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    move v1, v4

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v1, v2

    .line 37
    :goto_0
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    move v1, v4

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move v1, v2

    .line 47
    :goto_1
    add-int/2addr v0, v1

    .line 48
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 49
    .line 50
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 51
    .line 52
    .line 53
    move-result-wide v5

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    ushr-long v7, v5, v3

    .line 57
    .line 58
    xor-long/2addr v5, v7

    .line 59
    long-to-int v1, v5

    .line 60
    add-int/2addr v0, v1

    .line 61
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 62
    .line 63
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 64
    .line 65
    .line 66
    move-result-wide v5

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    ushr-long v7, v5, v3

    .line 70
    .line 71
    xor-long/2addr v5, v7

    .line 72
    long-to-int v1, v5

    .line 73
    add-int/2addr v0, v1

    .line 74
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 75
    .line 76
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 77
    .line 78
    .line 79
    move-result-wide v5

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    ushr-long v7, v5, v3

    .line 83
    .line 84
    xor-long/2addr v5, v7

    .line 85
    long-to-int v1, v5

    .line 86
    add-int/2addr v0, v1

    .line 87
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 88
    .line 89
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 90
    .line 91
    .line 92
    move-result-wide v5

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    ushr-long v7, v5, v3

    .line 96
    .line 97
    xor-long/2addr v5, v7

    .line 98
    long-to-int v1, v5

    .line 99
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 103
    .line 104
    if-eqz v1, :cond_2

    .line 105
    .line 106
    move v2, v4

    .line 107
    :cond_2
    add-int/2addr v0, v2

    .line 108
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 109
    .line 110
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 111
    .line 112
    .line 113
    move-result-wide v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    ushr-long v3, v1, v3

    .line 117
    .line 118
    xor-long/2addr v1, v3

    .line 119
    long-to-int v1, v1

    .line 120
    add-int/2addr v0, v1

    .line 121
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 122
    .line 123
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
