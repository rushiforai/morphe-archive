.class public Lcom/p1/mobile/putong/data/OMSLauncherInfo;
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
            "Lcom/p1/mobile/putong/data/OMSLauncherInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSLauncherInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omslauncherinfo"


# instance fields
.field public ad:Lcom/p1/mobile/putong/data/ADInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public budgetType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public cacheEnable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public creative:Lcom/p1/mobile/putong/data/CreativeOms;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public dspId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public duration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public href:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public ifBeRealtime:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public isUseCache:Z

.field public issueTimestamp:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public price:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public scenes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public version:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->isUseCache:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OMSLauncherInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->nullCheck()V

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

    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clone()Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSLauncherInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 43
    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 53
    .line 54
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 55
    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->clone()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 67
    .line 68
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ADInfo;->clone()Lcom/p1/mobile/putong/data/ADInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 85
    .line 86
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 87
    .line 88
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    new-instance v2, Ll/t750;

    .line 95
    .line 96
    invoke-direct {v2}, Ll/t750;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 104
    .line 105
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 106
    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 110
    .line 111
    if-eqz v1, :cond_7

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CreativeOms;->clone()Lcom/p1/mobile/putong/data/CreativeOms;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 118
    .line 119
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 120
    .line 121
    if-eqz v1, :cond_8

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OperationConfig;->clone()Lcom/p1/mobile/putong/data/OperationConfig;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 128
    .line 129
    :cond_8
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 130
    .line 131
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 132
    .line 133
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 134
    .line 135
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 138
    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 140
    .line 141
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 142
    .line 143
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 144
    .line 145
    iget p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 146
    .line 147
    iput p0, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 148
    .line 149
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 150
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clone()Lcom/p1/mobile/putong/data/OMSLauncherInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 70
    .line 71
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 116
    .line 117
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 118
    .line 119
    if-ne v1, v3, :cond_2

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 122
    .line 123
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_2

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 142
    .line 143
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 144
    .line 145
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 162
    .line 163
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 164
    .line 165
    if-ne v1, v3, :cond_2

    .line 166
    .line 167
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 168
    .line 169
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 170
    .line 171
    if-ne v1, v3, :cond_2

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_2

    .line 182
    .line 183
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 184
    .line 185
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 186
    .line 187
    cmp-long v1, v3, v5

    .line 188
    .line 189
    if-nez v1, :cond_2

    .line 190
    .line 191
    iget p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 192
    .line 193
    iget p1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 194
    .line 195
    if-ne p0, p1, :cond_2

    .line 196
    .line 197
    return v0

    .line 198
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omslauncherinfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public getCreativeType()Lcom/p1/mobile/putong/data/CreativeType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 4
    .line 5
    return-object p0
.end method

.method public getLogoRatio()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public getPicUrl()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object v0
.end method

.method public hashCode()I
    .locals 5

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_4

    .line 74
    :cond_4
    move v1, v2

    .line 75
    :goto_4
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 79
    .line 80
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->hashCode()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    goto :goto_5

    .line 92
    :cond_5
    move v1, v2

    .line 93
    :goto_5
    add-int/2addr v0, v1

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    goto :goto_6

    .line 105
    :cond_6
    move v1, v2

    .line 106
    :goto_6
    add-int/2addr v0, v1

    .line 107
    mul-int/lit8 v0, v0, 0x29

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v1, :cond_7

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    goto :goto_7

    .line 118
    :cond_7
    move v1, v2

    .line 119
    :goto_7
    add-int/2addr v0, v1

    .line 120
    mul-int/lit8 v0, v0, 0x29

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 123
    .line 124
    if-eqz v1, :cond_8

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ADInfo;->hashCode()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    goto :goto_8

    .line 131
    :cond_8
    move v1, v2

    .line 132
    :goto_8
    add-int/2addr v0, v1

    .line 133
    mul-int/lit8 v0, v0, 0x29

    .line 134
    .line 135
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 136
    .line 137
    const/16 v3, 0x4d5

    .line 138
    .line 139
    const/16 v4, 0x4cf

    .line 140
    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    move v1, v4

    .line 144
    goto :goto_9

    .line 145
    :cond_9
    move v1, v3

    .line 146
    :goto_9
    add-int/2addr v0, v1

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 150
    .line 151
    if-eqz v1, :cond_a

    .line 152
    .line 153
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    goto :goto_a

    .line 158
    :cond_a
    move v1, v2

    .line 159
    :goto_a
    add-int/2addr v0, v1

    .line 160
    mul-int/lit8 v0, v0, 0x29

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz v1, :cond_b

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    goto :goto_b

    .line 171
    :cond_b
    move v1, v2

    .line 172
    :goto_b
    add-int/2addr v0, v1

    .line 173
    mul-int/lit8 v0, v0, 0x29

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 176
    .line 177
    if-eqz v1, :cond_c

    .line 178
    .line 179
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CreativeOms;->hashCode()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    goto :goto_c

    .line 184
    :cond_c
    move v1, v2

    .line 185
    :goto_c
    add-int/2addr v0, v1

    .line 186
    mul-int/lit8 v0, v0, 0x29

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 189
    .line 190
    if-eqz v1, :cond_d

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OperationConfig;->hashCode()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    goto :goto_d

    .line 197
    :cond_d
    move v1, v2

    .line 198
    :goto_d
    add-int/2addr v0, v1

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 202
    .line 203
    add-int/2addr v0, v1

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 207
    .line 208
    if-eqz v1, :cond_e

    .line 209
    .line 210
    move v3, v4

    .line 211
    :cond_e
    add-int/2addr v0, v3

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz v1, :cond_f

    .line 217
    .line 218
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    :cond_f
    add-int/2addr v0, v2

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 226
    .line 227
    const/16 v3, 0x20

    .line 228
    .line 229
    ushr-long v3, v1, v3

    .line 230
    .line 231
    xor-long/2addr v1, v3

    .line 232
    long-to-int v1, v1

    .line 233
    add-int/2addr v0, v1

    .line 234
    mul-int/lit8 v0, v0, 0x29

    .line 235
    .line 236
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 237
    .line 238
    add-int/2addr v0, v1

    .line 239
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 240
    .line 241
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 58
    .line 59
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 60
    .line 61
    if-nez v0, :cond_6

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 64
    .line 65
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 66
    .line 67
    if-nez v0, :cond_7

    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 70
    .line 71
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 72
    .line 73
    if-nez v0, :cond_8

    .line 74
    .line 75
    new-instance v0, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 81
    .line 82
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 83
    .line 84
    if-nez v0, :cond_9

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 87
    .line 88
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 89
    .line 90
    if-nez v0, :cond_a

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/data/CreativeOms;->new_()Lcom/p1/mobile/putong/data/CreativeOms;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 97
    .line 98
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 99
    .line 100
    if-nez v0, :cond_b

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/data/OperationConfig;->new_()Lcom/p1/mobile/putong/data/OperationConfig;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 107
    .line 108
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 109
    .line 110
    if-nez v0, :cond_c

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 113
    .line 114
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
