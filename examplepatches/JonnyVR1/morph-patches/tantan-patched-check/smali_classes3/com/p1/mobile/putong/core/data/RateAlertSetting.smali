.class public Lcom/p1/mobile/putong/core/data/RateAlertSetting;
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
            "Lcom/p1/mobile/putong/core/data/RateAlertSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/RateAlertSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "ratealertsetting"


# instance fields
.field public activeDays:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public appOpenTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public profilePictures:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public receivedMessages:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public registerDays:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public sentMessages:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public useMinutes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    new-instance v0, Ll/alc0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/alc0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/RateAlertSetting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->nullCheck()V

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

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->clone()Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/RateAlertSetting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v2, Ll/blc0;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/blc0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 42
    .line 43
    iput p0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 44
    .line 45
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->clone()Lcom/p1/mobile/putong/core/data/RateAlertSetting;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

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
    iget p0, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 54
    .line 55
    iget p1, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 56
    .line 57
    if-ne p0, p1, :cond_2

    .line 58
    .line 59
    return v0

    .line 60
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ratealertsetting"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 28
    .line 29
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v1, 0x0

    .line 42
    :goto_0
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 46
    .line 47
    add-int/2addr v0, v1

    .line 48
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 49
    .line 50
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
