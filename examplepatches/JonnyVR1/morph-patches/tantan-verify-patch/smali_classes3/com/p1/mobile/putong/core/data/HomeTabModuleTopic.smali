.class public Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;
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
            "Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "hometabmoduletopic"


# instance fields
.field public background:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public broadcastBackground:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public broadcastButtonIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public broadcastButtonTextFemale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public broadcastButtonTextMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public broadcastTitleFemale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public broadcastTitleMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public buttonTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public buyBackground:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public buyButtonTextFemale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public buyButtonTextMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public buySubTitleFemale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public buySubTitleMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public buyTitleFemale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public buyTitleMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public limitTime:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public matchText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->nullCheck()V

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

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->clone()Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 67
    .line 68
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 95
    .line 96
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 97
    .line 98
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->clone()Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 164
    .line 165
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 166
    .line 167
    if-ne v1, v3, :cond_2

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_2

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_2

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_2

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_2

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_2

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 220
    .line 221
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_2

    .line 228
    .line 229
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 230
    .line 231
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-eqz p0, :cond_2

    .line 238
    .line 239
    return v0

    .line 240
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "hometabmoduletopic"

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
    if-nez v0, :cond_17

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    mul-int/lit8 v0, v0, 0x29

    .line 202
    .line 203
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    const/16 v1, 0x4cf

    .line 208
    .line 209
    goto :goto_f

    .line 210
    :cond_f
    const/16 v1, 0x4d5

    .line 211
    .line 212
    :goto_f
    add-int/2addr v0, v1

    .line 213
    mul-int/lit8 v0, v0, 0x29

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 216
    .line 217
    if-eqz v1, :cond_10

    .line 218
    .line 219
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    goto :goto_10

    .line 224
    :cond_10
    move v1, v2

    .line 225
    :goto_10
    add-int/2addr v0, v1

    .line 226
    mul-int/lit8 v0, v0, 0x29

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 229
    .line 230
    if-eqz v1, :cond_11

    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    goto :goto_11

    .line 237
    :cond_11
    move v1, v2

    .line 238
    :goto_11
    add-int/2addr v0, v1

    .line 239
    mul-int/lit8 v0, v0, 0x29

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 242
    .line 243
    if-eqz v1, :cond_12

    .line 244
    .line 245
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    goto :goto_12

    .line 250
    :cond_12
    move v1, v2

    .line 251
    :goto_12
    add-int/2addr v0, v1

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 255
    .line 256
    if-eqz v1, :cond_13

    .line 257
    .line 258
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    goto :goto_13

    .line 263
    :cond_13
    move v1, v2

    .line 264
    :goto_13
    add-int/2addr v0, v1

    .line 265
    mul-int/lit8 v0, v0, 0x29

    .line 266
    .line 267
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 268
    .line 269
    if-eqz v1, :cond_14

    .line 270
    .line 271
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    goto :goto_14

    .line 276
    :cond_14
    move v1, v2

    .line 277
    :goto_14
    add-int/2addr v0, v1

    .line 278
    mul-int/lit8 v0, v0, 0x29

    .line 279
    .line 280
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 281
    .line 282
    if-eqz v1, :cond_15

    .line 283
    .line 284
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    goto :goto_15

    .line 289
    :cond_15
    move v1, v2

    .line 290
    :goto_15
    add-int/2addr v0, v1

    .line 291
    mul-int/lit8 v0, v0, 0x29

    .line 292
    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 294
    .line 295
    if-eqz v1, :cond_16

    .line 296
    .line 297
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    :cond_16
    add-int/2addr v0, v2

    .line 302
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 303
    .line 304
    :cond_17
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_7

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 66
    .line 67
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_8

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 72
    .line 73
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 74
    .line 75
    if-nez v0, :cond_9

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 78
    .line 79
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v0, :cond_a

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 84
    .line 85
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 86
    .line 87
    if-nez v0, :cond_b

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 90
    .line 91
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 92
    .line 93
    if-nez v0, :cond_c

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 96
    .line 97
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 98
    .line 99
    if-nez v0, :cond_d

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 102
    .line 103
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 104
    .line 105
    if-nez v0, :cond_e

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 108
    .line 109
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 110
    .line 111
    if-nez v0, :cond_f

    .line 112
    .line 113
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 114
    .line 115
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 116
    .line 117
    if-nez v0, :cond_10

    .line 118
    .line 119
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 120
    .line 121
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 122
    .line 123
    if-nez v0, :cond_11

    .line 124
    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 126
    .line 127
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 128
    .line 129
    if-nez v0, :cond_12

    .line 130
    .line 131
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 132
    .line 133
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 134
    .line 135
    if-nez v0, :cond_13

    .line 136
    .line 137
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 138
    .line 139
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 140
    .line 141
    if-nez v0, :cond_14

    .line 142
    .line 143
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 144
    .line 145
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 146
    .line 147
    if-nez v0, :cond_15

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 150
    .line 151
    :cond_15
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
