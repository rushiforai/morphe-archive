.class public Ll/lh$a;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/account/data/CameraFilter;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic h:Ll/lh;


# direct methods
.method public constructor <init>(Ll/lh;)V
    .locals 5

    .line 1
    iput-object p1, p0, Ll/lh$a;->h:Ll/lh;

    .line 2
    .line 3
    new-instance v0, Ll/dji;

    .line 4
    .line 5
    new-instance v1, Ll/vod;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "account_filters"

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/account/data/CameraFilter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, -0x1

    .line 28
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/ih;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/ih;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v2, "accountLoadFilters"

    .line 37
    .line 38
    invoke-direct {p0, p1, v2, v0, v1}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public synthetic constructor <init>(Ll/lh;Ll/th;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Ll/lh$a;-><init>(Ll/lh;)V

    return-void
.end method

.method public static synthetic B()Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/jh;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/jh;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/kh;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/kh;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0
.end method

.method public static synthetic C()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/cameraFilters"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;->data:Lcom/p1/mobile/putong/account/data/AccountCameraData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraFilters:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method
