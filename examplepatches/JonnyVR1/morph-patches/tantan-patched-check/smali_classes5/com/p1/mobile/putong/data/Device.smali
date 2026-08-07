.class public Lcom/p1/mobile/putong/data/Device;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final IDFP:Ljava/lang/String; = "idfp"

.field public static final IMEI:Ljava/lang/String; = "imei"

.field public static final IMEI1:Ljava/lang/String; = "ime1"

.field public static final IMEI2:Ljava/lang/String; = "ime2"

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/Device;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEID:Ljava/lang/String; = "meid"

.field public static final MEID1:Ljava/lang/String; = "mei1"

.field public static final MEID2:Ljava/lang/String; = "mei2"

.field public static final OAID:Ljava/lang/String; = "oaid"

.field public static final ONEID:Ljava/lang/String; = "onei"

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Device;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "device"

.field public static final UUID:Ljava/lang/String; = "uuid"


# instance fields
.field public appBuild:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public appUIVersion:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public appVersion:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public brand:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public bundleId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public created_time:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public devicePushNotifications:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DevicePush;",
            ">;"
        }
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public identifier:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public identifiers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DeviceIdentifier;",
            ">;"
        }
    .end annotation
.end field

.field public language:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public locale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public oneid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public pluginVersion:Ljava/util/Map;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;
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
    new-instance v0, Lcom/p1/mobile/putong/data/Device$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Device$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Device;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/DeviceIdentifier;)Lcom/p1/mobile/putong/data/DeviceIdentifier;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->clone()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/DevicePush;)Lcom/p1/mobile/putong/data/DevicePush;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DevicePush;->clone()Lcom/p1/mobile/putong/data/DevicePush;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Device;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Device;->nullCheck()V

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

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->clone()Lcom/p1/mobile/putong/data/Device;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Device;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DevicePush;->clone()Lcom/p1/mobile/putong/data/DevicePush;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    new-instance v2, Ll/ezd;

    .line 29
    .line 30
    invoke-direct {v2}, Ll/ezd;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 38
    .line 39
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DeviceOs;->clone()Lcom/p1/mobile/putong/data/DeviceOs;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 56
    .line 57
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 70
    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    new-instance v2, Ll/fzd;

    .line 74
    .line 75
    invoke-direct {v2}, Ll/fzd;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 83
    .line 84
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 89
    .line 90
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 93
    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 97
    .line 98
    if-eqz v1, :cond_4

    .line 99
    .line 100
    new-instance v2, Ll/gzd;

    .line 101
    .line 102
    invoke-direct {v2}, Ll/gzd;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/Map;Ll/qcj;)Ljava/util/Map;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 110
    .line 111
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 112
    .line 113
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 116
    .line 117
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 118
    .line 119
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->clone()Lcom/p1/mobile/putong/data/Device;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Device;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Device;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 164
    .line 165
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 166
    .line 167
    cmpl-double v1, v3, v5

    .line 168
    .line 169
    if-nez v1, :cond_2

    .line 170
    .line 171
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 172
    .line 173
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    if-eqz p0, :cond_2

    .line 180
    .line 181
    return v0

    .line 182
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "device"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DevicePush;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DeviceOs;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    goto :goto_c

    .line 173
    :cond_c
    move v1, v2

    .line 174
    :goto_c
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_d

    .line 186
    :cond_d
    move v1, v2

    .line 187
    :goto_d
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_e

    .line 199
    :cond_e
    move v1, v2

    .line 200
    :goto_e
    add-int/2addr v0, v1

    .line 201
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 202
    .line 203
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 204
    .line 205
    .line 206
    move-result-wide v3

    .line 207
    mul-int/lit8 v0, v0, 0x29

    .line 208
    .line 209
    const/16 v1, 0x20

    .line 210
    .line 211
    ushr-long v5, v3, v1

    .line 212
    .line 213
    xor-long/2addr v3, v5

    .line 214
    long-to-int v1, v3

    .line 215
    add-int/2addr v0, v1

    .line 216
    mul-int/lit8 v0, v0, 0x29

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 219
    .line 220
    if-eqz v1, :cond_f

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    :cond_f
    add-int/2addr v0, v2

    .line 227
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 228
    .line 229
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/DevicePush;->new_()Lcom/p1/mobile/putong/data/DevicePush;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 35
    .line 36
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v0, :cond_4

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 41
    .line 42
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 43
    .line 44
    if-nez v0, :cond_5

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 47
    .line 48
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 49
    .line 50
    if-nez v0, :cond_6

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceOs;->new_()Lcom/p1/mobile/putong/data/DeviceOs;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 57
    .line 58
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 59
    .line 60
    if-nez v0, :cond_7

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 63
    .line 64
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 65
    .line 66
    if-nez v0, :cond_8

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 69
    .line 70
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 71
    .line 72
    if-nez v0, :cond_9

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 75
    .line 76
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 77
    .line 78
    if-nez v0, :cond_a

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 86
    .line 87
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_b

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 92
    .line 93
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_c

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 98
    .line 99
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v0, :cond_d

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 104
    .line 105
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 106
    .line 107
    if-nez v0, :cond_e

    .line 108
    .line 109
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 112
    .line 113
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 114
    .line 115
    if-nez v0, :cond_f

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 118
    .line 119
    :cond_f
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/Device;)Lcom/p1/mobile/putong/data/Device;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 117
    .line 118
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 131
    .line 132
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 145
    .line 146
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 147
    .line 148
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_a

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 157
    .line 158
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 159
    .line 160
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_b

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 173
    .line 174
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 175
    .line 176
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 177
    .line 178
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_c

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 185
    .line 186
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 187
    .line 188
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 189
    .line 190
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_d

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 201
    .line 202
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 203
    .line 204
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 205
    .line 206
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_e

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 213
    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 215
    .line 216
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 217
    .line 218
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-nez p1, :cond_f

    .line 225
    .line 226
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 227
    .line 228
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 229
    .line 230
    :cond_f
    new-instance p0, Lcom/p1/mobile/putong/data/Device;

    .line 231
    .line 232
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/Device;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    if-eqz p0, :cond_10

    .line 240
    .line 241
    const/4 p0, 0x0

    .line 242
    return-object p0

    .line 243
    :cond_10
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Device;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
