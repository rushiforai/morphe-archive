.class public Lcom/p1/mobile/putong/data/Notifications;
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
            "Lcom/p1/mobile/putong/data/Notifications;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Notifications;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "notifications"


# instance fields
.field public dailyReportPush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public messagePush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public momentPush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public newMatchPush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public officialPush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public previewPushMessage:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public sound:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public superLikePush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public syncMoment:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public weeklyReportPush:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Notifications$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Notifications$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Notifications;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Notifications$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Notifications$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Notifications;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/Notifications;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Notifications;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Notifications;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Notifications;->nullCheck()V

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

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Notifications;->clone()Lcom/p1/mobile/putong/data/Notifications;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Notifications;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Notifications;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Notifications;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->clone()Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 51
    .line 52
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 53
    .line 54
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 55
    .line 56
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Notifications;->clone()Lcom/p1/mobile/putong/data/Notifications;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Notifications;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Notifications;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 38
    .line 39
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 54
    .line 55
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 60
    .line 61
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 66
    .line 67
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 82
    .line 83
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 84
    .line 85
    if-ne p0, p1, :cond_2

    .line 86
    .line 87
    return v0

    .line 88
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "notifications"

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->previewPushMessage:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->newMatchPush:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v1, v2

    .line 28
    :goto_1
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->messagePush:Z

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    move v1, v3

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    move v1, v2

    .line 38
    :goto_2
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->superLikePush:Z

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    move v1, v3

    .line 46
    goto :goto_3

    .line 47
    :cond_3
    move v1, v2

    .line 48
    :goto_3
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->momentPush:Z

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    move v1, v3

    .line 56
    goto :goto_4

    .line 57
    :cond_4
    move v1, v2

    .line 58
    :goto_4
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    if-eqz v1, :cond_5

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_5

    .line 71
    :cond_5
    move v1, v4

    .line 72
    :goto_5
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->dailyReportPush:Z

    .line 76
    .line 77
    if-eqz v1, :cond_6

    .line 78
    .line 79
    move v1, v3

    .line 80
    goto :goto_6

    .line 81
    :cond_6
    move v1, v2

    .line 82
    :goto_6
    add-int/2addr v0, v1

    .line 83
    mul-int/lit8 v0, v0, 0x29

    .line 84
    .line 85
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->weeklyReportPush:Z

    .line 86
    .line 87
    if-eqz v1, :cond_7

    .line 88
    .line 89
    move v1, v3

    .line 90
    goto :goto_7

    .line 91
    :cond_7
    move v1, v2

    .line 92
    :goto_7
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->officialPush:Z

    .line 96
    .line 97
    if-eqz v1, :cond_8

    .line 98
    .line 99
    move v1, v3

    .line 100
    goto :goto_8

    .line 101
    :cond_8
    move v1, v2

    .line 102
    :goto_8
    add-int/2addr v0, v1

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 106
    .line 107
    if-eqz v1, :cond_9

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->hashCode()I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    :cond_9
    add-int/2addr v0, v4

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Notifications;->syncMoment:Z

    .line 117
    .line 118
    if-eqz v1, :cond_a

    .line 119
    .line 120
    move v2, v3

    .line 121
    :cond_a
    add-int/2addr v0, v2

    .line 122
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 123
    .line 124
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Notifications;->sound:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationNoDisturb;->new_()Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Notifications;->noDisturb:Lcom/p1/mobile/putong/data/NotificationNoDisturb;

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Notifications;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
