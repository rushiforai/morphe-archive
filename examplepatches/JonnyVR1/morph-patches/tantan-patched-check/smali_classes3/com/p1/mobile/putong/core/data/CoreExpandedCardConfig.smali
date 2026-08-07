.class public Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;
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
            "Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "coreexpandedcardconfig"


# instance fields
.field public checkPicIndex:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public checkPicNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public default_order:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public dislikeCountToTriggerGuide:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public enable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public idNumShow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public lifePicIndex:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public likeCountToTriggerGuide:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public maxDislikeGuideShowCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public maxLikeGuideShowCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public myTabFetchCoolTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public nextInfoHeight:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public pic_label_op_enable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public receiveProfileLikeEnable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public sections_order:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public sendProfileLikeEnable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public showNaviOnlyWhenReachTop:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nullCheck()V

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

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->clone()Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/dq8;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/dq8;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 46
    .line 47
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 50
    .line 51
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 52
    .line 53
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 54
    .line 55
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 58
    .line 59
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    new-instance v2, Ll/eq8;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/eq8;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 75
    .line 76
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 77
    .line 78
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 81
    .line 82
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 85
    .line 86
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 89
    .line 90
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 91
    .line 92
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 93
    .line 94
    iput p0, v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 95
    .line 96
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->clone()Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 48
    .line 49
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 50
    .line 51
    if-ne v1, v3, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 66
    .line 67
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 72
    .line 73
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 74
    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 80
    .line 81
    if-ne v1, v3, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 94
    .line 95
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 96
    .line 97
    if-ne v1, v3, :cond_2

    .line 98
    .line 99
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 100
    .line 101
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 102
    .line 103
    if-ne v1, v3, :cond_2

    .line 104
    .line 105
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 106
    .line 107
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 112
    .line 113
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 114
    .line 115
    if-ne v1, v3, :cond_2

    .line 116
    .line 117
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 118
    .line 119
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 120
    .line 121
    if-ne p0, p1, :cond_2

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
    const-string p0, "coreexpandedcardconfig"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 32
    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    move v1, v4

    .line 47
    :goto_2
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 51
    .line 52
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 56
    .line 57
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 61
    .line 62
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 66
    .line 67
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    move v1, v3

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v1, v2

    .line 77
    :goto_3
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    move v1, v3

    .line 85
    goto :goto_4

    .line 86
    :cond_4
    move v1, v2

    .line 87
    :goto_4
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    move v1, v3

    .line 95
    goto :goto_5

    .line 96
    :cond_5
    move v1, v2

    .line 97
    :goto_5
    add-int/2addr v0, v1

    .line 98
    mul-int/lit8 v0, v0, 0x29

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 101
    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    :cond_6
    add-int/2addr v0, v4

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 112
    .line 113
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 117
    .line 118
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 122
    .line 123
    if-eqz v1, :cond_7

    .line 124
    .line 125
    move v2, v3

    .line 126
    :cond_7
    add-int/2addr v0, v2

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 130
    .line 131
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 135
    .line 136
    add-int/2addr v0, v1

    .line 137
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 138
    .line 139
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
