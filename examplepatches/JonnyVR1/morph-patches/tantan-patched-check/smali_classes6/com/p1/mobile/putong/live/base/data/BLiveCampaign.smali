.class public Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivecampaign"


# instance fields
.field public campaignType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public carouselSeconds:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public detailGravity:I

.field public detailInset:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public detailUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public entranceImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public entranceSize:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public entranceUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isH5HandleClick:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public isNeedCloseBtn:Z

.field public popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public position:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public schema:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public validPeriod:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isNeedCloseBtn:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Double;)Ljava/lang/Double;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->nullCheck()V

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

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->position:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->position:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v2, Ll/ms1;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/ms1;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    new-instance v2, Ll/ns1;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/ns1;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 55
    .line 56
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    new-instance v2, Ll/os1;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/os1;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 70
    .line 71
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isH5HandleClick:Z

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isH5HandleClick:Z

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 80
    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 88
    .line 89
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 90
    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 92
    .line 93
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->carouselSeconds:I

    .line 94
    .line 95
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->carouselSeconds:I

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 98
    .line 99
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 100
    .line 101
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->position:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->position:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 82
    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isH5HandleClick:Z

    .line 100
    .line 101
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isH5HandleClick:Z

    .line 102
    .line 103
    if-ne v1, v3, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->carouselSeconds:I

    .line 126
    .line 127
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->carouselSeconds:I

    .line 128
    .line 129
    if-ne v1, v3, :cond_2

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_2

    .line 140
    .line 141
    return v0

    .line 142
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivecampaign"

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
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->position:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    goto :goto_5

    .line 87
    :cond_5
    move v1, v2

    .line 88
    :goto_5
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_6

    .line 100
    :cond_6
    move v1, v2

    .line 101
    :goto_6
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    goto :goto_7

    .line 113
    :cond_7
    move v1, v2

    .line 114
    :goto_7
    add-int/2addr v0, v1

    .line 115
    mul-int/lit8 v0, v0, 0x29

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isH5HandleClick:Z

    .line 118
    .line 119
    if-eqz v1, :cond_8

    .line 120
    .line 121
    const/16 v1, 0x4cf

    .line 122
    .line 123
    goto :goto_8

    .line 124
    :cond_8
    const/16 v1, 0x4d5

    .line 125
    .line 126
    :goto_8
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 130
    .line 131
    if-eqz v1, :cond_9

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    goto :goto_9

    .line 138
    :cond_9
    move v1, v2

    .line 139
    :goto_9
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 143
    .line 144
    if-eqz v1, :cond_a

    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_a

    .line 151
    :cond_a
    move v1, v2

    .line 152
    :goto_a
    add-int/2addr v0, v1

    .line 153
    mul-int/lit8 v0, v0, 0x29

    .line 154
    .line 155
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->carouselSeconds:I

    .line 156
    .line 157
    add-int/2addr v0, v1

    .line 158
    mul-int/lit8 v0, v0, 0x29

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v1, :cond_b

    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    :cond_b
    add-int/2addr v0, v2

    .line 169
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 170
    .line 171
    :cond_c
    return v0
.end method

.method public isImageType()Z
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->type:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 48
    .line 49
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 59
    .line 60
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 61
    .line 62
    if-nez v0, :cond_7

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 65
    .line 66
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 67
    .line 68
    if-nez v0, :cond_8

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 75
    .line 76
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 77
    .line 78
    if-nez v0, :cond_9

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 81
    .line 82
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 83
    .line 84
    if-nez v0, :cond_a

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 87
    .line 88
    :cond_a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
