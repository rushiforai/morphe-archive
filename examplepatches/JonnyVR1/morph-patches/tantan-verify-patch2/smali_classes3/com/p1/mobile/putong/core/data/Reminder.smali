.class public Lcom/p1/mobile/putong/core/data/Reminder;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/Reminder;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/Reminder;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "reminder"


# instance fields
.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public mediaAmount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public moment:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public otherUser:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public read:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public reference:Lcom/p1/mobile/putong/core/data/ReminderReference;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Reminder$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Reminder$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/Reminder$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Reminder$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/Reminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
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

.method public static new_()Lcom/p1/mobile/putong/core/data/Reminder;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Reminder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Reminder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Reminder;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Reminder;->clone()Lcom/p1/mobile/putong/core/data/Reminder;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/Reminder;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Reminder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Reminder;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ReminderReference;->clone()Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 31
    .line 32
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 33
    .line 34
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 35
    .line 36
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 37
    .line 38
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 41
    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Reminder;->clone()Lcom/p1/mobile/putong/core/data/Reminder;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/Reminder;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/Reminder;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 52
    .line 53
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 54
    .line 55
    if-ne p1, v3, :cond_3

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 58
    .line 59
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 60
    .line 61
    cmpl-double p1, v3, v5

    .line 62
    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 66
    .line 67
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 68
    .line 69
    if-ne p1, v3, :cond_3

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 72
    .line 73
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    return v0

    .line 82
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "reminder"

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
    if-nez v0, :cond_5

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ReminderReference;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->read:Z

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    const/16 v1, 0x4cf

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_3
    const/16 v1, 0x4d5

    .line 59
    .line 60
    :goto_3
    add-int/2addr v0, v1

    .line 61
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Reminder;->createdTime:D

    .line 62
    .line 63
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 64
    .line 65
    .line 66
    move-result-wide v3

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    const/16 v1, 0x20

    .line 70
    .line 71
    ushr-long v5, v3, v1

    .line 72
    .line 73
    xor-long/2addr v3, v5

    .line 74
    long-to-int v1, v3

    .line 75
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->mediaAmount:I

    .line 79
    .line 80
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->moment:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    :cond_4
    add-int/2addr v0, v2

    .line 92
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 93
    .line 94
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->owner:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReminderReference;->new_()Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Reminder;->reference:Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Reminder;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
