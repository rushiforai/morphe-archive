.class public Lcom/p1/mobile/putong/core/data/SpecialCard;
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
            "Lcom/p1/mobile/putong/core/data/SpecialCard;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/SpecialCard;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "specialcard"


# instance fields
.field public actived_duration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public interval_day:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public interval_hour_cycle_mode:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public num_limited_left:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public signup_country:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public swipe_wright_time:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public version:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpecialCard$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpecialCard$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpecialCard$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpecialCard$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/Double;)Ljava/lang/Double;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/SpecialCard;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpecialCard;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SpecialCard;->nullCheck()V

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

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SpecialCard;->clone()Lcom/p1/mobile/putong/core/data/SpecialCard;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/SpecialCard;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpecialCard;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/mvf0;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/mvf0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 30
    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v2, Ll/nvf0;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/nvf0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 47
    .line 48
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 49
    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 53
    .line 54
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 57
    .line 58
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 59
    .line 60
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 61
    .line 62
    iput p0, v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 63
    .line 64
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SpecialCard;->clone()Lcom/p1/mobile/putong/core/data/SpecialCard;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 66
    .line 67
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 72
    .line 73
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 74
    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 78
    .line 79
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 80
    .line 81
    if-ne p0, p1, :cond_2

    .line 82
    .line 83
    return v0

    .line 84
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "specialcard"

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
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 48
    .line 49
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    :cond_3
    add-int/2addr v0, v2

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 64
    .line 65
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 69
    .line 70
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 74
    .line 75
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 79
    .line 80
    add-int/2addr v0, v1

    .line 81
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 82
    .line 83
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/DeviceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 41
    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SpecialCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
