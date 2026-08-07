.class public Lcom/p1/mobile/putong/account/data/AccountCameraData;
.super Lcom/tantanapp/common/data/BaseData;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/account/data/AccountCameraData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/account/data/AccountCameraData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "accountcameradata"


# instance fields
.field public cameraCategories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;"
        }
    .end annotation
.end field

.field public cameraFilters:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraFilter;",
            ">;"
        }
    .end annotation
.end field

.field public cameraStickers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountCameraData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountCameraData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountCameraData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountCameraData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/BaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/data/CameraSticker;)Lcom/p1/mobile/putong/account/data/CameraSticker;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/CameraSticker;->clone()Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/data/CameraCategory;)Lcom/p1/mobile/putong/account/data/CameraCategory;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/CameraCategory;->clone()Lcom/p1/mobile/putong/account/data/CameraCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/account/data/CameraFilter;)Lcom/p1/mobile/putong/account/data/CameraFilter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/CameraFilter;->clone()Lcom/p1/mobile/putong/account/data/CameraFilter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/account/data/AccountCameraData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountCameraData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/data/AccountCameraData;->nullCheck()V

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

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/AccountCameraData;->clone()Lcom/p1/mobile/putong/account/data/AccountCameraData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/account/data/AccountCameraData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/AccountCameraData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/wh;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/wh;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/xh;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/xh;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 37
    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    new-instance v1, Ll/yh;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/yh;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iput-object p0, v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 50
    .line 51
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/data/AccountCameraData;->clone()Lcom/p1/mobile/putong/account/data/AccountCameraData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/account/data/AccountCameraData;

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
    check-cast v1, Lcom/p1/mobile/putong/account/data/AccountCameraData;

    .line 13
    .line 14
    if-eq p0, p1, :cond_2

    .line 15
    .line 16
    return v2

    .line 17
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 18
    .line 19
    iget-object v3, v1, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 38
    .line 39
    iget-object p1, v1, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    return v0

    .line 48
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "accountcameradata"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    :cond_2
    add-int/2addr v0, v2

    .line 47
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 48
    .line 49
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
