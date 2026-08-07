.class public Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivetraceserverdata"


# instance fields
.field public biz:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public enterSource:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public giftBarPageId:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public giftBarTab:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public givenSource:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public index:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public location:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getLocation(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 18
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 19
    iput-object p3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    return-void
.end method

.method public static getH5TraceServerData(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    const-string v1, "H5"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private getLocation(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;)Ljava/lang/String;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "common"

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static getNativeTabBarTraceServerData(Ljava/lang/String;II)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 2

    .line 1
    const-string v0, "giftbar"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

    .line 14
    .line 15
    add-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    int-to-long p0, p1

    .line 18
    iput-wide p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 19
    .line 20
    add-int/lit8 p2, p2, 0x1

    .line 21
    .line 22
    int-to-long p0, p2

    .line 23
    iput-wide p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 24
    .line 25
    return-object v0
.end method

.method public static getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    const-string v0, "common"

    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    move-result-object v0

    .line 30
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    move-result-object p0

    return-object p0
.end method

.method public static getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 3
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    const-string v1, "Native"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, ""

    .line 21
    .line 22
    :goto_0
    invoke-direct {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 2
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    const-string v1, "Native"

    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)V

    return-object v0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->nullCheck()V

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

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 37
    .line 38
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 54
    .line 55
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 56
    .line 57
    cmp-long v1, v3, v5

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 62
    .line 63
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 64
    .line 65
    cmp-long v1, v3, v5

    .line 66
    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    return v0

    .line 90
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivetraceserverdata"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 61
    .line 62
    const/16 v1, 0x20

    .line 63
    .line 64
    ushr-long v5, v3, v1

    .line 65
    .line 66
    xor-long/2addr v3, v5

    .line 67
    long-to-int v3, v3

    .line 68
    add-int/2addr v0, v3

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 72
    .line 73
    ushr-long v5, v3, v1

    .line 74
    .line 75
    xor-long/2addr v3, v5

    .line 76
    long-to-int v1, v3

    .line 77
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_4

    .line 89
    :cond_4
    move v1, v2

    .line 90
    :goto_4
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    :cond_5
    add-int/2addr v0, v2

    .line 102
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 103
    .line 104
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
