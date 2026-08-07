.class public Lcom/p1/mobile/putong/core/data/VerificationCenter;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final AGEVERIFICATIONINFO_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            "Lcom/p1/mobile/putong/data/StudentVerificationStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final CTDIDVERIFICATIONINFO_MEDIA:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public static final CTDIDVERIFICATIONINFO_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            "Lcom/p1/mobile/putong/data/StudentVerificationStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final IDCARD:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            "Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final PICVERIFICATIONINFO_MEDIA:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public static final PICVERIFICATIONINFO_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            "Lcom/p1/mobile/putong/data/StudentVerificationStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "verificationcenter"

.field public static final USERID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final VOICEANCHOR_STATUS:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public anchor:Lcom/p1/mobile/putong/core/data/LiveAnchor;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public identity:Lcom/p1/mobile/putong/core/data/Identity;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public verificationType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerificationCenter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerificationCenter$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$5;

    .line 34
    .line 35
    const-string v1, "userId_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->USERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$6;

    .line 43
    .line 44
    const-string v1, "verificationType_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->VERIFICATIONTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$7;

    .line 52
    .line 53
    const-string v1, "picVerificationInfo_media_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->PICVERIFICATIONINFO_MEDIA:Lcom/tantanapp/common/data/orm/Column;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$8;

    .line 61
    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    const-string v2, "str_picVerificationInfo_status_c"

    .line 65
    .line 66
    const-string v3, "picVerificationInfo_status_c"

    .line 67
    .line 68
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$8;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->PICVERIFICATIONINFO_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$9;

    .line 74
    .line 75
    const-string v2, "idCard_c"

    .line 76
    .line 77
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/core/data/VerificationCenter$9;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->IDCARD:Lcom/tantanapp/common/data/orm/Column;

    .line 81
    .line 82
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$10;

    .line 83
    .line 84
    const-string v2, "str_ageVerificationInfo_status_c"

    .line 85
    .line 86
    const-string v3, "ageVerificationInfo_status_c"

    .line 87
    .line 88
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$10;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 89
    .line 90
    .line 91
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->AGEVERIFICATIONINFO_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 92
    .line 93
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$11;

    .line 94
    .line 95
    const-string v2, "voiceAnchor_status_c"

    .line 96
    .line 97
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/core/data/VerificationCenter$11;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->VOICEANCHOR_STATUS:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 101
    .line 102
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$12;

    .line 103
    .line 104
    const-string v2, "ctdidVerificationInfo_media_c"

    .line 105
    .line 106
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/core/data/VerificationCenter$12;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->CTDIDVERIFICATIONINFO_MEDIA:Lcom/tantanapp/common/data/orm/Column;

    .line 110
    .line 111
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$13;

    .line 112
    .line 113
    const-string v2, "str_ctdidVerificationInfo_status_c"

    .line 114
    .line 115
    const-string v3, "ctdidVerificationInfo_status_c"

    .line 116
    .line 117
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$13;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 118
    .line 119
    .line 120
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->CTDIDVERIFICATIONINFO_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 121
    .line 122
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter$14;

    .line 123
    .line 124
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerificationCenter$14;-><init>()V

    .line 125
    .line 126
    .line 127
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->DB_ADAPTER:Ll/vzf0;

    .line 128
    .line 129
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

.method public static new_()Lcom/p1/mobile/putong/core/data/VerificationCenter;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;->nullCheck()V

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

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;->clone()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/VerificationCenter;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->clone()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->anchor:Lcom/p1/mobile/putong/core/data/LiveAnchor;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LiveAnchor;->clone()Lcom/p1/mobile/putong/core/data/LiveAnchor;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->anchor:Lcom/p1/mobile/putong/core/data/LiveAnchor;

    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->identity:Lcom/p1/mobile/putong/core/data/Identity;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Identity;->clone()Lcom/p1/mobile/putong/core/data/Identity;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->identity:Lcom/p1/mobile/putong/core/data/Identity;

    .line 51
    .line 52
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->clone()Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->clone()Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 71
    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->clone()Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 81
    .line 82
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 83
    .line 84
    if-eqz p0, :cond_6

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->clone()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 91
    .line 92
    :cond_6
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;->clone()Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->anchor:Lcom/p1/mobile/putong/core/data/LiveAnchor;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->anchor:Lcom/p1/mobile/putong/core/data/LiveAnchor;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->identity:Lcom/p1/mobile/putong/core/data/Identity;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->identity:Lcom/p1/mobile/putong/core/data/Identity;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 102
    .line 103
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 104
    .line 105
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_3

    .line 110
    .line 111
    return v0

    .line 112
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "verificationcenter"

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
    if-nez v0, :cond_9

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->anchor:Lcom/p1/mobile/putong/core/data/LiveAnchor;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LiveAnchor;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->identity:Lcom/p1/mobile/putong/core/data/Identity;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Identity;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    :cond_8
    add-int/2addr v0, v2

    .line 125
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 126
    .line 127
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 39
    .line 40
    if-nez v0, :cond_4

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->new_()Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 47
    .line 48
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 49
    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 57
    .line 58
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
