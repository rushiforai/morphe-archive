.class public Lcom/p1/mobile/putong/data/UserFakeSettings;
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
            "Lcom/p1/mobile/putong/data/UserFakeSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/UserFakeSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "userfakesettings"


# instance fields
.field public dailyReportPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public intent:Lcom/p1/mobile/putong/data/SettingsIntent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public locationAddress:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public locationName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public momentPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public sound:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public syncMoment:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public weeklyReportPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserFakeSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserFakeSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/UserFakeSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserFakeSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/UserFakeSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserFakeSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/UserFakeSettings;->nullCheck()V

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

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserFakeSettings;->clone()Lcom/p1/mobile/putong/data/UserFakeSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/UserFakeSettings;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserFakeSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->clone()Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 45
    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 47
    .line 48
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserFakeSettings;->clone()Lcom/p1/mobile/putong/data/UserFakeSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 96
    .line 97
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    return v0

    .line 104
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "userfakesettings"

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
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    :cond_8
    add-int/2addr v0, v2

    .line 121
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 122
    .line 123
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->sound:Ljava/lang/String;

    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 34
    .line 35
    if-nez v0, :cond_4

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->new_()Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 42
    .line 43
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

    .line 44
    .line 45
    if-nez v0, :cond_5

    .line 46
    .line 47
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

    .line 50
    .line 51
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationName:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->locationAddress:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 64
    .line 65
    if-nez v0, :cond_8

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/data/SettingsIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 76
    .line 77
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
