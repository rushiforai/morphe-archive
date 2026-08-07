.class public Lcom/p1/mobile/putong/core/data/AdvancedSettings;
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
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "advancedsettings"


# instance fields
.field public active:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public bloodType:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BloodType;",
            ">;"
        }
    .end annotation
.end field

.field public filterReportUser:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public intlFriendPurpose:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public newUser:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public online:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public popular:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public realFace:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public student:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public zodiacs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/ProfileZodiac;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/ProfileZodiac;)Lcom/p1/mobile/putong/data/ProfileZodiac;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/BloodType;)Lcom/p1/mobile/putong/data/BloodType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->nullCheck()V

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

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    new-instance v2, Ll/x90;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/x90;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 44
    .line 45
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    new-instance v2, Ll/y90;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/y90;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 67
    .line 68
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 69
    .line 70
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 71
    .line 72
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_2

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
    const-string p0, "advancedsettings"

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
    if-nez v0, :cond_b

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    :cond_a
    add-int/2addr v0, v2

    .line 147
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 148
    .line 149
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 34
    .line 35
    if-nez v0, :cond_4

    .line 36
    .line 37
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 40
    .line 41
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 42
    .line 43
    if-nez v0, :cond_5

    .line 44
    .line 45
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 48
    .line 49
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 50
    .line 51
    if-nez v0, :cond_6

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 59
    .line 60
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 61
    .line 62
    if-nez v0, :cond_7

    .line 63
    .line 64
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 67
    .line 68
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 69
    .line 70
    if-nez v0, :cond_8

    .line 71
    .line 72
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 75
    .line 76
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 77
    .line 78
    if-nez v0, :cond_9

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 86
    .line 87
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_a

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 92
    .line 93
    :cond_a
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_4

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_6

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 105
    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 107
    .line 108
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_7

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 117
    .line 118
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 119
    .line 120
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 121
    .line 122
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_8

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 131
    .line 132
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 133
    .line 134
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 135
    .line 136
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_9

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 145
    .line 146
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 147
    .line 148
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-nez p1, :cond_a

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 157
    .line 158
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 159
    .line 160
    :cond_a
    new-instance p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 161
    .line 162
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_b

    .line 170
    .line 171
    const/4 p0, 0x0

    .line 172
    return-object p0

    .line 173
    :cond_b
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
