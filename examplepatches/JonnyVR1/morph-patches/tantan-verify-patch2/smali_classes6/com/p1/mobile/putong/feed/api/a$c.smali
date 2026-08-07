.class public Lcom/p1/mobile/putong/feed/api/a$c;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/api/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic h:Lcom/p1/mobile/putong/feed/api/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/api/a;Ljava/lang/String;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/api/a$c;->h:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    new-instance v0, Ll/dji;

    .line 4
    .line 5
    new-instance v1, Ll/vod;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "makeupItem"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct {v1, v2, v3, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v3, -0x1

    .line 32
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/ie7;

    .line 36
    .line 37
    invoke-direct {v1, p2}, Ll/ie7;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string p2, "loadMakeupItem"

    .line 41
    .line 42
    invoke-direct {p0, p1, p2, v0, v1}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/a;Ljava/lang/String;Ll/le7;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/a$c;-><init>(Lcom/p1/mobile/putong/feed/api/a;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic B(Ljava/lang/String;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/cameraCategories/"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "?filter=makeup"

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/dog;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/he7;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/he7;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ll/oc4;->O()Ll/oc4;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p0}, Ll/oc4;->z(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/feed/data/CameraSticker;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->minVersion:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/uc4;->g(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic E(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/je7;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/je7;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/ke7;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/ke7;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
