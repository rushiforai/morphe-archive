.class public Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;
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
            "Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "monetizationconfiguration"


# instance fields
.field public buyDialogHidePrice:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public membershipDesc:Ljava/util/Map;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public showCompliantEntry:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public showIndexNearbyTab:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public showPrivateCustomTab:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public userTags:Lcom/p1/mobile/putong/core/data/UserTags;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public willPayScore:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/util/Map;)Ljava/util/Map;
    .locals 1

    .line 1
    new-instance v0, Ll/t510;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t510;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/Map;Ll/qcj;)Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nullCheck()V

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

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->clone()Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->clone()Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserTags;->clone()Lcom/p1/mobile/putong/core/data/UserTags;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 25
    .line 26
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->clone()Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 43
    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->clone()Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 53
    .line 54
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 55
    .line 56
    if-eqz v1, :cond_4

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->clone()Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 63
    .line 64
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 65
    .line 66
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 69
    .line 70
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    new-instance v2, Ll/u510;

    .line 77
    .line 78
    invoke-direct {v2}, Ll/u510;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/Map;Ll/qcj;)Ljava/util/Map;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 86
    .line 87
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 88
    .line 89
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NearbyBlock;->clone()Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 100
    .line 101
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 102
    .line 103
    if-eqz p0, :cond_7

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->clone()Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 110
    .line 111
    :cond_7
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->clone()Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 40
    .line 41
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 76
    .line 77
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 82
    .line 83
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 98
    .line 99
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

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
    const-string p0, "monetizationconfiguration"

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
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserTags;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 35
    .line 36
    const/16 v3, 0x4d5

    .line 37
    .line 38
    const/16 v4, 0x4cf

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    move v1, v4

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v3

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    move v1, v4

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v1, v3

    .line 55
    :goto_3
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_4

    .line 67
    :cond_4
    move v1, v2

    .line 68
    :goto_4
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    goto :goto_5

    .line 80
    :cond_5
    move v1, v2

    .line 81
    :goto_5
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 85
    .line 86
    if-eqz v1, :cond_6

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    goto :goto_6

    .line 93
    :cond_6
    move v1, v2

    .line 94
    :goto_6
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 98
    .line 99
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 103
    .line 104
    if-eqz v1, :cond_7

    .line 105
    .line 106
    move v1, v4

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v3

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    move v3, v4

    .line 130
    :cond_9
    add-int/2addr v0, v3

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 134
    .line 135
    if-eqz v1, :cond_a

    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NearbyBlock;->hashCode()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    goto :goto_9

    .line 142
    :cond_a
    move v1, v2

    .line 143
    :goto_9
    add-int/2addr v0, v1

    .line 144
    mul-int/lit8 v0, v0, 0x29

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 147
    .line 148
    if-eqz v1, :cond_b

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->hashCode()I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    :cond_b
    add-int/2addr v0, v2

    .line 155
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 156
    .line 157
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->new_()Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserTags;->new_()Lcom/p1/mobile/putong/core/data/UserTags;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
