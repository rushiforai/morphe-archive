.class public Ll/lh;
.super Lcom/p1/mobile/putong/account/api/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lh$a;,
        Ll/lh$b;,
        Ll/lh$c;
    }
.end annotation


# instance fields
.field public g:Ll/lh$a;

.field public h:Ll/lh$b;

.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;>;"
        }
    .end annotation
.end field

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;>;"
        }
    .end annotation
.end field

.field public k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraBeautyMode;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/b;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lh$a;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Ll/lh$a;-><init>(Ll/lh;Ll/th;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/lh;->g:Ll/lh$a;

    .line 11
    .line 12
    new-instance v0, Ll/lh$b;

    .line 13
    .line 14
    invoke-direct {v0, p0, v1}, Ll/lh$b;-><init>(Ll/lh;Ll/th;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/lh;->h:Ll/lh$b;

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/lh;->i:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/lh;->j:Lrx/subjects/a;

    .line 30
    .line 31
    new-instance v0, Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/lh;->k:Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/lh;->l:Lrx/subjects/a;

    .line 43
    .line 44
    iget-object p0, p0, Ll/lh;->k:Ljava/util/HashMap;

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "hot"

    .line 56
    .line 57
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;->data:Lcom/p1/mobile/putong/account/data/AccountCameraData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraCategories:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic i(Ll/qcj;Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;)Ljava/util/List;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;->data:Lcom/p1/mobile/putong/account/data/AccountCameraData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/AccountCameraData;->cameraStickers:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/xg;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/xg;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_0
    invoke-static {}, Ll/nj;->C()Ll/nj;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Ll/nj;->v(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    return-object p1
.end method

.method public static synthetic j(Ll/lh;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lh;->F(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic k(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {}, Ll/nj;->C()Ll/nj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/nj;->u(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic l(Ll/pcj;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/wg;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/wg;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/account/data/CameraFilter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/CameraFilter;->minVersion:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/oj;->a(Ljava/lang/String;)Z

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

.method public static synthetic n(Ljava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ljava/lang/String;)Ll/x1d0;
    .locals 3

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
    const-string p0, "?search = sticker&filter=default,beauty"

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
    invoke-static {p0}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic p(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    new-instance v0, Ll/vg;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vg;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic q()Ll/x1d0;
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
    const-string v1, "/cameraCategories?filter=default,beauty"

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

.method public static synthetic r(Ll/lh;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lh;->G(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic s(Ll/lh;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lh;->H(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic t(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/account/data/CameraSticker;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->minVersion:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/oj;->a(Ljava/lang/String;)Z

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

.method public static synthetic w(Ll/pcj;Ll/qcj;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/data/AccountCameraDataEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/dh;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ll/dh;-><init>(Ll/qcj;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic x(Ll/gcg0;)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "AccountMMBeautyAutoModelgeo.json"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public A()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lh;->j:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public B(Lcom/p1/mobile/putong/account/data/CameraSticker;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ")",
            "Lrx/c<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/nj;->C()Ll/nj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nj;->y(Lcom/p1/mobile/putong/account/data/CameraSticker;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public C(Lcom/p1/mobile/putong/account/data/CameraSticker;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ")",
            "Lrx/c<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/nj;->C()Ll/nj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nj;->z(Lcom/p1/mobile/putong/account/data/CameraSticker;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public D(Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lh;->g:Ll/lh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mof0;->l(Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/ah;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/ah;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/bh;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/bh;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/ch;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/ch;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lh;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Collection;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public final synthetic F(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lh;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lh;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lh;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    new-instance v0, Ll/sg;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sg;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/tg;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/tg;-><init>(Ll/lh;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/ug;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/ug;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    new-instance v0, Ll/gh;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gh;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/hh;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/hh;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "accountCameraCategories"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v0, v2, v1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/qg;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/qg;-><init>(Ll/lh;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/rg;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/rg;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lh;->h:Ll/lh$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/eh;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/eh;-><init>(Ll/lh;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/fh;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/fh;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public L()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lh;->g:Ll/lh$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/lh;->g:Ll/lh$a;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ll/nj;->C()Ll/nj;

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/nj;->O(Ljava/util/List;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Ll/lh;->g:Ll/lh$a;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/lh;->J()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/lh;->I()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/lh;->K()V

    .line 50
    .line 51
    .line 52
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 53
    .line 54
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public M(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/lh$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, Ll/lh$c;-><init>(Ll/lh;Ljava/lang/String;Ll/th;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/yg;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/yg;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public N(Ll/qcj;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pg;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/pg;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "accountCameraCategoriesInCid"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance v1, Ll/zg;

    .line 21
    .line 22
    invoke-direct {v1, v0, p1}, Ll/zg;-><init>(Ll/pcj;Ll/qcj;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public y()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraBeautyMode;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lh;->l:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public z()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lh;->i:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method
