.class public Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;
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
            "Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "purchasedialogconfigs"


# instance fields
.field public isShowCheckPopup:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public merchandises:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;",
            ">;"
        }
    .end annotation
.end field

.field public navigationTriggerDialog:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NavigationTriggerDialog;",
            ">;"
        }
    .end annotation
.end field

.field public sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public skuConfigs:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SkuConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public triggerDialog:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;",
            ">;"
        }
    .end annotation
.end field

.field public triggerDialogFromList:Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;->clone()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->clone()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/SkuConfigs;)Lcom/p1/mobile/putong/core/data/SkuConfigs;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SkuConfigs;->clone()Lcom/p1/mobile/putong/core/data/SkuConfigs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/NavigationTriggerDialog;)Lcom/p1/mobile/putong/core/data/NavigationTriggerDialog;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NavigationTriggerDialog;->clone()Lcom/p1/mobile/putong/core/data/NavigationTriggerDialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->nullCheck()V

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

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->clone()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/wab0;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/wab0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/xab0;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/xab0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->navigationTriggerDialog:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    new-instance v2, Ll/yab0;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/yab0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->navigationTriggerDialog:Ljava/util/List;

    .line 54
    .line 55
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->skuConfigs:Ljava/util/List;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    new-instance v2, Ll/zab0;

    .line 60
    .line 61
    invoke-direct {v2}, Ll/zab0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->skuConfigs:Ljava/util/List;

    .line 69
    .line 70
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;->clone()Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 79
    .line 80
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialogFromList:Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;

    .line 81
    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;->clone()Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialogFromList:Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;

    .line 89
    .line 90
    :cond_5
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->clone()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->navigationTriggerDialog:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->navigationTriggerDialog:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->skuConfigs:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->skuConfigs:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialogFromList:Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialogFromList:Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;

    .line 76
    .line 77
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

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
    const-string p0, "purchasedialogconfigs"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->navigationTriggerDialog:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->skuConfigs:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialogFromList:Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TriggerDialogFromListBean;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    :cond_6
    add-int/2addr v0, v2

    .line 95
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 96
    .line 97
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->merchandises:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
